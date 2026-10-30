// Real pinned adapter + offload recovery/projection; every HTTP request is intercepted.
// DSH_TEST_PREFIX=/path/to/patched/dsh-prefix node --test runtime/tests/image-offload-cache.test.mjs
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { createRequire, registerHooks } from 'node:module';
import { join, resolve } from 'node:path';
import { pathToFileURL } from 'node:url';
import { after, beforeEach, test } from 'node:test';

const prefix = resolve(process.env.DSH_TEST_PREFIX ?? process.cwd());
const require = createRequire(join(prefix, 'package.json'));
const adapterPath = require.resolve('@deepseek-ai/dsh-llm-pi-ai');
const source = await readFile(adapterPath, 'utf8');
const moduleURL = 'data:text/javascript;base64,' + Buffer.from(source + '\nexport { resolveProfiles };\n').toString('base64');
const hooks = registerHooks({
  resolve(specifier, context, next) {
    return next(specifier, context.parentURL === moduleURL
      ? { ...context, parentURL: pathToFileURL(adapterPath).href } : context);
  },
});
let adapterModule;
try { adapterModule = await import(moduleURL); } finally { hooks.deregister(); }
const { Config, resolveProfiles, PiAiAdapter } = adapterModule;
const { apply: mountOffload } = await import(pathToFileURL(require.resolve('@deepseek-ai/dsh-compaction-image-offload')));
const { Config: deepSeekConfig } = await import(pathToFileURL(require.resolve('@deepseek-ai/dsh-llm-deepseek')));

const originalFetch = globalThis.fetch;
let requests;
beforeEach(() => {
  requests = [];
  globalThis.fetch = async (url, init) => {
    assert.equal(typeof url === 'string' ? url : url.url, 'https://offline.invalid/v1/responses');
    requests.push(JSON.parse(init.body));
    return new Response('data: ' + JSON.stringify({ type: 'response.completed', response: {
      id: 'offline', status: 'completed', output: [],
      usage: { input_tokens: 1, output_tokens: 0, total_tokens: 1 },
    } }) + '\n\n', { headers: { 'content-type': 'text/event-stream' } });
  };
});
after(() => { globalThis.fetch = originalFetch; });

const raw = {
  api: 'openai-responses', baseURL: 'https://offline.invalid/v1',
  models: [{ id: 'offline-model', input: ['text', 'image'] }],
  maxRequestImageBytes: 120,
};
const image = (bytes = 3, label = String(bytes)) => ({
  type: 'image', attachment: {
    attachmentId: 'sha256:' + Buffer.from(label).toString('hex').padEnd(64, '0').slice(0, 64),
    mediaType: 'image/jpeg', width: 1, height: 1, bytes,
  },
});
const small = image();
const messages = (count, omitted = 0) => [{
  id: 'message', role: 'user', content: Array.from({ length: count }, (_, index) =>
    index < omitted ? { ...small, offloaded: true } : small),
}];

function provider(extra = {}, read = () => {}, reportedBytes = ref => ref.bytes) {
  let profiles = resolveProfiles({ offline: { ...raw, ...extra } });
  const adapter = new PiAiAdapter({
    profiles: () => profiles,
    resolveApiKey: async () => 'offline-placeholder',
    auth: { credentials: { get: async () => undefined } },
    resolveAttachments: () => ({
      readImageRequest: async (ref) => {
        read(ref);
        return { data: new Uint8Array(ref.bytes), bytes: reportedBytes(ref),
          mediaType: 'image/jpeg', width: 1, height: 1 };
      },
    }),
  });
  return {
    adapter,
    profile: () => profiles.get('offline'),
    update(extra) { profiles = resolveProfiles({ offline: { ...raw, ...extra } }); },
  };
}

async function attempt(adapter, input) {
  const before = requests.length;
  try {
    for await (const _ of adapter.stream({
      provider: 'offline', model: 'offline-model', messages: input,
      sessionId: 'offline-session', signal: new AbortController().signal,
    })) {}
  } catch (error) {
    if (error.code !== 'EMPTY_RESPONSE') return { error, sent: requests.length - before };
  }
  assert.equal(requests.length - before, 1, 'one local fake HTTP request must complete');
  return { sent: 1, body: requests.at(-1) };
}

function sessionFixture(contents) {
  const handlers = new Map();
  let projection;
  mountOffload({
    sessions: { registerMessageProjection(value) { projection = value; } },
    on(name, handler) { handlers.set(name, handler); },
  });
  const events = contents.map((content, seq) => ({
    seq, type: 'user/message', data: { id: `m-${seq}`, role: 'user', content },
  }));
  const nodes = events.map(event => event.seq);
  let derived = new Map(events.map(event => [event.seq, event.data]));
  const session = {
    events, surface: { nodes },
    eventAt: seq => events[seq],
    deriveEventMessage: event => derived.get(event.seq),
    deriveMessages: () => nodes.map(seq => derived.get(seq)),
    append(type, data) {
      assert.equal(type, 'image/offload');
      const event = { seq: events.length, type, data };
      const updates = projection.project(event, { events, nodes, baseSeq: 0, messages: derived });
      events.push(event);
      for (const [seq, message] of updates) derived.set(seq, message);
    },
    replay() {
      const restored = new Map(nodes.map(seq => [seq, events[seq].data]));
      for (const event of events.filter(event => event.type === 'image/offload')) {
        const updates = projection.project(event, { events, nodes, baseSeq: 0, messages: restored });
        for (const [seq, message] of updates) restored.set(seq, message);
      }
      return nodes.map(seq => restored.get(seq));
    },
  };
  return { session, handlers };
}

async function recover(adapter, fixture) {
  let retries = 0;
  for (let iteration = 0; iteration < 3; iteration++) {
    const result = await attempt(adapter, fixture.session.deriveMessages());
    if (!result.error) return { ...result, retries };
    assert.equal(result.error.code, 'IMAGE_OFFLOAD_REQUIRED', result.error.message);
    assert.equal(result.sent, 0);
    const action = await fixture.handlers.get('agent/request-error')({
      agent: { session: fixture.session }, failure: result.error.failure,
      signal: new AbortController().signal,
    }, () => assert.fail('offload recovery unexpectedly declined'));
    assert.equal(action.kind, 'retry');
    retries++;
  }
  assert.fail('offload recovery did not converge');
}

const retainedImageCount = body => body.input.reduce((count, entry) => count +
  (Array.isArray(entry.content) ? entry.content.filter(block => block.type === 'input_image').length : 0), 0);

test('normal and small custom limits receive bounded batch defaults', () => {
  const parsed = Config({ providers: { offline: raw } }).providers.get().offline;
  assert.equal(resolveProfiles({ offline: parsed }).get('offline').requestImageOffloadByteQuantum, 30);
  assert.equal(provider({ maxRequestImageBytes: 20 * 1024 * 1024 }).profile().requestImageOffloadByteQuantum, 5 * 1024 * 1024);
  assert.equal(provider({ maxRequestImageBytes: 1 }).profile().requestImageOffloadByteQuantum, 1);
  assert.equal(provider({ maxRequestImageBytes: 40 * 1024 * 1024 }).profile().requestImageOffloadByteQuantum, 5 * 1024 * 1024);
});

test('invalid quanta and unsafe hard bounds are rejected', () => {
  for (const bad of [0, -1, 1.5, NaN, Infinity, 2 ** 53, 121]) {
    assert.throws(() => provider({ requestImageOffloadByteQuantum: bad }));
  }
  assert.throws(() => provider({ maxRequestImageBytes: 2 ** 53 }));
  assert.equal(provider({ requestImageOffloadByteQuantum: 1 }).profile().requestImageOffloadByteQuantum, 1);
  assert.equal(provider({ requestImageOffloadByteQuantum: 120 }).profile().requestImageOffloadByteQuantum, 120);
});

test('at and below the hard bound every request field is unchanged by batching', async () => {
  for (const count of [0, 1, 29, 30]) {
    const legacy = await attempt(provider({ requestImageOffloadByteQuantum: 1 }).adapter, messages(count));
    const batch = await attempt(provider({ requestImageOffloadByteQuantum: 40 }).adapter, messages(count));
    assert.deepEqual(batch.body, legacy.body);
    assert.equal(retainedImageCount(batch.body), count);
  }
});

test('base64 accounting uses actual data, not inconsistent attachment byte metadata', async () => {
  const adapter = provider({ requestImageOffloadByteQuantum: 40 }, () => {}, () => 9).adapter;
  const below = await attempt(adapter, messages(20));
  assert.equal(below.error, undefined);
  assert.equal(retainedImageCount(below.body), 20);
  const overflow = await attempt(adapter, messages(31));
  assert.equal(overflow.error.code, 'IMAGE_OFFLOAD_REQUIRED');
  assert.equal(overflow.error.failure.offloadImages, 11);
  assert.equal(overflow.sent, 0);
});

test('one-byte opt-out preserves the minimum old-image removal count', async () => {
  const result = await attempt(provider({ requestImageOffloadByteQuantum: 1 }).adapter, messages(31));
  assert.equal(result.error.code, 'IMAGE_OFFLOAD_REQUIRED');
  assert.equal(result.error.failure.offloadImages, 1);
  assert.equal(result.sent, 0);
});

test('overflow removes enough old images to reach a stable low watermark', async () => {
  for (const [count, expected] of [[31, 11], [39, 19], [40, 20], [41, 21]]) {
    const result = await attempt(provider({ requestImageOffloadByteQuantum: 40 }).adapter, messages(count));
    assert.equal(result.error.code, 'IMAGE_OFFLOAD_REQUIRED');
    assert.equal(result.error.failure.offloadImages, expected);
    assert.equal(result.sent, 0);
    const after = await attempt(provider({ requestImageOffloadByteQuantum: 40 }).adapter, messages(count, expected));
    assert.equal(retainedImageCount(after.body), 20);
  }
});

test('actual plugin hook batches across messages and projection replays identically', async () => {
  const fixture = sessionFixture([Array(10).fill(small), Array(21).fill(small)]);
  const result = await recover(provider({ requestImageOffloadByteQuantum: 40 }).adapter, fixture);
  assert.equal(result.retries, 1);
  assert.equal(requests.length, 1);
  assert.deepEqual(fixture.session.events.at(-1).data.targets, [
    { seq: 0, imageIndexes: [0,1,2,3,4,5,6,7,8,9] }, { seq: 1, imageIndexes: [0] },
  ]);
  assert.deepEqual(fixture.session.replay(), fixture.session.deriveMessages());
  assert.equal(fixture.session.deriveMessages().at(-1).content.at(-1).offloaded, undefined);
});

test('duplicate attachment occurrences count separately; omitted indexes remain stable', async () => {
  let reads = 0;
  const fixture = sessionFixture([[{ ...small, offloaded: true }, ...Array(31).fill(small)]]);
  const result = await recover(provider({ requestImageOffloadByteQuantum: 40 }, () => reads++).adapter, fixture);
  assert.equal(result.retries, 1);
  assert.equal(reads, 2, 'one shared attachment version per attempt, not one per occurrence');
  assert.deepEqual(fixture.session.events.at(-1).data.targets, [{ seq: 0, imageIndexes: [1,2,3,4,5,6,7,8,9,10,11] }]);
});

test('batch leaves room for ten later screenshots without another prefix rewrite', async () => {
  const adapter = provider({ requestImageOffloadByteQuantum: 40 }).adapter;
  for (let added = 0; added <= 10; added++) {
    const result = await attempt(adapter, messages(31 + added, 11));
    assert.equal(result.error, undefined);
    assert.equal(retainedImageCount(result.body), 20 + added);
  }
  assert.equal((await attempt(adapter, messages(42, 11))).error.code, 'IMAGE_OFFLOAD_REQUIRED');
});

test('large allowed quantum never discards the newest screenshot', async () => {
  const fixture = sessionFixture([Array(31).fill(small)]);
  const result = await recover(provider({ requestImageOffloadByteQuantum: 120 }).adapter, fixture);
  assert.equal(result.retries, 1);
  assert.equal(retainedImageCount(result.body), 1);
  assert.equal(fixture.session.events.at(-1).data.targets[0].imageIndexes.length, 30);
});

test('latest screenshot can exceed the soft target but must obey the hard limit', async () => {
  const fixture = sessionFixture([[...Array(7).fill(small), image(75, 'latest')]]);
  const result = await recover(provider({ requestImageOffloadByteQuantum: 40 }).adapter, fixture);
  assert.equal(result.retries, 1);
  assert.equal(retainedImageCount(result.body), 1);
  assert.equal(fixture.session.events.at(-1).data.targets[0].imageIndexes.length, 7);
});

test('one oversized newest image fails explicitly before HTTP or durable omissions', async () => {
  for (const content of [[image(93, 'oversized')], [...Array(4).fill(small), image(93, 'oversized')]]) {
    const result = await attempt(provider({ requestImageOffloadByteQuantum: 40 }).adapter, [{ role: 'user', content }]);
    assert.equal(result.error.code, 'INVALID_REQUEST');
    assert.equal(result.sent, 0);
    assert.equal(result.error.failure.offloadImages, undefined);
  }
});

test('new resolved profile snapshots take effect and invalid candidates preserve the prior snapshot', async () => {
  const current = provider({ requestImageOffloadByteQuantum: 1 });
  assert.equal((await attempt(current.adapter, messages(31))).error.failure.offloadImages, 1);
  current.update({ requestImageOffloadByteQuantum: 40 });
  assert.equal((await attempt(current.adapter, messages(31))).error.failure.offloadImages, 11);
  assert.throws(() => current.update({ requestImageOffloadByteQuantum: 0 }));
  assert.equal((await attempt(current.adapter, messages(31))).error.failure.offloadImages, 11);
});

test('diagnostic messages contain accounting only, not attachment identities or prompts', async () => {
  const input = messages(31);
  input[0].content.unshift({ type: 'text', text: 'private prompt must not be logged' });
  const result = await attempt(provider({ requestImageOffloadByteQuantum: 40 }).adapter, input);
  assert.equal(result.error.code, 'IMAGE_OFFLOAD_REQUIRED');
  assert.doesNotMatch(result.error.message, /sha256:|private prompt|offline-placeholder/);
  assert.match(result.error.message, /124/);
  assert.match(result.error.message, /80/);
});

test('the official DeepSeek image-offload defaults are unchanged', () => {
  const config = deepSeekConfig({});
  assert.equal(config.inlineImageOffloadByteQuantum.get(), 10 * 1024 * 1024);
  assert.equal(config.imageOffloadByteQuantum.get(), 64 * 1024 * 1024);
});
