// SPDX-License-Identifier: MIT
//
// Smoke test of the auth bridge against a real `dsh web`, with a throwaway HOME
// and DSH_HOME. Mounts app/assets/engine/auth/ through an overlay shaped like
// the one AppAuthGuest.kt writes, then checks over HTTP:
//   - appAuth/list on a fresh home (nothing signed in, no route);
//   - begin → poll reaches `open` with the real authorize URL and pi-ai's
//     callback server listening (ChatGPT 1455, Claude 53692), then cancel;
//   - a seeded fake grant (no real account) → list repairs the route and the
//     provider's models appear → signOut deletes the grant and keeps settings.
// No login is completed and nothing is sent to OpenAI or Anthropic.
//
//   node app/tool/engine_auth/smoke-real-dsh.mjs [--dsh <install dir>] [--work <empty dir>] [--port <n>]

import { spawn } from 'node:child_process'
import { randomUUID } from 'node:crypto'
import { chmodSync, copyFileSync, existsSync, mkdirSync, mkdtempSync, readFileSync, readdirSync, writeFileSync } from 'node:fs'
import { connect } from 'node:net'
import { homedir, tmpdir } from 'node:os'
import { dirname, join, resolve } from 'node:path'
import { fileURLToPath } from 'node:url'

const args = Object.fromEntries(process.argv.slice(2).reduce((pairs, arg, i, all) => (arg.startsWith('--') ? [...pairs, [arg.slice(2), all[i + 1]]] : pairs), []))
const DSH = resolve(args.dsh ?? join(homedir(), '.dsh-runtime/npm/lib/node_modules/@deepseek-ai/dsh'))
const WORK = resolve(args.work ?? mkdtempSync(join(tmpdir(), 'dsh-auth-smoke-')))
const PORT = Number(args.port ?? 38931)
const BRIDGE = resolve(dirname(fileURLToPath(import.meta.url)), '../../assets/engine/auth')

for (const forbidden of [join(homedir(), '.dsh'), join(homedir(), '.dsh-runtime')]) {
  if (WORK === forbidden || WORK.startsWith(`${forbidden}/`)) throw new Error(`refusing to use ${WORK}: pick a throwaway directory`)
}
if (existsSync(WORK) && readdirSync(WORK).length > 0) throw new Error(`${WORK} is not empty`)

let failures = 0
const pass = (what) => console.log(`  PASS ${what}`)
const fail = (what) => {
  failures++
  console.log(`  FAIL ${what}`)
}
const check = (ok, what) => (ok ? pass(what) : fail(what))

// ── a throwaway home and the guest directory ──────────────────────────────
const home = join(WORK, 'home')
const dshHome = join(WORK, 'dsh')
const guest = join(WORK, 'guest') // stands in for /opt/dsh-app/auth
for (const dir of [home, dshHome, guest, join(WORK, 'tmp')]) mkdirSync(dir, { recursive: true, mode: 0o700 })
for (const name of ['index.mjs', 'bridge.mjs']) copyFileSync(join(BRIDGE, name), join(guest, name))
const overlay = join(guest, 'auth.patch.yml')
writeFileSync(overlay, `- insert:\n    - id: dsh-app-auth\n      name: ${join(guest, 'index.mjs')}\n`)

// ── start dsh web ─────────────────────────────────────────────────────────
const log = []
const child = spawn(process.execPath, [join(DSH, 'lib/bin.js'), 'web', '--patch', overlay, '--host', '127.0.0.1', '--port', String(PORT), '--no-open'], {
  cwd: WORK,
  env: { PATH: `${dirname(process.execPath)}:/usr/bin:/bin`, HOME: home, DSH_HOME: dshHome, TMPDIR: join(WORK, 'tmp'), LANG: 'C.UTF-8' },
  stdio: ['ignore', 'pipe', 'pipe'],
})
child.stdout.on('data', (chunk) => log.push(String(chunk)))
child.stderr.on('data', (chunk) => log.push(String(chunk)))
const stop = async () => {
  if (child.exitCode !== null) return
  child.kill('SIGTERM')
  const exited = await Promise.race([new Promise((r) => child.once('exit', () => r(true))), new Promise((r) => setTimeout(() => r(false), 8000))])
  if (!exited) child.kill('SIGKILL')
}
process.on('SIGINT', () => stop().then(() => process.exit(130)))

const sleep = (ms) => new Promise((r) => setTimeout(r, ms))
const listening = (port) =>
  new Promise((resolveListening) => {
    const socket = connect({ port, host: '127.0.0.1' })
    socket.once('connect', () => (socket.destroy(), resolveListening(true)))
    socket.once('error', () => resolveListening(false))
  })

try {
  let line
  for (let i = 0; i < 120 && line === undefined && child.exitCode === null; i++) {
    line = log.join('').split('\n').find((l) => l.startsWith('dsh web: http'))
    if (line === undefined) await sleep(500)
  }
  if (line === undefined) throw new Error(`dsh web did not start:\n${log.join('').slice(-3000)}`)
  console.log(`== dsh web up (${DSH})`)
  check(!/did not activate/.test(log.join('')), 'every entry activated (the bridge loaded)')

  const url = new URL(line.slice('dsh web: '.length).trim())
  const base = `${url.protocol}//${url.host}`
  const login = await fetch(`${base}/?token=${url.searchParams.get('token')}`, { redirect: 'manual' })
  const cookie = (login.headers.get('set-cookie') ?? '').split(';')[0]
  const call = async (endpoint, callArgs = {}) => {
    const response = await fetch(`${base}/api/${endpoint}`, {
      method: 'POST',
      headers: { 'content-type': 'application/json', cookie },
      body: JSON.stringify({ type: 'client-request', rpcId: randomUUID(), method: endpoint, payload: { args: callArgs } }),
    })
    return (await response.json()).result
  }
  const value = async (endpoint, callArgs) => {
    const result = await call(endpoint, callArgs)
    if (!result?.ok) throw new Error(`${endpoint}: ${JSON.stringify(result?.error)}`)
    return result.value
  }
  const piAi = async () => (await value('settings/describe')).namespaces.find((n) => n.ns === 'llm-pi-ai')
  const pollUntil = async (attemptId, phases) => {
    for (let i = 0; i < 100; i++) {
      const step = await value('appAuth/poll', { attemptId })
      if (phases.includes(step.phase)) return step
      await sleep(100)
    }
    return value('appAuth/poll', { attemptId })
  }

  console.log('== appAuth/list on a fresh home')
  const fresh = await value('appAuth/list')
  check(JSON.stringify(fresh) === JSON.stringify({ providers: [{ id: 'openai-codex', signedIn: false }, { id: 'anthropic', signedIn: false }, { id: 'xai', signedIn: false }] }), `list: ${JSON.stringify(fresh)}`)
  check(Object.keys((await piAi()).value.providers ?? {}).length === 0, 'no llm-pi-ai route before sign-in')

  for (const [provider, authorize, port] of [
    ['openai-codex', 'https://auth.openai.com/oauth/authorize?', 1455],
    ['anthropic', 'https://claude.ai/oauth/authorize?', 53692],
  ]) {
    console.log(`== ${provider}: begin → open → cancel`)
    const { attemptId } = await value('appAuth/begin', { provider })
    const step = await pollUntil(attemptId, ['open', 'prompt', 'failed', 'cancelled'])
    const redirect = step.url ? new URL(step.url).searchParams.get('redirect_uri') : undefined
    check(step.phase === 'open' && step.url?.startsWith(authorize), `phase ${step.phase}, authorize page ${step.url ? new URL(step.url).origin + new URL(step.url).pathname : '-'}`)
    check(redirect === `http://localhost:${port}${provider === 'anthropic' ? '/callback' : '/auth/callback'}`, `redirect_uri ${redirect}`)
    check(await listening(port), `pi-ai's callback server listens on 127.0.0.1:${port}`)
    check(typeof step.message === 'string' && typeof step.placeholder === 'string', `message "${step.message}", placeholder ${step.placeholder}`)
    await value('appAuth/cancel', { attemptId })
    const end = await pollUntil(attemptId, ['cancelled', 'failed', 'done'])
    check(end.phase === 'cancelled' && end.error === '登录已取消', `after cancel: ${JSON.stringify(end)}`)
    await sleep(200)
    check(!(await listening(port)), `port ${port} released`)
  }

  console.log('== seeded fake grant → route → models → signOut')
  const b64 = (o) => Buffer.from(JSON.stringify(o)).toString('base64url')
  const fakeAccess = `${b64({ alg: 'none' })}.${b64({ 'https://api.openai.com/profile': { email: 'smoke@example.invalid' } })}.x`
  const credentialsFile = join(dshHome, '.credentials.yaml')
  const existing = existsSync(credentialsFile) ? readFileSync(credentialsFile, 'utf8') : 'version: 1\n'
  const records = existing.includes('\nrecords:') ? '' : 'records:\n'
  writeFileSync(
    credentialsFile,
    `${existing.trimEnd()}\n${records}  llm-pi-ai/openai-codex:\n    kind: grant\n    payload:\n      type: oauth\n      access: ${fakeAccess}\n      refresh: fake\n      expires: ${Date.now() + 86400e3}\n      accountId: fake\n`,
  )
  chmodSync(credentialsFile, 0o600)
  await sleep(800) // credentials-local reloads on change
  const signedIn = await value('appAuth/list')
  check(signedIn.providers[0].signedIn === true && signedIn.providers[0].account === 'smoke@example.invalid', `list: ${JSON.stringify(signedIn.providers[0])}`)
  check(JSON.stringify((await piAi()).user?.providers?.['openai-codex']) === '{"displayName":"ChatGPT"}', 'route llm-pi-ai.providers.openai-codex = {displayName: ChatGPT}')
  const catalog = await value('session/modelCatalog')
  const group = catalog.groups.find((g) => (g.provider ?? g.id) === 'openai-codex')
  check((group?.models?.length ?? 0) > 0, `ChatGPT models in the catalog: ${(group?.models ?? []).map((m) => m.model ?? m.id).join(', ')}`)
  await value('appAuth/signOut', { provider: 'openai-codex' })
  check((await piAi()).user?.providers?.['openai-codex']?.displayName === 'ChatGPT', 'signOut preserved the route')
  check(!readFileSync(credentialsFile, 'utf8').includes('llm-pi-ai/openai-codex'), 'signOut deleted the grant')
  check((await value('appAuth/list')).providers[0].signedIn === false, 'list reads signed out')
} catch (error) {
  fail(error.stack ?? String(error))
} finally {
  await stop()
  console.log(`== dsh stopped; work dir ${WORK}`)
  const bridgeLines = log.join('').split('\n').filter((l) => l.startsWith('[dsh-app auth]'))
  console.log(bridgeLines.map((l) => `  | ${l}`).join('\n'))
}
process.exit(failures === 0 ? 0 : 1)
