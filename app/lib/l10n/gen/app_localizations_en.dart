// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get accessPickTitle => 'What should DSH Go help with?';

  @override
  String get accessPickMessage => 'Pick any, then turn each one on';

  @override
  String get accessPickConfirm => 'Turn on selected';

  @override
  String get accessSkip => 'Skip';

  @override
  String get accessFeatureFiles => 'Read and write phone files';

  @override
  String get accessFeatureFilesNeeds => 'Needs file access';

  @override
  String get accessFeaturePet => 'Pet over other apps';

  @override
  String get accessFeaturePetNeeds => 'Needs display over other apps';

  @override
  String get accessFeaturePhone => 'Phone control';

  @override
  String get accessFeaturePhoneNeeds => 'Needs accessibility and notifications';

  @override
  String get accessFeatureBackground => 'Keep running in background';

  @override
  String get accessFeatureBackgroundNeeds => 'Tells you when tasks finish; needs notifications and background access';

  @override
  String get accessFeatureVoice => 'Voice input';

  @override
  String get accessFeatureVoiceNeeds => 'Needs the microphone';

  @override
  String accessVoiceModel(int size) {
    return 'Works offline; downloads a voice model of about $size MB';
  }

  @override
  String get accessVoiceMetered => 'You\'re on mobile data; the download will use it';

  @override
  String get accessFilesRiskBody => 'AI can read and change your photos, downloads and documents.';

  @override
  String accessStepCount(int index, int total) {
    return '$index / $total';
  }

  @override
  String get accessTurnOn => 'Turn on';

  @override
  String get accessOpenSettings => 'Open settings';

  @override
  String get accessItsSet => 'It\'s set';

  @override
  String get accessOpenAgain => 'Open again';

  @override
  String get accessIsOn => 'On';

  @override
  String get accessNotOnYet => 'Not on yet';

  @override
  String get accessDidYouSet => 'Did you turn it on there?';

  @override
  String accessWhere(String path) {
    return 'Where: $path';
  }

  @override
  String get accessOpenFailed => 'Couldn\'t open system settings';

  @override
  String get accessMicTitle => 'Allow the microphone';

  @override
  String get accessMicWhy => 'For voice input';

  @override
  String get accessStorageTitle => 'Allow file access';

  @override
  String get accessStorageWhy => 'Lets AI read and write photos, downloads and documents';

  @override
  String get accessNotifyTitle => 'Allow notifications';

  @override
  String get accessNotifyWhy => 'Tells you when a task finishes or needs you';

  @override
  String get accessBatteryTitle => 'Allow background running';

  @override
  String get accessBatteryWhy => 'Tasks keep going when you switch apps';

  @override
  String get accessVendorBackgroundWhy => 'Keeps the system from cutting tasks off in the background';

  @override
  String get accessAutostartTitle => 'Allow auto-start';

  @override
  String get accessAutostartWhy => 'Lets DSH Go come back after the system clears it';

  @override
  String accessVivoAutostartPath(String app) {
    return 'Permission management › Auto-start › $app';
  }

  @override
  String accessXiaomiAutostartPath(String app) {
    return 'Manage apps › $app › Autostart';
  }

  @override
  String get accessA11yTitle => 'Turn on accessibility';

  @override
  String get accessA11yWhy => 'Phone control reads the screen and taps through it';

  @override
  String get accessPopupTitle => 'Allow pop-ups in background';

  @override
  String get accessPopupWhy => 'Brings you back to DSH Go when phone control is done';

  @override
  String accessVivoPopupPath(String app) {
    return 'Permission management › $app › Display pop-up windows in background';
  }

  @override
  String accessXiaomiPopupPath(String app) {
    return 'Manage apps › $app › Other permissions › Display pop-up windows while running in the background';
  }

  @override
  String get accessOverlayTitle => 'Allow display over other apps';

  @override
  String get accessOverlayWhy => 'Lets your pet appear over other apps';

  @override
  String get accessOverlayGreyed => 'Switch greyed out?';

  @override
  String get accessRestrictedTitle => 'Allow restricted settings first';

  @override
  String get accessRestrictedTap =>
      'In Accessibility, tap “DSH Phone Control”; when “Restricted setting” appears, tap OK';

  @override
  String get accessRestrictedMenu =>
      'In App info, tap the three dots at the top right and choose “Allow restricted settings”';

  @override
  String get accessRestrictedAdvanced =>
      'In App info, open “Advanced settings” and turn on “Allow restricted settings”';

  @override
  String get accessRestrictedBack => 'Back in Accessibility, turn on “DSH Phone Control”';

  @override
  String get accessRestrictedHelp => 'See how';

  @override
  String get accessOpenA11y => 'Open accessibility';

  @override
  String get accessOpenAppInfo => 'Open app info';

  @override
  String get accessStateOn => 'On';

  @override
  String get accessStateOff => 'Off';

  @override
  String get accessStateVisited => 'Visited';

  @override
  String get accessStateUnknown => 'Set up';

  @override
  String get accessSummaryAllSet => 'All set';

  @override
  String accessSummaryLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count still off', one: '1 still off');
    return '$_temp0';
  }

  @override
  String get accessSummaryMessage => 'Turn on the rest anytime in Settings › General › System permissions';

  @override
  String get accessFinishFailed => 'Couldn’t finish setup';

  @override
  String accessVoiceDownload(int size) {
    return 'The voice model (about $size MB) starts downloading once the engine is ready. Follow it in Settings › General › Voice input.';
  }

  @override
  String get accessPageTitle => 'System permissions';

  @override
  String get accessPageSubtitle => 'What each feature needs from Android';

  @override
  String get activityThinkingUntangle => 'Hmm… let me untangle this';

  @override
  String get activityThinkingWorkThrough => 'Let’s work through this';

  @override
  String get activityThinkingGears => 'Brain gears turning';

  @override
  String get activityThinkingSecond => 'Give me a second';

  @override
  String get activityThinkingSmoking => 'Brain’s working overtime';

  @override
  String get activityThinkingOnIt => 'Thinking, thinking';

  @override
  String get activityThinkingNoRush => 'One thought at a time';

  @override
  String get activityThinkingPonder => 'Let me ponder that';

  @override
  String get activityThinkingLogic => 'Working through the logic';

  @override
  String get activityThinkingBrain => 'Putting my brain to work';

  @override
  String get activityThinkingSort => 'Let me sort this out';

  @override
  String get activityThinkingMemory => 'Searching my memory';

  @override
  String get activityThinkingStorm => 'Brainstorming';

  @override
  String get activityThinkingSavor => 'Hmm… let that sink in';

  @override
  String get activityThinkingMoment => 'One moment, thinking';

  @override
  String get activityThinkingHeadScratch => 'Scratching my head…';

  @override
  String get activityThinkingPlayOut => 'Let’s see where this goes';

  @override
  String get activityThinkingLoading => 'Thoughts loading';

  @override
  String get activityThinkingMulling => 'Mulling it over';

  @override
  String get activityThinkingBreakDown => 'Hmm… let me break it down';

  @override
  String get activityThinkingTrain => 'All aboard the thought train';

  @override
  String get activityThinkingSomething => 'Hmm… there’s something here';

  @override
  String get activityThinkingJog => 'Taking this idea for a jog';

  @override
  String get activityThinkingPicture => 'Wait, I can picture it';

  @override
  String get activityThinkingBubbles => 'Thought bubbles';

  @override
  String get activityThinkingWaves => 'Brainwaves incoming';

  @override
  String get activityThinkingCoffee => 'Brain’s brewing coffee';

  @override
  String get activityThinkingDraft => 'Drafting it in my head';

  @override
  String get activityThinkingComing => 'Ah, it’s coming to me';

  @override
  String get activityThinkingBubbling => 'Ideas bubbling up';

  @override
  String get activityThinkingTackle => 'Hmm… let’s tackle it';

  @override
  String get activityThinkingSpark => 'A spark of an idea';

  @override
  String get activityThinkingLogicFirst => 'Let’s sort the logic first';

  @override
  String get activityThinkingLocate => 'Pinpointing it';

  @override
  String get activityThinkingInvestigate => 'Looking into it';

  @override
  String get activityThinkingGif => 'thinking.gif';

  @override
  String get activityThinkingLook => 'Lemme take a look';

  @override
  String get activityThinkingInteresting => 'Hmm… interesting';

  @override
  String get activityThinkingHands => 'Warming up my brain';

  @override
  String get activityThinkingFiveMinutes => 'Five minutes. Quite a project';

  @override
  String get activityThinkingSerious => 'Time to get serious';

  @override
  String get activityThinkingTricky => 'This is a bit tricky';

  @override
  String get activityThinkingAscend => 'Reaching a higher plane';

  @override
  String get activityThinkingAlmostPromise => 'Almost there, promise';

  @override
  String get activityThinkingLongWay => 'Took the scenic route';

  @override
  String get activityThinkingWrapping => 'Wrapping things up';

  @override
  String get activityThinkingSong => 'Give me one song’s worth';

  @override
  String get activityThinkingBigMove => 'Preparing the big move';

  @override
  String get activityThinkingSimple => 'Easy request. Or is it?';

  @override
  String get activityThinkingOneMinute => 'One minute, still thinking';

  @override
  String get activityThinkingChallenge => 'Now that’s a challenge';

  @override
  String get activityThinkingDig => 'Let me dig a little deeper';

  @override
  String get activityThinkingNotSimple => 'There’s more to this';

  @override
  String get activityThinkingDeep => 'Getting deep into it';

  @override
  String get activityThinkingBurning => 'Brain cells firing away';

  @override
  String get activityThinkingNearlyClear => 'Almost figured it out';

  @override
  String get activityThinkingTwisty => 'This one’s a little twisty…';

  @override
  String get activityThinkingWorkout => 'Giving my brain a workout…';

  @override
  String get activityThinkingStay => 'Stay with me, almost there';

  @override
  String get activityThinkingCloser => 'Let me think this through';

  @override
  String get activityThinkingThirtySeconds => 'Thirty seconds, still at it';

  @override
  String get activityThinkingSoon => 'Hang tight, nearly there';

  @override
  String get activityThinkingAnotherPass => 'Let me take another pass';

  @override
  String get activityThinkingTrack => 'Still on track';

  @override
  String get activityThinkingLead => 'Getting somewhere';

  @override
  String get activityThinkingCircles => 'Going in circles…';

  @override
  String get activityThinkingAnyMoment => 'Any moment now';

  @override
  String get activityThinkingStillLocate => 'Still narrowing it down';

  @override
  String get activityWaitingCall => 'Calling the model…';

  @override
  String get activityWaitingOnWay => 'Model’s on its way';

  @override
  String get activityWaitingSpeak => 'Waiting for a word…';

  @override
  String get activityWaitingWords => 'Finding the right words';

  @override
  String get activityWaitingAwake => 'Is the model awake yet?';

  @override
  String get activityWaitingStretch => 'Letting it stretch';

  @override
  String get activityWaitingYawn => 'The model just yawned';

  @override
  String get activityWaitingComing => 'Model: on my way';

  @override
  String get activityWaitingText => 'Waiting for the first words';

  @override
  String get activityWaitingQueue => 'Still in the queue';

  @override
  String get activityWaitingBrew => 'Something’s brewing';

  @override
  String get activityWaitingWater => 'Model’s taking a sip';

  @override
  String get activityWaitingWarmup => 'Letting it warm up';

  @override
  String get activityWaitingMeditate => 'Model’s meditating';

  @override
  String get activityWaitingBlink => 'Waiting for it to blink';

  @override
  String get activityWaitingMoment => 'It says, “one moment”';

  @override
  String get activityWritingWords => 'Finding the words';

  @override
  String get activityWritingTyping => 'Typing away';

  @override
  String get activityWritingInspired => 'Words flowing like magic';

  @override
  String get activityWritingOnIt => 'Writing, writing';

  @override
  String get activityWritingCareful => 'Choosing each word';

  @override
  String get activityWritingFlow => 'All in one flow';

  @override
  String get activityWritingPlain => 'Putting it in plain words';

  @override
  String get activityWritingIdeas => 'Putting ideas into words';

  @override
  String get activityWritingKeys => 'Tapping away';

  @override
  String get activityWritingAlmost => 'Almost done writing';

  @override
  String get activityWritingTell => 'Let me tell you';

  @override
  String get activityWritingFast => 'Writing up a storm';

  @override
  String get activityWritingBreeze => 'Words flying onto the page';

  @override
  String get activityWritingFormat => 'Tidying up the layout';

  @override
  String get activityNightAscend => 'Transcending bedtime…';

  @override
  String get activityNightHello => 'A little late-night hello';

  @override
  String get activityNightOwl => 'You’re a night owl too?';

  @override
  String get activityNightMoon => 'If the moon’s up, I’m up';

  @override
  String get activityNightSlow => 'Late-night brain, go easy';

  @override
  String get activityNightChampion => 'Night owl champion online';

  @override
  String get activityNightSleepy => 'Sleepy, but I’ve got this';

  @override
  String get activityNightMidnight => 'Still going past midnight';

  @override
  String get activityNightOpen => 'Open for the night shift';

  @override
  String get activityNightStars => 'Even the stars are asleep';

  @override
  String get activityNightDawn => 'Thinking into the small hours';

  @override
  String get activityWeekendChill => 'A little weekend chill';

  @override
  String get activityWeekendHere => 'Here on weekends too!';

  @override
  String get activityWeekendCompany => 'Here on days off too';

  @override
  String get activityWeekendOnline => 'No weekend shutdown';

  @override
  String get activityWeekendSneak => 'Sneaky weekend thinking';

  @override
  String get activityWeekendWorking => 'Working on the weekend too?';

  @override
  String get activityWeekendMode => 'Weekend mode ON';

  @override
  String get activityWeekendBugs => 'Weekend bug fixing';

  @override
  String get activityWeekendSkin => 'Weekend-exclusive look';

  @override
  String get activityNewYearCheers => 'Happy New Year!';

  @override
  String get activityNewYearDay => 'Happy New Year';

  @override
  String get activityNewYearBugs => 'New year, new bugs';

  @override
  String get activityNewYearFirstLine => 'First line of code this year';

  @override
  String get activityNewYearWork => 'Here’s to a great start';

  @override
  String get activityValentineCode => 'Coding on Valentine’s Day too';

  @override
  String get activityValentineLove => 'Code is true love';

  @override
  String get activityValentineDate => 'No date today?';

  @override
  String get activityValentineKeyboard => 'Keyboards are my roses';

  @override
  String get activityPiDay => 'Happy π Day';

  @override
  String get activityPiCircle => 'Extra-round circles today';

  @override
  String get activityAprilFools => 'Happy April Fools’ Day';

  @override
  String get activityAprilBug => 'This bug’s a prank, right?';

  @override
  String get activityAprilErrors => 'Watch out for prank errors';

  @override
  String get activityAprilKidding => 'Just kidding, no errors';

  @override
  String get activityLaborWorking => 'Still working on Labor Day';

  @override
  String get activityLaborPride => 'A little pride in the work';

  @override
  String get activityLaborSpirit => 'Worker mode: all in';

  @override
  String get activityChildrenDay => 'Happy Children’s Day';

  @override
  String get activityChildrenHeart => 'We’re all kids at heart';

  @override
  String get activityChildrenCode => 'Cute code only today';

  @override
  String get activityProgrammerCheers => 'Happy 1024 Programmers’ Day';

  @override
  String get activityProgrammerDay => 'It’s Programmers’ Day';

  @override
  String get activityProgrammer1024 => '1024, happy coding day';

  @override
  String get activityProgrammerCode => 'Coding on our holiday too';

  @override
  String get activityHalloween => 'Happy Halloween';

  @override
  String get activityHalloweenTreat => 'Trick or treat';

  @override
  String get activityHalloweenCode => 'Code can be spooky too';

  @override
  String get activityChristmasEve => 'Happy Christmas Eve';

  @override
  String get activityChristmasEveThinking => 'Thinking on Christmas Eve too';

  @override
  String get activityChristmasEveGift => 'Code tonight, gifts await';

  @override
  String get activityChristmas => 'Merry Christmas';

  @override
  String get activityChristmasCompany => 'Here with you for Christmas';

  @override
  String get activityChristmasEgg => 'A Christmas-only Easter egg';

  @override
  String get activityChristmasReindeer => 'Reindeer delivering code';

  @override
  String get activityYearEndEve => 'New Year’s Eve';

  @override
  String get activityYearEndLast => 'One last thought this year';

  @override
  String get activityYearEndReady => 'Ready for the new year';

  @override
  String get activityYearEndSeeYou => 'See you next year!';

  @override
  String get activityZodiacRat => 'Rat';

  @override
  String get activityZodiacOx => 'Ox';

  @override
  String get activityZodiacTiger => 'Tiger';

  @override
  String get activityZodiacRabbit => 'Rabbit';

  @override
  String get activityZodiacDragon => 'Dragon';

  @override
  String get activityZodiacSnake => 'Snake';

  @override
  String get activityZodiacHorse => 'Horse';

  @override
  String get activityZodiacGoat => 'Goat';

  @override
  String get activityZodiacMonkey => 'Monkey';

  @override
  String get activityZodiacRooster => 'Rooster';

  @override
  String get activityZodiacDog => 'Dog';

  @override
  String get activityZodiacPig => 'Pig';

  @override
  String get activityLunarCheers => 'Happy Lunar New Year!';

  @override
  String get activityLunarCode => 'Still coding over New Year';

  @override
  String get activityLunarEnvelope => 'Red envelopes, please';

  @override
  String get activityLunarSpring => 'Happy Spring Festival';

  @override
  String get activityLunarGreeting => 'New Year greetings';

  @override
  String get activityLunarCodeGreeting => 'The code says Happy New Year';

  @override
  String get activityRareSsr => 'SSR! Rare Easter egg';

  @override
  String get activityRareUr => 'UR drop';

  @override
  String get activityRareLegend => 'Legendary drop!';

  @override
  String get activityRareOrange => 'An orange-tier drop';

  @override
  String get activityRareEgg => 'An Easter egg found you';

  @override
  String get activityRareChosen => 'The chosen moment';

  @override
  String get activityRareHidden => 'You found the hidden edition';

  @override
  String get activityRareChat => 'Secret chat unlocked';

  @override
  String get activityRareMax => 'Rarity MAX';

  @override
  String get activityRareLucky => 'Luck is on your side';

  @override
  String get activityRareCritical => 'Critical hit';

  @override
  String get activityRareNextLevel => 'Next-level thinking';

  @override
  String get activityFailCrash => 'Well, that went sideways';

  @override
  String get activityFailOops => 'Oops';

  @override
  String get activityFailRun => 'That didn’t run';

  @override
  String get activityFailTrip => 'A little stumble';

  @override
  String get activityFailWrong => 'That’s not right';

  @override
  String get activityFailHiccup => 'Hit a hiccup';

  @override
  String get activityFailBroken => 'That’s not working';

  @override
  String get activityFailLocal => 'It works on my machine';

  @override
  String get activityFailYesterday => 'It worked yesterday';

  @override
  String get activityFailTough => 'That’s a tough one';

  @override
  String get activityFailCrack => 'Well, that fell apart';

  @override
  String get activityFailPressure => 'Feeling the pressure';

  @override
  String get activityFailCareless => 'Got a little careless there';

  @override
  String get activityFailSlip => 'A slip of the keys';

  @override
  String get activityFailTryAgain => 'Let’s try another way';

  @override
  String get activityFailChance => 'Give me another shot';

  @override
  String get activityTestGreen => 'All tests green';

  @override
  String get activityTestAllGreen => 'All green. Nice';

  @override
  String get activityTestFirstTry => 'Passed first try!';

  @override
  String get activityTestNoErrors => 'No errors';

  @override
  String get activityTestPassed => 'It passed!';

  @override
  String get activityTestSolid => 'Looking solid';

  @override
  String get activityTestRed => 'Red. Let’s see what broke';

  @override
  String get activityTestInvestigate => 'Tests failed. Looking into it';

  @override
  String get activityTestStubborn => 'One stubborn test';

  @override
  String get activityTestFix => 'Red light. Back to fixing';

  @override
  String get activityGitCommitSave => 'Committed. Progress saved';

  @override
  String get activityGitSaved => 'Progress saved';

  @override
  String get activityGitCommitRelief => 'Committed. Peace of mind';

  @override
  String get activityGitPushed => 'Pushed';

  @override
  String get activityGitPushDone => 'Pushed. Off it goes';

  @override
  String get activityGitCodeOut => 'Code’s out the door';

  @override
  String get activityInstallDone => 'Dependencies installed';

  @override
  String get activityInstallInternet => 'Downloaded half the internet';

  @override
  String get activityInstallPackages => 'All packages present';

  @override
  String get activityMilestoneFive => 'Tools x5, getting into it';

  @override
  String get activityMilestoneTen => 'Tool combo x10';

  @override
  String get activityMilestoneTwenty => 'Tools x20, on a roll';

  @override
  String get activityMilestoneFifty => 'Tools x50, working overtime';

  @override
  String get activityRetryWait => 'Hang tight, retrying';

  @override
  String get activityRetryBackoff => 'Turned away. Backing off';

  @override
  String get activityRetryKnock => 'Knocking once more';

  @override
  String get activityRateLimited => 'Rate limited. Taking a break';

  @override
  String get activityRate429 => '429. A breather, then retry';

  @override
  String get activityRateQueue => 'Quite a queue today';

  @override
  String get activityCompactContext => 'Tidying up the context…';

  @override
  String get activityCompactBag => 'Organizing my backpack…';

  @override
  String get activityCompactSpace => 'Making some room';

  @override
  String get activityCompactMemory => 'Trimming my memory';

  @override
  String get activityCompactChats => 'Packing up old chats';

  @override
  String get activityReminderWater => 'Half an hour. Water break?';

  @override
  String get activityReminderTenMinutes => 'Ten minutes. Quite a task';

  @override
  String get activityDiffTitle => 'Turn changes';

  @override
  String get activityDiffCopied => 'Patch copied';

  @override
  String get activityDiffNoWrap => 'Don’t wrap lines';

  @override
  String get activityDiffWrap => 'Wrap lines';

  @override
  String get activityDiffCopy => 'Copy patch';

  @override
  String get activityDiffEmpty => 'Empty file, no changes to show';

  @override
  String get activityDiffNewFile => 'New file';

  @override
  String get activityDiffUnknownLines => 'Line numbers unknown';

  @override
  String get activityDiffCopyPath => 'Copy path';

  @override
  String get activityThinking => 'Thinking';

  @override
  String get activityReplyInterrupted => 'Reply (interrupted)';

  @override
  String get activityWaitingApproval => 'Waiting for approval';

  @override
  String get activityWaitingAnswer => 'Waiting for answer';

  @override
  String get activityWriting => 'Writing reply';

  @override
  String get activityThinkingNow => 'Thinking';

  @override
  String get activityRetrying => 'Retrying';

  @override
  String get activityCompacting => 'Compacting context';

  @override
  String get activityVerbRun => 'Run';

  @override
  String get activityVerbWrite => 'Write';

  @override
  String get activityVerbEdit => 'Edit';

  @override
  String get activityVerbImage => 'View image';

  @override
  String get activityVerbRead => 'Read';

  @override
  String get activityVerbFind => 'Find';

  @override
  String get activityVerbSearch => 'Search';

  @override
  String get activityVerbWebSearch => 'Search web';

  @override
  String get activityVerbWebView => 'View web';

  @override
  String get activityVerbSubagent => 'Send subagent';

  @override
  String get activityVerbTodo => 'Update to-dos';

  @override
  String get activitySecretHide => 'Hide key';

  @override
  String get activitySecretShow => 'Show key';

  @override
  String get activitySlashNoMatch => 'No matching command. Send as a message';

  @override
  String get activitySlashCommands => 'Commands';

  @override
  String get activitySlashEnterArgs => 'Enter arguments, then send';

  @override
  String get activityStepTitle => 'Step details';

  @override
  String get activityStepMissing => 'This step isn’t in the loaded history';

  @override
  String get activityStepQuestion => 'Question';

  @override
  String get activityStepSuccess => 'Succeeded';

  @override
  String get activityStepNeedsPermission => 'Needs permission';

  @override
  String get activityTools => 'Tools';

  @override
  String get activityStepDispatched => 'Dispatched';

  @override
  String get activityStepExecution => 'Execution';

  @override
  String get activityStepLocation => 'Location';

  @override
  String get activityStepArguments => 'Arguments';

  @override
  String get activityStepChanges => 'Changes';

  @override
  String get activityStepFullScreen => 'View full screen';

  @override
  String get activityStepReadContent => 'Content read';

  @override
  String get activityStepWrittenContent => 'Content written';

  @override
  String get activityStepError => 'Error';

  @override
  String get activityOutput => 'Output';

  @override
  String get activityStepResult => 'Result';

  @override
  String get activityStepDeclined => 'You declined this tool call';

  @override
  String get activityStepNoOutput => 'No output';

  @override
  String get activityStepStart => 'Started';

  @override
  String get activityDuration => 'Duration';

  @override
  String get activityFirstToken => 'First token';

  @override
  String get activityStepGeneration => 'Generation';

  @override
  String get activityStepSpeed => 'Speed';

  @override
  String get activityModel => 'Model';

  @override
  String get activityStepTiming => 'Timing';

  @override
  String get activityUsage => 'Usage';

  @override
  String get activityInput => 'Input';

  @override
  String get activityStepCacheHit => '  Cache hit';

  @override
  String get activityStepCacheMiss => '  Cache miss';

  @override
  String get activityStepCacheWrite => '  Cache write';

  @override
  String get activityStepReasoning => '  Reasoning';

  @override
  String get activityStepAnswer => '  Answer';

  @override
  String get activityStepThinking => 'Thinking';

  @override
  String get activityStepExplanation => 'Explanation';

  @override
  String get activityStepToolCalls => 'Tools called in this step';

  @override
  String get activityStepProcessing => 'Model is processing';

  @override
  String get activityApprovalAllowed => 'Allowed';

  @override
  String get activityApprovalUnanswered => 'No approval received';

  @override
  String get activityApprovalAnswered => 'Answered';

  @override
  String get activityToolRead => 'Read';

  @override
  String get activityToolWrite => 'Write';

  @override
  String get activityToolCall => 'Call tool';

  @override
  String get activityTraceTitle => 'Turn trajectory';

  @override
  String get activityTraceNotLoaded => 'This turn’s history hasn’t loaded yet';

  @override
  String get activityTraceOutputLimit => 'Output limit reached';

  @override
  String get activityTraceEngineRestarted => 'Interrupted by engine restart';

  @override
  String get activityTraceBlocked => 'Blocked';

  @override
  String get activityTraceHeading => 'Turn trajectory  ';

  @override
  String get activityTraceWaiting => 'Waiting for you';

  @override
  String get activityTraceNoSteps => 'No timed steps in this turn';

  @override
  String get activityUsageInputIncludesCache => 'Input includes cache hits';

  @override
  String get activityCacheHit => 'Cache hit';

  @override
  String get activitySummaryTodo => 'Updated to-dos';

  @override
  String get activityUsageBalance => 'DeepSeek balance';

  @override
  String get activityUsageContext => 'Context';

  @override
  String get activityUsageChat => 'This chat';

  @override
  String get activityUsageAfterMessage => 'Appears after you send a message';

  @override
  String get activityUsageContextFull => 'Context nearly full. Send /compact to compact it';

  @override
  String get activitySpanZero => '0 sec';

  @override
  String get activitySpanTiny => '<0.1 sec';

  @override
  String activityTokensTenThousands(String value) {
    return '${value}K';
  }

  @override
  String activityTokensHundredMillions(String value) {
    return '${value}M';
  }

  @override
  String activityUsageContextSemantics(String percent) {
    return 'Context $percent used, view usage';
  }

  @override
  String activityUsageSystemTokens(String tokens) {
    return 'System $tokens';
  }

  @override
  String activityUsageToolTokens(String tokens) {
    return 'Tools $tokens';
  }

  @override
  String activityUsageMessageTokens(String tokens) {
    return 'Messages $tokens';
  }

  @override
  String activityUsageTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count turns total', one: '1 turn total');
    return '$_temp0';
  }

  @override
  String activityUsageCacheWriteTokens(String tokens) {
    return 'Cache write $tokens';
  }

  @override
  String activitySummaryCommands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ran $count commands',
      one: 'Ran 1 command',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryEditedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edited $count files',
      one: 'Edited 1 file',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryReadFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Read $count files', one: 'Read 1 file');
    return '$_temp0';
  }

  @override
  String activitySummarySearches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Searched $count times',
      one: 'Searched 1 time',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryWeb(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Used the web $count times',
      one: 'Used the web 1 time',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySubagents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Called subagents $count times',
      one: 'Called a subagent 1 time',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Other tools: $count calls',
      one: 'Other tools: 1 call',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Used $count tools', one: 'Used 1 tool');
    return '$_temp0';
  }

  @override
  String activityDiffBlockMarker(int index, int total) {
    return '@@ Change $index/$total @@';
  }

  @override
  String activityDiffEditMarker(int index, int total) {
    return 'Edit $index of $total';
  }

  @override
  String activityTraceSpanSemantics(String title, String detail, String duration) {
    return '$title $detail, duration $duration';
  }

  @override
  String activityTraceGroupSemantics(String label, String duration) {
    return '$label, duration $duration';
  }

  @override
  String activityTraceEstimatedCost(String cost) {
    return '$cost (estimated at official rates)';
  }

  @override
  String activityTraceReasoningTokens(String tokens) {
    return 'Reasoning: $tokens';
  }

  @override
  String activityStepPosition(int turn, Object step) {
    return 'Turn $turn · Step $step';
  }

  @override
  String activityStepTokenSpeed(String speed) {
    return '$speed tokens/sec';
  }

  @override
  String activityStepRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count times', one: '1 time');
    return '$_temp0';
  }

  @override
  String activityStepTruncated(String text, int count) {
    return '$text\n… (Showing only the first ${count}k characters. Copy for the full text)';
  }

  @override
  String activityStepLiveElapsed(String elapsed, String suffix) {
    return '$elapsed · In progress$suffix';
  }

  @override
  String activityStepCopySection(String title) {
    return 'Copy $title';
  }

  @override
  String activityStepCopiedSection(String title) {
    return 'Copied $title';
  }

  @override
  String activitySlashDescriptionArgs(String description) {
    return '$description · Enter arguments, then send';
  }

  @override
  String activitySpanSecondsText(String seconds) {
    return '$seconds sec';
  }

  @override
  String activitySpanSeconds(int seconds) {
    return '$seconds sec';
  }

  @override
  String activitySpanMinutesSeconds(int minutes, String seconds) {
    return '$minutes min $seconds sec';
  }

  @override
  String activitySpanHoursMinutes(int hours, String minutes) {
    return '$hours h $minutes min';
  }

  @override
  String activityCostUnderCent(String symbol) {
    return 'Under ${symbol}0.01';
  }

  @override
  String activityCostApprox(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySpanRetries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Retried $count times',
      one: 'Retried 1 time',
    );
    return '$_temp0';
  }

  @override
  String activitySpanToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chose to call $count tools',
      one: 'Chose to call 1 tool',
    );
    return '$_temp0';
  }

  @override
  String activityRunningItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'among $count items', one: 'among 1 item');
    return '$_temp0';
  }

  @override
  String activityRetryAttempt(int count) {
    return 'Attempt $count';
  }

  @override
  String activityDiffFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count files', one: '1 file');
    return '$_temp0';
  }

  @override
  String activityDiffFileSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(added, locale: localeName, other: '$added lines added', one: '1 line added');
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed lines removed',
      one: '1 line removed',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String activityDiffEditNumber(int edit) {
    return 'Edit $edit';
  }

  @override
  String activityDiffHunkNumber(int index) {
    return 'Change $index';
  }

  @override
  String activityDiffFromLine(int line) {
    return 'From line $line';
  }

  @override
  String activityDiffEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Edited $count times',
      one: 'Edited 1 time',
    );
    return '$_temp0';
  }

  @override
  String activityLunarZodiac(String animal) {
    return 'Good luck in the Year of the $animal';
  }

  @override
  String activityReminderHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours hours straight. Take a break?',
      one: 'One hour straight. Take a break?',
    );
    return '$_temp0';
  }

  @override
  String get activityStepModelRequest => 'One model request';

  @override
  String activityStepModelRequestDetail(String detail) {
    return 'One model request · $detail';
  }

  @override
  String activityUsageEstimatedCost(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySlashCommandSemantics(String label, String name) {
    return '$label, /$name';
  }

  @override
  String get activityToolListSeparator => ', ';

  @override
  String get botsFolderGone => 'This folder is gone';

  @override
  String get botsFolderReadFailed => 'Couldn’t read this folder';

  @override
  String get botsFolderOpenFailed => 'Couldn’t open this folder';

  @override
  String botsFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count folders', one: '1 folder');
    return '$_temp0';
  }

  @override
  String get botsWorkingFolder => 'Working directory';

  @override
  String get botsFolderTeamDefault => 'Team workspace';

  @override
  String get botsFolderRoomDefault => 'Each Bot’s own directory';

  @override
  String get botsFolderHint => 'Folders on the connected host.';

  @override
  String get botsFolderCurrent => 'Current directory';

  @override
  String get botsFolderUnavailable => 'The connection or folder changed. Reopen to continue.';

  @override
  String get botsFolderNoChoices => 'No other folders on the host.';

  @override
  String get botsFolderConfirm => 'Use this working directory?';

  @override
  String get botsFolderRefused =>
      'The host refused this folder. It may be gone, inaccessible or protected. Choose another or retry.';

  @override
  String botsChildCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count child agents',
      one: '1 child agent',
    );
    return '$_temp0';
  }

  @override
  String get botsCurrentChat => 'Current chat';

  @override
  String botsSubagentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagents', one: '1 subagent');
    return '$_temp0';
  }

  @override
  String botsRunningCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count running', one: '1 running');
    return '$_temp0';
  }

  @override
  String botsFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count failed', one: '1 failed');
    return '$_temp0';
  }

  @override
  String botsNestedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Includes $count child agents',
      one: 'Includes 1 child agent',
    );
    return '$_temp0';
  }

  @override
  String botsBackToParent(String title) {
    return 'Back to “$title”';
  }

  @override
  String botsTeamMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Agent team, $count members',
      one: 'Agent team, 1 member',
    );
    return '$_temp0';
  }

  @override
  String get botsAgentTeam => 'Agent team';

  @override
  String botsSubagentRunningCount(int count, int running) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count subagents', one: '1 subagent');
    String _temp1 = intl.Intl.pluralLogic(running, locale: localeName, other: '$running running', one: '1 running');
    return '$_temp0, $_temp1';
  }

  @override
  String get botsSubagents => 'Subagents';

  @override
  String get botsNoSubagents => 'No subagents sent';

  @override
  String get botsOpenChatFirst => 'Open a chat first';

  @override
  String get botsTeamReadFailed => 'Couldn’t load the team';

  @override
  String get botsNoTeamOnHost => 'No agent team on this host';

  @override
  String get botsTeamNotEnabled => 'Agent team is off';

  @override
  String get botsTeamDescription => 'Agents work together on a shared task board';

  @override
  String get botsTeamEnabling => 'Turning on…';

  @override
  String get botsTeamEnable => 'Turn on team';

  @override
  String botsMembersWorking(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members working',
      one: '1 member working',
    );
    return '$_temp0';
  }

  @override
  String get botsTeamStandby => 'All on standby';

  @override
  String get botsMembers => 'Members';

  @override
  String get botsTasks => 'Tasks';

  @override
  String get botsTeamRecordUnreadable => 'Couldn’t read a team record';

  @override
  String get botsMessages => 'Messages';

  @override
  String get botsOwner => 'Owner';

  @override
  String get botsTeamCreateHint => 'Ask AI to form a team in a chat';

  @override
  String get botsCurrent => 'Current';

  @override
  String get botsNoTasks => 'No tasks yet';

  @override
  String get botsTodo => 'To do';

  @override
  String get botsUnassigned => 'Unassigned';

  @override
  String botsTaskWaitingFor(String dependencies) {
    return 'Waiting for $dependencies';
  }

  @override
  String get botsWriteOverlap => 'Overlapping write scopes';

  @override
  String get botsWaitingDependencies => 'Waiting on dependencies';

  @override
  String get botsReadyToStart => 'Ready to start';

  @override
  String get botsTaskId => 'ID';

  @override
  String get botsDependencies => 'Dependencies';

  @override
  String get botsWriteScopes => 'Write scopes';

  @override
  String get botsMessagesReadFailed => 'Couldn’t load messages';

  @override
  String get botsNoMemberMessages => 'No messages between members yet';

  @override
  String get botsMessagesIncomplete => 'Some members’ messages didn’t load · Retry';

  @override
  String botsDateTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get botsViewDetails => 'View details';

  @override
  String get botsAdmin => 'Admin';

  @override
  String get botsFullTextChanged => 'This conversation has changed';

  @override
  String get botsFullTextReopen => 'Open the message again';

  @override
  String get botsFullTextReadFailed => 'Couldn’t load the full text';

  @override
  String get botsShowAll => 'Show all';

  @override
  String get botsImagePlaceholder => '[Image]';

  @override
  String get botsSending => 'Sending';

  @override
  String get botsWriteOwn => 'Write your own';

  @override
  String get botsSubmit => 'Submit';

  @override
  String botsChooseModelFor(String name) {
    return 'Choose a model for $name';
  }

  @override
  String get botsModelGreeting => 'It’ll say hello once you choose';

  @override
  String get botsChooseModel => 'Choose model';

  @override
  String get botsSkipAnswer => 'Skip';

  @override
  String get botsBotGone => 'This bot is gone';

  @override
  String get botsWaitingModel => 'Choose a model';

  @override
  String get botsThinking => 'Thinking';

  @override
  String get botsMainBot => 'Main bot';

  @override
  String get botsIdle => 'Idle';

  @override
  String get botsAnsweredQuestion => 'You answered its question';

  @override
  String get botsEarlierMessages => 'Earlier messages';

  @override
  String botsComposerHint(String name) {
    return 'Message $name…';
  }

  @override
  String botsDeleteNamed(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get botsDeleteBotBody => 'Its chats stay. Its memories move to the archive.';

  @override
  String get botsTokensToday => '24h tokens';

  @override
  String get botsMemoryUnit => 'Memories';

  @override
  String get botsRoomUnit => 'Group chats';

  @override
  String get botsProfile => 'Profile';

  @override
  String get botsModel => 'Model';

  @override
  String get botsBotName => 'Name';

  @override
  String get botsRole => 'Role';

  @override
  String get botsWriterExample => 'For example: Writer';

  @override
  String get botsInstructions => 'Instructions';

  @override
  String get botsInstructionsHint => 'How it should work';

  @override
  String get botsColor => 'Color';

  @override
  String get botsUsage => 'Usage';

  @override
  String get botsUsageScanning => 'Still counting older chats. Totals will fill in.';

  @override
  String get botsUsageRefresh => 'Refresh';

  @override
  String get botsToday => 'Last 24 hours';

  @override
  String get botsLastWeek => 'Last 7 days';

  @override
  String get botsLastMonth => 'Last 30 days';

  @override
  String botsMonthCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Last 30 days · $count calls',
      one: 'Last 30 days · 1 call',
    );
    return '$_temp0';
  }

  @override
  String get botsFullRecord => 'Full record';

  @override
  String get botsEveryToolCall => 'Every tool call';

  @override
  String get botsUnsetMain => 'Unset main bot';

  @override
  String get botsSetMain => 'Set as main';

  @override
  String get botsDeleteBot => 'Delete bot';

  @override
  String get botsEffortOff => 'No thinking';

  @override
  String get botsEffortMinimal => 'Minimal';

  @override
  String get botsEffortLow => 'Low';

  @override
  String get botsEffortMedium => 'Medium';

  @override
  String get botsEffortHigh => 'High';

  @override
  String get botsEffortMax => 'Max';

  @override
  String botsNamedRecord(String name) {
    return '$name · Full record';
  }

  @override
  String get botsOrganizingNotes => 'Organizing notes';

  @override
  String get botsToolRun => 'run commands';

  @override
  String get botsToolRead => 'view files';

  @override
  String get botsToolEdit => 'edit files';

  @override
  String get botsToolSearch => 'search the web';

  @override
  String get botsToolBrowse => 'browse the web';

  @override
  String get botsToolMessage => 'contact other bots';

  @override
  String get botsToolGroup => 'chat with the group';

  @override
  String get botsToolMemory => 'organize memories';

  @override
  String get botsToolRecall => 'look through records';

  @override
  String get botsToolTeam => 'organize the team';

  @override
  String get botsToolAsk => 'ask you something';

  @override
  String get botsToolWork => 'work';

  @override
  String get botsJustNow => 'Just now';

  @override
  String botsCountHundredMillion(String value) {
    return '${value}M';
  }

  @override
  String botsCountTenThousand(String value) {
    return '${value}K';
  }

  @override
  String get botsModelNotSelected => 'Not selected';

  @override
  String botsYourPreview(String preview) {
    return 'You: $preview';
  }

  @override
  String botsEventWorking(String name) {
    return '$name started working';
  }

  @override
  String botsEventApproval(String name) {
    return '$name needs your approval';
  }

  @override
  String botsEventDone(String name) {
    return '$name finished working';
  }

  @override
  String botsEventStopped(String name) {
    return 'You stopped $name’s work';
  }

  @override
  String botsEventFailed(String name) {
    return '$name couldn’t answer';
  }

  @override
  String botsEventMissed(String name) {
    return '$name didn’t respond in time';
  }

  @override
  String botsEventLookup(String name) {
    return '$name looked through its chats';
  }

  @override
  String botsEventLookupQuery(String name, String query) {
    return '$name searched its chats for “$query”';
  }

  @override
  String botsEventResumed(String name) {
    return '$name resumed after restarting';
  }

  @override
  String botsEventCut(String name) {
    return '$name stopped after another restart interrupted it';
  }

  @override
  String get botsAutomation => 'Automation';

  @override
  String botsAutomationText(String text) {
    return 'Automation: $text';
  }

  @override
  String get botsOtherBot => 'Another bot';

  @override
  String botsMessageFrom(String name) {
    return 'Message from $name';
  }

  @override
  String botsEventReplied(String name) {
    return '$name replied';
  }

  @override
  String get botsGroupReplied => 'A reply in the group';

  @override
  String botsNamedGroupReplied(String name) {
    return 'A reply in “$name”';
  }

  @override
  String botsEventCalledStop(String name) {
    return '$name stopped the work';
  }

  @override
  String get botsChooseMember => 'Choose member';

  @override
  String get botsMentionMember => 'Mention member';

  @override
  String get botsRelayUnavailable => 'Bots aren’t available over Relay';

  @override
  String get botsUseSsh => 'Connect to this computer over SSH to use bots';

  @override
  String get botsTeamLoadFailed => 'Couldn’t load the bot team';

  @override
  String botsBotCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bots', one: '1 bot');
    return '$_temp0';
  }

  @override
  String botsRoomCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count group chats', one: '1 group chat');
    return '$_temp0';
  }

  @override
  String get botsNewBot => 'New bot';

  @override
  String get botsGroupChat => 'Group chat';

  @override
  String get botsNewGroup => 'New group';

  @override
  String get botsDuplicateCreated => 'Copied. It will show up in the list shortly.';

  @override
  String get botsDuplicate => 'Duplicate Bot';

  @override
  String get botsDuplicateHint => 'Same settings, fresh chat and memory';

  @override
  String botsDuplicateNamed(String name) {
    return 'Duplicate $name?';
  }

  @override
  String get botsDuplicateBody =>
      'The new Bot keeps its job, instructions and model settings, starts with a fresh chat and personal memory, and gets its name from the host. When a model is available, it opens with a greeting.';

  @override
  String get botsChooseModelStart => 'Choose a model to start';

  @override
  String get botsNoChats => 'No chats yet';

  @override
  String botsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count unread', one: '1 unread');
    return '$_temp0';
  }

  @override
  String get botsMainTag => 'Main';

  @override
  String get botsMemberNeedsApproval => 'A member needs approval';

  @override
  String botsNamedWorking(String name) {
    return '$name is working';
  }

  @override
  String botsNamesWorking(String names) {
    return '$names are working';
  }

  @override
  String botsMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count members', one: '1 member');
    return '$_temp0';
  }

  @override
  String get botsUpdateRequired => 'DS Bot needs an update';

  @override
  String get botsInstall => 'Install DS Bot';

  @override
  String get botsUpdateForPhone => 'Update to use it on your phone';

  @override
  String get botsInstallDescription => 'Always-on bots, each with its own memory and role';

  @override
  String botsInstallOnHost(String host) {
    return 'Install on $host to get started';
  }

  @override
  String botsRunsOnHost(String host) {
    return 'Runs on $host';
  }

  @override
  String get botsInstalling => 'Installing';

  @override
  String get botsMemory => 'Memory';

  @override
  String get botsEditMemory => 'Edit memory';

  @override
  String get botsAddMemory => 'Add memory';

  @override
  String get botsMemoryReplyExample => 'For example: Keep replies short';

  @override
  String get botsMemoryDraftExample => 'For example: First draft by Friday';

  @override
  String botsMemoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Memory · $count', one: 'Memory · 1');
    return '$_temp0';
  }

  @override
  String get botsMemoryReadFailed => 'Couldn’t load memories';

  @override
  String get botsSummary => 'Summary';

  @override
  String get botsNoMemory => 'No memories yet';

  @override
  String get botsTeam => 'Team';

  @override
  String get botsSelf => 'Self';

  @override
  String get botsWrittenByYou => 'Written by you';

  @override
  String get botsNameRequired => 'Enter a name';

  @override
  String get botsRoleHint => 'What it does, in one sentence';

  @override
  String get botsNewInstructionsHint => 'How it should work and what to keep in mind';

  @override
  String get botsAppearance => 'Appearance';

  @override
  String get botsCreating => 'Creating';

  @override
  String get botsGroupNameOptional => 'Group name (optional)';

  @override
  String botsMembersSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Members · $count selected',
      one: 'Members · 1 selected',
    );
    return '$_temp0';
  }

  @override
  String get botsPickTwoBots => 'Pick at least two bots';

  @override
  String get botsFullText => 'Full text';

  @override
  String botsTextPartial(String count) {
    return 'Showing the first $count characters';
  }

  @override
  String get botsTextCompletenessUnknown => 'Couldn’t confirm this is the complete text';

  @override
  String get botsRoomGone => 'This group chat is gone';

  @override
  String botsNamedSpeaking(String name) {
    return '$name is speaking';
  }

  @override
  String botsNamedActivity(String name, String activity) {
    return '$name: $activity';
  }

  @override
  String get botsWorking => 'Working';

  @override
  String get botsDiscussing => 'Discussing';

  @override
  String get botsTyping => 'Typing';

  @override
  String get botsGroupComposerHint => 'Message everyone…';

  @override
  String get botsDecline => 'Decline';

  @override
  String get botsAllowOnce => 'Allow once';

  @override
  String get botsPrivateChat => 'Chat privately';

  @override
  String get botsSetAdmin => 'Make admin';

  @override
  String get botsRemoveMember => 'Remove from group';

  @override
  String get botsDeleteRoomBody => 'The group’s records stay. Its memories move to the archive.';

  @override
  String botsNamedAdmin(String name) {
    return 'Admin $name';
  }

  @override
  String botsRoomWorkingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count working', one: '1 working');
    return '$_temp0';
  }

  @override
  String botsMembersCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Members · $count', one: 'Members · 1');
    return '$_temp0';
  }

  @override
  String get botsStopMember => 'Stop';

  @override
  String get botsAddMember => 'Add members';

  @override
  String get botsWhoAnswers => 'Who answers first';

  @override
  String get botsAdminFirst => 'Admin first';

  @override
  String get botsEveryoneInTurn => 'Take turns';

  @override
  String get botsGroupName => 'Group name';

  @override
  String get botsGroupNotice => 'Group notice';

  @override
  String get botsGroupNoticeHint => 'Every member sees this before speaking';

  @override
  String get botsDeleteGroup => 'Delete group';

  @override
  String get botsDiscardTitle => 'Discard changes?';

  @override
  String get botsKeepEditing => 'Keep editing';

  @override
  String get botsDiscard => 'Discard';

  @override
  String get botsProgress => 'Progress';

  @override
  String get botsGlyphRun => 'Run';

  @override
  String get botsGlyphJobOutput => 'List background jobs';

  @override
  String get botsGlyphJobs => 'Background jobs';

  @override
  String get botsGlyphStopJob => 'Stop background job';

  @override
  String get botsGlyphRead => 'Read';

  @override
  String get botsGlyphImage => 'View image';

  @override
  String get botsGlyphDeliver => 'Present files';

  @override
  String get botsGlyphWrite => 'Write';

  @override
  String get botsGlyphSearch => 'Search';

  @override
  String get botsGlyphFindFiles => 'Find files';

  @override
  String get botsGlyphOpenWeb => 'Open webpage';

  @override
  String get botsGlyphMessageAgent => 'Message subagent';

  @override
  String get botsGlyphInterruptAgent => 'Interrupt subagent';

  @override
  String get botsGlyphListModels => 'List subagent models';

  @override
  String get botsGlyphWorkflow => 'Workflow';

  @override
  String get botsGlyphLoop => 'Loop task';

  @override
  String get botsGlyphSkill => 'Use skill';

  @override
  String get botsGlyphTodo => 'Update to-dos';

  @override
  String get botsGlyphSetGoal => 'Set goal';

  @override
  String get botsGlyphViewGoal => 'View goal';

  @override
  String get botsGlyphUpdateGoal => 'Update goal';

  @override
  String get botsGlyphAsk => 'Ask question';

  @override
  String get botsCommunityEmpty => 'Nothing here yet';

  @override
  String get botsCommunityGroups => 'Chat groups';

  @override
  String get botsCommunity => 'Community';

  @override
  String get botsForum => 'Forum';

  @override
  String get botsForumSubtitle => 'Ask, share, connect';

  @override
  String get botsProjectHome => 'DSH Go project home';

  @override
  String get botsOpenSource => 'Open-source project';

  @override
  String get botsPluginCatalogFailed => 'Couldn’t open the plugin catalog';

  @override
  String get botsTapRetry => 'Tap to retry';

  @override
  String get botsFeaturedPlugins => 'Featured plugins';

  @override
  String get botsPluginSource => 'Plugin info from dshfind';

  @override
  String get botsPromptIdeas => 'Try this';

  @override
  String get botsUpdates => 'What’s new';

  @override
  String get botsLink => 'link';

  @override
  String botsLinkOpenFailed(String host) {
    return 'Couldn’t open $host';
  }

  @override
  String botsYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String get botsCopyGroupNumber => 'Copy group number';

  @override
  String botsQrCodeLabel(String title) {
    return '$title QR code';
  }

  @override
  String get botsFiles => 'Files';

  @override
  String get botsEmptyCell => '(empty)';

  @override
  String botsYesterdayTime(String time) {
    return 'Yesterday $time';
  }

  @override
  String get botsOutsideWorkspace => 'Outside the workspace';

  @override
  String get botsNotFolder => 'This isn’t a folder';

  @override
  String get botsChatNotFound => 'Chat not found';

  @override
  String get botsBrowseUnsupported => 'This connection doesn’t support file browsing';

  @override
  String get botsWorkspace => 'Workspace';

  @override
  String get botsSearchFiles => 'Search files';

  @override
  String get botsGoUp => 'Go up';

  @override
  String get botsEmptyFolder => 'Empty folder';

  @override
  String botsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count files', one: '1 file');
    return '$_temp0';
  }

  @override
  String botsTruncatedItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Only the first $count items are shown',
      one: 'Only the first item is shown',
    );
    return '$_temp0';
  }

  @override
  String get botsMoreActions => 'More actions';

  @override
  String get botsSearchFailed => 'Couldn’t search';

  @override
  String get botsNoResults => 'No results';

  @override
  String get botsCopyPath => 'Copy path';

  @override
  String get botsPetOutsideApp => 'Show outside the app';

  @override
  String get botsPetNotAuthorized => 'Not allowed';

  @override
  String get botsPetDisplayWhen => 'When to show';

  @override
  String get botsPetWhenActive => 'When active';

  @override
  String get botsPetAlways => 'Always';

  @override
  String get botsPetSwitchDisabled => 'Switch disabled';

  @override
  String get botsPetRestrictedSettings => 'Allow restricted settings';

  @override
  String get botsPetHiddenToday => 'Hidden for today';

  @override
  String get botsPetRestore => 'Restore';

  @override
  String get botsPetChange => 'Change pet';

  @override
  String get botsPetHideHour => 'Hide for 1 hour';

  @override
  String get botsPetSettings => 'Pet settings';

  @override
  String get botsPetDeepy => 'Deepy';

  @override
  String get botsPetWhaleGirl => 'Whale girl';

  @override
  String get botsPetNone => 'None';

  @override
  String get botsPets => 'Pets';

  @override
  String get botsPetSource => 'From DSH-TUI';

  @override
  String get botsPetSize => 'Size';

  @override
  String get botsPetQuiet => 'Quiet mode';

  @override
  String get botsPetQuietSubtitle => 'Animations only, no bubbles';

  @override
  String get botsPetShowNow => 'Show now';

  @override
  String botsPetHiddenUntil(String time) {
    return 'Hidden until $time';
  }

  @override
  String get botsKeyEsc => 'Send Esc';

  @override
  String get botsKeyTab => 'Send Tab';

  @override
  String get botsKeyLeft => 'Left';

  @override
  String get botsKeyUp => 'Up';

  @override
  String get botsKeyDown => 'Down';

  @override
  String get botsKeyRight => 'Right';

  @override
  String get botsKeyPipe => 'Pipe';

  @override
  String get botsKeyTilde => 'Tilde';

  @override
  String get botsKeySlash => 'Slash';

  @override
  String get botsKeyDash => 'Hyphen';

  @override
  String get botsTerminal => 'Terminal';

  @override
  String get botsTerminalRename => 'Rename terminal';

  @override
  String get botsTerminalName => 'Terminal name';

  @override
  String get botsTerminalRenameFailed => 'Couldn’t rename';

  @override
  String botsTerminalCloseNamed(String title) {
    return 'Close “$title”?';
  }

  @override
  String get botsTerminalCloseBody => 'Processes inside will end';

  @override
  String get botsTerminalUnsupported => 'Terminal isn’t available on this connection';

  @override
  String get botsTerminalSupportedHosts => 'Available on this phone or an SSH host';

  @override
  String get botsTerminalOpening => 'Opening terminal…';

  @override
  String get botsTerminalNone => 'No open terminals';

  @override
  String get botsTerminalNew => 'New terminal';

  @override
  String get botsTerminalClose => 'Close terminal';

  @override
  String get botsTerminalChooseShell => 'Choose shell';

  @override
  String get botsTerminalShellFailed => 'Couldn’t load shells';

  @override
  String get botsTerminalReading => 'Reading…';

  @override
  String get botsTerminalDefaultShell => 'Default shell';

  @override
  String get botsTerminalOtherDevice => 'Another device is typing';

  @override
  String get botsTerminalTakeOver => 'Take over';

  @override
  String get botsTerminalStarting => 'Starting…';

  @override
  String get botsTerminalConnecting => 'Connecting…';

  @override
  String get botsTerminalDisconnected => 'Disconnected';

  @override
  String get botsTerminalReconnect => 'Reconnect';

  @override
  String get botsTerminalEnded => 'Ended';

  @override
  String botsTerminalExitCode(int code) {
    return 'Ended · Exit code $code';
  }

  @override
  String get botsTerminalGone => 'This terminal is gone';

  @override
  String get botsTerminalLimit => 'Close unused terminals first';

  @override
  String get botsToolWorkingRun => 'Running commands';

  @override
  String botsToolApprovalRun(String name) {
    return '$name wants to run commands';
  }

  @override
  String get botsToolWorkingRead => 'Viewing files';

  @override
  String botsToolApprovalRead(String name) {
    return '$name wants to view files';
  }

  @override
  String get botsToolWorkingEdit => 'Editing files';

  @override
  String botsToolApprovalEdit(String name) {
    return '$name wants to edit files';
  }

  @override
  String get botsToolWorkingSearch => 'Searching the web';

  @override
  String botsToolApprovalSearch(String name) {
    return '$name wants to search the web';
  }

  @override
  String get botsToolWorkingBrowse => 'Browsing the web';

  @override
  String botsToolApprovalBrowse(String name) {
    return '$name wants to browse the web';
  }

  @override
  String get botsToolWorkingMessage => 'Contacting other bots';

  @override
  String botsToolApprovalMessage(String name) {
    return '$name wants to contact other bots';
  }

  @override
  String get botsToolWorkingGroup => 'Chatting with the group';

  @override
  String botsToolApprovalGroup(String name) {
    return '$name wants to chat with the group';
  }

  @override
  String get botsToolWorkingMemory => 'Organizing memories';

  @override
  String botsToolApprovalMemory(String name) {
    return '$name wants to organize memories';
  }

  @override
  String get botsToolWorkingRecall => 'Looking through records';

  @override
  String botsToolApprovalRecall(String name) {
    return '$name wants to look through records';
  }

  @override
  String get botsToolWorkingTeam => 'Organizing the team';

  @override
  String botsToolApprovalTeam(String name) {
    return '$name wants to organize the team';
  }

  @override
  String get botsToolWorkingAsk => 'Preparing to ask you';

  @override
  String botsToolApprovalAsk(String name) {
    return '$name wants to ask you something';
  }

  @override
  String get botsToolWorkingWork => 'Working';

  @override
  String botsToolApprovalWork(String name) {
    return '$name wants to work';
  }

  @override
  String get botsEveryone => 'Everyone';

  @override
  String get botsActivelyRunning => 'Running';

  @override
  String get botsListSeparator => ', ';

  @override
  String get botsNameSeparator => ', ';

  @override
  String get botsGlyphSubagent => 'Subagent';

  @override
  String get botsGlyphWebSearch => 'Web search';

  @override
  String botsSenderPreview(String name, String preview) {
    return '$name: $preview';
  }

  @override
  String botsAgentSemantics(String title, String state) {
    return '$title, $state';
  }

  @override
  String botsViewMetric(Object label, Object value) {
    return '$label: $value';
  }

  @override
  String get botsEffortXhigh => 'Extra high';

  @override
  String get botsRelayLimit => 'Bot relay limit';

  @override
  String get botsRelayLimitHint =>
      'Pause after this many Bot-to-Bot calls since your last message. Enter a whole number from 1 to 200, or leave empty for the default.';

  @override
  String botsRelayLimitDefault(int count) {
    return 'Default: $count';
  }

  @override
  String get botsRelayLimitInvalid => 'Enter a whole number from 1 to 200.';

  @override
  String get botsRelayLimitRestore => 'Restore default';

  @override
  String get botsRelayLimitConnectionChanged => 'The connection changed. Close this sheet and open it again.';

  @override
  String get botsMobileUnsupportedTitle => 'DS Bot isn\'t on mobile yet';

  @override
  String get botsMobileApiRequired => 'Use it in DSH Web for now';

  @override
  String get botsMobileApiMissing => 'Not on mobile yet. Use it in DSH Web for now';

  @override
  String get botsCreationConnectionChanged => 'The connection changed. Reopen this form to create on the current host.';

  @override
  String get brandXiaomi => 'Xiaomi / Redmi';

  @override
  String get brandHuawei => 'Huawei';

  @override
  String get brandHonor => 'Honor';

  @override
  String get brandOppo => 'OPPO / OnePlus / realme';

  @override
  String get brandSamsung => 'Samsung';

  @override
  String get brandVivoOs => 'vivo / iQOO (OriginOS)';

  @override
  String get brandXiaomiOs => 'Xiaomi / Redmi (HyperOS, MIUI)';

  @override
  String get brandHuaweiOs => 'Huawei / Honor (HarmonyOS, MagicOS)';

  @override
  String get brandOppoOs => 'OPPO / OnePlus / realme (ColorOS)';

  @override
  String get brandSamsungOs => 'Samsung (One UI)';

  @override
  String get brandZhihu => 'Zhihu';

  @override
  String get catalogCurrentChat => 'Current chat';

  @override
  String get catalogChatDetails => 'Chat details';

  @override
  String get catalogChatDetailsSummary => 'Trajectory, changes and progress';

  @override
  String get catalogArtifacts => 'Output files';

  @override
  String get catalogArtifactsSummary => 'Preview, share and save';

  @override
  String get catalogFiles => 'Files';

  @override
  String get catalogFilesSummary => 'Browse and preview';

  @override
  String get catalogTerminal => 'Terminal';

  @override
  String get catalogTerminalSummary => 'Workspace terminal';

  @override
  String get catalogExport => 'Export chat log';

  @override
  String get catalogExportSummary => 'Save as ZIP';

  @override
  String get catalogJobs => 'Background jobs';

  @override
  String get catalogJobsSummary => 'View output or stop jobs';

  @override
  String get catalogPlanGoal => 'Plan and goal';

  @override
  String get catalogPlanGoalSummary => 'Goals, plans and to-dos';

  @override
  String get catalogSkills => 'Skills';

  @override
  String get catalogSkillsSummary => 'Use skills in chats';

  @override
  String get catalogSubagents => 'Subagents';

  @override
  String get catalogSubagentsSummary => 'Lineage and status; tap to chat';

  @override
  String get catalogReference => 'Reference files and chats';

  @override
  String get catalogReferenceSummary => 'Use @ in the composer';

  @override
  String get catalogAutomationSection => 'Automation';

  @override
  String get catalogSchedules => 'Automations';

  @override
  String get catalogSchedulesSummary => 'Scheduled and recurring tasks';

  @override
  String get catalogAgentModelsSection => 'Agents and models';

  @override
  String get catalogPermission => 'Permissions';

  @override
  String get catalogPermissionSummary => 'Choose when to ask for approval';

  @override
  String get catalogAgentPresets => 'Agent presets';

  @override
  String get catalogAgentPresetsSummary => 'How new chats work';

  @override
  String get catalogModels => 'Models';

  @override
  String get catalogModelsSummary => 'Subscriptions and custom providers';

  @override
  String get catalogSubagentSettings => 'Subagent settings';

  @override
  String get catalogSubagentSettingsSummary => 'Depth, parallelism and models';

  @override
  String get catalogAgentLoop => 'Agent loop';

  @override
  String get catalogAgentLoopSummary => 'Parallel tool call limit';

  @override
  String get catalogShellSettings => 'Command execution';

  @override
  String get catalogShellSettingsSummary => 'Timeouts and output limits';

  @override
  String get catalogWebSearch => 'Web search';

  @override
  String get catalogWebSearchSummary => 'Search service and budget';

  @override
  String get catalogPlugins => 'Plugins';

  @override
  String get catalogPluginsSummary => 'Installed plugins and markets';

  @override
  String get catalogPluginInventory => 'Plugin inventory';

  @override
  String get catalogPluginInventorySummary => 'All loaded plugins';

  @override
  String get catalogCordisSummary => 'Dynamic panels from plugins';

  @override
  String get catalogAgentTeam => 'Agent team';

  @override
  String get catalogAgentTeamSummary => 'Members, task board and messages';

  @override
  String get catalogCotTranslation => 'Translate thinking';

  @override
  String get catalogCotTranslationSummary => 'Expand thinking, then tap “Translate”';

  @override
  String get catalogVoiceInput => 'Voice input';

  @override
  String get catalogVoiceInputSummary => 'Microphone in the composer';

  @override
  String get catalogCommunitySharingSection => 'Community and sharing';

  @override
  String get catalogForum => 'Forum';

  @override
  String get catalogForumSummary => 'Ask, share and meet others';

  @override
  String get catalogCommunity => 'Community';

  @override
  String get catalogCommunitySummary => 'Highlights and group chats';

  @override
  String get catalogBotSummary => 'Bot teams and group chats';

  @override
  String get catalogShareProfile => 'Share configuration';

  @override
  String get catalogShareProfileSummary => 'Plugins, settings and skills';

  @override
  String get catalogHostsSettingsSection => 'Hosts and settings';

  @override
  String get catalogSearch => 'Search chats';

  @override
  String get catalogSearchSummary => 'Find by title or content';

  @override
  String get catalogNotifications => 'Notifications';

  @override
  String get catalogNotificationsSummary => 'Completion and approval alerts';

  @override
  String get catalogWorkspaces => 'Workspaces';

  @override
  String get catalogWorkspacesSummary => 'Add and switch folders';

  @override
  String get catalogGeneral => 'General';

  @override
  String get catalogGeneralSummary => 'Display, sending and log uploads';

  @override
  String get catalogAccount => 'Account';

  @override
  String get catalogAccountSummary => 'Sign in, balance and top-ups';

  @override
  String get catalogRemoteSummary => 'Connect to a computer or server';

  @override
  String get catalogPhoneControl => 'Phone control';

  @override
  String get catalogPhoneControlSummary => 'See your screen and tap for you';

  @override
  String get catalogEngine => 'Local engine';

  @override
  String get catalogEngineSummary => 'Engine status and logs on this phone';

  @override
  String get catalogDiagnostics => 'Diagnostics';

  @override
  String get catalogDiagnosticsSummary => 'Export diagnostics bundle';

  @override
  String get catalogWebSummary => 'Official DSH interface';

  @override
  String get catalogPluginPanel => 'Plugin panel';

  @override
  String get catalogHostPluginMissing => 'This host doesn’t have this plugin';

  @override
  String get catalogAllFeatures => 'All features';

  @override
  String get catalogAllFeaturesSubtitle => 'DSH Web features, all here';

  @override
  String get catalogOpenChatFirst => 'Open a chat first';

  @override
  String get catalogNoOpenChat => 'No chat open';

  @override
  String get catalogOpenChat => 'Currently open chat';

  @override
  String get catalogOpenOrCreateChat => 'Open or start a chat first';

  @override
  String get catalogCordisHostClient => 'Backend and interface';

  @override
  String get catalogCordisHostOnly => 'Backend only';

  @override
  String get catalogCordisClientOnly => 'Interface only';

  @override
  String get catalogCordisPluginGone => 'This plugin is gone';

  @override
  String get catalogCordisStopFailed => 'Couldn’t stop';

  @override
  String get catalogCordisRemoveOne => 'This will stop and delete it.';

  @override
  String get catalogCordisRemove => 'Remove';

  @override
  String get catalogCordisRemoved => 'Removed';

  @override
  String get catalogCordisRemoveFailed => 'Couldn’t remove';

  @override
  String get catalogCordisChat => 'Chat';

  @override
  String get catalogCordisMakeup => 'Components';

  @override
  String get catalogCordisStopping => 'Stopping…';

  @override
  String get catalogCordisRemoving => 'Removing…';

  @override
  String get catalogSeatGone => 'Plugin no longer available';

  @override
  String catalogCordisRemoveTitle(String name) {
    return 'Remove “$name”?';
  }

  @override
  String catalogCordisRemoveVersions(int versions) {
    String _temp0 = intl.Intl.pluralLogic(
      versions,
      locale: localeName,
      other: 'This will stop it and delete all $versions versions.',
      one: 'This will stop it and delete 1 version.',
    );
    return '$_temp0';
  }

  @override
  String catalogCordisVersionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count versions', one: '1 version');
    return '$_temp0';
  }

  @override
  String get catalogToolsSection => 'Tools';

  @override
  String get catalogAllSettings => 'All settings';

  @override
  String get chatBackgroundTaskNotice => 'Background task notice';

  @override
  String get chatBackgroundTaskMessage => 'Background task message';

  @override
  String get chatDeclineQuestion => 'Skip';

  @override
  String get chatChats => 'Chats';

  @override
  String get chatViewChatDetails => 'View chat details';

  @override
  String get chatUnsent => 'Not sent';

  @override
  String get chatSteerNextStep => 'Steer · Next step';

  @override
  String get chatQueuedAfterTurn => 'Queued · Next turn';

  @override
  String get chatSteering => 'Steering';

  @override
  String get chatQueued => 'Queued';

  @override
  String get chatStoppingTurn => 'Stopping this turn';

  @override
  String get chatSending => 'Sending';

  @override
  String get chatSendNow => 'Send now';

  @override
  String get chatSwitchToSteer => 'Steer instead';

  @override
  String get chatWithdraw => 'Undo';

  @override
  String get chatContinuedInNewChat => 'Continued in a new chat';

  @override
  String get chatReadOriginalImageFailed => 'Couldn’t read the original image. Try again.';

  @override
  String get chatRegenerateFailed => 'Couldn’t regenerate';

  @override
  String get chatRegeneratedInNewChat => 'Regenerated in a new chat';

  @override
  String get chatOpenedInNewChatReattach => 'Opened in a new chat. Add attachments again.';

  @override
  String get chatOpenedInNewChat => 'Opened in a new chat';

  @override
  String chatForkQueuedLeft(String message, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      left,
      locale: localeName,
      other: '$message ($left queued messages stayed behind)',
      one: '$message (1 queued message stayed behind)',
    );
    return '$_temp0';
  }

  @override
  String get chatReturnToOriginal => 'Back to original chat';

  @override
  String chatWaitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items need approval',
      one: '1 item needs approval',
    );
    return '$_temp0';
  }

  @override
  String chatWaitingBackToBottom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items need approval, back to bottom',
      one: '1 item needs approval, back to bottom',
    );
    return '$_temp0';
  }

  @override
  String get chatBackToBottom => 'Back to bottom';

  @override
  String get chatCreateFailed => 'Couldn’t create chat';

  @override
  String get chatSendMode => 'Send mode';

  @override
  String get chatSteer => 'Steer';

  @override
  String get chatSteerHint => 'The AI sees it next step, without interrupting';

  @override
  String get chatInterruptAndSend => 'Interrupt and send';

  @override
  String get chatInterruptHint => 'Stop the current task and handle this first';

  @override
  String get chatQueue => 'Queue';

  @override
  String get chatQueueHint => 'Send after this turn';

  @override
  String get chatWithdrawnEditable => 'Undone. Edit and send again.';

  @override
  String get chatWithdrawn => 'Undone';

  @override
  String chatAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Up to $count attachments per message',
      one: 'Up to 1 attachment per message',
    );
    return '$_temp0';
  }

  @override
  String get chatAttachmentPermission => 'Permission denied. Turn it on in system settings.';

  @override
  String get chatOpenAttachmentFailed => 'Couldn’t open attachment';

  @override
  String get chatReadFailed => 'Couldn’t read';

  @override
  String get chatReadImageFailed => 'Couldn’t read image';

  @override
  String get chatOpenChatFirst => 'Open a chat first';

  @override
  String get chatTurnCompleted => 'This turn is complete';

  @override
  String get chatTurnError => 'Something went wrong this turn';

  @override
  String get chatAnswerHint => 'Type your answer…';

  @override
  String get chatStarting => 'Starting';

  @override
  String get chatConnecting => 'Connecting';

  @override
  String get chatDisconnected => 'Disconnected';

  @override
  String get chatReconnecting => 'Reconnecting';

  @override
  String get chatGenerating => 'Generating';

  @override
  String get chatGoToSettings => 'Open settings';

  @override
  String get chatListeningEllipsis => 'Listening…';

  @override
  String get chatTranscribingEllipsis => 'Transcribing…';

  @override
  String get chatConnectToSend => 'Connect to the engine to send';

  @override
  String get chatGeneratingSteerHint => 'Generating · Type to steer';

  @override
  String get chatComposerHint => 'Message DSH…';

  @override
  String get chatStopGenerating => 'Stop generating';

  @override
  String get chatVoiceInput => 'Voice input';

  @override
  String get chatStopVoiceInput => 'Stop voice input';

  @override
  String get chatGoal => 'Goal';

  @override
  String get chatGoalActions => 'Goal actions';

  @override
  String get chatGoalBlocked => 'Blocked';

  @override
  String chatGoalRoundLimit(int rounds, int max) {
    return 'Round $rounds / $max';
  }

  @override
  String chatGoalRound(int rounds) {
    return 'Round $rounds';
  }

  @override
  String get chatEditGoal => 'Edit goal';

  @override
  String get chatPauseGoal => 'Pause';

  @override
  String get chatPauseGoalHint => 'Pause automatic progress';

  @override
  String get chatResumeGoal => 'Resume';

  @override
  String get chatResumeGoalHint => 'Resume automatic progress';

  @override
  String get chatClearGoal => 'Clear goal';

  @override
  String get chatGoalHint => 'What do you want to achieve?';

  @override
  String get chatClearGoalTitle => 'Clear goal?';

  @override
  String chatTodoCurrent(String content) {
    return 'Working on: $content';
  }

  @override
  String chatTodoNext(String content) {
    return 'Next: $content';
  }

  @override
  String get chatTodoAllDone => 'All done';

  @override
  String chatTodoSemantics(String count, String label) {
    return 'To-do $count, $label';
  }

  @override
  String get chatCollapseTodos => 'Collapse list';

  @override
  String get chatExpandTodos => 'Expand list';

  @override
  String get chatTodoNotStarted => 'Not started';

  @override
  String get chatFile => 'File';

  @override
  String get chatFolder => 'Folder';

  @override
  String get chatChat => 'Chat';

  @override
  String get chatSubagent => 'Subagent';

  @override
  String get chatRecent => 'Recent';

  @override
  String get chatMentionSearching => 'Searching…';

  @override
  String get chatMentionNoFiles => 'No matching files';

  @override
  String get chatMentionNoMatches => 'No matching files or chats';

  @override
  String get chatQuote => 'Quote';

  @override
  String get chatOpenFolder => 'Open folder';

  @override
  String get chatJustNow => 'Just now';

  @override
  String chatMentionAgeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String chatMentionAgeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0';
  }

  @override
  String chatMentionAgeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count days', one: '1 day');
    return '$_temp0';
  }

  @override
  String chatMentionAgeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count months', one: '1 month');
    return '$_temp0';
  }

  @override
  String chatMentionAgeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count years', one: '1 year');
    return '$_temp0';
  }

  @override
  String get chatMermaidChart => 'Mermaid chart';

  @override
  String get chatPreview => 'Preview';

  @override
  String get chatUnwrapLines => 'Unwrap lines';

  @override
  String get chatWrapLines => 'Wrap lines';

  @override
  String get chatAlertNote => 'Note';

  @override
  String get chatAlertTip => 'Tip';

  @override
  String get chatAlertImportant => 'Important';

  @override
  String get chatAlertWarning => 'Warning';

  @override
  String get chatAlertCaution => 'Caution';

  @override
  String get chatImage => 'Image';

  @override
  String get chatImageNotFound => 'Image not found';

  @override
  String get chatImageOffline => 'Not connected to DSH';

  @override
  String get chatImageTooLarge => 'Image too large';

  @override
  String get chatImageReadFailed => 'Can’t read file';

  @override
  String get chatImageDisplayFailed => 'Can’t display';

  @override
  String get chatImageTapToView => 'Tap to view';

  @override
  String get chatImageTapToRetry => 'Tap to retry';

  @override
  String get chatImageUnsupportedAddress => 'Unsupported address';

  @override
  String get chatMermaidNeedsNetwork => 'Needs internet';

  @override
  String get chatMermaidSyntaxError => 'Invalid chart syntax';

  @override
  String get chatChartPreview => 'Chart preview';

  @override
  String get chatCopyCode => 'Copy code';

  @override
  String get chatChartClosed => 'Chart closed';

  @override
  String get chatVoiceMicrophoneFailed => 'Couldn’t open microphone';

  @override
  String get chatVoicePermissionOff => 'Microphone access is off';

  @override
  String get chatVoicePermissionNeeded => 'Voice input needs microphone access';

  @override
  String get chatVoiceUnavailable => 'Speech recognition isn’t available on this phone';

  @override
  String get chatVoiceNotHeard => 'Didn’t catch that. Try again.';

  @override
  String get chatVoiceTranscriptionFailed => 'Couldn’t transcribe this recording';

  @override
  String get chatVoiceNetworkFailed => 'Couldn’t transcribe. Check your connection.';

  @override
  String get chatVoiceLanguageUnsupported => 'This language isn’t supported yet';

  @override
  String get chatVoiceMicrophoneBusy => 'Microphone is in use';

  @override
  String get chatVoiceBusy => 'Speech recognition is busy. Try again later.';

  @override
  String get chatVoiceRecognitionFailed => 'Speech recognition failed';

  @override
  String get chatListening => 'Listening';

  @override
  String get chatTranscribing => 'Transcribing';

  @override
  String get chatCancelVoiceInput => 'Cancel voice input';

  @override
  String get chatViewTurnTrace => 'View turn trajectory';

  @override
  String chatTokensPerSecond(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'About $count tokens/s',
      one: 'About 1 token/s',
    );
    return '$_temp0';
  }

  @override
  String get chatNoTokensStreaming => 'No text streaming';

  @override
  String chatCurrentStep(String step) {
    return 'This step $step';
  }

  @override
  String chatTodoProgress(int done, int total) {
    return 'To-do progress $done/$total';
  }

  @override
  String chatProgress(int done, int total) {
    return 'Progress $done/$total';
  }

  @override
  String get chatApproveCommand => 'Allow this command?';

  @override
  String get chatApproveWrite => 'Allow writing this file?';

  @override
  String get chatApproveEdit => 'Allow editing this file?';

  @override
  String get chatApproveWebpage => 'Allow opening this page?';

  @override
  String get chatApproveSearch => 'Allow web search?';

  @override
  String chatApproveTool(String name) {
    return 'Allow “$name”?';
  }

  @override
  String get chatDecline => 'Decline';

  @override
  String get chatAllowOnce => 'Allow once';

  @override
  String get chatAllowForChat => 'Allow for chat';

  @override
  String get chatSaveToDownloads => 'Save to Downloads';

  @override
  String get chatCopyPath => 'Copy path';

  @override
  String get chatOpenInDefaultApp => 'Open in default app';

  @override
  String get chatDownloadsFolderHint => 'Downloads/DSH-Go folder';

  @override
  String chatSavedToDownloadsPath(String path) {
    return 'Saved to Downloads/$path';
  }

  @override
  String chatSavedToPath(String path) {
    return 'Saved to $path';
  }

  @override
  String chatDeliveredFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Delivered $count files',
      one: 'Delivered 1 file',
    );
    return '$_temp0';
  }

  @override
  String chatGeneratedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Generated $count files',
      one: 'Generated 1 file',
    );
    return '$_temp0';
  }

  @override
  String chatAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'All $count files', one: '1 file in total');
    return '$_temp0';
  }

  @override
  String get chatCollapseFileList => 'Collapse file list';

  @override
  String chatExpandAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand all $count files',
      one: 'Expand 1 file',
    );
    return '$_temp0';
  }

  @override
  String get chatDownloading => 'Downloading…';

  @override
  String chatDownloadingPercent(int percent) {
    return 'Downloading… $percent%';
  }

  @override
  String get chatOpening => 'Opening…';

  @override
  String get chatSavingToDownloads => 'Saving to Downloads…';

  @override
  String get chatOpenInPhoneApp => 'Open in an app on this phone';

  @override
  String get chatMoreActions => 'More actions';

  @override
  String get chatAlreadyInDownloads => 'Already in Downloads on this phone';

  @override
  String get chatArtifactCopyPathOnly => 'This connection can’t read files. You can copy the path.';

  @override
  String get chatReplying => 'Replying';

  @override
  String get chatInterrupted => 'Interrupted';

  @override
  String get chatGallery => 'Photos';

  @override
  String get chatTakePhoto => 'Take photo';

  @override
  String get chatAddAttachment => 'Add image or file';

  @override
  String chatRemoveAttachment(String name) {
    return 'Remove “$name”';
  }

  @override
  String get chatAutoApproveCommands => 'Allow commands automatically';

  @override
  String get chatAutoApproving => 'Auto-approving';

  @override
  String chatViewMoreChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'View changes, $count more files',
      one: 'View changes, 1 more file',
    );
    return '$_temp0';
  }

  @override
  String get chatViewChanges => 'View changes';

  @override
  String chatChangedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Changed $count files',
      one: 'Changed 1 file',
    );
    return '$_temp0';
  }

  @override
  String chatMoreFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count more files', one: '1 more file');
    return '$_temp0';
  }

  @override
  String chatFileChangeSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(added, locale: localeName, other: '$added lines added', one: '1 line added');
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: '$removed lines deleted',
      one: '1 line deleted',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String get chatNewFileSuffix => '  New';

  @override
  String get chatPathCopied => 'Path copied';

  @override
  String chatCommandCompacted(int count, String tokens) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Compacted $count history items (~$tokens tokens)',
      one: 'Compacted 1 history item (~$tokens tokens)',
    );
    return '$_temp0';
  }

  @override
  String chatCommandPermissionChanged(String name) {
    return 'Switched to $name';
  }

  @override
  String chatCommandCurrentPermission(String name) {
    return 'Current permissions: $name';
  }

  @override
  String get chatCommandUnknownPermission => 'No such permission preset';

  @override
  String get chatCommandFeedbackRequired => 'Add feedback before sending';

  @override
  String get chatCommandFeedbackSubmitted => 'Feedback submitted';

  @override
  String get chatCommandNothingToCompact => 'Nothing to compact yet';

  @override
  String get chatCommandCompactionCancelled => 'Compaction cancelled';

  @override
  String get chatCommandCompactionBusy => 'Busy. Try compacting later.';

  @override
  String get chatCommandCompactedSaveFailed => 'Compacted, but couldn’t save';

  @override
  String get chatCommandCompactUsage => '/compact takes no arguments';

  @override
  String get chatCommandHistoryChanged => 'The chat changed. Try again.';

  @override
  String get chatCommandCompactionFailed => 'Couldn’t compact. Try again.';

  @override
  String get chatCommandCompactionIncomplete => 'Compaction incomplete. Check the chat.';

  @override
  String get chatCommandPlanEnabled => 'Plan mode on';

  @override
  String get chatCommandPlanEnabling => 'Plan mode starts next step';

  @override
  String get chatCommandPlanDisabled => 'Plan mode off';

  @override
  String get chatCommandPlanDisabling => 'Plan mode ends next step';

  @override
  String get chatCommandPlanCancelled => 'Plan mode entry cancelled';

  @override
  String get chatCommandPlanInactive => 'Plan mode is off';

  @override
  String get chatCommandPlanNoAttachments => 'Can’t attach files when leaving plan mode';

  @override
  String get chatCommandNoGoal => 'No goal yet';

  @override
  String get chatCommandGoalRequired => 'Add a new goal before sending';

  @override
  String get chatCommandGoalAttachments => 'Send attachments with a goal';

  @override
  String get chatCommandGoalCleared => 'Goal cleared';

  @override
  String get chatCommandGoalInvalid => 'Can’t do that now. Check the goal.';

  @override
  String get chatCommandGoalExists => 'A goal exists. Edit or clear it first.';

  @override
  String get chatCommandGoalCreated => 'Goal set';

  @override
  String get chatCommandGoalUpdated => 'Goal updated';

  @override
  String get chatCommandGoalPaused => 'Goal paused';

  @override
  String get chatCommandGoalResumed => 'Goal resumed';

  @override
  String get chatCommandCurrentGoal => 'Current goal';

  @override
  String get chatCommandGoalBlocked => 'Needs attention';

  @override
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max) {
    return '$title\n$objective\n$status · Round $rounds/$max';
  }

  @override
  String get chatCommandFailed => 'Command failed';

  @override
  String get chatImageStorageDenied => 'Couldn’t save. Storage access is off.';

  @override
  String get chatImageCannotSave => 'Can’t save this image';

  @override
  String get chatImageDownloadFailed => 'Couldn’t download image. Try again.';

  @override
  String get chatImageSaveFailed => 'Couldn’t save. Try again.';

  @override
  String get chatImageSavedToPhotos => 'Saved to Photos';

  @override
  String get chatShareFailed => 'Couldn’t open sharing';

  @override
  String get chatSubmit => 'Submit';

  @override
  String get chatSelectText => 'Select text';

  @override
  String get chatRegenerate => 'Regenerate';

  @override
  String get chatBranchFromHere => 'Branch here';

  @override
  String get chatEditAndResend => 'Edit and resend';

  @override
  String get chatRegenerateHint => 'Regenerate in a new chat. The original stays as is.';

  @override
  String get chatBranchHint => 'Continue in a new chat. The original stays as is.';

  @override
  String get chatEditResendHint => 'Rewrite in a new chat. The original stays as is.';

  @override
  String get chatSaveToPhotos => 'Save to Photos';

  @override
  String get chatCopyAll => 'Copy all';

  @override
  String get chatRequestRetrying => 'Request failed, retrying';

  @override
  String chatRequestRetryAttempt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Request failed, retrying (attempt $count)',
      one: 'Request failed, retrying (attempt 1)',
    );
    return '$_temp0';
  }

  @override
  String chatRequestRetryLimit(int count, int max) {
    return 'Request failed, retrying ($count/$max)';
  }

  @override
  String chatSubscriptionExpired(String name) {
    return '$name sign-in expired';
  }

  @override
  String get chatProviderKeyMissing => 'No API key for this provider yet';

  @override
  String get chatDeepSeekKeyMissing => 'No DeepSeek API key yet';

  @override
  String get chatOutputLimitReached => 'Output limit reached';

  @override
  String get chatTurnBlocked => 'This turn was blocked';

  @override
  String get chatTurnEngineRestarted => 'The engine restarted, interrupting this turn';

  @override
  String get chatSignInAgain => 'Sign in again';

  @override
  String chatQuestionsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count questions for you',
      one: '1 question for you',
    );
    return '$_temp0';
  }

  @override
  String get chatOneQuestion => 'A question for you';

  @override
  String get chatMultipleChoices => 'Select any';

  @override
  String get chatCustomAnswer => 'Other answer';

  @override
  String get chatCustomAnswerHint => 'Type your answer';

  @override
  String chatQuoteSemantics(String text) {
    return 'Quote: $text';
  }

  @override
  String get chatRemoveQuote => 'Remove quote';

  @override
  String get chatReadOnlySubagent => 'One-shot subagent · View only';

  @override
  String get chatThinkingActive => 'Thinking';

  @override
  String get chatThinking => 'Thinking';

  @override
  String get chatTranslate => 'Translate';

  @override
  String get chatTranslationUnavailable => 'Translation unavailable';

  @override
  String get chatViewOriginal => 'View original';

  @override
  String get chatViewTranslation => 'View translation';

  @override
  String get chatTranslating => 'Translating';

  @override
  String chatToolFailures(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label, $count failed',
      one: '$label, 1 failed',
    );
    return '$_temp0';
  }

  @override
  String get chatToolNeedsApproval => 'Approval needed to run';

  @override
  String get chatCommand => 'Command';

  @override
  String chatToolLineRange(int first, int last) {
    return ' · Lines $first⁠–⁠$last';
  }

  @override
  String get chatParameters => 'Parameters';

  @override
  String get chatOutput => 'Output';

  @override
  String get chatResult => 'Result';

  @override
  String get chatError => 'Error';

  @override
  String get chatChanges => 'Changes';

  @override
  String get chatContent => 'Content';

  @override
  String get chatNoOutput => 'No output';

  @override
  String get chatToolDeclined => 'This tool call was declined';

  @override
  String get chatToolRunning => 'Running…';

  @override
  String get chatNoDetails => 'No details yet';

  @override
  String get chatErrApiKey => 'API key is invalid or expired';

  @override
  String get chatErrBalance => 'Insufficient balance';

  @override
  String get chatErrAccountQuota => 'Account quota used up';

  @override
  String get chatErrRateLimit => 'Too many requests. Try again later.';

  @override
  String get chatErrContextLength => 'Chat too long. Send /compact, then try again.';

  @override
  String get chatErrModelUnavailable => 'Model service temporarily unavailable';

  @override
  String get chatErrModelTimeout => 'Model response timed out';

  @override
  String get chatErrModelConnection => 'Couldn’t reach the model service';

  @override
  String get chatErrModelEmpty => 'The model returned no content';

  @override
  String get chatErrEngineOutdated => 'This model needs a newer engine';

  @override
  String get chatErrModelUnsupported => 'This model isn’t available';

  @override
  String get chatSwitchModel => 'Switch model';

  @override
  String get chatErrTurn => 'Something went wrong this turn';

  @override
  String chatTurnSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count steps', one: '1 step');
    return '$_temp0';
  }

  @override
  String chatTurnFootnoteSemantics(String summary) {
    return 'This turn: $summary, view turn trajectory';
  }

  @override
  String chatTurnToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count tool calls', one: '1 tool call');
    return '$_temp0';
  }

  @override
  String chatTurnMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count messages', one: '1 message');
    return '$_temp0';
  }

  @override
  String chatTurnThoughts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thinking blocks',
      one: '1 thinking block',
    );
    return '$_temp0';
  }

  @override
  String get chatMe => 'Me';

  @override
  String chatGoalSemantics(String objective) {
    return 'Goal, $objective';
  }

  @override
  String chatGoalStateSemantics(String objective, String state) {
    return 'Goal, $objective, $state';
  }

  @override
  String chatTodoItemSemantics(String content, String state) {
    return '$content, $state';
  }

  @override
  String chatMentionSemantics(String kind, String label) {
    return '$kind: $label';
  }

  @override
  String chatArtifactSemantics(String name, String description) {
    return '$name, $description';
  }

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonClose => 'Close';

  @override
  String get commonCopied => 'Copied';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSettings => 'Settings';

  @override
  String get commonBack => 'Back';

  @override
  String get commonCopy => 'Copy';

  @override
  String get commonDone => 'Done';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonInstall => 'Install';

  @override
  String get commonShare => 'Share';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonClear => 'Clear';

  @override
  String get commonCollapse => 'Show less';

  @override
  String get commonEnable => 'Enable';

  @override
  String get commonOpen => 'Open';

  @override
  String get commonDetails => 'Details';

  @override
  String get commonMore => 'More';

  @override
  String get commonCreate => 'Create';

  @override
  String get commonSend => 'Send';

  @override
  String get commonStop => 'Stop';

  @override
  String get commonPaste => 'Paste';

  @override
  String get commonHide => 'Hide';

  @override
  String get commonLater => 'Later';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonRename => 'Rename';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonNotSet => 'Not set';

  @override
  String get commonDefault => 'Default';

  @override
  String get commonSaved => 'Saved';

  @override
  String get commonSaveFailed => 'Couldn’t save';

  @override
  String get commonSaveFailedRetry => 'Couldn’t save. Try again.';

  @override
  String get commonFailedTryAgain => 'Something went wrong. Try again.';

  @override
  String get commonEngineUnreachable => 'Can’t reach the engine';

  @override
  String get commonStorageFull => 'Not enough storage';

  @override
  String get commonConnectionFailed => 'Couldn’t connect';

  @override
  String get commonCopyLink => 'Copy link';

  @override
  String get commonOpenWith => 'Open in another app';

  @override
  String get commonOpenInWeb => 'Open in DSH Web';

  @override
  String get commonUntitledChat => 'Untitled chat';

  @override
  String get commonNewChat => 'New chat';

  @override
  String get commonYesterday => 'Yesterday';

  @override
  String get commonSignedIn => 'Signed in';

  @override
  String get commonSignIn => 'Sign in';

  @override
  String get commonSignOut => 'Sign out';

  @override
  String get commonThisPhone => 'This phone';

  @override
  String get commonRemoteHost => 'Remote host';

  @override
  String get commonWeb => 'Web';

  @override
  String get commonFollowSystem => 'System';

  @override
  String get commonLight => 'Light';

  @override
  String get commonDark => 'Dark';

  @override
  String get commonInProgress => 'In progress';

  @override
  String get commonCompleted => 'Completed';

  @override
  String get commonStopped => 'Stopped';

  @override
  String get commonCancelled => 'Cancelled';

  @override
  String get commonRunning => 'Running';

  @override
  String get commonPaused => 'Paused';

  @override
  String get commonDeclined => 'Declined';

  @override
  String get commonFailed => 'Failed';

  @override
  String get commonStopping => 'Stopping';

  @override
  String get commonWaitingApproval => 'Needs approval';

  @override
  String get commonWaitingAnswer => 'Needs your answer';

  @override
  String get commonNotConnected => 'Not connected';

  @override
  String get commonInstalled => 'Installed';

  @override
  String get commonName => 'Name';

  @override
  String get commonStatus => 'Status';

  @override
  String get commonVersion => 'Version';

  @override
  String get commonOther => 'Other';

  @override
  String get commonPin => 'Pin';

  @override
  String get commonReply => 'Reply';

  @override
  String get commonUpdate => 'Update';

  @override
  String get commonViewLogs => 'View logs';

  @override
  String commonItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$_temp0';
  }

  @override
  String commonMonthDay(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String get engineAccountSignedIn => 'Signed in to DeepSeek';

  @override
  String get engineAccountSignOutTitle => 'Sign out of DeepSeek?';

  @override
  String get engineAccountSignOutBusy =>
      'Some tasks are using account models. Signing out interrupts them immediately. Your chats and files stay.';

  @override
  String get engineAccountSignOutBody =>
      'Account models will be unavailable. Your chats, files and API key stay. You can sign in again anytime.';

  @override
  String get engineAccountSignOutUnknown =>
      'Can’t check whether any tasks are using account models. Signing out interrupts any that are.';

  @override
  String get engineAccountSignOutFailed => 'Couldn’t sign out. Try again later.';

  @override
  String get engineAccountTitle => 'Account';

  @override
  String get engineAccountRefresh => 'Refresh';

  @override
  String get engineAccountDeepSeek => 'DeepSeek account';

  @override
  String get engineAccountProfileUnavailable => 'Can’t load account details right now';

  @override
  String get engineAccountBalance => 'Balance';

  @override
  String get engineAccountBalanceHint => 'Account models are charged to your balance';

  @override
  String get engineAccountBalanceEngineOff => 'Start the engine to see your balance';

  @override
  String get engineAccountTopUp => 'Top up';

  @override
  String get engineAccountUsageDetails => 'Usage details';

  @override
  String get engineAccountToppedUpBalance => 'Topped-up balance';

  @override
  String get engineAccountGrantedBalance => 'Granted balance';

  @override
  String get engineAccountBalanceUnavailable => 'Can’t load your balance right now';

  @override
  String get engineAccountNoKeyNeeded => 'No API key needed when signed in';

  @override
  String get engineAccountUnsupported => 'This engine doesn’t support account sign-in';

  @override
  String get engineAccountSignInDeepSeek => 'Sign in with DeepSeek';

  @override
  String get engineAccountAutoStart => 'Signing in starts the engine automatically';

  @override
  String get engineAccountReplaceKey => 'Replace key';

  @override
  String get engineAccountClearKeyTitle => 'Clear API key?';

  @override
  String get engineAccountClearKeyBody =>
      'Deletes the key saved in the app. While the engine on this phone is running, the key in the engine is deleted too.';

  @override
  String get engineAccountBrowserFailed => 'Couldn’t open the browser';

  @override
  String get engineAccountSignInSuccess => 'Signed in';

  @override
  String get engineAccountAlmostReady => 'Almost ready';

  @override
  String get engineAccountStartingEngine => 'Starting engine';

  @override
  String get engineAccountOpenSignInNext => 'The sign-in page opens next';

  @override
  String get engineAccountPreparingSignIn => 'Preparing sign-in';

  @override
  String get engineAccountOpenDeepSeekNext => 'Opening DeepSeek sign-in';

  @override
  String get engineAccountFinishInBrowser => 'Finish sign-in in your browser';

  @override
  String get engineAccountReturnToDsh => 'Return to DSH Go after signing in';

  @override
  String get engineAccountFinishingSignIn => 'Finishing sign-in';

  @override
  String get engineAccountSavingSignIn => 'Saving sign-in details';

  @override
  String get engineAccountAwaitingResult => 'Still waiting for sign-in';

  @override
  String get engineAccountCopySignInLink => 'Copy sign-in link';

  @override
  String get engineAccountReopenSignIn => 'Reopen sign-in';

  @override
  String get engineAccountCancelSignIn => 'Cancel sign-in';

  @override
  String get engineAccountSignInLinkCopied => 'Sign-in link copied';

  @override
  String get engineAccountSigningIn => 'Signing in';

  @override
  String get engineAccountSignedOut => 'Signed out';

  @override
  String get engineAccountUsageFact => 'Usage is charged to your account balance';

  @override
  String get engineAccountBrowserFact => 'Sign in with your browser. DSH never sees your password';

  @override
  String get engineAccountCredentialsFact => 'Sign-in credentials stay on this phone';

  @override
  String get engineSubagentTitle => 'Subagent';

  @override
  String get engineAgentLoopTitle => 'Agent loop';

  @override
  String get engineShellTitle => 'Command execution';

  @override
  String get engineSearchTitle => 'Web search';

  @override
  String get engineSearchNewApiBadge => 'New API';

  @override
  String get engineGeneralTitle => 'General';

  @override
  String get engineSettingsTitle => 'Engine parameters';

  @override
  String get engineSettingsReadFailed => 'Couldn’t load settings';

  @override
  String get engineSettingsRun => 'Runtime';

  @override
  String get engineSettingsPlugins => 'Plugins';

  @override
  String get engineSettingsPluginInventory => 'Plugin inventory';

  @override
  String get engineSettingsPluginStopped => 'Plugin isn’t running';

  @override
  String get engineSettingsEnablePlugin => 'Enable it to change its settings';

  @override
  String get engineSettingsNoEditableFields => 'No settings to change here';

  @override
  String get engineFieldRestoreDefault => 'Reset to default';

  @override
  String get engineFieldDecrease => 'Decrease';

  @override
  String get engineFieldIncrease => 'Increase';

  @override
  String get engineFieldRemove => 'Remove';

  @override
  String get engineFieldShow => 'Show';

  @override
  String get engineFieldFromEnvironment => 'Provided by the startup environment';

  @override
  String get engineFieldItem => 'item';

  @override
  String get engineFieldAlreadyAdded => 'Already added';

  @override
  String get engineFieldEnterName => 'Enter a name';

  @override
  String get engineFieldEnterNumber => 'Enter a number';

  @override
  String get engineFieldValue => 'Value';

  @override
  String get engineFieldNew => 'New';

  @override
  String get engineFieldRequired => 'Required';

  @override
  String get engineGeneralMissing => 'This host has no general settings';

  @override
  String get engineSettingsVersionRequired => 'Requires DSH 0.2.1 or later';

  @override
  String get engineGeneralWebDisplay => 'Web display';

  @override
  String get engineGeneralWebSending => 'Web sending';

  @override
  String get engineGeneralData => 'Data';

  @override
  String get engineSubagentModelsTitle => 'Subagent models';

  @override
  String get engineChatLogTitle => 'Chat logs';

  @override
  String get engineThinkingTranslationTitle => 'Thinking translation';

  @override
  String get enginePluginIndexesTitle => 'Plugin market indexes';

  @override
  String get enginePermissionTitle => 'Permission';

  @override
  String get engineAgentPresetsTitle => 'Agent presets';

  @override
  String get engineDefaultModelTitle => 'Default model';

  @override
  String get engineWebAppearanceTitle => 'Web appearance';

  @override
  String get engineLanguageTitle => 'Language';

  @override
  String get engineFieldCommandTimeout => 'Command timeout';

  @override
  String get engineFieldMaxOutput => 'Output limit';

  @override
  String get engineFieldMaxTimeout => 'Max requested timeout';

  @override
  String get engineFieldMaxSpill => 'Spill file limit';

  @override
  String get engineFieldGracePeriod => 'Termination grace period';

  @override
  String get engineFieldDefaultCwd => 'Default working directory';

  @override
  String get engineFieldFollowChat => 'Follow chat';

  @override
  String get engineSubagentMaxDepth => 'Maximum recursion depth';

  @override
  String get engineFieldLayersUnit => 'levels';

  @override
  String get engineSubagentMaxActive => 'Max active subagents';

  @override
  String get engineFieldCountUnit => 'items';

  @override
  String get engineSubagentAllowModelChoice => 'Let AI choose subagent models';

  @override
  String get engineSubagentAllowedModels => 'Available models';

  @override
  String get engineAgentMaxParallelCalls => 'Parallel tool calls per step';

  @override
  String get engineFieldSearchProvider => 'Search service';

  @override
  String get engineFieldFetchProvider => 'Web fetch service';

  @override
  String get engineFieldBaseUrl => 'Service URL';

  @override
  String get engineSearchMaxUses => 'Max searches per request';

  @override
  String get engineFieldTimesUnit => 'times';

  @override
  String get engineSearchHelperModel => 'Helper model';

  @override
  String get engineFieldApiVersion => 'API version';

  @override
  String get engineFieldMaxTokens => 'Max output length';

  @override
  String get engineSearchResultsPerSearch => 'Results per search';

  @override
  String get engineFieldResultsUnit => 'results';

  @override
  String get engineSearchSendOriginalQuestion => 'Include your original question in searches';

  @override
  String get engineChatLogUpload => 'Upload chat logs to DeepSeek';

  @override
  String get engineTranslationProvider => 'Translation service';

  @override
  String get engineTranslationAccountPaid => 'DeepSeek account (paid)';

  @override
  String get engineTranslationApiPaid => 'DeepSeek API (paid)';

  @override
  String get engineTranslationTargetLanguage => 'Target language';

  @override
  String get engineTranslationFollowLanguage => 'Follow interface language';

  @override
  String get engineTranslationLanguageHint => 'Enter auto or a language code, such as zh, en or ja';

  @override
  String get enginePluginIndexSources => 'Index sources';

  @override
  String get enginePluginIndexUrl => 'Index URL';

  @override
  String get engineFieldHttpUrlHint => 'A URL starting with http:// or https://';

  @override
  String get enginePermissionNewChat => 'New chat permissions';

  @override
  String get engineAgentDefaultPreset => 'Default agent preset';

  @override
  String get engineProviderTitle => 'Provider';

  @override
  String get engineModelTitle => 'Model';

  @override
  String get engineFieldReasoningEffort => 'Thinking depth';

  @override
  String get engineGeneralShowCodingView => 'Show coding view';

  @override
  String get engineGeneralWorkDetails => 'Work details';

  @override
  String get engineFieldCompact => 'Compact';

  @override
  String get engineFieldStandard => 'Standard';

  @override
  String get engineFieldDetailed => 'Detailed';

  @override
  String get engineFieldVerbose => 'Verbose';

  @override
  String get engineGeneralCollapseTiming => 'When to collapse work details';

  @override
  String get engineGeneralOnCompletion => 'On completion';

  @override
  String get engineGeneralOnNewMessage => 'On new message';

  @override
  String get engineGeneralPerformanceUsage => 'Performance & usage';

  @override
  String get engineGeneralLinkOpening => 'Open links in';

  @override
  String get engineGeneralAppSidebar => 'App sidebar';

  @override
  String get engineGeneralDefaultBrowser => 'Default browser';

  @override
  String get engineGeneralBusySend => 'Send while AI is working';

  @override
  String get engineGeneralQueueSend => 'Queue';

  @override
  String get engineGeneralSteerSend => 'Steer';

  @override
  String get engineFieldTheme => 'Theme';

  @override
  String get engineFieldFontSize => 'Text size';

  @override
  String get engineFieldCodeFontSize => 'Code font size';

  @override
  String get engineFieldTerminalFontSize => 'Terminal font size';

  @override
  String get engineFieldTextFont => 'Text font';

  @override
  String get engineFieldCodeFont => 'Code font';

  @override
  String get engineFieldTerminalFont => 'Terminal font';

  @override
  String get engineFieldInterfaceLanguage => 'Interface language';

  @override
  String get engineFieldSecondsUnit => 's';

  @override
  String get engineFieldBytesUnit => 'bytes';

  @override
  String get engineFieldGreaterThanZero => 'Greater than 0';

  @override
  String get engineFieldEnterNumeric => 'Enter a number';

  @override
  String get engineFieldEnterInteger => 'Enter a whole number';

  @override
  String get engineFieldInvalidFormat => 'Invalid format';

  @override
  String get engineFieldAddress => 'Address';

  @override
  String get engineFieldToken => 'Token';

  @override
  String get engineFieldService => 'Service';

  @override
  String get engineFieldTimeout => 'Timeout';

  @override
  String get engineFieldQuantity => 'Count';

  @override
  String get engineFieldMaxUses => 'Max uses';

  @override
  String get engineFieldMaxRetries => 'Max retries';

  @override
  String get engineFieldConcurrency => 'Concurrency';

  @override
  String get engineFieldInterval => 'Interval';

  @override
  String get engineFieldPrompt => 'Prompt';

  @override
  String get engineFieldSystemPrompt => 'System prompt';

  @override
  String get engineFieldTemperature => 'Temperature';

  @override
  String get engineFieldDebugMode => 'Debug mode';

  @override
  String get engineFieldVerboseLogs => 'Verbose logs';

  @override
  String get engineFieldPath => 'Path';

  @override
  String get engineFieldCwd => 'Working directory';

  @override
  String get engineFieldCommand => 'Command';

  @override
  String get engineFieldArguments => 'Arguments';

  @override
  String get engineFieldEnvironment => 'Environment variables';

  @override
  String get engineFieldHeaders => 'Headers';

  @override
  String get engineFieldProxy => 'Proxy';

  @override
  String get engineFieldAuto => 'Auto';

  @override
  String get engineFieldEnabled => 'Enabled';

  @override
  String get engineFieldOn => 'On';

  @override
  String get engineFieldOff => 'Off';

  @override
  String get engineFieldLow => 'Low';

  @override
  String get engineFieldMedium => 'Medium';

  @override
  String get engineFieldHigh => 'High';

  @override
  String get engineFieldMax => 'Max';

  @override
  String get engineFieldNone => 'None';

  @override
  String get engineFieldModified => 'Modified';

  @override
  String get engineFieldLocked => 'Fixed by config file';

  @override
  String get engineFieldSharedWithModel => 'Shared with models';

  @override
  String get engineFieldNotConfigured => 'Not configured';

  @override
  String get engineFieldConfigured => 'Configured';

  @override
  String get engineSettingsMissing => 'This host has no such setting';

  @override
  String get engineSettingsPluginDisabled => 'Required plugin isn’t enabled';

  @override
  String get engineSettingsReadOnly => 'Engine settings are read-only';

  @override
  String get engineSubagentSavedUnavailable => 'Saved but currently unavailable';

  @override
  String get engineSubagentKeepOneModel => 'Keep at least one model';

  @override
  String get engineSubagentLimits => 'Limits';

  @override
  String get engineSubagentModelSelection => 'Model selection';

  @override
  String get engineSubagentPickFirstModel => 'Choose a model to apply';

  @override
  String get engineSubagentReadModelsFailed => 'Couldn’t load models';

  @override
  String get engineSubagentNoModels => 'No models available yet';

  @override
  String get engineSubagentConnectModel => 'Add provider';

  @override
  String get engineSearchDeepSeek => 'DeepSeek search';

  @override
  String get engineSearchNewApi => 'New search API';

  @override
  String get engineProviderDeleteBody =>
      'This deletes the provider and its API key. Chats using it will need another model.';

  @override
  String get engineProviderReadFailed => 'Couldn’t load providers';

  @override
  String get engineProviderGone => 'This provider is gone';

  @override
  String get engineProviderProtocol => 'Protocol';

  @override
  String get engineProviderEnterKey => 'Enter API key';

  @override
  String get engineProviderIssues => 'Issues';

  @override
  String get engineProviderRejectedConfig => 'The engine rejected some settings';

  @override
  String get engineProviderConnection => 'Connection';

  @override
  String get engineProviderDefaultUrl => 'Default URL';

  @override
  String get engineProviderKeyNotRequired => 'Not needed';

  @override
  String get engineProviderNoModels => 'No models yet';

  @override
  String get engineProviderWebConfigured => 'Configured in DSH Web. You can view or delete it here';

  @override
  String get engineProviderDelete => 'Delete provider';

  @override
  String get engineProviderConfigFile => 'Provided by the engine config file. Can’t delete it here';

  @override
  String get engineProviderTesting => 'Testing';

  @override
  String get engineProviderTestConnection => 'Test connection';

  @override
  String get engineProviderKeyFirst => 'Enter an API key first';

  @override
  String get engineProviderNoDiscoveredModels => 'The service listed no models. Add them manually.';

  @override
  String get engineProviderNeedModel => 'Add at least one model';

  @override
  String get engineProviderEdit => 'Edit provider';

  @override
  String get engineProviderAdd => 'Add provider';

  @override
  String get engineProviderBasicInfo => 'Basic info';

  @override
  String get engineProviderNameHint => 'e.g. My gateway';

  @override
  String get engineProviderCompatibleProtocol => 'Compatible protocol';

  @override
  String get engineProviderKeepStoredKey => 'Saved. Leave blank to keep it';

  @override
  String get engineProviderSaving => 'Saving';

  @override
  String get engineProviderWaitingEngine => 'Waiting for engine';

  @override
  String get engineProviderFetchingModels => 'Fetching models';

  @override
  String get engineProviderFetchModels => 'Fetch models';

  @override
  String get engineProviderAddManually => 'Add manually';

  @override
  String get engineProviderManualModel => 'Add model manually';

  @override
  String get engineProviderModelId => 'Model ID';

  @override
  String get engineProviderSelectModels => 'Select models';

  @override
  String get engineProviderSearchModels => 'Search models';

  @override
  String get engineProviderDeselectAll => 'Deselect all';

  @override
  String get engineProviderSelectAll => 'Select all';

  @override
  String get engineProviderNoMatchingModels => 'No matching models';

  @override
  String get engineProviderAlreadyAdded => 'Added';

  @override
  String get engineProviderReady => 'Ready';

  @override
  String get engineProviderMissingKey => 'Missing API key';

  @override
  String get engineProviderMisconfigured => 'Invalid config';

  @override
  String get engineProviderInactive => 'Not enabled';

  @override
  String get engineProviderConfiguredInWeb => 'Configured in Web';

  @override
  String get engineProvidersTitle => 'Models';

  @override
  String get engineProvidersNotConnected => 'Not connected to the engine';

  @override
  String get engineProvidersStartEngine => 'Start the engine to add providers';

  @override
  String get engineProvidersUnsupported => 'This host doesn’t support custom providers';

  @override
  String get engineProvidersNotConfiguredHere => 'Not configured on this host';

  @override
  String get engineProvidersSigningIn => 'Signing in…';

  @override
  String get engineProvidersSignInOrKey => 'Sign in or enter an API key';

  @override
  String get engineProvidersOfficial => 'Official';

  @override
  String get engineProvidersSubscription => 'Subscriptions';

  @override
  String get engineProvidersCustom => 'Custom';

  @override
  String get engineProvidersCompatibleHint => 'OpenAI- and Anthropic-compatible services';

  @override
  String get engineProvidersReadOnly => 'Engine settings are read-only. Can’t add providers';

  @override
  String get engineSubscriptionSignOutBody => 'Its models will be removed from the model picker.';

  @override
  String get engineSubscriptionNoModels => 'No models';

  @override
  String get engineSubscriptionModelsFailed => 'Couldn’t load models';

  @override
  String get engineSubscriptionPreparing => 'Preparing…';

  @override
  String get engineSubscriptionCancelled => 'Sign-in cancelled';

  @override
  String get engineSubscriptionIncomplete => 'Sign-in incomplete';

  @override
  String get engineSubscriptionWaitingSignIn => 'Waiting for sign-in…';

  @override
  String get engineSubscriptionReopen => 'Reopen';

  @override
  String get engineSubscriptionCode => 'Verification code';

  @override
  String get engineSubscriptionWaitingVerification => 'Waiting for verification…';

  @override
  String get engineSubscriptionCopyCode => 'Copy code';

  @override
  String get engineSubscriptionOpenVerification => 'Open verification';

  @override
  String get engineSubscriptionPasteRedirect => 'Paste the redirected URL';

  @override
  String get engineSubscriptionPasteCode => 'Paste the authorization code';

  @override
  String get engineSubscriptionPasteHere => 'Paste here';

  @override
  String get engineSubscriptionConfirm => 'Confirm';

  @override
  String get engineSubscriptionTryAgain => 'Try again';

  @override
  String engineAccountWelcome(String name) {
    return 'Welcome, $name';
  }

  @override
  String engineLayerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count levels', one: '1 level');
    return '$_temp0';
  }

  @override
  String engineFieldDefaultValue(String value) {
    return 'Default $value';
  }

  @override
  String engineFieldDefaultValueUnit(String value, String unit) {
    return 'Default $value $unit';
  }

  @override
  String engineFieldCurrentValue(String value) {
    return 'Current $value';
  }

  @override
  String engineFieldRemoveItem(String name) {
    return 'Remove $name';
  }

  @override
  String engineFieldAddItem(String item) {
    return 'Add $item';
  }

  @override
  String engineFieldItemIndex(int index) {
    return 'Item $index';
  }

  @override
  String engineFieldByteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count bytes', one: '1 byte');
    return '$_temp0';
  }

  @override
  String engineFieldHours(String value) {
    return '$value h';
  }

  @override
  String engineFieldMinutes(String value) {
    return '$value min';
  }

  @override
  String engineFieldSeconds(String value) {
    return '$value s';
  }

  @override
  String engineFieldMilliseconds(String value) {
    return '$value ms';
  }

  @override
  String engineFieldPositiveMax(String max) {
    return 'Greater than 0, up to $max';
  }

  @override
  String engineFieldMin(String min) {
    return 'At least $min';
  }

  @override
  String engineFieldMaxBound(String max) {
    return 'At most $max';
  }

  @override
  String engineFieldBelowMin(String min) {
    return 'Must be at least $min';
  }

  @override
  String engineFieldAboveMax(String max) {
    return 'Must be at most $max';
  }

  @override
  String engineFieldMultiple(String step) {
    return 'Must be a multiple of $step';
  }

  @override
  String engineFieldMinCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'At least $count characters',
      one: 'At least 1 character',
    );
    return '$_temp0';
  }

  @override
  String engineFieldMaxCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'At most $count characters',
      one: 'At most 1 character',
    );
    return '$_temp0';
  }

  @override
  String engineSubagentUnavailableProvider(String provider) {
    return '$provider · Currently unavailable';
  }

  @override
  String engineProviderDeleteTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String engineProviderDeleteFailed(String error) {
    return 'Couldn’t delete: $error';
  }

  @override
  String engineProviderModelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Models · $count', one: 'Model · 1');
    return '$_temp0';
  }

  @override
  String engineProviderContext(String size) {
    return 'Context $size';
  }

  @override
  String engineProviderTestPassed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Connected · Listed $count models',
      one: 'Connected · Listed 1 model',
    );
    return '$_temp0';
  }

  @override
  String engineProviderCompletedUrl(String url) {
    return 'Completed as $url';
  }

  @override
  String engineProviderSaveFailed(String error) {
    return 'Couldn’t save: $error';
  }

  @override
  String engineProviderCandidateCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count total', one: '1 total');
    return '$_temp0';
  }

  @override
  String engineProviderAddModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Add $count models', one: 'Add 1 model');
    return '$_temp0';
  }

  @override
  String engineProviderModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count models', one: '1 model');
    return '$_temp0';
  }

  @override
  String engineProvidersSummary(int total, int ready) {
    String _temp0 = intl.Intl.pluralLogic(total, locale: localeName, other: '$total providers', one: '1 provider');
    return '$_temp0 · $ready ready';
  }

  @override
  String engineProvidersAccount(String name) {
    return 'Account · $name';
  }

  @override
  String engineProvidersSignedInAccount(String account) {
    return 'Signed in · $account';
  }

  @override
  String engineSubscriptionSignIn(String provider) {
    return 'Sign in to $provider';
  }

  @override
  String engineSubscriptionSignOutTitle(String provider) {
    return 'Sign out of $provider?';
  }

  @override
  String engineSubscriptionSignOutFailed(String error) {
    return 'Couldn’t sign out: $error';
  }

  @override
  String engineSubscriptionCodeSemantics(String code) {
    return 'Verification code $code';
  }

  @override
  String engineFieldItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$_temp0';
  }

  @override
  String engineFieldUseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count times', one: '1 time');
    return '$_temp0';
  }

  @override
  String engineFieldResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count results', one: '1 result');
    return '$_temp0';
  }

  @override
  String engineFieldMinCharactersDecimal(String bound) {
    return 'At least $bound characters';
  }

  @override
  String engineFieldMaxCharactersDecimal(String bound) {
    return 'At most $bound characters';
  }

  @override
  String engineLayerValue(String value) {
    return '$value levels';
  }

  @override
  String engineFieldEnterPositiveRange(String max) {
    return 'Enter a number greater than 0 and no more than $max';
  }

  @override
  String engineFieldEnterBoundedRange(String min, String max) {
    return 'Enter a number from $min to $max';
  }

  @override
  String get engineModelTokenLimits => 'Token limits';

  @override
  String get engineModelContextLength => 'Context length';

  @override
  String get engineModelMaxOutput => 'Max output';

  @override
  String engineModelDefaultSize(String size) {
    return 'Default $size';
  }

  @override
  String get engineModelCapabilities => 'Capabilities';

  @override
  String get engineModelInputType => 'Input';

  @override
  String get engineModelInputText => 'Text';

  @override
  String get engineModelInputTextImage => 'Text + image';

  @override
  String get engineModelThinking => 'Thinking';

  @override
  String get engineModelVision => 'Vision';

  @override
  String get engineModelLevels => 'Available levels';

  @override
  String get engineModelNeedLevel => 'Pick at least one level';

  @override
  String get engineFieldEditOnWeb => 'Edit this item on the web';

  @override
  String get engineSettingsHostChanged => 'The host changed. Reopen these settings to edit.';

  @override
  String get engineSecretTargetChanged => 'This field changed. Reopen it to edit.';

  @override
  String engineSettingsGroupCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count settings', one: '1 setting');
    return '$_temp0';
  }

  @override
  String get featuresCordisSubtitle => 'Dynamic plugins · Cleared when the engine restarts';

  @override
  String get featuresCordisUnavailable => 'Cordis isn’t available here';

  @override
  String get featuresCordisRemoteUnavailable => 'Unavailable over DSH Remote';

  @override
  String get featuresCordisReadFailed => 'Couldn’t load plugins';

  @override
  String get featuresCordisEmpty => 'No dynamic plugins yet';

  @override
  String get featuresCordisEmptyHint => 'Plugins appear here once created';

  @override
  String get featuresCurrentChat => 'Current chat';

  @override
  String get featuresOtherChats => 'Other chats';

  @override
  String featuresPresetDefaultSet(String name) {
    return 'New chats will use “$name”';
  }

  @override
  String get featuresPresetDefaultFailed => 'Couldn’t set as default';

  @override
  String featuresPresetDeleteTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get featuresPresetDeleteHint => 'It won’t be available for new chats. Existing chats stay as they are.';

  @override
  String get featuresDeleted => 'Deleted';

  @override
  String get featuresDeleteFailed => 'Couldn’t delete';

  @override
  String get featuresPresetAlreadyDefault => 'Default for new chats';

  @override
  String get featuresPresetSetDefault => 'Use for new chats';

  @override
  String get featuresPresetViewConfig => 'View configuration';

  @override
  String get featuresPresetDuplicate => 'Duplicate preset';

  @override
  String get featuresPresetDefaultDeleteHint => 'Set another preset as the default for new chats first';

  @override
  String get featuresAgentPresets => 'Agent presets';

  @override
  String get featuresAgentPresetsSubtitle => 'Tools and behavior for new chats';

  @override
  String get featuresNew => 'New';

  @override
  String get featuresPresetsReadFailed => 'Couldn’t load agent presets';

  @override
  String get featuresLoadFailed => 'Couldn’t load';

  @override
  String get featuresNewChatDefault => 'Default for new chats';

  @override
  String get featuresEmptyDocument => '(Empty)';

  @override
  String get featuresReadFailed => 'Couldn’t read';

  @override
  String featuresTodayTime(String time) {
    return 'Today $time';
  }

  @override
  String featuresTomorrowTime(String time) {
    return 'Tomorrow $time';
  }

  @override
  String featuresYesterdayTime(String time) {
    return 'Yesterday $time';
  }

  @override
  String featuresScheduleSummaryNext(String rule, String time) {
    return '$rule · Next $time';
  }

  @override
  String get featuresEnded => 'Ended';

  @override
  String featuresScheduleSummaryEnded(String time) {
    return 'Ended · Ran $time';
  }

  @override
  String featuresJobElapsed(String span) {
    return 'Running for $span';
  }

  @override
  String featuresJobDuration(String span) {
    return 'Took $span';
  }

  @override
  String get featuresPermissionReadOnly => 'Read only';

  @override
  String get featuresPermissionWorkspaceWrite => 'Workspace write';

  @override
  String get featuresPermissionFullAccess => 'Full access';

  @override
  String get featuresPermissionAutoReview => 'Auto review';

  @override
  String get featuresPermissionCustom => 'Custom';

  @override
  String get featuresPermissionReadOnlyHint => 'View files without changing them';

  @override
  String get featuresPermissionWorkspaceWriteHint => 'Edit workspace files; ask before going beyond';

  @override
  String get featuresPermissionFullAccessHint => 'Run without asking';

  @override
  String get featuresPermissionAutoReviewHint => 'The model reviews each action and asks when unsure';

  @override
  String get featuresPresetStandard => 'Standard mode';

  @override
  String get featuresPresetPtc => 'PTC mode';

  @override
  String get featuresPresetMinimal => 'Minimal mode';

  @override
  String get featuresPresetCreator => 'Creator mode';

  @override
  String get featuresPresetStandardDescription => 'Code, files, and research for most tasks';

  @override
  String get featuresPresetPtcDescription => 'Batch tool calls, then filter, analyze, and summarize';

  @override
  String get featuresPresetMinimalDescription => 'Terminal and image viewing only, for testing and comparison';

  @override
  String get featuresPresetCreatorDescription => 'Have the agent write plugins to customize DSH';

  @override
  String featuresHostUnreachable(String name) {
    return 'Can’t connect to “$name”';
  }

  @override
  String featuresHostConnecting(String name) {
    return 'Connecting to “$name”…';
  }

  @override
  String get featuresJobs => 'Background jobs';

  @override
  String get featuresJobsSubtitle => 'Cleared when the engine restarts';

  @override
  String get featuresJobsReadFailed => 'Couldn’t load background jobs';

  @override
  String get featuresJobsEmpty => 'No background jobs';

  @override
  String get featuresJobsEmptyHint => 'Commands such as dev servers appear here';

  @override
  String featuresJobsEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Ended · $count', one: 'Ended · 1');
    return '$_temp0';
  }

  @override
  String get featuresJobStopTitle => 'Stop this job?';

  @override
  String get featuresJobAlreadyEnded => 'This job has already ended';

  @override
  String get featuresJobStopFailed => 'Couldn’t stop';

  @override
  String get featuresJobOutput => 'Job output';

  @override
  String get featuresOutput => 'Output';

  @override
  String featuresJobRecentLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Last $count lines', one: 'Last 1 line');
    return '$_temp0';
  }

  @override
  String get featuresJobOutputSubject => 'DSH job output';

  @override
  String get featuresJobOutputReadFailed => 'Couldn’t read output';

  @override
  String get featuresJobOutputWaiting => 'Waiting for output…';

  @override
  String get featuresJobOutputEmpty => 'No output';

  @override
  String get featuresPermissionAutoTitle => 'Turn on Auto review?';

  @override
  String get featuresPermissionAutoWarning => 'The model decides whether to allow each action. It may get it wrong.';

  @override
  String get featuresSwitchFailed => 'Couldn’t switch';

  @override
  String get featuresPermissions => 'Permissions';

  @override
  String get featuresPermissionsSubtitle => 'Choose when to ask before running commands or editing files';

  @override
  String get featuresPermissionsReadFailed => 'Couldn’t load permissions';

  @override
  String get featuresPermissionCustomHint => 'Choosing a preset replaces your custom permissions';

  @override
  String get featuresModuleInstructions => 'Workspace instructions';

  @override
  String get featuresModuleTime => 'Time awareness';

  @override
  String get featuresModuleBash => 'Bash command tool';

  @override
  String get featuresModulePersistentBash => 'Persistent Bash tool';

  @override
  String get featuresModulePowerShell => 'PowerShell command tool';

  @override
  String get featuresModuleFiles => 'File read/write tool';

  @override
  String get featuresModuleFileSearch => 'File search tool';

  @override
  String get featuresModuleJobs => 'Background job tool';

  @override
  String get featuresModuleSchedule => 'Automation tool';

  @override
  String get featuresModuleLocalSkills => 'Local skill loading';

  @override
  String get featuresModuleSkillTool => 'Skill loading tool';

  @override
  String get featuresModuleGoalCommand => 'Goal management command';

  @override
  String get featuresModuleGoalTool => 'Goal management tool';

  @override
  String get featuresModulePlan => 'Plan mode';

  @override
  String get featuresModuleCompaction => 'Context compaction';

  @override
  String get featuresModuleCompactCommand => 'Context compaction command';

  @override
  String get featuresModuleAskUser => 'Ask user tool';

  @override
  String get featuresModuleTodo => 'Todo list tool';

  @override
  String get featuresModuleWeb => 'Web search and fetch tool';

  @override
  String get featuresModulePresent => 'File delivery tool';

  @override
  String get featuresModuleCordis => 'Plugin API lookup tool';

  @override
  String get featuresModuleSubagent => 'Subagent delegation tool';

  @override
  String get featuresModuleSubagentControl => 'Subagent control tool';

  @override
  String get featuresModuleWorkflow => 'Workflow tool';

  @override
  String get featuresModulePluginManager => 'Plugin management tool';

  @override
  String get featuresModulePluginMarket => 'Plugin marketplace tool';

  @override
  String get featuresModuleToolCalls => 'Tool call style';

  @override
  String get featuresModuleTerminal => 'Persistent terminal service';

  @override
  String get featuresModulePersona => 'Agent persona';

  @override
  String get featuresGroupDelegation => 'Subagent delegation';

  @override
  String get featuresGroupTerminal => 'Persistent terminal';

  @override
  String get featuresPresetIdRequired => 'Enter an ID';

  @override
  String get featuresPresetIdLength => 'Up to 40 characters';

  @override
  String get featuresPresetIdFormat => 'Use lowercase letters, numbers, and hyphens';

  @override
  String get featuresPresetIdTaken => 'This ID is already in use';

  @override
  String featuresPresetCopyName(String name) {
    return '$name copy';
  }

  @override
  String get featuresPresetBasedOn => 'Based on';

  @override
  String get featuresNameRequired => 'Enter a name';

  @override
  String get featuresCreatorOpenFailed => 'Couldn’t open Creator mode';

  @override
  String get featuresPresetNameHint => 'For example: Code review';

  @override
  String get featuresPresetId => 'ID';

  @override
  String get featuresPresetIdHint => 'Lowercase letters, numbers, and hyphens';

  @override
  String get featuresPresetDescription => 'Description';

  @override
  String get featuresPresetDescriptionHint => 'Describe what it’s for in one sentence';

  @override
  String get featuresPresetConfigReadFailed => 'Couldn’t load preset configuration';

  @override
  String get featuresPresetCreateTitle => 'New agent preset';

  @override
  String get featuresPresetDuplicateTitle => 'Duplicate agent preset';

  @override
  String get featuresPresetEditTitle => 'Edit agent preset';

  @override
  String get featuresCreatorOpening => 'Opening Creator mode';

  @override
  String get featuresWaitingEngine => 'Waiting for the engine';

  @override
  String get featuresCreatorUnavailable => 'Creator mode unavailable';

  @override
  String get featuresPresetStartUpdate => 'Start updating';

  @override
  String get featuresPresetStartCreate => 'Start creating';

  @override
  String get featuresPresetSystemPrompt => 'System prompt';

  @override
  String get featuresPresetSystemPromptHint => 'Who you are and how you work';

  @override
  String get featuresPresetReplaceSystemPrompt => 'Replace the full system prompt';

  @override
  String get featuresPresetTools => 'Tools';

  @override
  String get featuresSkills => 'Skills';

  @override
  String get featuresPresetContextModes => 'Context and modes';

  @override
  String get featuresCronMinute => 'Minutes';

  @override
  String get featuresCronHour => 'Hours';

  @override
  String get featuresDate => 'Date';

  @override
  String get featuresCronMonth => 'Month';

  @override
  String get featuresCronWeekday => 'Day of week';

  @override
  String get featuresCronRequired => 'Enter a 5-field Cron expression';

  @override
  String get featuresCronWhitespace => 'No leading or trailing spaces';

  @override
  String featuresCronFieldCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expected 5 fields, got $count',
      one: 'Expected 5 fields, got 1',
    );
    return '$_temp0';
  }

  @override
  String featuresCronInvalidField(int index, String name) {
    return 'Field $index ($name) is invalid';
  }

  @override
  String get featuresWeekdayMon => 'Mon';

  @override
  String get featuresWeekdayTue => 'Tue';

  @override
  String get featuresWeekdayWed => 'Wed';

  @override
  String get featuresWeekdayThu => 'Thu';

  @override
  String get featuresWeekdayFri => 'Fri';

  @override
  String get featuresWeekdaySat => 'Sat';

  @override
  String get featuresWeekdaySun => 'Sun';

  @override
  String get featuresMonthJan => 'January';

  @override
  String get featuresMonthFeb => 'February';

  @override
  String get featuresMonthMar => 'March';

  @override
  String get featuresMonthApr => 'April';

  @override
  String get featuresMonthMay => 'May';

  @override
  String get featuresMonthJun => 'June';

  @override
  String get featuresMonthJul => 'July';

  @override
  String get featuresMonthAug => 'August';

  @override
  String get featuresMonthSep => 'September';

  @override
  String get featuresMonthOct => 'October';

  @override
  String get featuresMonthNov => 'November';

  @override
  String get featuresMonthDec => 'December';

  @override
  String featuresWeekdayName(String day) {
    return '$day';
  }

  @override
  String featuresCronWeekdayRange(String first, String last) {
    return '$first–$last';
  }

  @override
  String featuresCronEveryDay(String months) {
    return 'Every day$months';
  }

  @override
  String featuresCronMonthDays(String days, String months) {
    return 'Monthly on $days$months';
  }

  @override
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months) {
    return 'Monthly on $days, if $weekdays$months';
  }

  @override
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months) {
    return 'Monthly on $days or $weekdays$months';
  }

  @override
  String featuresCronHourRange(String first, String last) {
    return '$first to $last';
  }

  @override
  String get featuresEveryMinute => 'Every minute';

  @override
  String featuresCronEveryMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Every $count minutes',
      one: 'Every minute',
    );
    return '$_temp0';
  }

  @override
  String get featuresEveryHour => 'Every hour';

  @override
  String featuresCronHourlyMinutes(String minutes) {
    return 'At minute $minutes of every hour';
  }

  @override
  String featuresCronHoursEveryMinute(String hours) {
    return 'Every minute during hour $hours';
  }

  @override
  String featuresCronHoursEveryMinutes(String hours, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Every $count minutes during hour $hours',
      one: 'Every minute during hour $hours',
    );
    return '$_temp0';
  }

  @override
  String featuresCronEveryHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Every $count hours', one: 'Every hour');
    return '$_temp0';
  }

  @override
  String featuresCronHoursMinutes(String hours, String minutes) {
    return 'At minute $minutes during hour $hours';
  }

  @override
  String get featuresRepeatDaily => 'Daily';

  @override
  String get featuresRepeatWeekdays => 'Weekdays';

  @override
  String get featuresRepeatWeekly => 'Weekly';

  @override
  String get featuresRepeatMonthly => 'Monthly';

  @override
  String get featuresRepeatInterval => 'Interval';

  @override
  String get featuresRepeatOnce => 'Once';

  @override
  String get featuresRepeatAdvanced => 'Advanced';

  @override
  String get featuresIntervalSeconds => 'Seconds';

  @override
  String get featuresZoneUnavailable => 'Time zone unavailable';

  @override
  String get featuresChooseDay => 'Choose at least one day';

  @override
  String get featuresIntervalMinimum => 'Interval must be at least 1';

  @override
  String get featuresMinimumMinute => 'At least 1 minute';

  @override
  String get featuresTimeDoesNotExist => 'This time doesn’t exist in this time zone';

  @override
  String get featuresChooseFutureTime => 'Choose a future time';

  @override
  String get featuresCronNeverRuns => 'This expression never runs';

  @override
  String featuresRuleDaily(String time) {
    return 'Daily at $time';
  }

  @override
  String featuresRuleWeekdays(String time) {
    return 'Weekdays at $time';
  }

  @override
  String featuresRuleWeekends(String time) {
    return 'Weekends at $time';
  }

  @override
  String featuresRuleWeekly(String days, String time) {
    return 'Every $days at $time';
  }

  @override
  String featuresRuleMonthly(String days, String time) {
    return 'Monthly on $days at $time';
  }

  @override
  String get featuresRepeat => 'Repeat';

  @override
  String get featuresChat => 'Chat';

  @override
  String get featuresWorkspace => 'Workspace';

  @override
  String get featuresInstructionRequired => 'Enter instructions';

  @override
  String featuresScheduleSaveError(String reason) {
    return 'Couldn’t save: $reason';
  }

  @override
  String featuresScheduleCreateError(String reason) {
    return 'Couldn’t create: $reason';
  }

  @override
  String get featuresScheduleNameHint => 'For example: Daily standup reminder';

  @override
  String get featuresScheduleInstruction => 'Instructions';

  @override
  String get featuresScheduleInstructionHint => 'For example: Summarize yesterday’s commits for me';

  @override
  String get featuresScheduleRunTime => 'Run time';

  @override
  String get featuresScheduleOpenChat => 'View chat';

  @override
  String get featuresScheduleEditTitle => 'Edit automation';

  @override
  String get featuresScheduleCreateTitle => 'New automation';

  @override
  String get featuresScheduleSaving => 'Saving';

  @override
  String get featuresScheduleCreating => 'Creating in chat';

  @override
  String get featuresTime => 'Time';

  @override
  String get featuresNotSelected => 'Not selected';

  @override
  String featuresMonthDaysLabel(String days) {
    return 'Day $days';
  }

  @override
  String get featuresTimeZone => 'Time zone';

  @override
  String get featuresScheduleRunLocation => 'Run in';

  @override
  String get featuresJustCreatedChat => 'Just-created chat';

  @override
  String get featuresModel => 'Model';

  @override
  String get featuresRequestRefused => 'The engine didn’t accept this request';

  @override
  String get featuresScheduleNotFound => 'This automation no longer exists';

  @override
  String get featuresScheduleEndedError => 'This automation has ended and can’t be edited';

  @override
  String get featuresScheduleConflict => 'This automation just changed. Go back and try again.';

  @override
  String get featuresScheduleInvalidPrompt => 'Enter a name and instructions. Names can have up to 120 characters.';

  @override
  String get featuresScheduleInvalidTime => 'Invalid run time';

  @override
  String get featuresScheduleIntervalTooShort => 'Interval must be at least 1 minute';

  @override
  String get featuresScheduleTimeOutOfRange => 'Time is out of range';

  @override
  String get featuresScheduleSubagentError => 'This chat can’t receive automations';

  @override
  String get featuresEvery => 'Every';

  @override
  String get featuresCronExpression => 'Cron expression';

  @override
  String get featuresCronFieldGuide => 'Min  Hour  Day  Month  Weekday';

  @override
  String featuresZoneTimeSuffix(String city) {
    return ' ($city time)';
  }

  @override
  String get featuresScheduleNextLocal => 'Next runs (this phone’s time)';

  @override
  String get featuresScheduleNext => 'Next runs';

  @override
  String featuresMonthDayChoice(int day) {
    return 'Day $day';
  }

  @override
  String get featuresZonesCommon => 'Common';

  @override
  String get featuresZonesAll => 'All';

  @override
  String get featuresZoneSearchHint => 'Search cities, time zones, or UTC offsets';

  @override
  String get featuresZonesNoMatch => 'No matching time zones';

  @override
  String get featuresZoneUTC => 'Coordinated Universal Time';

  @override
  String get featuresZoneShanghai => 'Shanghai';

  @override
  String get featuresZoneUrumqi => 'Urumqi';

  @override
  String get featuresZoneHongKong => 'Hong Kong';

  @override
  String get featuresZoneMacau => 'Macau';

  @override
  String get featuresZoneTaipei => 'Taipei';

  @override
  String get featuresZoneTokyo => 'Tokyo';

  @override
  String get featuresZoneSeoul => 'Seoul';

  @override
  String get featuresZoneSingapore => 'Singapore';

  @override
  String get featuresZoneKualaLumpur => 'Kuala Lumpur';

  @override
  String get featuresZoneBangkok => 'Bangkok';

  @override
  String get featuresZoneHoChiMinh => 'Ho Chi Minh City';

  @override
  String get featuresZoneJakarta => 'Jakarta';

  @override
  String get featuresZoneManila => 'Manila';

  @override
  String get featuresZoneKolkata => 'Kolkata';

  @override
  String get featuresZoneDubai => 'Dubai';

  @override
  String get featuresZoneJerusalem => 'Jerusalem';

  @override
  String get featuresZoneLondon => 'London';

  @override
  String get featuresZoneDublin => 'Dublin';

  @override
  String get featuresZoneLisbon => 'Lisbon';

  @override
  String get featuresZoneParis => 'Paris';

  @override
  String get featuresZoneBerlin => 'Berlin';

  @override
  String get featuresZoneMadrid => 'Madrid';

  @override
  String get featuresZoneRome => 'Rome';

  @override
  String get featuresZoneAmsterdam => 'Amsterdam';

  @override
  String get featuresZoneZurich => 'Zurich';

  @override
  String get featuresZoneStockholm => 'Stockholm';

  @override
  String get featuresZoneWarsaw => 'Warsaw';

  @override
  String get featuresZoneAthens => 'Athens';

  @override
  String get featuresZoneIstanbul => 'Istanbul';

  @override
  String get featuresZoneMoscow => 'Moscow';

  @override
  String get featuresZoneCairo => 'Cairo';

  @override
  String get featuresZoneJohannesburg => 'Johannesburg';

  @override
  String get featuresZoneLagos => 'Lagos';

  @override
  String get featuresZoneNewYork => 'New York';

  @override
  String get featuresZoneToronto => 'Toronto';

  @override
  String get featuresZoneChicago => 'Chicago';

  @override
  String get featuresZoneDenver => 'Denver';

  @override
  String get featuresZonePhoenix => 'Phoenix';

  @override
  String get featuresZoneLosAngeles => 'Los Angeles';

  @override
  String get featuresZoneVancouver => 'Vancouver';

  @override
  String get featuresZoneAnchorage => 'Anchorage';

  @override
  String get featuresZoneMexicoCity => 'Mexico City';

  @override
  String get featuresZoneBogota => 'Bogota';

  @override
  String get featuresZoneLima => 'Lima';

  @override
  String get featuresZoneSantiago => 'Santiago';

  @override
  String get featuresZoneSaoPaulo => 'Sao Paulo';

  @override
  String get featuresZoneBuenosAires => 'Buenos Aires';

  @override
  String get featuresZoneHonolulu => 'Honolulu';

  @override
  String get featuresZoneAuckland => 'Auckland';

  @override
  String get featuresZoneSydney => 'Sydney';

  @override
  String get featuresZoneMelbourne => 'Melbourne';

  @override
  String get featuresZoneBrisbane => 'Brisbane';

  @override
  String get featuresZonePerth => 'Perth';

  @override
  String get featuresScheduleCreated => 'Created';

  @override
  String get featuresSchedulesReadFailed => 'Couldn’t load automations';

  @override
  String get featuresSchedulesEmpty => 'No automations yet';

  @override
  String get featuresSchedulesEmptyHint => 'Send to a chat and run automatically at the scheduled time';

  @override
  String get featuresScheduleNewTask => 'New automation';

  @override
  String get featuresSchedulesNoMatch => 'No matching automations';

  @override
  String get featuresSchedulesNoActive => 'No active automations';

  @override
  String get featuresSchedulesNoEnded => 'No ended automations';

  @override
  String get featuresSchedules => 'Automations';

  @override
  String get featuresSchedulesSubtitle => 'Send to the original chat at the scheduled time';

  @override
  String get featuresSchedulesSearch => 'Search automations';

  @override
  String featuresSchedulesAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'All $count', one: 'All 1');
    return '$_temp0';
  }

  @override
  String get featuresScheduleUntitled => 'Untitled automation';

  @override
  String get featuresScheduleSent => 'Sent to chat';

  @override
  String get featuresView => 'View';

  @override
  String get featuresSendFailed => 'Couldn’t send';

  @override
  String get featuresScheduleDeleteTitle => 'Delete this automation?';

  @override
  String get featuresScheduleDeleteHint =>
      'Future runs will stop and run history will be deleted. The original chat stays as it is.';

  @override
  String get featuresScheduleDeleted => 'Automation deleted';

  @override
  String get featuresScheduleActive => 'Active';

  @override
  String get featuresScheduleRun => 'Run';

  @override
  String get featuresScheduleNextRun => 'Next';

  @override
  String get featuresScheduleLastRun => 'Last';

  @override
  String get featuresScheduleRule => 'Rule';

  @override
  String get featuresScheduleLinkedChat => 'Linked chat';

  @override
  String get featuresScheduleChatDeleted => 'Chat deleted';

  @override
  String get featuresScheduleEdit => 'Edit automation';

  @override
  String get featuresScheduleRunNow => 'Run now';

  @override
  String get featuresScheduleHistory => 'Run history';

  @override
  String get featuresScheduleNeverRun => 'No runs yet';

  @override
  String get featuresScheduleHistoryUnavailable => 'History unavailable';

  @override
  String get featuresScheduleHistoryReadFailed => 'Couldn’t load run history';

  @override
  String get featuresScheduleDelete => 'Delete automation';

  @override
  String featuresExportSavedTo(String path) {
    return 'Saved to $path';
  }

  @override
  String get featuresExportTitle => 'Export chat logs';

  @override
  String get featuresExportSubtitle => 'A ZIP for feedback or backup';

  @override
  String get featuresExportUnavailable => 'Can’t export over this connection';

  @override
  String get featuresExportRemoteHint =>
      'Logs aren’t available over DSH Remote. Export them from DSH Web on your computer.';

  @override
  String get featuresExportShareHint => 'Attach to feedback or send to yourself';

  @override
  String get featuresExportSaveDownloads => 'Save to Downloads';

  @override
  String get featuresExportDownloadsHint => 'Save in Downloads/DSH-Go';

  @override
  String get featuresExportContents => 'All records and attachments from this chat and its subagents';

  @override
  String get featuresSkillUseHere => 'Use in chat';

  @override
  String get featuresSkillUseNew => 'New chat';

  @override
  String get featuresSkillsCallHint => 'Type /skill-name to use';

  @override
  String get featuresSkillsReadFailed => 'Couldn’t load skills';

  @override
  String get featuresSkillsEmpty => 'No skills in this chat yet';

  @override
  String get featuresSkillsEmptyHint => 'Skills in .dsh/skills appear here';

  @override
  String get featuresSkillsSourceHint => 'From the project’s and ~/.dsh skills folders';

  @override
  String featuresSkillUsage(String usage) {
    return 'For: $usage';
  }

  @override
  String get featuresSkillManual => 'Manual only';

  @override
  String featuresArtifactsSemantic(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Output files, $count files, view all',
      one: 'Output files, 1 file, view all',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsTitle => 'Output files';

  @override
  String featuresArtifactsAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'All $count', one: 'All 1');
    return '$_temp0';
  }

  @override
  String featuresArtifactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count files', one: '1 file');
    return '$_temp0';
  }

  @override
  String get featuresArtifactsNoFiles => 'No files yet';

  @override
  String featuresArtifactsTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files · Delivered and generated',
      one: '1 file · Delivered and generated',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsEmpty => 'No output files yet';

  @override
  String get featuresArtifactsEmptyHint => 'Files delivered or generated by AI appear here';

  @override
  String get featuresListSeparator => ', ';

  @override
  String featuresErrorReason(String title, String reason) {
    return '$title: $reason';
  }

  @override
  String featuresYearDate(int year, String date) {
    return '$date, $year';
  }

  @override
  String featuresDateWeekdayTime(String date, String week, String time) {
    return '$week, $date $time';
  }

  @override
  String featuresDateWeekday(String date, String day) {
    return '$day, $date';
  }

  @override
  String featuresOnceDescription(String rule, String date, String time) {
    return '$rule · $date $time';
  }

  @override
  String featuresCronMonthSuffix(String months) {
    return ' ($months)';
  }

  @override
  String featuresRuleIntervalSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Every $count seconds',
      one: 'Every second',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Every $count minutes',
      one: 'Every minute',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Every $count hours', one: 'Every hour');
    return '$_temp0';
  }

  @override
  String featuresSchedulesActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Active $count', one: 'Active 1');
    return '$_temp0';
  }

  @override
  String featuresSchedulesEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Ended $count', one: 'Ended 1');
    return '$_temp0';
  }

  @override
  String featuresScheduleRetention(int days, int count) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Last $days days', one: 'Last 1 day');
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'up to $count entries',
      one: 'up to 1 entry',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String featuresScheduleRetentionUnknown(int days) {
    String _temp0 = intl.Intl.pluralLogic(days, locale: localeName, other: 'Last $days days', one: 'Last 1 day');
    return '$_temp0, entry limit unavailable';
  }

  @override
  String featuresArtifactsDeliveredTurn(int turn) {
    return 'Turn $turn · Delivered';
  }

  @override
  String featuresArtifactsGeneratedTurn(int turn) {
    return 'Turn $turn · Generated';
  }

  @override
  String featuresPresetCreateRequest(String name, String id, String directory) {
    return 'Create agent preset “$name” ($id): Write these two files verbatim in the workspace, then use plugin_manager’s install_bundle to install the `$directory` directory. Do only this.\n\n';
  }

  @override
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory) {
    return 'Update agent preset “$name” ($id): Write these two files verbatim in the workspace. Use plugin_manager to remove bundle `$replacing`, then use install_bundle to install the `$directory` directory. Do only this.\n\n';
  }

  @override
  String featuresZoneThisPhone(String city) {
    return '$city · This phone';
  }

  @override
  String get featuresPermissionResetHint => 'The new-chat default is no longer valid';

  @override
  String get featuresPermissionResetDefault => 'Restore default';

  @override
  String get fileImageName => 'image';

  @override
  String get fileSharedText => 'Shared text.txt';

  @override
  String get fileChatFallback => 'chat';

  @override
  String get hubSessionDetails => 'Chat details';

  @override
  String get hubTerminal => 'Terminal';

  @override
  String get hubSessionNoTurns => 'No complete turns yet';

  @override
  String get hubSessionElapsed => 'Time';

  @override
  String get hubSessionSteps => 'Steps';

  @override
  String get hubSessionChangedFiles => 'Files changed';

  @override
  String get hubSessionTrajectoryHint => 'Steps and time for each turn appear here';

  @override
  String get hubSessionLoadEarlier => 'Load earlier turns';

  @override
  String get hubSessionError => 'Error';

  @override
  String get hubSessionInterrupted => 'Interrupted';

  @override
  String get hubSessionOutputLimit => 'Output limit reached';

  @override
  String get hubSessionNoChanges => 'No files changed yet';

  @override
  String get hubSessionShellChangesHint => 'Files changed with shell commands aren’t shown here';

  @override
  String get hubSessionChanges => 'Chat changes';

  @override
  String get hubSessionChangesNote => 'Only changes made with write and edit tools in loaded history are included';

  @override
  String get hubSessionNoGoal => 'No goal or to-dos yet';

  @override
  String get hubSessionGoalHint => 'AI lists to-dos for complex tasks. Follow their progress here';

  @override
  String get hubSessionGoal => 'Goal';

  @override
  String get hubSessionPlanMode => 'Plan mode';

  @override
  String get hubSessionPlanSwitching => 'Switching plan mode';

  @override
  String get hubSessionPlanHint => 'AI plans first, without changing files';

  @override
  String get hubSessionTodos => 'To-dos';

  @override
  String get hubSessionNotStarted => 'Not started';

  @override
  String get hubSessionTurnUsage => 'Usage by turn';

  @override
  String get hubSessionNoSubagents => 'No subagents sent';

  @override
  String get hubSessionDelegations => 'Delegation history';

  @override
  String get hubTabTrajectory => 'Trajectory';

  @override
  String get hubTabChanges => 'Changes';

  @override
  String get hubTabFiles => 'Files';

  @override
  String get hubTabProgress => 'Progress';

  @override
  String get hubTabContext => 'Context';

  @override
  String get hubTabSubagents => 'Subagents';

  @override
  String get hubPlugins => 'Plugins';

  @override
  String get hubSettingsFullAccessTitle => 'Turn on Full access?';

  @override
  String get hubSettingsFullAccessBody => 'AI won’t ask before running commands or changing files.';

  @override
  String get hubSettingsStorageTitle => 'Let AI access phone files?';

  @override
  String get hubSettingsStorageAllow => 'Allow access';

  @override
  String get hubSettingsStorageDenied =>
      'Storage access wasn’t granted. Allow “All files access” for DSH Go in system settings, then try again.';

  @override
  String get hubSettingsRestartRequired => 'Takes effect after restarting the engine';

  @override
  String get hubSettingsRestartNow => 'Restart now';

  @override
  String get hubSettingsInterface => 'Interface';

  @override
  String get hubSettingsChat => 'Chat';

  @override
  String get hubSettingsAutoCommands => 'Auto-run commands';

  @override
  String get hubSettingsPhoneFiles => 'Access phone files';

  @override
  String get hubSettingsPhoneFilesHint => 'AI can read and write phone storage';

  @override
  String get hubSettingsVisualReplies => 'Visual replies';

  @override
  String get hubSettingsVisualRepliesHint => 'Charts, comparisons and tappable options';

  @override
  String get hubSettingsPhoneControl => 'Phone control';

  @override
  String get hubSettingsPhoneControlHint => 'See your screen and tap for you';

  @override
  String get hubSettingsPreferences => 'Personal preferences';

  @override
  String get hubSettingsAppearance => 'Appearance';

  @override
  String get hubSettingsChatTextSize => 'Chat text size';

  @override
  String get hubSettingsCollapseSteps => 'Collapse steps when done';

  @override
  String get hubSettingsCollapseStepsHint => 'Fold thinking and tool calls into one line';

  @override
  String get hubSettingsWebPhoneLayout => 'Web phone layout';

  @override
  String get hubSettingsWebPhoneLayoutHint => 'Adapt DSH Web to phone screens';

  @override
  String get hubSettingsEngineExtensions => 'Engine and extensions';

  @override
  String get hubSettingsEngine => 'Local engine';

  @override
  String get hubSettingsProviders => 'Models';

  @override
  String get hubSettingsEngineSettings => 'Engine parameters';

  @override
  String get hubSettingsShareConfig => 'Share configuration';

  @override
  String get hubSettingsAllFeatures => 'All features';

  @override
  String get hubSettingsAbout => 'About';

  @override
  String get hubSettingsCommunity => 'Community';

  @override
  String get hubSettingsLicenses => 'Open-source licenses';

  @override
  String get hubSettingsAccount => 'DeepSeek account';

  @override
  String get hubSettingsSigningIn => 'Signing in…';

  @override
  String get hubSettingsInvalidKey => 'Invalid API key. Can’t check balance';

  @override
  String get hubSettingsNoApiKey => 'No API key set';

  @override
  String get hubSettingsApiKeyHint => 'Add an API key to start chatting';

  @override
  String get hubSettingsSignInAccount => 'Sign in to DeepSeek';

  @override
  String get hubSettingsOrApiKey => 'Or add an API key';

  @override
  String get hubPluginShare => 'Share plugin';

  @override
  String get hubPluginDetails => 'Plugin details';

  @override
  String get hubPluginFeatured => 'Featured on dshfind';

  @override
  String get hubPluginWebOnly => 'Web only';

  @override
  String get hubPluginStars => 'Stars';

  @override
  String get hubPluginSource => 'Source';

  @override
  String get hubPluginInstalledVersion => 'Installed version';

  @override
  String get hubPluginRequiresDsh => 'Requires DSH';

  @override
  String get hubPluginPackageName => 'Package name';

  @override
  String get hubPluginHomepage => 'Homepage';

  @override
  String get hubPluginRepository => 'Repository';

  @override
  String get hubPluginManageTitle => 'Manage plugin';

  @override
  String get hubPluginManage => 'Manage';

  @override
  String get hubPluginSafeModeInstall => 'Can’t install in Safe mode';

  @override
  String get hubPluginInstallCommand => 'Get install command';

  @override
  String get hubPluginInstallComputer => 'Install on computer';

  @override
  String get hubPluginInstalling => 'Installing…';

  @override
  String get hubPluginAllowBuilds => 'Allow scripts and retry';

  @override
  String get hubPluginRetryInstall => 'Retry install';

  @override
  String get hubPluginOfficial => 'Official DSH';

  @override
  String get hubPluginNotLoaded => 'Couldn’t load';

  @override
  String get hubPluginComponents => 'Components';

  @override
  String get hubPluginSafeModeRemove => 'Can’t uninstall in Safe mode';

  @override
  String get hubPluginRemoveCommand => 'Get uninstall command';

  @override
  String get hubPluginRemoveComputer => 'Uninstall on computer';

  @override
  String get hubPluginUninstall => 'Uninstall';

  @override
  String hubSessionTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count turns', one: '1 turn');
    return '$_temp0';
  }

  @override
  String hubSessionTurnsRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count turns · In progress',
      one: '1 turn · In progress',
    );
    return '$_temp0';
  }

  @override
  String hubSessionStepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count steps', one: '1 step');
    return '$_temp0';
  }

  @override
  String hubSessionWaitTime(String duration) {
    return 'Waited $duration for you';
  }

  @override
  String hubSessionTurn(int turn) {
    return 'Turn $turn';
  }

  @override
  String hubSessionFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Changed $count files',
      one: 'Changed 1 file',
    );
    return '$_temp0';
  }

  @override
  String hubSessionEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Edited $count times', one: 'Edited once');
    return '$_temp0';
  }

  @override
  String hubSessionTurnOf(int turn, int total) {
    return 'Turn $turn / $total';
  }

  @override
  String hubSessionCacheHit(String percent) {
    return '$percent cached';
  }

  @override
  String get hubSessionBlocked => 'Blocked';

  @override
  String hubSessionBlockedReason(String reason) {
    return 'Blocked: $reason';
  }

  @override
  String hubSessionTodoSemantics(String content, String status) {
    return '$content, $status';
  }

  @override
  String get hubSettingsStorageBody =>
      'AI can read and change your photos, downloads and documents. The engine restarts once.';

  @override
  String hubSettingsBalance(String amount) {
    return 'Balance $amount';
  }

  @override
  String hubSettingsBalanceLow(String amount) {
    return 'Balance $amount · Low balance';
  }

  @override
  String hubSettingsAccountSemantics(String title, String subtitle) {
    return 'Account: $title, $subtitle';
  }

  @override
  String hubSettingsHostSemantics(String name, String status) {
    return 'Remote host: $name, $status';
  }

  @override
  String get hubSettingsApiKey => 'DeepSeek API key';

  @override
  String hubPluginBrowserFailed(String address) {
    return 'Couldn’t open the browser. Visit $address manually';
  }

  @override
  String hubPluginYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String hubPluginUpdateTo(String version) {
    return 'Update to $version';
  }

  @override
  String hubPluginInstallOn(String host) {
    return 'Install on $host';
  }

  @override
  String hubPluginComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count components', one: '1 component');
    return '$_temp0';
  }

  @override
  String get hubPluginComponentSeparator => ', ';

  @override
  String get hubGroupAi => 'AI';

  @override
  String get hubGroupCapabilities => 'Capabilities';

  @override
  String get hubGroupGeneral => 'General';

  @override
  String get hubGroupHosts => 'Hosts';

  @override
  String get hubGroupHelp => 'Help and about';

  @override
  String get hubPersonalization => 'Personalization';

  @override
  String get hubPersonalizationAboutYou => 'About you';

  @override
  String get hubPersonalizationReplies => 'Replies';

  @override
  String get hubPersonalizationWorkStyle => 'Working style';

  @override
  String get hubPrivacy => 'Privacy and sharing';

  @override
  String get hubPrivacySharing => 'Sharing';

  @override
  String get hubInterfaceHome => 'Home';

  @override
  String get hubInterfaceWebHint => 'DSH\'s own web app';

  @override
  String get hubInterfaceOpenWeb => 'Open the web app';

  @override
  String get hubInterfacePhoneLayout => 'Phone layout';

  @override
  String get hubAbout => 'About DSH Go';

  @override
  String get hubAboutNewVersion => 'Update available';

  @override
  String get hubValueSet => 'Set';

  @override
  String get hubValueOff => 'Off';

  @override
  String get hubValueOneStep => 'One step left';

  @override
  String get hubValueAllowed => 'Allowed';

  @override
  String get hubValueNeedsSetup => 'Set up';

  @override
  String hubValueHosts(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count hosts', one: '1 host');
    return '$_temp0';
  }

  @override
  String get hubValueNoHosts => 'None';

  @override
  String hubValuePlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String get hubEngineStartup => 'Startup';

  @override
  String get hubThemeLightDark => 'Light and dark';

  @override
  String get hubPermissionPhone => 'Phone';

  @override
  String get hubPermissionPhoneConfirm => 'Phone control confirmation';

  @override
  String get launchScreenTitle => 'Launch screen';

  @override
  String get launchDefault => 'Default';

  @override
  String get launchCustom => 'Custom';

  @override
  String get launchFit => 'Fit';

  @override
  String get launchFitFill => 'Fill';

  @override
  String get launchFitCenter => 'Center';

  @override
  String get launchBackground => 'Background';

  @override
  String get launchBackdropAuto => 'Auto';

  @override
  String get launchBackdropEdge => 'From picture';

  @override
  String get launchBackdropWhite => 'White';

  @override
  String get launchBackdropBlack => 'Black';

  @override
  String get launchReplace => 'Replace picture or video';

  @override
  String get launchPreview => 'Preview';

  @override
  String get launchFooter =>
      'Pictures and animations up to 8 MB, videos up to 30 MB. Plays through once on a cold start; tap to skip.';

  @override
  String get launchChanged => 'Launch screen changed';

  @override
  String launchChangedSize(String size) {
    return 'Launch screen changed · $size';
  }

  @override
  String get launchTooLarge => 'The picture is over 8 MB';

  @override
  String get launchOverLimit => 'The file is over 30 MB';

  @override
  String get launchUnsupported => 'Use a PNG, JPEG, WebP, GIF or MP4';

  @override
  String get launchUnreadable => 'Couldn’t read this file';

  @override
  String get launchUnavailable => 'Couldn’t open your photos';

  @override
  String get launchBroken => 'Can’t be read';

  @override
  String get iconShortcutRow => 'Picture shortcut';

  @override
  String get iconShortcutRowSubtitle => 'Your own picture on the home screen';

  @override
  String get iconShortcutPick => 'Choose a picture';

  @override
  String get iconShortcutChange => 'Another picture';

  @override
  String get iconShortcutHint => 'Drag or pinch to fit';

  @override
  String get iconShortcutName => 'Name';

  @override
  String get iconShortcutAdd => 'Add to home screen';

  @override
  String get iconShortcutNote =>
      'Android doesn’t let an app use any picture as its icon, so this adds a separate shortcut that opens DSH Go. Some home screens put a small badge on its corner.';

  @override
  String get iconShortcutAdded => 'Added to your home screen';

  @override
  String get iconShortcutConfirm => 'Confirm in the dialog that appears';

  @override
  String get iconShortcutNoDialog => 'No dialog? Allow DSH Go to create home screen shortcuts in system settings.';

  @override
  String get iconShortcutSettings => 'Settings';

  @override
  String get iconShortcutUnsupported => 'This home screen doesn’t take shortcuts';

  @override
  String get iconShortcutFailed => 'Couldn’t add it. Try again later.';

  @override
  String get searchKwLaunchScreen => 'splash,startup,launch animation,opening screen';

  @override
  String get searchKwIconShortcut => 'shortcut,custom icon,home screen picture';

  @override
  String get localeTitle => 'Language';

  @override
  String get localeSystem => 'System';

  @override
  String get localeZh => '简体中文';

  @override
  String get localeEn => 'English';

  @override
  String get localEnvChooseTitle => 'Where should DSH run?';

  @override
  String get localEnvChooseMessage => 'You can change this later in Settings';

  @override
  String localEnvThisPhoneDetail(int storage, int memory) {
    return '$storage MB storage · $memory MB memory';
  }

  @override
  String localEnvThisPhoneDetailShort(int memory) {
    return '$memory MB memory while running';
  }

  @override
  String localEnvLowStorage(int needed) {
    return 'Needs about $needed MB free';
  }

  @override
  String get localEnvRemoteDetail => 'Use DSH on your computer or server';

  @override
  String get localEnvRecommended => 'Recommended';

  @override
  String get localEnvInstallTitle => 'Install on this phone';

  @override
  String get localEnvInstallMessage => 'Run DSH right on this phone';

  @override
  String localEnvFactStorage(int storage) {
    return 'About $storage MB of storage';
  }

  @override
  String localEnvFactMemory(int memory) {
    return 'About $memory MB of memory while running';
  }

  @override
  String get localEnvUseRemote => 'Use a remote host instead';

  @override
  String get localEnvNotInstalled => 'Not installed on this phone';

  @override
  String get localEnvUninstall => 'Uninstall runtime';

  @override
  String get localEnvUninstallHint => 'Free up storage';

  @override
  String get localEnvUninstallTitle => 'Uninstall the runtime?';

  @override
  String get localEnvUninstallBody =>
      'Chats, workspaces, plugins, settings, interface settings and skills on this phone will be deleted.';

  @override
  String get localEnvUninstallConfirm => 'Uninstall';

  @override
  String get localEnvUninstallFailed => 'Couldn’t uninstall. Try again.';

  @override
  String get localEnvPhoneNeedsRuntime => 'Available after installing on this phone';

  @override
  String get localEnvSignInNeedsRuntime => 'Needs DSH on this phone';

  @override
  String get localEnvSignInInstallFirst => 'Install it to sign in';

  @override
  String get mediaGenerateTile => 'Create';

  @override
  String get mediaAiGenerated => 'AI-generated';

  @override
  String mediaCostEstimate(String amount) {
    return 'About $amount';
  }

  @override
  String mediaSavedCount(int count) {
    return 'Saved $count to Photos';
  }

  @override
  String get mediaRegenerate => 'Regenerate';

  @override
  String get mediaCopyPrompt => 'Copy prompt';

  @override
  String get mediaFileGone => 'File is gone';

  @override
  String get mediaKindImage => 'Image';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaTitleImage => 'New image';

  @override
  String get mediaTitleVideo => 'New video';

  @override
  String get mediaOpenElsewhere => 'Open in another app';

  @override
  String get mediaShowInFiles => 'Show in files';

  @override
  String get mediaGenerating => 'Generating';

  @override
  String mediaGeneratingProgress(String progress) {
    return 'Generating · $progress';
  }

  @override
  String get mediaCancelled => 'Cancelled';

  @override
  String get mediaNotGenerated => 'Not created';

  @override
  String mediaPartial(int done, int total) {
    return '$done of $total';
  }

  @override
  String mediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count images', one: '1 image');
    return '$_temp0';
  }

  @override
  String mediaSeconds(int seconds) {
    return '$seconds s';
  }

  @override
  String mediaImageOf(int index, int count) {
    return 'Image $index of $count';
  }

  @override
  String mediaPageOf(int index, int count) {
    return '$index / $count';
  }

  @override
  String get mediaErrorPolicyInput => 'The description didn\'t pass content review';

  @override
  String get mediaErrorPolicyOutput => 'The result didn\'t pass content review';

  @override
  String get mediaErrorAuth => 'Service not authorized';

  @override
  String get mediaErrorBalance => 'Insufficient balance';

  @override
  String get mediaErrorQuota => 'Today\'s limit is used up';

  @override
  String get mediaErrorUnavailable => 'Service unavailable for now';

  @override
  String get mediaErrorExpired => 'The result expired';

  @override
  String get mediaErrorGeneric => 'Couldn\'t create it';

  @override
  String get mediaVary => 'Vary';

  @override
  String get mediaEdit => 'Edit';

  @override
  String get mediaRevise => 'Revise';

  @override
  String get mediaUpscale => 'Upscale';

  @override
  String get mediaMakeVideo => 'Make a video';

  @override
  String get mediaDetailModel => 'Model';

  @override
  String get mediaDetailSize => 'Size';

  @override
  String get mediaDetailCost => 'Cost';

  @override
  String get mediaDetailProvenance => 'Provenance';

  @override
  String get mediaDetailFile => 'File';

  @override
  String mediaOriginalPrompt(String text) {
    return 'Original: $text';
  }

  @override
  String get mediaProvenanceC2pa => 'C2PA';

  @override
  String get mediaProvenanceImplicit => 'Embedded';

  @override
  String get mediaProvenanceVisible => 'Visible mark';

  @override
  String get mediaModeExit => 'Leave create mode';

  @override
  String mediaModeLabel(String summary) {
    return 'Create settings: $summary';
  }

  @override
  String get mediaParamModel => 'Model';

  @override
  String get mediaParamAspect => 'Aspect';

  @override
  String get mediaParamCount => 'Number';

  @override
  String get mediaParamQuality => 'Quality';

  @override
  String get mediaParamDuration => 'Length';

  @override
  String get mediaQualityAuto => 'Auto';

  @override
  String get mediaQualityStandard => 'Standard';

  @override
  String get mediaQualityHigh => 'HD';

  @override
  String get mediaQuality4k => '4K';

  @override
  String get mediaQualityLevelLow => 'Low';

  @override
  String get mediaQualityLevelMedium => 'Medium';

  @override
  String get mediaQualityLevelHigh => 'High';

  @override
  String get mediaModelPick => 'Choose';

  @override
  String get mediaPickModelFirst => 'Choose a model first';

  @override
  String mediaPricePerImage(String price) {
    return '$price / image';
  }

  @override
  String mediaPricePerSecond(String price) {
    return '$price / s';
  }

  @override
  String get mediaManageModels => 'Manage';

  @override
  String get mediaHintImage => 'Describe the picture…';

  @override
  String get mediaHintVideo => 'Describe the scene and the shot…';

  @override
  String get mediaHintEdit => 'How should it change…';

  @override
  String get mediaFirstFrame => 'First';

  @override
  String get mediaLastFrame => 'Last';

  @override
  String get mediaNoLastFrame => 'This model takes no last frame';

  @override
  String get mediaNoRefs => 'This model takes no reference images';

  @override
  String mediaRefLimit(int count) {
    return 'Up to $count reference images';
  }

  @override
  String get mediaNoDescription => 'Describe it first';

  @override
  String get mediaDescriptionTooLong => 'Too long to generate. Shorten the description';

  @override
  String get mediaInstallTitle => 'Images and video';

  @override
  String get mediaInstallBody => 'This host has no image and video plugin yet';

  @override
  String get mediaInstallAction => 'Install on this host';

  @override
  String get mediaUnavailableTitle => 'Generation mode unavailable';

  @override
  String get mediaUnavailableBody =>
      'The image and video plugin on this host isn\'t compatible. You can still describe what you want in chat.';

  @override
  String get mediaUnavailableAction => 'Manage plugins';

  @override
  String get mediaSettingsTitle => 'Images and video';

  @override
  String get searchKwMediaGeneration =>
      'image generation,text to image,video generation,AI art,generate images,generate video';

  @override
  String get nearbyThisChat => 'This chat';

  @override
  String get nearbyPermissionTitle => 'Permissions for this chat';

  @override
  String nearbyNewChatDefault(String name) {
    return 'New chats: $name';
  }

  @override
  String get nearbySetAsDefault => 'Use for new chats';

  @override
  String get nearbyManageModels => 'Manage models';

  @override
  String nearbyPermissionPill(String name) {
    return 'Permissions for this chat: $name';
  }

  @override
  String get nearbyChange => 'Change';

  @override
  String get performanceTitle => 'Performance';

  @override
  String get performanceAuto => 'Auto';

  @override
  String get performanceFull => 'Full';

  @override
  String get performanceLight => 'Light';

  @override
  String get performanceAutoHint => 'Adjust default effects for this device';

  @override
  String get performanceFullHint => 'Keep blur and animation';

  @override
  String get performanceLightHint => 'Reduce ongoing effects and resource use';

  @override
  String get performanceChoiceHint => 'Your pet and engine choices take priority';

  @override
  String get performanceCooling => 'Reducing effects until the device cools';

  @override
  String get performanceEffects => 'Interface effects';

  @override
  String get performanceBlur => 'Glass blur';

  @override
  String get performanceAnimations => 'Interface animation';

  @override
  String get performanceSystemMotion => 'Also follows the system\'s remove animations setting';

  @override
  String get performanceFollowMode => 'Follow the performance mode';

  @override
  String get performanceRemoteHint => 'Connect to a computer or server to reduce work on this phone';

  @override
  String get phoneDiagnosticsCollecting => 'Collecting…';

  @override
  String get phoneDiagnosticsPacking => 'Packing…';

  @override
  String get phoneDiagnosticsSharing => 'Opening share sheet…';

  @override
  String get phoneDiagnosticsSaving => 'Saving to Downloads…';

  @override
  String get phoneDiagnosticsShare => 'Share diagnostics bundle';

  @override
  String get phoneDiagnosticsShareHint => 'Attach to a bug report';

  @override
  String get phoneDiagnosticsSave => 'Save to Downloads';

  @override
  String get phoneDiagnosticsSaveHint => 'Save in Downloads/DSH-Go';

  @override
  String get phoneDiagnosticsNote =>
      'Includes versions, device info, logs and the latest crash. No API keys or tokens.';

  @override
  String get phoneDiagnosticsExport => 'Export diagnostics bundle';

  @override
  String get phoneSafeMode => 'Safe mode';

  @override
  String get phoneEngineStartingSafeEllipsis => 'Starting in Safe mode…';

  @override
  String get phoneEngineStartingEllipsis => 'Starting…';

  @override
  String get phoneEngineTidyingFilesEllipsis => 'Tidying plugin files…';

  @override
  String get phoneEngineStoppingEllipsis => 'Stopping…';

  @override
  String get phoneEngineStoppedNextSafe => 'Stopped · Next start in Safe mode';

  @override
  String get phoneEngineInstallingRuntime => 'Installing runtime…';

  @override
  String get phoneEngineRuntimeNotInstalled => 'Runtime not installed';

  @override
  String get phoneEngineErrorSeeLogs => 'Engine error. See logs for details.';

  @override
  String get phoneEngineTitle => 'Local engine';

  @override
  String get phoneEngineLocal => 'This phone’s engine';

  @override
  String get phoneEngineLogs => 'Logs';

  @override
  String get phoneEngineAutoStart => 'Start when DSH Go opens';

  @override
  String get phoneEngineKeepAlive => 'Background running';

  @override
  String get phoneEngineKeepAliveHint => 'Prevent Android from stopping the engine';

  @override
  String get phoneEngineDiagnostics => 'Diagnostics';

  @override
  String get phoneEngineDiagnosticsHint => 'Runtime info and bug reports';

  @override
  String get phoneEngineRuntime => 'Runtime';

  @override
  String get phoneEngineArchitecture => 'Architecture';

  @override
  String get phoneEngineStopTitle => 'Stop the engine?';

  @override
  String get phoneEngineStopBody => 'Active chats will be interrupted. You can start it again anytime.';

  @override
  String get phoneEngineInstallRuntime => 'Install runtime';

  @override
  String get phoneEngineStartAgain => 'Start again';

  @override
  String get phoneEngineStart => 'Start';

  @override
  String get phoneEngineRestart => 'Restart';

  @override
  String get phoneEngineResetFailed => 'Couldn’t reset';

  @override
  String get phoneEngineReset => 'Reset runtime';

  @override
  String get phoneEngineResetHint => 'Delete chats and files, then extract again';

  @override
  String get phoneEngineResetTitle => 'Reset the runtime?';

  @override
  String get phoneEngineKeepUiSkills => 'Keep interface settings and skills';

  @override
  String get phoneEngineKeepPluginsSettings => 'Keep installed plugins and settings';

  @override
  String get phoneEngineDeleteReset => 'Delete and reset';

  @override
  String get phoneEngineNotInstalled => 'Not installed';

  @override
  String get phoneEngineInstalling => 'Installing';

  @override
  String get phoneEngineStoppedSafe => 'Stopped · Safe mode';

  @override
  String get phoneEngineStartingSafe => 'Starting in Safe mode';

  @override
  String get phoneEngineStarting => 'Starting';

  @override
  String get phoneEngineTidyingFiles => 'Tidying plugin files';

  @override
  String get phoneEngineRunningProbation => 'Running · Trial';

  @override
  String get phoneEngineStartupFailed => 'Couldn’t start';

  @override
  String get phoneEngineCrashed => 'Crashed';

  @override
  String get phoneEngineKilled => 'Stopped by Android';

  @override
  String get phoneEngineError => 'Something went wrong';

  @override
  String get phoneEngineRuntimeCorrupt => 'The bundled runtime is damaged. Reinstall DSH.';

  @override
  String get phoneEngineExited => 'The engine quit unexpectedly';

  @override
  String get phoneEngineRuntimeMissing => 'The runtime isn’t installed yet';

  @override
  String get phoneEngineSafeUnsupported => 'This runtime doesn’t support Safe mode. Update DSH.';

  @override
  String get phoneEngineRuntimeIncomplete => 'The bundled runtime is incomplete. Reinstall DSH.';

  @override
  String get phoneLogEmpty => 'No logs yet';

  @override
  String get phoneLogShareTitle => 'DSH engine logs';

  @override
  String get phoneLogCopyAll => 'Copy all';

  @override
  String get phoneBackgroundAllow => 'Allow access';

  @override
  String get phoneToolScreen => 'Read screen';

  @override
  String get phoneToolCollect => 'Scroll and collect';

  @override
  String get phoneToolTap => 'Tap';

  @override
  String get phoneToolType => 'Type';

  @override
  String get phoneToolScroll => 'Swipe';

  @override
  String get phoneToolKey => 'Press key';

  @override
  String get phoneToolTapCoordinates => 'Tap coordinates';

  @override
  String get phoneToolHandoff => 'Hand back to you';

  @override
  String get phoneToolOpenApp => 'Open app';

  @override
  String get phoneToolListApps => 'View apps';

  @override
  String get phoneToolIntent => 'System action';

  @override
  String get phoneToolNotify => 'Send notification';

  @override
  String get phoneToolClipboard => 'Clipboard';

  @override
  String get phoneToolAction => 'Action';

  @override
  String get phoneDecisionContinued => 'You continued';

  @override
  String get phoneDecisionDone => 'Executed';

  @override
  String get phoneDecisionAllowed => 'You allowed it';

  @override
  String get phoneDecisionPauseExpired => 'Paused too long';

  @override
  String get phoneDecisionBlocked => 'Blocked';

  @override
  String get phoneDecisionTimeout => 'Timed out';

  @override
  String get phoneDecisionUnavailable => 'Unavailable';

  @override
  String get phoneDecisionScreenChanged => 'Screen changed';

  @override
  String get phoneDecisionFailed => 'Didn’t work';

  @override
  String get phoneActionLogTitle => 'Action log';

  @override
  String get phoneActionLogSubtitle => 'Records actions, never screen contents';

  @override
  String get phoneActionLogRefresh => 'Refresh';

  @override
  String get phoneActionLogEmpty => 'No actions yet';

  @override
  String get phoneActionLogEmptyHint => 'Every step DSH takes on your phone appears here';

  @override
  String get phoneAppRuleDeny => 'Hands off';

  @override
  String get phoneAppRuleConfirm => 'Every step';

  @override
  String get phoneAppRuleNormal => 'As usual';

  @override
  String get phoneAppRuleDenyHint => 'No reading or tapping. Default for banking and payment apps.';

  @override
  String get phoneAppRuleConfirmHint => 'Can read. Asks before tapping or typing.';

  @override
  String get phoneAppRuleNormalHint => 'Asks only before sensitive actions, like sending';

  @override
  String get phoneAppRulesTitle => 'App rules';

  @override
  String get phoneAppRulesSubtitle => 'Unlisted apps work as usual. Sensitive actions still need approval.';

  @override
  String get phoneAppRulesUnavailable => 'Can’t read app rules';

  @override
  String get phoneTryLater => 'Try again later';

  @override
  String get phoneAppRulesChanged => 'As usual · Changed by you';

  @override
  String get phoneAppRulesAdd => 'Add app';

  @override
  String get phoneAppRulesAddHint => 'Add by package name';

  @override
  String get phoneSensitiveActionsNote => 'Passwords, verification codes, payments and system settings are up to you';

  @override
  String get phoneAppRulesSaveFailed => 'Couldn’t save. Try again later.';

  @override
  String get phoneAppRulesAcceptRisk => 'Change anyway';

  @override
  String get phoneAppRulesPackage => 'Package name';

  @override
  String get phoneAppRulesPackageHint => 'Find it in Settings → Apps → App info';

  @override
  String get phoneDndRequiresAndroid => 'Requires Android 14 or later';

  @override
  String get phoneDndHiddenScreen => 'Works on a hidden screen';

  @override
  String get phoneDndShizukuReady => 'Shizuku · Ready';

  @override
  String get phoneNotReadyYet => 'Not ready yet';

  @override
  String get phoneDndAdbReady => 'Direct ADB · Ready';

  @override
  String get phoneActionFailedLater => 'Couldn’t complete. Try again later.';

  @override
  String get phoneDndDisabled => 'Non-disruptive mode is off';

  @override
  String get phoneDndEnabled => 'Non-disruptive mode is on';

  @override
  String get phoneDndShizukuPermissionFailed =>
      'Permission not granted. Allow DSH Go in Shizuku’s “Application management”.';

  @override
  String get phoneDndPairedConnect => 'Paired. Tap “Connect”.';

  @override
  String get phoneDndTitle => 'Non-disruptive mode';

  @override
  String get phoneDndSubtitle => 'Works on a hidden screen while you use your phone';

  @override
  String get phoneDndUnsupported => 'This phone needs Android 14 or later to use this feature.';

  @override
  String get phoneDndRequirements => 'Requirements';

  @override
  String get phoneDndKeepUnlocked => 'Keep the screen on and unlocked.';

  @override
  String get phoneDndReactivate => 'Reactivate after restarting your phone.';

  @override
  String get phoneDndKeepDebugging => 'Stay on Wi-Fi with Developer options and Wireless debugging on.';

  @override
  String get phoneDndUsingShizuku => 'Using Shizuku';

  @override
  String get phoneDndUsingAdb => 'Using Direct ADB';

  @override
  String get phoneReady => 'Ready';

  @override
  String get phoneDndUseShizuku => 'Use Shizuku';

  @override
  String get phoneDndDirectAdb => 'Direct ADB';

  @override
  String get phoneDndInstallShizuku =>
      'Install Shizuku first (free and open source). If you use tools like Ice Box or Brevent, you may already have it.';

  @override
  String get phoneDndOpenShizukuSite => 'Open Shizuku website';

  @override
  String get phoneDndStartShizuku =>
      'Open Shizuku and follow “Start via Wireless debugging” (requires Wi-Fi). This page refreshes when you return.';

  @override
  String get phoneDndGrantShizukuHint => 'Shizuku is running. Allow DSH Go to use it next.';

  @override
  String get phoneDndGrantShizuku => 'Allow DSH Go';

  @override
  String get phoneDndShizukuAllSet => 'Shizuku is ready.';

  @override
  String get phoneDndShizukuInstalled => 'Shizuku installed';

  @override
  String get phoneDndShizukuRunning => 'Shizuku running';

  @override
  String get phoneDndShizukuGranted => 'DSH Go allowed';

  @override
  String get phoneDndShizukuCompatibility =>
      'This Android version has compatibility issues with the official Shizuku release.';

  @override
  String get phoneDndWirelessDebuggingOn => 'Wireless debugging on';

  @override
  String get phoneDndPaired => 'Paired';

  @override
  String get phoneDndConnected => 'Connected';

  @override
  String get phoneDndPairOnce => 'Pair once (no extra app)';

  @override
  String get phoneDndDeveloperOptionsStep =>
      'Turn on Developer options: tap “Build number” 7 times in “About phone”. On Xiaomi, tap “OS version” in “My device → Detailed info and specs”; on vivo, tap “Software version”.';

  @override
  String get phoneDndWirelessDebuggingStep =>
      'Turn on “Wireless debugging” in Developer options while connected to Wi-Fi. Developer options is usually in “System” or “Additional settings”.';

  @override
  String get phoneDndStartPairingStep => 'Return here and tap “Start pairing”. DSH sends a notification.';

  @override
  String get phoneDndGetPairingCodeStep =>
      'In “Wireless debugging”, tap “Pair device with pairing code” to see a 6-digit code.';

  @override
  String get phoneDndEnterPairingCodeStep =>
      'Pull down notifications and enter the code in DSH’s notification. Once paired, tap “Connect”.';

  @override
  String get phoneDndStartPairing => 'Start pairing';

  @override
  String get phoneDndPairingNotificationSent => 'Notification sent. Get the code in “Wireless debugging”.';

  @override
  String get phoneDndManualEntry => 'Enter manually';

  @override
  String get phoneDndConnect => 'Connect';

  @override
  String get phoneDndManualEntryHint => 'No input field in the notification? Use “Enter manually”.';

  @override
  String get phoneDndXiaomiUsbHint =>
      'Turning on “USB debugging (Security settings)” requires a SIM card and a Xiaomi account.';

  @override
  String get phoneDndEnable => 'Enable non-disruptive mode';

  @override
  String get phoneDndEnterCodeTitle => 'Enter pairing code';

  @override
  String get phoneDndCodeLabel => '6-digit pairing code';

  @override
  String get phoneDndPortLabel => 'Port (optional)';

  @override
  String get phoneDndPortHint => 'The number after the colon in “IP address & port” below the pairing code';

  @override
  String get phoneDndPair => 'Pair';

  @override
  String get phoneConfirmAsk => 'Always ask';

  @override
  String get phoneConfirmTask => 'This task';

  @override
  String get phoneConfirmAlways => 'Always skip';

  @override
  String get phoneConfirmAskHint => 'Asks before entering a new app, sending, deleting or paying';

  @override
  String get phoneConfirmTaskHint => 'Asks once per task';

  @override
  String get phoneConfirmAlwaysHint => 'Acts without asking';

  @override
  String get phoneConfirmTitle => 'Confirmation';

  @override
  String get phoneConfirmAlwaysTitle => 'Always skip confirmation?';

  @override
  String get phoneConfirmAlwaysBody => 'Opening apps, tapping, sending and deleting will happen without asking you.';

  @override
  String get phoneConfirmSaveFailed => 'Couldn’t change. Try again later.';

  @override
  String get phoneEnableFailed => 'Couldn’t turn on. Try again later.';

  @override
  String get phoneDisableFailed => 'Couldn’t turn off. Try again later.';

  @override
  String get phoneEnabled => 'On';

  @override
  String get phoneDisabled => 'Off';

  @override
  String get phoneOpenAccessibilityFailed => 'Can’t open settings. Find DSH in Settings → Accessibility.';

  @override
  String get phoneOpenAppInfoFailed => 'Can’t open app info. Find DSH Go in Settings → Apps.';

  @override
  String get phoneStopFailed => 'Couldn’t stop. Tap “Stop” on the floating bar or notification.';

  @override
  String get phoneControlTitle => 'Phone control';

  @override
  String get phoneControlSubtitle => 'Reads the screen and taps for you. Stop anytime.';

  @override
  String get phoneControlWorking => 'Operating your phone';

  @override
  String get phoneControlTaskNoConfirmHint =>
      'Confirmation skipped for this task · Pause or stop from the floating bar';

  @override
  String get phoneControlFloatingBarHint => 'Pause or stop from the floating bar';

  @override
  String get phoneControlAdvanced => 'Advanced';

  @override
  String get phoneControlKeepAliveHint => 'Prevent Android from turning off accessibility';

  @override
  String get phoneControlReadingEllipsis => 'Reading…';

  @override
  String get phoneControlNotReady => 'Not ready';

  @override
  String get phoneControlNotEnabled => 'Off';

  @override
  String get phoneControlSafeModeNotLoaded => 'Not loaded in Safe mode';

  @override
  String get phoneControlLocalOnly => 'Only available with this phone’s engine';

  @override
  String get phoneControlAfterEngineStarts => 'Takes effect when the engine starts';

  @override
  String get phoneControlNeedsAccessibility => 'One step left: turn on accessibility';

  @override
  String get phoneControlReady => 'Ready to control your phone';

  @override
  String get phoneControlSetup => 'Setup';

  @override
  String get phoneControlAccessibilityService => 'Accessibility service';

  @override
  String get phoneControlAccessibilityReady => 'Ready to read the screen and tap';

  @override
  String get phoneControlAccessibilityReconnect => 'Service disconnected. Turn it off and on again.';

  @override
  String get phoneControlAccessibilityHint => 'Needed to read the screen and tap';

  @override
  String get phoneControlGoSettings => 'Open settings';

  @override
  String get phoneControlGoEnable => 'Turn on';

  @override
  String get phoneControlAccessibilityBlocked => 'Accessibility switch disabled?';

  @override
  String get phoneControlRestrictedAfterAttempt =>
      'Looks like it didn’t turn on. Sideloaded apps need “Allow restricted settings” first.';

  @override
  String get phoneControlRestrictedHint => 'Sideloaded apps need “Allow restricted settings” first';

  @override
  String get phoneControlNotifications => 'Notifications';

  @override
  String get phoneControlNotificationsPairingHint => 'Used for approvals, stopping and pairing codes';

  @override
  String get phoneControlNotificationsHint => 'Needed for approvals and the “Stop” button';

  @override
  String get phoneControlAllowed => 'Allowed';

  @override
  String get phoneControlTry => 'Try it';

  @override
  String get phoneControlReadScreen => 'Read current screen';

  @override
  String get phoneControlReadScreenHint => 'See what DSH reads, without sending it to the model';

  @override
  String get phoneControlEnableAccessibilityFirst => 'Turn on the accessibility service first';

  @override
  String get phoneControlLoading => 'Loading';

  @override
  String get phoneControlRules => 'Rules';

  @override
  String get phoneControlRecentActions => 'Recent actions';

  @override
  String get phoneControlRecentActionsHint => 'Every step is logged, without screen contents';

  @override
  String get phoneControlAllActions => 'All actions';

  @override
  String get phoneControlModuleNotReady => 'Phone control isn’t ready in this version';

  @override
  String get phoneControlSafeModeUnavailable => 'Unavailable in Safe mode';

  @override
  String get phoneControlSafeModeHint => 'Safe mode skips plugins. Switch to normal mode to use this.';

  @override
  String get phoneControlRemoteHost => 'Connected to a remote host';

  @override
  String get phoneControlCapabilities => 'What you can do';

  @override
  String get phoneControlIntents => 'Alarms, events, maps, sharing';

  @override
  String get phoneControlNoExtraPermissions => 'No extra permissions needed';

  @override
  String get phoneControlReadToTable => 'Read the screen into tables or tasks';

  @override
  String get phoneControlNeedsAccessibilityHint => 'Requires accessibility';

  @override
  String get phoneControlTapType => 'Tap and type for you';

  @override
  String get phoneControlSensitiveHint => 'Sending and purchases normally require approval; settings can relax these protections.';

  @override
  String get phoneDisclosureWhatTitle => 'What it reads';

  @override
  String get phoneDisclosureWhatBody =>
      'Text on the current screen. With a vision model, a screenshot may be included.';

  @override
  String get phoneDisclosureWhenTitle => 'When it reads';

  @override
  String get phoneDisclosureWhenBody => 'Only when you start a task or tap “Read current screen”. Never otherwise.';

  @override
  String get phoneDisclosureWhoTitle => 'Who receives it';

  @override
  String get phoneDisclosureWhoBody => 'Task-related screen data may be sent to your configured third-party model provider. Some card and ID numbers are masked where detected, but detection is not complete; screenshots may expose sensitive content.';

  @override
  String get phoneDisclosureNeverTitle => 'What it won’t do by default';

  @override
  String get phoneDisclosureNeverBody => 'Passwords, verification codes, and system settings are restricted by default; banking and payment apps are excluded by default. You can explicitly lift these limits in Settings.';

  @override
  String get phoneDisclosureStopTitle => 'Stop anytime';

  @override
  String get phoneDisclosureStopBody =>
      'A floating bar lets you pause, stop or steer. Keep the screen on and unlocked.';

  @override
  String get phoneDisclosureTitle => 'Before turning on Phone control';

  @override
  String get phoneDisclosureIntro => 'Phone control can read the screen, tap, and type. Use it only on a device you own or are authorized to control. Read this first:';

  @override
  String get phoneDisclosureRestartNote => 'The engine will restart, interrupting any reply in progress';

  @override
  String get phoneDisclosureNotNow => 'Not now';

  @override
  String get phoneDisclosureAgreeEnable => 'Agree and enable';

  @override
  String get phoneCheckUnknown => 'Not sure';

  @override
  String get phoneCheckYes => 'Yes';

  @override
  String get phoneCheckNotYet => 'Not yet';

  @override
  String get phoneRomStock => 'Stock / Other';

  @override
  String get phoneRestrictedAccessibility => 'Accessibility';

  @override
  String get phoneRestrictedOpenAccessibility => 'Turn on accessibility';

  @override
  String get phoneRestrictedOverlay => 'Floating window';

  @override
  String get phoneRestrictedOpenOverlay => 'Turn on floating window';

  @override
  String get phoneRestrictedTryAccessibility =>
      'First try turning on DSH in “Accessibility”. When “Restricted setting” appears, tap “OK”. The option below appears only after this step.';

  @override
  String get phoneRestrictedOpenInfoStep => 'Return here and tap “Open app info”.';

  @override
  String get phoneRestrictedBackAccessibility => 'Return to “Accessibility” and turn on DSH.';

  @override
  String get phoneRestrictedMenuStep =>
      'Tap the three dots at the top right, choose “Allow restricted settings”, then verify your lock screen password.';

  @override
  String get phoneRestrictedTryOverlay =>
      'First try turning on DSH Go in floating window settings. When “Restricted setting” appears, tap “OK”. The option below appears only after this step.';

  @override
  String get phoneRestrictedBackOverlay => 'Return to floating window settings and turn on DSH Go.';

  @override
  String get phoneRestrictedHuaweiOverlay =>
      'HarmonyOS 4 and earlier usually skip this step. Turn on DSH Go directly in floating window settings.';

  @override
  String get phoneRestrictedHuaweiAccessibility =>
      'HarmonyOS 4 and earlier usually skip this step. Turn on DSH directly in “Accessibility”.';

  @override
  String get phoneRestrictedVivoNote =>
      'The location varies by OriginOS version. If there are no three dots, scroll to the bottom of App info.';

  @override
  String get phoneRestrictedAdvancedStep => 'In “Advanced settings”, find “Allow restricted settings” and turn it on.';

  @override
  String get phoneRestrictedOppoNote =>
      'ColorOS may hide this option. Use the built-in Files app to find DSH’s installer and install over the existing app (no need to uninstall; chats and settings stay). Then turn on accessibility.';

  @override
  String get phoneRestrictedHuaweiNote =>
      'If “Restricted setting” appears in Accessibility, follow the “Stock / Other” steps.';

  @override
  String get phoneRestrictedTitle => 'Allow restricted settings';

  @override
  String get phoneRestrictedSteps => 'Steps';

  @override
  String get phoneRestrictedDiagram => 'Illustration';

  @override
  String get phoneRestrictedOpenInfo => 'Open app info';

  @override
  String get phoneRestrictedOpenOverlayFailed =>
      'Can’t open floating window settings. Search for “Floating window” in Settings.';

  @override
  String get phoneRestrictedOpenAccessibilityFailed =>
      'Can’t open accessibility settings. Search for “Accessibility” in Settings.';

  @override
  String get phoneRestrictedFootnote =>
      'Names vary by system. Search Settings for “Restricted” if needed. If it still won’t open, restart your phone and try again.';

  @override
  String get phoneRestrictedAppInfo => 'App info';

  @override
  String get phoneRestrictedPermissionsManager => 'Permission manager';

  @override
  String get phoneRestrictedBatterySaver => 'Battery saver';

  @override
  String get phoneRestrictedAdvanced => 'Advanced settings';

  @override
  String get phoneRestrictedPermissions => 'Permissions';

  @override
  String get phoneRestrictedBattery => 'Battery';

  @override
  String get phoneRestrictedDiagramAdvanced =>
      'Illustration: In App info, tap “Advanced settings”, then turn on “Allow restricted settings”.';

  @override
  String get phoneRestrictedDiagramMenu =>
      'Illustration: In App info, tap the three dots at the top right, then choose “Allow restricted settings”.';

  @override
  String get phoneRestrictedCaptionAdvanced => '① Tap “Advanced settings”';

  @override
  String get phoneRestrictedCaptionMenu => '① Tap the three dots';

  @override
  String get phoneRestrictedCaptionToggle => '② Turn on this switch';

  @override
  String get phoneRestrictedCaptionOption => '② Choose this option';

  @override
  String get phoneScreenReadFailed => 'Couldn’t read the screen';

  @override
  String get phoneScreenUnknownReason => 'Unknown reason';

  @override
  String get phoneScreenReadFailedHint =>
      'Check that accessibility is on. Android blocks reading password and payment screens.';

  @override
  String get phoneScreenCurrent => 'Current screen';

  @override
  String get phoneScreenEmpty => '(No readable text on screen)';

  @override
  String get phoneScreenReadNote => 'This is what the model would see. This read wasn’t sent to the model.';

  @override
  String get phoneFailureSafeStartup => 'Couldn’t start even in Safe mode';

  @override
  String get phoneFailureSafeStartupHint => 'Likely a global configuration or runtime issue';

  @override
  String get phoneFailureKilled => 'Android stopped the engine';

  @override
  String get phoneFailureKilledHint => 'Likely low memory or battery restrictions';

  @override
  String get phoneFailureLaunch => 'Local runtime couldn’t start';

  @override
  String get phoneFailureLaunchHint => 'Check the logs, or connect to a remote host to continue';

  @override
  String get phoneFailureNoSpaceHint => 'Free up some space and try again';

  @override
  String get phoneFailureStartup => 'DSH couldn’t start';

  @override
  String get phoneFailureCrashedEarly => 'DSH crashed soon after starting';

  @override
  String get phoneFailureCrashedLate => 'DSH crashed while running';

  @override
  String get phoneFailureFatal => 'The engine reported a fatal error';

  @override
  String get phoneFailureRestore => 'Restore configuration';

  @override
  String get phoneFailureEnterSafe => 'Enter Safe mode';

  @override
  String get phoneFailureStartNormal => 'Start normally';

  @override
  String get phoneFailureGlobalPatch => 'Global patch';

  @override
  String get phoneFailureEnvironment => 'Environment variables';

  @override
  String get phoneSafeMoveAsideTitle => 'Move these files aside first?';

  @override
  String get phoneSafeMoveAsideIntro => 'They affect all configurations, including Safe mode:';

  @override
  String get phoneSafeMoveAsideNote =>
      'Files are renamed (with .off-timestamp), never deleted. You can rename them back after fixing the issue.';

  @override
  String get phoneSafeStartDirectly => 'Start directly';

  @override
  String get phoneSafeMoveAsideStart => 'Move and start';

  @override
  String get phoneSafeNoRestoreNeeded => 'Configuration matches the last working version. No restore needed.';

  @override
  String get phoneSafeNoRestoreRecord => 'No previous working configuration recorded';

  @override
  String get phoneSafeRestoreTitle => 'Restore the last working configuration?';

  @override
  String get phoneSafeRestoreStart => 'Restore and start';

  @override
  String get phoneSafeRestoredStarting => 'Restored the last working configuration. Starting…';

  @override
  String get phoneSafeRestoreFailed => 'Couldn’t restore';

  @override
  String get phoneSafeRestoreIntro => 'DSH will restore the last working configuration:';

  @override
  String get phoneSafeRestoreSettings => '• Restore settings to that version (save current settings as a backup)';

  @override
  String get phoneSafeRestoreNote =>
      'No plugins will be uninstalled. No internet needed. You can re-enable disabled plugins later.';

  @override
  String get phoneSafeLeaveTitle => 'Return to normal mode?';

  @override
  String get phoneSafeLeaveBody =>
      'Start with your original configuration and plugins. Web settings changed in Safe mode won’t be kept.';

  @override
  String get phoneSafeLeave => 'Return to normal mode';

  @override
  String get phoneSafeMovePatch => 'Move patch aside';

  @override
  String get phoneSafeMoveFiles => 'Move files aside';

  @override
  String get phoneSafeFailureLog => 'Logs around the failure';

  @override
  String get phoneSafeFailureLogEmpty => 'No output recorded at the time of failure';

  @override
  String get phoneSafeBannerTitle => 'Safe mode · Plugins not loaded';

  @override
  String get phoneSafeBannerProbation => 'Trying normal mode';

  @override
  String get phoneSafeBannerProbationHint =>
      'If no errors occur within 2 minutes, recovery is complete. Otherwise, Safe mode returns automatically.';

  @override
  String get phoneSafeBannerRunningHint => 'Your chats are safe. Fix the configuration, then return to normal mode.';

  @override
  String get phoneSafeBannerFailedHint => 'Couldn’t start even in Safe mode. Check the engine page.';

  @override
  String get phoneSafeBannerStoppedHint => 'Engine stopped. Next start will still use Safe mode.';

  @override
  String get phoneSafeRepair => 'Help me fix it';

  @override
  String get phoneSafeReasonStartup => 'Failed to start twice in a row';

  @override
  String get phoneSafeReasonProbation => 'Crashed again after recovery';

  @override
  String get phoneSafeReasonManual => 'Turned on manually';

  @override
  String get phoneSafeNormalSettingsHint => 'Restart with original configuration and plugins';

  @override
  String get phoneSafeStartSettings => 'Start in Safe mode';

  @override
  String get phoneSafeStartSettingsHint => 'Skip plugins to troubleshoot startup';

  @override
  String get phoneSafeAutoSettings => 'Automatic Safe mode';

  @override
  String get phoneSafeAutoSettingsHint => 'Turn on after repeated startup failures';

  @override
  String get phoneAccentMist => 'Mist';

  @override
  String get phoneAccentDaiqing => 'Teal';

  @override
  String get phoneAccentDusk => 'Dusk';

  @override
  String get phoneAccentTurquoise => 'Aqua';

  @override
  String get phoneAccentAmber => 'Amber';

  @override
  String get phoneAccentGraphite => 'Slate';

  @override
  String get phoneAccentCustom => 'Custom';

  @override
  String phoneEngineInstallPercent(int percent) {
    return 'Installing · $percent%';
  }

  @override
  String phoneEngineStatusSemantics(String prefix, String status) {
    return '$prefix engine: $status';
  }

  @override
  String phoneLogLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count lines', one: '1 line');
    return '$_temp0';
  }

  @override
  String phoneLogCopiedLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Copied $count lines',
      one: 'Copied 1 line',
    );
    return '$_temp0';
  }

  @override
  String phoneAppRuleDefault(String rule) {
    return 'Default: $rule';
  }

  @override
  String phoneAppRulesLoosenTitle(String app) {
    return 'Let DSH operate “$app”?';
  }

  @override
  String phoneAppRulesSkipStepsTitle(String app) {
    return 'Stop confirming each step in “$app”?';
  }

  @override
  String phoneDndShizukuStatus(String reason) {
    return 'Shizuku · $reason';
  }

  @override
  String phoneDndAdbStatus(String reason) {
    return 'Direct ADB · $reason';
  }

  @override
  String phoneDndBrowserFailed(String url) {
    return 'Can’t open the browser. URL: $url';
  }

  @override
  String phoneControlWorkingApp(String app) {
    return 'Operating “$app”';
  }

  @override
  String phoneControlPolicySummary(int denied, int confirmed) {
    String _temp0 = intl.Intl.pluralLogic(
      denied,
      locale: localeName,
      other: '$denied apps off limits',
      one: '1 app off limits',
    );
    String _temp1 = intl.Intl.pluralLogic(
      confirmed,
      locale: localeName,
      other: '$confirmed apps confirm each step',
      one: '1 app confirms each step',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String phoneControlRemoteHint(String host) {
    return 'DSH on “$host” can’t control this phone. Switch to “This phone” to use it.';
  }

  @override
  String phoneRestrictedSubtitle(String place) {
    return 'Allow this for sideloaded apps to enable the $place switch';
  }

  @override
  String phoneRestrictedDone(String place) {
    return '$place is on. You can go back.';
  }

  @override
  String phoneFailurePlugins(String plugins) {
    return 'May be related to plugins “$plugins”';
  }

  @override
  String phoneFailureRequired(String components) {
    return 'Required components $components failed startup checks';
  }

  @override
  String phoneSafeRestoreAt(String when) {
    return 'DSH will restore the working configuration from $when:';
  }

  @override
  String phoneSafeRestoreDisable(String plugins) {
    return '• Disable: $plugins';
  }

  @override
  String phoneSafeRestoreChanged(String plugins) {
    return '  ($plugins updated since then; can only be disabled for now)';
  }

  @override
  String phoneSafeRestoreEnable(String plugins) {
    return '• Re-enable: $plugins';
  }

  @override
  String phoneSafeTodayTime(String time) {
    return 'Today $time';
  }

  @override
  String phoneSafeReasonPlugins(String plugins) {
    return 'Failed to start twice in a row. Suspected plugins: $plugins';
  }

  @override
  String get phoneListSeparator => ', ';

  @override
  String get phonePluginQuoteSeparator => '”, “';

  @override
  String phoneEngineRunningAt(String address) {
    return 'Running · $address';
  }

  @override
  String phoneEngineSafeAt(String address) {
    return 'Safe mode · $address';
  }

  @override
  String get phoneAppRulesLoosenBody =>
      'Banking and payment apps detect automation and may restrict sign-in or freeze your account. By default, DSH won’t enter passwords or pay.';

  @override
  String get phoneAppRulesSkipStepsBody =>
      'Apps like WeChat watch for automation, and phone assistants have had accounts signed out. With “As usual”, only actions like sending messages still ask first.';

  @override
  String get phoneResetDeletesChatsWorkspaces => 'chats and workspaces';

  @override
  String get phoneResetBodyChatsWorkspaces => 'This will delete chats and workspaces, then reinstall the runtime.';

  @override
  String get phoneResetDeletesWithPlugins => 'chats, workspaces, plugins and settings';

  @override
  String get phoneResetBodyWithPlugins =>
      'This will delete chats, workspaces, plugins and settings, then reinstall the runtime.';

  @override
  String get phoneResetDeletesWithUi => 'chats, workspaces, interface settings and skills';

  @override
  String get phoneResetBodyWithUi =>
      'This will delete chats, workspaces, interface settings and skills, then reinstall the runtime.';

  @override
  String get phoneResetDeletesEverything => 'chats, workspaces, plugins, settings, interface settings and skills';

  @override
  String get phoneResetBodyEverything =>
      'This will delete chats, workspaces, plugins, settings, interface settings and skills, then reinstall the runtime.';

  @override
  String phoneEngineStorageDetails(String needed, String free) {
    return 'Not enough storage: about $needed MB needed, $free MB available';
  }

  @override
  String get phoneControlEnabledRestarting => 'On · Restarting the engine';

  @override
  String get phoneControlDisabledRestarting => 'Off · Restarting the engine';

  @override
  String get phoneControlEnabledPending => 'On · Takes effect when the engine starts';

  @override
  String get phoneReturnAfterDone => 'Back to DSH Go when done';

  @override
  String get phoneReturnAfterDoneHint => 'Closes the bar, opens the chat';

  @override
  String get phoneFloatingBar => 'Floating bar';

  @override
  String get phoneIdleOpacity => 'Idle opacity';

  @override
  String get phoneAutoCollapse => 'Collapse when idle';

  @override
  String get phoneAutoCollapseHint => 'Shrinks to a ball; tap to open';

  @override
  String get phoneDeveloperOptions => 'Developer options';

  @override
  String get phoneDirectEngine => 'Direct local engine launch';

  @override
  String get phoneDirectHint =>
      'Experimental and off by default; applies on the next start. Some phones (Android 16, for one) block a direct start, and the app then goes back to compatible launch on its own. Your data isn’t affected.';

  @override
  String get phoneDirectFailedHint =>
      'Direct launch didn’t work on this phone, so compatible launch is used. Stop the engine and turn this on to try again.';

  @override
  String get phoneDirectCompatibleHint =>
      'This start used compatible launch; the reason is above. Your choice is kept, and the next start tries again.';

  @override
  String get phoneDirectStopFirst => 'Stop the local engine before changing its launch method.';

  @override
  String get phoneDirectSafeHint =>
      'Safe mode uses compatible launch. This choice applies when you return to normal mode.';

  @override
  String get phoneDirectNeedsRuntime => 'This option needs a runtime with direct launch support.';

  @override
  String get phoneDirectChangeFailed => 'Could not change the launch method. Stop the local engine and try again.';

  @override
  String get phoneActualLaunchMode => 'Current launch';

  @override
  String get phoneLaunchNotObserved => 'Not running';

  @override
  String get phoneLastLaunchSelection => 'Last launch';

  @override
  String get phoneDirectRejectedReason => 'Fallback reason';

  @override
  String get phoneLaunchFailureReason => 'Last failure';

  @override
  String get phoneReturnCompatible => 'Use compatible launch';

  @override
  String get phoneLaunchDirect => 'Direct launch';

  @override
  String get phoneLaunchCompatible => 'Compatible launch';

  @override
  String get phoneDirectIncompatibleFiles => 'Plugin files not tidied yet, compatible launch for now';

  @override
  String get phoneDirectNotEnoughSpace => 'Not enough storage, compatible launch for now';

  @override
  String get phoneDirectMigrationFailed => 'File tidy-up unfinished, compatible launch for now';

  @override
  String get phoneDirectLaunchFailed => 'Direct launch failed';

  @override
  String get phoneLaunchStartFailed => 'Didn\'t finish starting';

  @override
  String phoneLaunchExited(String code) {
    return 'Exit code $code';
  }

  @override
  String get phoneTaskResultReady => 'Task complete · View result';

  @override
  String get phoneTaskEndedResult => 'Task ended · View result';

  @override
  String get phoneBackgroundGuideTitle => 'Confirmations and return';

  @override
  String get phoneBackgroundGuideSubtitle => 'See confirmations and task results in time';

  @override
  String get phoneBackgroundGuideBody =>
      'When a step needs your decision, a DSH Go card appears. If the card is unavailable, the app tries a notification or returns here. Allow phone-control notifications and pop-up alerts in system settings.';

  @override
  String get phoneBackgroundOemHint =>
      'In the system permissions for DSH Go, check “Display pop-up windows while running in the background”, if available. Allowing it can help the app return automatically. Menu names vary by system version.';

  @override
  String get phoneBackgroundReturnHint =>
      'If the app does not return when a task finishes, tap “Task complete · View result”. If system notifications or background windows are blocked, you may need to open DSH Go yourself.';

  @override
  String get phoneBackgroundGotIt => 'Got it';

  @override
  String get phoneBackgroundOpenSettings => 'Open system settings';

  @override
  String get phoneBackgroundNotificationBlocked => 'Allow pop-up alerts for phone-control notifications';

  @override
  String get phoneModeTitle => 'How DSH confirms';

  @override
  String get phoneModeMessage => 'You can change this in Settings anytime';

  @override
  String get phoneModeAsk => 'Ask me at key steps';

  @override
  String get phoneModeAskHint => 'Before a new app, sending, deleting or paying';

  @override
  String get phoneModeAuto => 'Fully automatic';

  @override
  String get phoneModeAutoHint => 'Never asks, never interrupts';

  @override
  String get phoneModeAutoNoteTitle => 'These stay with you';

  @override
  String get phoneModeAutoNote =>
      'System settings and permission pages, passwords and verification codes, and DSH Go itself stay with you. Banking and payment apps are off limits by default; you can change that in Settings.';

  @override
  String get phoneModeAutoUnlockNote =>
      'To let AI handle system settings, passwords and the like, turn it on in Settings › Phone control › Lift limits.';

  @override
  String get phoneModeConfirmAuto => 'Go fully automatic';

  @override
  String get phoneYoursTitle => 'These stay with you';

  @override
  String get phoneYoursSystem => 'System settings and permission pages';

  @override
  String get phoneYoursSecrets => 'Passwords and verification codes';

  @override
  String get phoneYoursOwnApp => 'DSH Go itself';

  @override
  String get phoneYoursDenyList => 'Apps set to Hands off in App rules, banking and payment by default';

  @override
  String get phoneUnlockTitle => 'Lift limits';

  @override
  String get phoneUnlockSubtitle => 'Let AI do what’s yours by default';

  @override
  String get phoneUnlockSystem => 'System settings';

  @override
  String get phoneUnlockSystemHint => 'Permissions, installers, security center, notifications';

  @override
  String get phoneUnlockSecrets => 'Passwords and codes';

  @override
  String get phoneUnlockSecretsHint => 'Fill in passwords, verification and payment codes';

  @override
  String get phoneUnlockOwnApp => 'DSH Go itself';

  @override
  String get phoneUnlockOwnAppHint => 'Tap and type inside DSH Go';

  @override
  String get phoneUnlockBusy => 'Can’t turn on while a task is running';

  @override
  String get phoneUnlockFootnote => 'Lifting restrictions expands AI control and may cause irreversible loss. Turn on only when needed, and off when done.';

  @override
  String get phoneUnlockBanks => 'Banking and payment apps';

  @override
  String get phoneUnlockBanksHint => 'Change in App rules';

  @override
  String get phoneUnlockNone => 'None on';

  @override
  String phoneUnlockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count on', one: '1 on');
    return '$_temp0';
  }

  @override
  String get phoneUnlockedBadge => 'Limits lifted';

  @override
  String get phoneUnlockConfirmSystemTitle => 'Let AI operate system settings?';

  @override
  String get phoneUnlockConfirmSecretsTitle => 'Let AI fill in passwords and codes?';

  @override
  String get phoneUnlockConfirmOwnAppTitle => 'Let AI operate DSH Go itself?';

  @override
  String get phoneUnlockCanTitle => 'Once on, AI can';

  @override
  String get phoneUnlockRiskTitle => 'What could go wrong';

  @override
  String get phoneUnlockDisclaimerTitle => 'Disclaimer';

  @override
  String get phoneUnlockSystemCan1 =>
      'Open and change system settings, including permissions, accessibility and developer options';

  @override
  String get phoneUnlockSystemCan2 => 'Install, update or uninstall apps in the installer';

  @override
  String get phoneUnlockSystemCan3 =>
      'Tap in the security center and the notification shade, including buttons on notifications';

  @override
  String get phoneUnlockSystemRisk1 =>
      'Malicious instructions in a web page, message or file could lead AI to turn off protections, grant permissions to other apps or install apps';

  @override
  String get phoneUnlockSystemRisk2 => 'Network, account or security settings changed by mistake are yours to restore';

  @override
  String get phoneUnlockSecretsCan1 => 'Type into password, verification-code and payment-code fields';

  @override
  String get phoneUnlockSecretsCan2 => 'Use codes it sees in chats, texts or notifications to sign in or verify';

  @override
  String get phoneUnlockSecretsCan3 => 'The action log shows •••• and never what was typed';

  @override
  String get phoneUnlockSecretsRisk1 =>
      'Malicious instructions could lead AI to enter a code somewhere else, letting someone into your account';

  @override
  String get phoneUnlockSecretsRisk2 => 'It could complete a payment or transfer you didn’t intend';

  @override
  String get phoneUnlockOwnAppCan1 => 'Tap and type inside DSH Go, including changing settings';

  @override
  String get phoneUnlockOwnAppCan2 => 'Read conversations and settings on DSH Go’s screens';

  @override
  String get phoneUnlockOwnAppRisk1 =>
      'Malicious instructions could lead AI to approve its own requests or turn confirmations off';

  @override
  String get phoneUnlockOwnAppRisk2 => 'What’s on these screens is sent to the model';

  @override
  String get phoneUnlockDisclaimer1 => 'After lifting a restriction, AI may perform permitted high-risk actions without step-by-step confirmation.';

  @override
  String get phoneUnlockDisclaimer2 => 'AI may misread a screen or follow malicious instructions in pages, messages, or files.';

  @override
  String get phoneUnlockDisclaimer3 => 'Your accounts, money, data, device, or privacy may be harmed. Review consequential actions and results.';

  @override
  String get phoneUnlockDisclaimer4 => 'The software is provided as is. Liability limits apply only where permitted by law; mandatory rights remain.';

  @override
  String get phoneUnlockDisclaimer5 => 'Enable temporarily only on an owned or authorized device. Do not test with real payment details on your primary phone.';

  @override
  String get phoneUnlockHold => 'I understand the risks, turn on';

  @override
  String get phoneUnlockHoldHint => 'Press and hold for about 1.5 seconds';

  @override
  String phoneUnlockOnNotice(String name) {
    return '“$name” is on';
  }

  @override
  String phoneUnlockOffNotice(String name) {
    return '“$name” is off';
  }

  @override
  String get searchKwPhoneUnlock => 'lift limits,unlock,passwords,codes,system settings,itself,risk,disclaimer';

  @override
  String get pluginConfigUnsaved => 'Unsaved';

  @override
  String get pluginConfigSecretSet => 'Set';

  @override
  String get pluginConfigAdvanced => 'Advanced';

  @override
  String get pluginConfigSearchHint => 'Search settings';

  @override
  String get pluginConfigNoMatch => 'No matching settings';

  @override
  String get pluginConfigOpenWeb => 'Set up on the web';

  @override
  String get pluginConfigOpenWebHint => 'The plugin\'s own page';

  @override
  String get pluginConfigResetAll => 'Reset all to defaults';

  @override
  String get pluginConfigResetAllTitle => 'Reset all to defaults?';

  @override
  String get pluginConfigReset => 'Reset';

  @override
  String pluginConfigChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count changes', one: '1 change');
    return '$_temp0';
  }

  @override
  String get pluginConfigAppliesOnReload => 'Saving reloads the plugin';

  @override
  String get pluginConfigSaving => 'Saving…';

  @override
  String get pluginConfigReloading => 'Reloading…';

  @override
  String get pluginConfigApplied => 'Applied';

  @override
  String get pluginConfigFailed => 'Didn\'t take effect';

  @override
  String get pluginConfigRestored => 'Previous settings restored';

  @override
  String get pluginConfigStopped => 'Didn\'t take effect, and the previous settings couldn\'t be restored';

  @override
  String get pluginConfigRestore => 'Restore';

  @override
  String get pluginConfigDiscard => 'Discard';

  @override
  String get pluginConfigNotStarted => 'The plugin didn\'t start';

  @override
  String get pluginConfigNone => 'Nothing to set';

  @override
  String get pluginConfigInvalidOperation => 'This change can\'t be applied';

  @override
  String get pluginConfigGone => 'The plugin is no longer running. Refreshed.';

  @override
  String get pluginConfigUnknown => 'Connection lost. Settings reloaded.';

  @override
  String get pluginConfigUnsupported => 'Can\'t be set here yet';

  @override
  String get pluginConfigSecretUnbound => 'Needs plugin support';

  @override
  String get pluginConfigListFailed => 'Couldn\'t read the plugin list. Try again later.';

  @override
  String get pluginConfigListUpdating => 'The plugin list is updating. Try again in a moment.';

  @override
  String get pluginConfigFixed => 'Set by configuration file';

  @override
  String get pluginConfigFixedNote => 'Set by a configuration file. View only here.';

  @override
  String get pluginConfigReadOnly => 'Read-only';

  @override
  String pluginConfigEntryTitle(String bundle, String entry) {
    return '$bundle · $entry';
  }

  @override
  String get pluginConfigNameSpeechToText => 'Speech recognition';

  @override
  String get pluginConfigNameSenseVoice => 'SenseVoice recognition';

  @override
  String get pluginConfigNameSpeechApi => 'Transcription API';

  @override
  String get pluginConfigNameTranslator => 'Translation service';

  @override
  String get pluginConfigNameSessionIndex => 'Session index';

  @override
  String get pluginConfigNameSessionSearchTool => 'Session search tool';

  @override
  String get pluginConfigNameTerminalService => 'Terminal service';

  @override
  String get pluginConfigNameTerminalBash => 'Bash terminal';

  @override
  String get pluginConfigNameTerminalPwsh => 'PowerShell terminal';

  @override
  String get pluginConfigNameTerminalTools => 'Terminal tools';

  @override
  String get pluginConfigNameWorktree => 'Worktree manager';

  @override
  String get pluginConfigNameWorktreeTools => 'Worktree tools';

  @override
  String get pluginConfigNameRalphWorkflow => 'Workflow engine';

  @override
  String get pluginConfigNameRalphTools => 'Ralph tools';

  @override
  String get plugInputRequired => 'Complete this field';

  @override
  String get plugInputInvalidValue => 'Invalid value';

  @override
  String get plugInputNumber => 'Enter a valid number';

  @override
  String plugInputBounds(String min, String max) {
    return 'Enter a value from $min to $max';
  }

  @override
  String plugInputLength(int min, int max) {
    return 'Use $min–$max characters';
  }

  @override
  String get plugInputPattern => 'Check the format';

  @override
  String get plugInputDate => 'Choose a valid date';

  @override
  String get plugInputTime => 'Choose a valid time';

  @override
  String get plugInputUnavailable => 'This component is not supported here';

  @override
  String get plugInputNoPassword => 'Plugins cannot use password fields';

  @override
  String get plugInputBadBinding => 'Input binding must be a field path under data';

  @override
  String get plugInputDuplicateBinding => 'Each field can bind to only one input';

  @override
  String get plugInputNamedPattern => 'Use a built-in validation pattern';

  @override
  String get plugInputNestedForm => 'Forms cannot be nested';

  @override
  String get plugInputSubmitMissing => 'Form needs a submit action';

  @override
  String get plugInputTooLarge => 'Too much content. Shorten it and try again';

  @override
  String get plugInputCheckFields => 'Check the highlighted fields';

  @override
  String get plugInputFailed => 'Not saved. Try again';

  @override
  String get plugInputSubmit => 'Save';

  @override
  String get plugInputChoose => 'Choose';

  @override
  String get plugInputPrevious => 'Previous';

  @override
  String get plugInputNext => 'Next';

  @override
  String plugInputDecrease(String label) {
    return 'Decrease $label';
  }

  @override
  String plugInputIncrease(String label) {
    return 'Increase $label';
  }

  @override
  String plugInputRating(String label, int value, int max) {
    return '$label: $value out of $max';
  }

  @override
  String get plugInputFormula => 'Invalid formula or formula limit exceeded';

  @override
  String get plugInputDatePicker => 'Plugin date';

  @override
  String get plugInputTimePicker => 'Plugin time';

  @override
  String get plugInputChoices => 'Plugin choices';

  @override
  String get plugInputGestureRequired => 'This effect requires a user tap';

  @override
  String get pluginsOperationHostChanged => 'Host changed — nothing was done';

  @override
  String get pluginsReloadLocal => 'Restart engine to reload';

  @override
  String get pluginsReloadInterrupts => 'Interrupts running tasks';

  @override
  String pluginsReloadConfirm(String name) {
    return 'Reload “$name”?';
  }

  @override
  String get pluginsReloadExplanation =>
      'This restarts the local engine and reloads plugins. Running tasks will be interrupted.';

  @override
  String get pluginsReloadProceed => 'Restart and reload';

  @override
  String get pluginsReloadRequested => 'Engine restart requested';

  @override
  String get pluginsReloadChanged => 'The host or plugin state changed. Try again.';

  @override
  String get pluginsReloadFailed => 'Couldn’t restart the engine. Check its logs.';

  @override
  String get pluginsFile => 'File';

  @override
  String get pluginsChat => 'Chat';

  @override
  String get pluginsImage => 'Image';

  @override
  String get pluginsNamespaceDefaultModel => 'Default model';

  @override
  String get pluginsNamespaceDefaultPreset => 'Default preset';

  @override
  String get pluginsNamespaceAgent => 'Agent';

  @override
  String get pluginsNamespaceSubagent => 'Subagent';

  @override
  String get pluginsNamespaceSubagentModels => 'Subagent models';

  @override
  String get pluginsNamespaceDeepSeekModel => 'DeepSeek model';

  @override
  String get pluginsNamespaceAccountModel => 'DeepSeek account model';

  @override
  String get pluginsNamespaceCustomModels => 'Custom model service';

  @override
  String get pluginsNamespaceNetwork => 'Internet access';

  @override
  String get pluginsNamespaceWebSearch => 'Web search';

  @override
  String get pluginsNamespaceSearchApi => 'Web search API';

  @override
  String get pluginsNamespaceCommands => 'Command execution';

  @override
  String get pluginsNamespacePermissions => 'Permissions';

  @override
  String get pluginsNamespaceChatLog => 'Chat log';

  @override
  String get pluginsNamespaceThinkingTranslation => 'Thinking translation';

  @override
  String get pluginsNamespaceTranslation => 'Translation';

  @override
  String get pluginsNamespaceLanguage => 'Language';

  @override
  String get pluginsNamespaceWebAppearance => 'Web appearance';

  @override
  String get pluginsNamespaceWebChat => 'Web chat';

  @override
  String get pluginsNamespaceWebInput => 'Web input';

  @override
  String get pluginsNamespaceWebSettings => 'Web settings';

  @override
  String get pluginsNamespaceWebGeneral => 'Web general';

  @override
  String get pluginsNamespaceAutoReview => 'Auto review';

  @override
  String get pluginsNamespaceAgentTeam => 'Agent team';

  @override
  String get pluginsNamespaceVoiceInput => 'Voice input';

  @override
  String get pluginsOfficialPlugin => 'Official plugin';

  @override
  String get pluginsLocalUnshareable => 'Installed locally, can’t share';

  @override
  String pluginsIncludesPresets(String names) {
    return 'Includes presets “$names”';
  }

  @override
  String get pluginsSecretsUnshareable => 'Contains secrets, can’t share';

  @override
  String pluginsLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count lines', one: '1 line');
    return '$_temp0';
  }

  @override
  String get pluginsEmptyValue => 'Empty';

  @override
  String get pluginsOnValue => 'On';

  @override
  String get pluginsOffValue => 'Off';

  @override
  String get pluginsOfficialUnavailable => 'This host doesn’t have this official plugin';

  @override
  String get pluginsEnabled => 'Enabled';

  @override
  String get pluginsVersionMismatch => 'Version differs from the shared version';

  @override
  String get pluginsCurrentVersion => 'Current version';

  @override
  String get pluginsNewVersion => 'New version';

  @override
  String pluginsAddedWith(String title) {
    return 'Added with “$title”';
  }

  @override
  String pluginsApplyAfterInstall(String detail) {
    return 'Apply after installing plugins · $detail';
  }

  @override
  String get pluginsSettingsReadFailed => 'Couldn’t read this host’s settings';

  @override
  String get pluginsSettingUnavailable => 'This host doesn’t have this setting';

  @override
  String get pluginsSettingsReadOnly => 'This host’s settings are read-only';

  @override
  String get pluginsImportLocalOnly => 'Can only import to this phone';

  @override
  String get pluginsReplaceSkill => 'Replace skill with the same name';

  @override
  String get pluginsReplaceContent => 'Replace existing content';

  @override
  String get pluginsSafeModeInstallBlocked => 'Can’t install plugins in Safe mode';

  @override
  String get pluginsHostInstallBlocked => 'Can’t install plugins on this host from here';

  @override
  String get pluginsInstallFailed => 'Installation failed';

  @override
  String get pluginsAfterRestart => 'Takes effect after restart';

  @override
  String get pluginsSettingsChanged => 'Settings just changed';

  @override
  String get pluginsWriteFailed => 'Couldn’t write';

  @override
  String get pluginsHostUnreachable => 'Can’t reach the host';

  @override
  String get pluginsFileWriteFailed => 'Couldn’t write the file';

  @override
  String get pluginsProfileTitle => 'DSH Go settings';

  @override
  String get pluginsGistTokenInvalid => 'GitHub token is invalid or lacks Gist permission';

  @override
  String pluginsGistCreateHttpFailed(int status) {
    return 'Couldn’t create Gist (HTTP $status)';
  }

  @override
  String get pluginsGistCreateFailed => 'Couldn’t create Gist';

  @override
  String get pluginsGitHubUnreachable => 'Can’t reach GitHub';

  @override
  String get pluginsGitHubTimeout => 'Connection to GitHub timed out';

  @override
  String get pluginsGistNotFound => 'Gist not found';

  @override
  String get pluginsGistNoProfile => 'This Gist has no settings to import';

  @override
  String get pluginsGistReadFailed => 'Couldn’t read Gist';

  @override
  String get pluginsListReadFailed => 'Couldn’t read the plugin list';

  @override
  String get pluginsReadingPlugins => 'Reading plugins…';

  @override
  String get pluginsDshOfficial => 'DSH official';

  @override
  String get pluginsOfficialToggleOnly =>
      'Official components can only be turned on or off, and apply to all chats on this host';

  @override
  String get pluginsOfficial => 'Official';

  @override
  String get pluginsNoThirdParty => 'No third-party plugins yet';

  @override
  String get pluginsPluginsDescription => 'Add tools, memory, and models to DSH';

  @override
  String get pluginsBrowseMarket => 'Browse plugins';

  @override
  String get pluginsLoading => 'Loading';

  @override
  String get pluginsIslandClosed => 'Plugin interface closed';

  @override
  String get pluginsReopen => 'Reopen';

  @override
  String pluginsOpenBrowserHost(String host) {
    return 'Open $host in your browser?';
  }

  @override
  String get pluginsSearch => 'Search plugins';

  @override
  String get pluginsMarketLoading => 'Loading plugin directory…';

  @override
  String get pluginsMarketLoadFailed => 'Couldn’t open the plugin directory';

  @override
  String get pluginsMarketInvalid => 'Invalid directory format';

  @override
  String get pluginsAll => 'All';

  @override
  String pluginsMarketCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0 · from dshfind';
  }

  @override
  String get pluginsHideWeb => 'Hide Web plugins';

  @override
  String pluginsShowWebCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Show $count Web plugins',
      one: 'Show 1 Web plugin',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNoCategoryPlugins => 'No plugins in this category';

  @override
  String pluginsNoSearchResults(String query) {
    return 'No results for “$query”';
  }

  @override
  String pluginsFailureDetails(String title) {
    return '$title · Tap to view';
  }

  @override
  String get pluginsFeatured => 'Recommended';

  @override
  String pluginsInstalledRemoteRestart(String name, String host) {
    return 'Installed “$name”. Restart DSH on $host to apply.';
  }

  @override
  String pluginsInstalledNamed(String name) {
    return 'Installed “$name”';
  }

  @override
  String get pluginsInstallCancelled => 'Installation cancelled';

  @override
  String pluginsInstallFailureNamed(String name, String reason) {
    return '“$name” $reason';
  }

  @override
  String get pluginsRestartRequired => 'Engine restart needed';

  @override
  String pluginsRestartExplanation(String name) {
    return 'Restart the engine to apply “$name”. Replies in progress will be interrupted.';
  }

  @override
  String get pluginsRestartEngine => 'Restart engine';

  @override
  String get pluginsAllowBuildScripts => 'Allow build scripts?';

  @override
  String get pluginsBuildScriptPackages => 'These packages run scripts during installation:';

  @override
  String pluginsBuildScriptWarning(String host) {
    return 'Scripts run with DSH’s permissions on $host and can read and write files and access the internet. Only allow this if you trust the plugin.';
  }

  @override
  String get pluginsThisDevice => 'This device';

  @override
  String get pluginsAllowRetry => 'Allow and retry';

  @override
  String pluginsUpdateNamed(String name) {
    return 'Update “$name”?';
  }

  @override
  String pluginsUninstallNamed(String title) {
    return 'Uninstall “$title”?';
  }

  @override
  String pluginsUninstallExplanation(String host) {
    return 'The plugin will be removed from $host. Its data and settings will stay.';
  }

  @override
  String get pluginsThisHost => 'This host';

  @override
  String get pluginsUninstall => 'Uninstall';

  @override
  String pluginsUninstalledNamed(String title) {
    return 'Uninstalled “$title”';
  }

  @override
  String get pluginsRestartNow => 'Restart now';

  @override
  String get pluginsUninstallFailed => 'Couldn’t uninstall';

  @override
  String get pluginsThatComputer => 'That computer';

  @override
  String get pluginsCommandAfterInstall => 'After installing, restart DSH on that computer, then refresh here';

  @override
  String get pluginsError => 'Error';

  @override
  String get pluginsInventoryTitle => 'Plugin inventory';

  @override
  String get pluginsGlobalPlugins => 'Global plugins';

  @override
  String get pluginsAgentPresets => 'Agent presets';

  @override
  String get pluginsInventoryReadFailed => 'Couldn’t read the plugin inventory';

  @override
  String pluginsComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count components', one: '1 component');
    return '$_temp0';
  }

  @override
  String pluginsEnabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count enabled', one: '1 enabled');
    return '$_temp0';
  }

  @override
  String pluginsErrorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count errors', one: '1 error');
    return '$_temp0';
  }

  @override
  String get pluginsNoPlugins => 'No plugins';

  @override
  String get pluginsNoMatchingPlugins => 'No matching plugins';

  @override
  String get pluginsPresetLoadFailed => 'Couldn’t load this preset';

  @override
  String get pluginsPresetNoPlugins => 'This preset has no plugins';

  @override
  String get pluginsStandard => 'Standard';

  @override
  String get pluginsMinimal => 'Minimal';

  @override
  String pluginsDefaultPresetName(String name) {
    return '$name (default)';
  }

  @override
  String get pluginsSystemComponents => 'System components';

  @override
  String pluginsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$_temp0';
  }

  @override
  String get pluginsSource => 'Source';

  @override
  String get pluginsDisableCondition => 'Disabled when';

  @override
  String get pluginsProvidedByPreset => 'Provided by preset';

  @override
  String get pluginsDetailsTitle => 'Plugin details';

  @override
  String pluginsPackageInfoError(String error) {
    return 'Invalid package info: $error';
  }

  @override
  String get pluginsInstalling => 'Installing';

  @override
  String get pluginsGet => 'Get';

  @override
  String get pluginsLoadingCannotCancel => 'Loading the plugin. This step can’t be cancelled.';

  @override
  String get pluginsInstallDuration => 'Takes a minute or two. You can leave this page.';

  @override
  String get pluginsViewInstallLogs => 'View install logs';

  @override
  String get pluginsViewDetails => 'View details';

  @override
  String get pluginsCopyCommand => 'Copy command';

  @override
  String get pluginsCommandCopied => 'Command copied';

  @override
  String get pluginsMissingFiles => 'Plugin files are missing. Reinstall to fix.';

  @override
  String get pluginsNotDshPlugin => 'Not a DSH plugin, can’t load';

  @override
  String get pluginsIncompatible => 'Incompatible with this DSH version, not loaded';

  @override
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion) {
    return 'Requires DSH $requiredVersion, currently $currentVersion, not loaded';
  }

  @override
  String pluginsLoadFailure(String reason) {
    return 'Couldn’t load: $reason';
  }

  @override
  String get pluginsUnknownReason => 'Unknown reason';

  @override
  String pluginsBundleProblem(String reason) {
    return 'Problem: $reason';
  }

  @override
  String pluginsRefreshFailure(String reason) {
    return 'Couldn’t refresh: $reason';
  }

  @override
  String get pluginsTitle => 'Plugins';

  @override
  String get pluginsRefresh => 'Refresh';

  @override
  String get pluginsMarketTitle => 'Plugin market';

  @override
  String get pluginsConnectToManage => 'Connect to the engine to manage plugins';

  @override
  String get pluginsSafeModeOperationsBlocked => 'Can’t install or uninstall plugins in Safe mode';

  @override
  String pluginsRelayToggleOnly(String host) {
    return '$host · Relay only supports turning plugins on or off. Install on that computer.';
  }

  @override
  String get pluginsInstallThisPhone => 'Install to: This phone';

  @override
  String pluginsInstallHost(String host) {
    return 'Install to: $host';
  }

  @override
  String get pluginsOfflineDescription =>
      'Installed plugins appear when the engine is running. You can browse the market now.';

  @override
  String get pluginsIconChanged => 'Icon changed. Your home screen updates in a few seconds.';

  @override
  String get pluginsIconChangeFailed => 'Couldn’t change the icon. Try again later.';

  @override
  String get pluginsTheme => 'Theme';

  @override
  String get pluginsAppearance => 'Appearance';

  @override
  String get pluginsColors => 'Colors';

  @override
  String get pluginsFeatureIcons => 'Feature icons';

  @override
  String get pluginsAppIcon => 'App icon';

  @override
  String get pluginsPet => 'Pet';

  @override
  String get pluginsCustomColor => 'Custom';

  @override
  String pluginsColorLabel(String label) {
    return 'Color: $label';
  }

  @override
  String get pluginsCoral => 'Coral';

  @override
  String get pluginsRouge => 'Rouge';

  @override
  String get pluginsOchre => 'Ochre';

  @override
  String get pluginsMoss => 'Moss';

  @override
  String get pluginsLake => 'Lake';

  @override
  String get pluginsIndigo => 'Indigo';

  @override
  String get pluginsHue => 'Hue';

  @override
  String get pluginsWallpaper => 'Wallpaper';

  @override
  String get pluginsFollowWallpaper => 'Use wallpaper colors';

  @override
  String get pluginsAllowHighPower => 'Allow high background power usage';

  @override
  String pluginsVivoBatteryPath(String app) {
    return 'Battery › Background power consumption management › $app';
  }

  @override
  String get pluginsXiaomiBatterySetting => 'Battery saver: No restrictions';

  @override
  String pluginsXiaomiBatteryPath(String app) {
    return 'Manage apps › $app › Battery saver';
  }

  @override
  String get pluginsHuaweiBatterySetting => 'Allow background activity';

  @override
  String pluginsHuaweiBatteryPath(String app) {
    return 'Battery › App launch › $app';
  }

  @override
  String get pluginsOppoBatterySetting => 'Allow background activity';

  @override
  String pluginsOppoBatteryPath(String app) {
    return 'Battery › App battery management › $app';
  }

  @override
  String get pluginsSamsungBatterySetting => 'Battery: Unrestricted';

  @override
  String pluginsSamsungBatteryPath(String app) {
    return 'Apps › $app › Battery';
  }

  @override
  String get pluginsVivoBatteryStep => 'Turn on “Allow high background power usage”';

  @override
  String pluginsXiaomiBatteryFullPath(String app) {
    return 'App settings › Manage apps › $app › Battery saver › No restrictions';
  }

  @override
  String get pluginsXiaomiAutostart => 'Turn on “Autostart” on the same page';

  @override
  String get pluginsHuaweiBatteryStep => 'Turn off “Manage automatically” and turn on “Allow background activity”';

  @override
  String get pluginsOppoBatteryStep => 'Turn on “Allow background activity”';

  @override
  String get pluginsSamsungBatteryStep => 'Select “Unrestricted”';

  @override
  String get pluginsBackgroundTitle => 'Background running';

  @override
  String get pluginsBackgroundDescription => 'Let chats finish in the background';

  @override
  String get pluginsSystem => 'System';

  @override
  String get pluginsSystemBatteryOptimization => 'System battery optimization';

  @override
  String get pluginsTurnedOff => 'Off';

  @override
  String get pluginsNotTurnedOff => 'On';

  @override
  String get pluginsStayOnline => 'Stay online';

  @override
  String get pluginsKeepEngineNotification => 'Keep the “Engine running” notification';

  @override
  String pluginsLockInRecents(String app) {
    return 'Lock $app in recent apps';
  }

  @override
  String get pluginsPhoneBrands => 'Phone brands';

  @override
  String get pluginsOtherBrands => 'Other brands';

  @override
  String pluginsConnectedHost(String host) {
    return 'Connected ($host)';
  }

  @override
  String pluginsConnectionError(String error) {
    return 'Couldn’t connect: $error';
  }

  @override
  String get pluginsConnecting => 'Connecting';

  @override
  String get pluginsDiagnosticsCopied => 'Diagnostics copied';

  @override
  String get pluginsDiagnostics => 'Diagnostics';

  @override
  String get pluginsDiagnosticsDescription => 'Include with bug reports. No API keys or tokens.';

  @override
  String get pluginsRuntime => 'Runtime';

  @override
  String get pluginsArchitecture => 'Architecture';

  @override
  String get pluginsBundledVersion => 'Bundled version';

  @override
  String get pluginsInstalledVersion => 'Installed version';

  @override
  String get pluginsErrorLabel => 'Error';

  @override
  String get pluginsConnection => 'Connection';

  @override
  String get pluginsAddress => 'Address';

  @override
  String get pluginsClient => 'Client';

  @override
  String get pluginsConfigured => 'Set';

  @override
  String get pluginsExport => 'Export';

  @override
  String get pluginsCopyDiagnostics => 'Copy diagnostics';

  @override
  String get pluginsDiagnosticsContents => 'Versions and connection status only';

  @override
  String get pluginsNotificationsPartlyBlocked => 'Some blocked by system';

  @override
  String get pluginsNotificationsBlocked => 'Blocked by system';

  @override
  String get pluginsTurnedOn => 'On';

  @override
  String get pluginsNotifications => 'Notifications';

  @override
  String get pluginsNotificationSettingsFailed =>
      'Couldn’t open system settings. Turn on notifications in Settings → Apps → DSH Go → Notifications.';

  @override
  String get pluginsSystemNotificationsOff => 'System notifications are off';

  @override
  String get pluginsBackgroundNoAlerts => 'You won’t get alerts while the app is in the background';

  @override
  String get pluginsApprovalNotificationsOff => '“Needs approval” notifications are off';

  @override
  String get pluginsBackgroundNoApprovalAlerts => 'You won’t get approval alerts while the app is in the background';

  @override
  String get pluginsDoneNotificationsOff => '“Turn ended” notifications are off';

  @override
  String get pluginsBackgroundNoDoneAlerts =>
      'You won’t get completion or error alerts while the app is in the background';

  @override
  String get pluginsTurnOn => 'Turn on';

  @override
  String get pluginsNotificationsDescription => 'Get alerts when chats finish or need you';

  @override
  String get pluginsAllowNotifications => 'Allow notifications';

  @override
  String get pluginsNotificationsAndBanners => 'System notifications and top banners';

  @override
  String get pluginsAlerts => 'Alerts';

  @override
  String get pluginsRemoteAlertsRequirement => 'Remote host alerts need the app running and connected';

  @override
  String get pluginsTurnComplete => 'Turn complete';

  @override
  String get pluginsReplyPreview => 'Include the start of the reply';

  @override
  String get pluginsErrorOrStopped => 'Error or stopped';

  @override
  String get pluginsErrorOrStoppedDescription => 'Request failed, engine restarted, or stopped';

  @override
  String get pluginsApprovalDescription => 'Approval needed to run commands, edit files, and more';

  @override
  String get pluginsQuestions => 'Questions for you';

  @override
  String get pluginsQuestionsDescription => 'AI needs your answer';

  @override
  String get pluginsSystemSettings => 'System settings';

  @override
  String get pluginsLockScreenPrivacy => 'Chat content stays hidden on the lock screen';

  @override
  String get pluginsSoundBannerLockScreen => 'Sound, banners, and lock screen';

  @override
  String get pluginsEnableFloatingNotifications => 'Turn on “Floating notifications” if banners don’t appear';

  @override
  String get pluginsPersonalPreferences => 'Personal preferences';

  @override
  String get pluginsPreferencesDescription => 'New chats will follow these instructions';

  @override
  String get pluginsPreferencesHint => 'For example: Reply in Chinese. I mainly write Flutter.';

  @override
  String get pluginsSaving => 'Saving';

  @override
  String get pluginsShareLink => 'Share link';

  @override
  String get pluginsInstallPlugin => 'Install plugin';

  @override
  String get pluginsImportProfile => 'Import settings';

  @override
  String get pluginsImportTo => 'Import to';

  @override
  String get pluginsInstallTo => 'Install to';

  @override
  String get pluginsVerification => 'Verification';

  @override
  String get pluginsSize => 'Size';

  @override
  String get pluginsVerified => 'Verified';

  @override
  String get pluginsVerificationMismatch => 'Verification mismatch';

  @override
  String get pluginsCannotVerify => 'Can’t verify';

  @override
  String get pluginsVerifying => 'Verifying';

  @override
  String get pluginsPresets => 'Presets';

  @override
  String get pluginsSkills => 'Skills';

  @override
  String get pluginsAdded => 'Added';

  @override
  String get pluginsModified => 'Modified';

  @override
  String get pluginsNoChanges => 'No changes needed';

  @override
  String get pluginsUnavailable => 'Unavailable';

  @override
  String get pluginsHostProfileReadFailed => 'Couldn’t read this host’s settings';

  @override
  String get pluginsAlreadyMatches => 'This host already matches';

  @override
  String get pluginsUnsuccessful => 'Failed';

  @override
  String get pluginsSkipped => 'Skipped';

  @override
  String get pluginsView => 'Inspect';

  @override
  String get pluginsImport => 'Import';

  @override
  String get pluginsHostPluginsReadFailed => 'Couldn’t read this host’s plugins';

  @override
  String pluginsUpdateTo(String version) {
    return 'Update to $version';
  }

  @override
  String pluginsImportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Import $count items',
      one: 'Import 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsImporting => 'Importing';

  @override
  String get pluginsInstallingActive => 'Installing';

  @override
  String pluginsImportFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items failed',
      one: '1 item failed',
    );
    return '$_temp0';
  }

  @override
  String get pluginsCouldNotInstall => 'Couldn’t install';

  @override
  String get pluginsEngineRestartToApply => 'Restart the engine to apply';

  @override
  String pluginsRemoteRestartToApply(String host) {
    return 'Restart DSH on $host to apply';
  }

  @override
  String pluginsImportedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Imported $count items',
      one: 'Imported 1 item',
    );
    return '$_temp0';
  }

  @override
  String get pluginsLocalPluginUnshareable => 'This plugin was installed locally and can’t be shared';

  @override
  String get pluginsSharePlugin => 'Share plugin';

  @override
  String pluginsPluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String pluginsSettingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count settings', one: '1 setting');
    return '$_temp0';
  }

  @override
  String pluginsPresetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count presets', one: '1 preset');
    return '$_temp0';
  }

  @override
  String pluginsSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count skills', one: '1 skill');
    return '$_temp0';
  }

  @override
  String get pluginsNothingSelected => 'Nothing selected';

  @override
  String get pluginsNext => 'Next';

  @override
  String get pluginsNothingToShare => 'Nothing to share';

  @override
  String get pluginsProfileReadFailed => 'Couldn’t read settings';

  @override
  String get pluginsShareProfile => 'Share configuration';

  @override
  String pluginsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count files', one: '1 file');
    return '$_temp0';
  }

  @override
  String get pluginsShareNeedsUpdate => 'Update the app to open this';

  @override
  String get pluginsShareUnusable => 'This share code can’t be used';

  @override
  String get pluginsShareDamaged => 'This share code is incomplete or damaged';

  @override
  String get pluginsShareFileReadFailed => 'Couldn’t read this file';

  @override
  String get pluginsShareOpenFailed => 'Couldn’t open this share code';

  @override
  String get pluginsPluginShareTitle => 'DSH Go plugin';

  @override
  String get pluginsShareSheetOpenFailed => 'Couldn’t open sharing';

  @override
  String get pluginsSavePermissionDenied => 'Couldn’t save without storage permission';

  @override
  String get pluginsQrCode => 'QR code';

  @override
  String get pluginsSaveAsFile => 'Save as file';

  @override
  String get pluginsGistLinkReady => 'Gist link created';

  @override
  String get pluginsTooLargeShareFile => 'Too much content. Share as a file.';

  @override
  String get pluginsGenerateLink => 'Create link';

  @override
  String get pluginsGitHubToken => 'GitHub token';

  @override
  String get pluginsGistPermissionNeeded => 'Gist permission required';

  @override
  String get pluginsGenerateGistLink => 'Create Gist link';

  @override
  String get pluginsShareQrCode => 'Share code QR code';

  @override
  String pluginsUpdateCurrentWarning(String to) {
    return 'The current version will be uninstalled, then $to installed. If installation fails, the plugin will need to be reinstalled.';
  }

  @override
  String pluginsUpdateVersionWarning(String from, String to) {
    return '$from will be uninstalled, then $to installed. If installation fails, the plugin will need to be reinstalled.';
  }

  @override
  String pluginsUninstalledRestartLocal(String title) {
    return 'Uninstalled “$title”. Restart the engine to finish removing it.';
  }

  @override
  String pluginsUninstalledRestartRemote(String title, String host) {
    return 'Uninstalled “$title”. Restart DSH on $host to finish removing it.';
  }

  @override
  String get pluginsEnableFailed => 'Couldn’t enable';

  @override
  String get pluginsDisableFailed => 'Couldn’t disable';

  @override
  String get pluginsEnabledRestartLocal => 'Enabled. Restart the engine to apply.';

  @override
  String pluginsEnabledRestartRemote(String host) {
    return 'Enabled. Restart DSH on $host to apply.';
  }

  @override
  String get pluginsDisabledRestartLocal => 'Disabled. Restart the engine to apply.';

  @override
  String pluginsDisabledRestartRemote(String host) {
    return 'Disabled. Restart DSH on $host to apply.';
  }

  @override
  String pluginsRelayCommandInstruction(String host) {
    return 'DSH Remote only supports turning plugins on or off. Run this in a terminal on $host:';
  }

  @override
  String get pluginsPermissionLocalThirdParty =>
      'Plugins run with DSH’s permissions: they can read and write files, run commands, and read API keys and phone storage you’ve granted access to. They aren’t restricted by the workspace sandbox. Provided by a third party and not reviewed by DSH.';

  @override
  String get pluginsPermissionLocalTrusted =>
      'Plugins run with DSH’s permissions: they can read and write files, run commands, and read API keys and phone storage you’ve granted access to. They aren’t restricted by the workspace sandbox. Only install plugins you trust.';

  @override
  String get pluginsPermissionRemoteThirdParty =>
      'Plugins run with DSH’s permissions: they can read and write files, run commands, and read API keys. They aren’t restricted by the workspace sandbox. Provided by a third party and not reviewed by DSH.';

  @override
  String get pluginsPermissionRemoteTrusted =>
      'Plugins run with DSH’s permissions: they can read and write files, run commands, and read API keys. They aren’t restricted by the workspace sandbox. Only install plugins you trust.';

  @override
  String pluginsSelectedQrCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items selected',
      one: '1 item selected',
    );
    return '$_temp0 · QR code available';
  }

  @override
  String pluginsSelectedFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items selected',
      one: '1 item selected',
    );
    return '$_temp0 · Share as a file';
  }

  @override
  String get pluginsListSeparator => ', ';

  @override
  String pluginsActionFailure(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String pluginsInventorySemantics(String title, String status) {
    return '$title, $status';
  }

  @override
  String pluginsSettingsChanges(String shown, int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$shown and more · $_temp0';
  }

  @override
  String get pluginsLoadStatus => 'Load status';

  @override
  String get pluginsLoadPartial => 'Partly active';

  @override
  String get pluginsLoadFailed => 'Load failed';

  @override
  String get pluginsLoadNotReady => 'Not ready';

  @override
  String get pluginsLoadMetadata => 'Metadata diagnostics';

  @override
  String pluginsLoadRunningCount(int running, int total) {
    return '$running of $total components running';
  }

  @override
  String get pluginsLoadUnreported => 'Not reported';

  @override
  String get pluginsLoadNoRuntimeDetail => 'The host did not return the runtime error details. Check its engine logs.';

  @override
  String get pluginsLoadRemoteLogs => 'Check the engine logs on this host.';

  @override
  String get plugslotsSurfaceComposerActions => 'Composer buttons';

  @override
  String get plugslotsSurfaceMessageActions => 'Message menu';

  @override
  String get plugslotsSurfaceComposerStrip => 'Status line';

  @override
  String get plugslotsSurfacePanel => 'Panels';

  @override
  String get plugslotsNativeUi => 'Native UI';

  @override
  String plugslotsIssueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count problems', one: '1 problem');
    return '$_temp0';
  }

  @override
  String get plugslotsAllGood => 'No problems';

  @override
  String plugslotsViewSize(String size) {
    return 'View $size';
  }

  @override
  String plugslotsInvokeMs(int ms) {
    return '$ms ms';
  }

  @override
  String get plugslotsLastView => 'Last view';

  @override
  String get plugslotsLastInvoke => 'Last response';

  @override
  String get plugslotsProblems => 'Problems';

  @override
  String get plugslotsNoProblems => 'No problems';

  @override
  String plugslotsWantsDraft(String plugin) {
    return '$plugin wants to read your draft';
  }

  @override
  String plugslotsWantsClipboard(String plugin) {
    return '$plugin wants to read your clipboard';
  }

  @override
  String plugslotsWantsBoth(String plugin) {
    return '$plugin wants to read your draft and clipboard';
  }

  @override
  String get plugslotsWantsWhen => 'Only when you tap it';

  @override
  String get plugslotsAllow => 'Allow';

  @override
  String plugslotsNoResponse(String plugin) {
    return '$plugin didn\'t respond';
  }

  @override
  String plugslotsFailed(String plugin) {
    return '$plugin ran into a problem';
  }

  @override
  String get plugslotsNeedsChat => 'Open a chat first';

  @override
  String plugslotsFromPlugin(String plugin) {
    return 'From $plugin';
  }

  @override
  String get plugslotsPanelOffline => 'Can\'t reach the plugin';

  @override
  String plugslotsIssueTooMany(int max) {
    return 'Up to $max; the rest are hidden';
  }

  @override
  String plugslotsIssueTrimmed(int max) {
    return 'Over $max characters; shortened';
  }

  @override
  String plugslotsIssueNeedsApp(String version) {
    return 'Needs DSH Go $version or later';
  }

  @override
  String get plugslotsIssueNewerProtocol => 'Needs a newer app';

  @override
  String get plugslotsIssueUnknownIcon => 'Unknown icon; using the default';

  @override
  String plugslotsIssueUnknownEffect(String name) {
    return 'Unsupported effect \"$name\"';
  }

  @override
  String get plugslotsIssueLate => 'Came back more than 3 s after the tap; ignored';

  @override
  String get plugslotsIssueHttps => 'Only https links';

  @override
  String plugslotsIssueUnknownPage(String page) {
    return 'No page called \"$page\"';
  }

  @override
  String get plugslotsIssueThrottled => 'Notices too frequent; skipped';

  @override
  String plugslotsIssueInvoke(String message) {
    return 'Call failed: $message';
  }

  @override
  String plugslotsIssueStream(String message) {
    return 'Data failed: $message';
  }

  @override
  String get plugslotsIssueMissing => 'Missing a required field';

  @override
  String get plugslotsIssueDuplicate => 'Duplicate id; skipped';

  @override
  String get plugslotsIssueNoPlacement => 'Nowhere to show it';

  @override
  String plugslotsWantsMessage(String plugin) {
    return '$plugin wants to read this reply';
  }

  @override
  String get plugslotsCodeInvalidManifest => 'The declaration is invalid; native parts are off';

  @override
  String get plugslotsCodeInvalidField => 'Wrong format; skipped';

  @override
  String get plugslotsCodeUnknownField => 'Unknown field; ignored';

  @override
  String get plugslotsCodeUnknownSurface => 'Not supported here yet; ignored';

  @override
  String get plugslotsCodeTooMany => 'Too many; the extras are hidden';

  @override
  String get plugslotsCodeTooLong => 'Too long; shortened';

  @override
  String get plugslotsCodeNoHandler => 'Not handled by the plugin yet; hidden';

  @override
  String get plugslotsCodeUndeclared => 'Registered but not declared; ignored';

  @override
  String get plugslotsCodeViewFile => 'Couldn\'t read the view file';

  @override
  String get plugslotsCodeBadEffect => 'Malformed action; skipped';

  @override
  String plugslotsCodeViolation(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count times', one: 'once');
    return 'Failed $_temp0';
  }

  @override
  String get plugslotsCodeDegraded => 'Too many errors; off until the next start';

  @override
  String get plugslotsCodeTimeout => 'The plugin didn\'t answer in time';

  @override
  String get plugslotsCodeRateLimited => 'Tapped too fast';

  @override
  String get plugslotsCodeNotFound => 'The plugin is off or missing';

  @override
  String get plugslotsCodePluginError => 'The plugin failed';

  @override
  String get plugslotsCodeInvalidView => 'The view is invalid';

  @override
  String get plugslotsCodeLimit => 'Too many subscriptions';

  @override
  String get plugslotsCodeOther => 'Other problem';

  @override
  String get plugslotsCodeUnknownEffect => 'Unsupported action; skipped';

  @override
  String get plugslotsNotDone => 'Didn\'t finish';

  @override
  String get plugslotsWorking => 'Working';

  @override
  String get plugslotsTapToCancel => 'Tap to cancel';

  @override
  String get plugslotsCodeTooManyPending => 'Two are still running';

  @override
  String get plugslotsCodeNoStream => 'The connection dropped';

  @override
  String plugslotsVoiceAsk(String plugin) {
    return 'Let $plugin hear you speak?';
  }

  @override
  String get plugslotsVoiceWhen =>
      'Reading stops the moment you speak. Your voice is checked on this phone, never saved or sent';

  @override
  String get plugslotsVoiceDeny => 'Don\'t allow';

  @override
  String get plugslotsVoiceSwitch => 'Hear you speak';

  @override
  String get plugslotsPickerUnavailable => 'File selection is unavailable on this device';

  @override
  String get plugslotsPickerBusy => 'Finish the current file selection first';

  @override
  String plugslotsPickerLimit(int count) {
    return 'Up to $count files, 8 MiB each and 16 MiB total';
  }

  @override
  String get plugslotsPickerFailed => 'Could not share the files with this plugin. Try again';

  @override
  String get plugslotsWebPlacesTitle => 'In DSH Web';

  @override
  String get plugslotsPlaceBesideComposer => 'Beside the composer';

  @override
  String get plugslotsPlaceHeader => 'Conversation header';

  @override
  String get plugslotsPlaceMessages => 'In messages';

  @override
  String get plugslotsPlaceOverlay => 'Floating layer';

  @override
  String get plugslotsPlaceSidebar => 'Sidebar';

  @override
  String get plugslotsPlaceRightbar => 'Right sidebar';

  @override
  String get plugslotsPlaceFiles => 'File previews';

  @override
  String get plugslotsPlaceSettings => 'Settings';

  @override
  String get plugslotsPlacePlugins => 'Plugins page';

  @override
  String get plugslotsPlaceNewChat => 'New conversation';

  @override
  String get plugslotsPlaceElsewhere => 'Elsewhere';

  @override
  String get plugslotsPlaceUnknown => 'Its web interface';

  @override
  String get plugslotsChatEntry => 'Plugins';

  @override
  String plugslotsChatWebFrom(String names) {
    return 'Web plugins · $names';
  }

  @override
  String get plugViewInvalid => 'Plugin view has an error';

  @override
  String get plugViewEmpty => 'No data yet';

  @override
  String get plugViewImageUnavailable => 'Can’t display image';

  @override
  String get plugViewUnavailableList => 'Can’t display list';

  @override
  String get plugViewUnavailableKeyValue => 'Can’t display details';

  @override
  String get plugViewUnavailableProgress => 'Can’t display progress';

  @override
  String get plugViewUnavailableTable => 'Can’t display table';

  @override
  String get plugViewUnavailableActions => 'Can’t display buttons';

  @override
  String plugViewFrom(String name) {
    return 'From $name';
  }

  @override
  String plugViewUnknownTone(String value) {
    return 'Unknown tone $value, ignored; available: good, warn, bad, info, muted';
  }

  @override
  String plugViewBadActionId(String value) {
    return 'Invalid action id $value; this element isn’t tappable';
  }

  @override
  String plugViewBadAction(String shape) {
    return 'An action must be an id string or $shape; ignored';
  }

  @override
  String plugViewArgsLimit(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit bytes', one: '1 byte');
    return 'Action args exceed $_temp0; ignored';
  }

  @override
  String plugViewUnknownIcon(String value) {
    return 'Unknown icon $value; drawn with the default icon';
  }

  @override
  String plugViewExpectedItems(String shape) {
    return 'Expected an array of $shape';
  }

  @override
  String plugViewSkippedItem(String shape) {
    return 'Expected $shape; item skipped';
  }

  @override
  String get plugViewBadMax => 'max must be a number above 0; using 100';

  @override
  String plugViewColumnLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first columns', one: '1 column');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String plugViewFirstColumns(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit columns', one: '1 column');
    return 'Showing only the first $_temp0';
  }

  @override
  String plugViewFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit rows', one: '1 row');
    return 'Showing only the first $_temp0';
  }

  @override
  String get plugViewOnePrimary => 'A view has at most one primary button; this one is drawn as plain';

  @override
  String get plugViewBadImageSource =>
      'Images take a plugin asset (asset:<path>, png, jpg, webp or gif) or a data:image/… URL';

  @override
  String get plugViewBadAspect => 'aspect must be a number from 0.25 to 4; ignored';

  @override
  String plugViewImageTooLarge(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit bytes', one: '1 byte');
    return 'data: image exceeds $_temp0';
  }

  @override
  String get plugViewImageDecode => 'Image can’t be decoded (PNG, JPEG, WebP or GIF only)';

  @override
  String get plugViewImagePixels => 'Image exceeds the size limit: 4096 per side, 4 million pixels in total';

  @override
  String plugViewTooDeep(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit levels', one: '1 level');
    return 'JSON nested deeper than $_temp0';
  }

  @override
  String get plugViewV2Content => 'Plugin content';

  @override
  String plugViewVersionFallback(String version) {
    return 'View version $version is not supported; using the compatible view';
  }

  @override
  String plugViewStyleInvalid(String values) {
    return 'Invalid style; expected $values';
  }

  @override
  String get plugViewStyleReserved => 'This appearance is reserved for the app; ignored';

  @override
  String get plugViewStyleContainerOnly => 'This style is only available on stack and row';

  @override
  String get plugViewStyleTextOnly => 'This style is only available on text, metric and callout';

  @override
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum) {
    return '$mode: $before adjusted to $after, contrast at least $minimum:1';
  }

  @override
  String get plugViewRichLimit => 'Rich text exceeds the limit; truncated';

  @override
  String plugViewBadTrend(int max) {
    return 'trend takes 2–$max numbers (nulls allowed); ignored';
  }

  @override
  String plugViewGalleryPicture(int index) {
    return 'Picture $index';
  }

  @override
  String get readListUpdating => 'Updating · previous results';

  @override
  String get readListOffline => 'Offline · previous results';

  @override
  String get readListFailed => 'Not updated · previous results';

  @override
  String get remoteStartupSection => 'On launch';

  @override
  String get remoteAutoConnectOnStartup => 'Connect to the last host';

  @override
  String get remoteAutoConnectOnStartupHint => 'When off, start on this phone';

  @override
  String get remoteStepConnect => 'Connect to server';

  @override
  String get remoteStepVerifyHostKey => 'Verify host fingerprint';

  @override
  String get remoteStepStartDsh => 'Start DSH';

  @override
  String get remoteStepTunnel => 'Create tunnel';

  @override
  String get remoteConnecting => 'Connecting';

  @override
  String get remoteConnected => 'Connected';

  @override
  String get remoteReconnecting => 'Reconnecting';

  @override
  String remoteReconnectAttempt(int count) {
    return 'Reconnecting · Attempt $count';
  }

  @override
  String get remoteErrInvalidServer => 'Invalid server address';

  @override
  String get remoteErrEmailPassword => 'Incorrect email or password';

  @override
  String get remoteErrHostNotInAccount => 'This host isn’t in your account';

  @override
  String get remoteHostFallback => 'This host';

  @override
  String get remoteErrHostOffline => 'Host is offline';

  @override
  String remoteErrHostRemoved(String name) {
    return '$name is no longer in your DSH Remote account';
  }

  @override
  String get remoteErrRelaySignInExpired => 'DSH Remote sign-in expired';

  @override
  String get remoteErrIdentityKeyChanged => 'Host identity key has changed';

  @override
  String get remoteErrIdentityUnconfirmed => 'Host identity fingerprint hasn’t been confirmed';

  @override
  String get remoteErrConnectionReplaced => 'Remote connection was replaced';

  @override
  String get remoteErrHostRejected => 'Host declined the connection';

  @override
  String get remoteErrHostNotOwned => 'Host isn’t in your DSH Remote account';

  @override
  String get remoteErrUpdateNeeded => 'Version mismatch. Update DSH Go and the host’s remote plugin';

  @override
  String get remoteErrVersionIncompatible => 'Update DSH or the remote plugin on the host';

  @override
  String get remoteErrSignInTimeout => 'Sign-in timed out';

  @override
  String get remoteSignInCancelled => 'Sign-in cancelled';

  @override
  String get remoteErrBrowserSignInUnsupported => 'Server doesn’t support browser sign-in';

  @override
  String get remoteErrTooManyRequests => 'Too many requests';

  @override
  String get remoteErrHostUnreachable => 'Can’t reach the remote host';

  @override
  String get remoteErrRemoteConnection => 'Couldn’t connect remotely';

  @override
  String get remoteOnline => 'Online';

  @override
  String get remoteOffline => 'Offline';

  @override
  String get remoteUnavailable => 'Unavailable';

  @override
  String get remoteErrHostNotFound => 'Host not found';

  @override
  String get remoteConnectionStopped => 'Remote connection stopped';

  @override
  String remoteBootstrapReusePort(int port) {
    return 'Using running DSH (port $port)';
  }

  @override
  String get remoteBootstrapStarting => 'Starting remote DSH…';

  @override
  String remoteErrCommandNotFound(String command) {
    return '“$command” not found on the host';
  }

  @override
  String get remoteErrDshMissing =>
      'dsh isn’t installed on the host. Install it and retry, or enter its full path as the start command.';

  @override
  String get remoteStartCommandExample => 'Example start command: ~/.nvm/versions/node/v22.0.0/bin/dsh web';

  @override
  String get remoteErrDshStartTimeout => 'Remote DSH took too long to start';

  @override
  String get remoteErrDshExited => 'Remote DSH exited right after starting';

  @override
  String get remoteErrDshStart => 'Couldn’t start remote DSH';

  @override
  String remoteExitCode(int code) {
    return 'Exit code $code';
  }

  @override
  String get remoteErrNoShell => 'Host has no sh. Only Linux and macOS are supported.';

  @override
  String get remoteErrFingerprintChanged => 'Host fingerprint changed. Disconnected.';

  @override
  String get remoteErrFingerprintUnconfirmed => 'Host fingerprint hasn’t been confirmed';

  @override
  String get remoteHostTrustCancelled => 'Host trust cancelled';

  @override
  String get remoteCheckingDsh => 'Checking remote DSH…';

  @override
  String get remoteErrDshPort => 'Can’t reach the remote DSH port';

  @override
  String get remoteDshReused => 'Using DSH already running on the host';

  @override
  String get remoteDshStarted => 'Started DSH on the host';

  @override
  String get remoteErrDshTokenRejected => 'Remote DSH rejected the sign-in token';

  @override
  String get remoteErrDshSignIn => 'Couldn’t sign in to remote DSH';

  @override
  String get remoteErrDshTunnel => 'Couldn’t connect to DSH through the tunnel';

  @override
  String get remoteErrDshSignInExpired => 'Remote DSH sign-in expired';

  @override
  String get remoteErrDshStopped => 'Remote DSH stopped running';

  @override
  String get remoteErrSshDisconnected => 'SSH disconnected';

  @override
  String get remoteErrSshUnresponsive => 'SSH isn’t responding';

  @override
  String remoteRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Retried $count times',
      one: 'Retried once',
    );
    return '$_temp0';
  }

  @override
  String get remoteErrSshNetworkChanged => 'SSH disconnected after a network change';

  @override
  String get remoteErrReadFingerprint => 'Couldn’t read the host fingerprint';

  @override
  String get remoteErrNoFingerprint => 'Server didn’t provide a host fingerprint';

  @override
  String get remoteErrPasswordMissing => 'Enter a password';

  @override
  String remoteErrAddressUnresponsive(String host, int port) {
    return '$host:$port isn’t responding';
  }

  @override
  String get remoteErrPrivateKeyMissing => 'Enter a private key';

  @override
  String get remoteErrKeyNeedsPassword => 'This private key needs a passphrase';

  @override
  String get remoteErrKeyPassword => 'Incorrect private key passphrase';

  @override
  String get remoteErrKeyUnreadable => 'Couldn’t read the private key';

  @override
  String remotePrivateKeyFormats(String error) {
    return 'Supports Ed25519, RSA and ECDSA private keys in OpenSSH and PEM formats.\n$error';
  }

  @override
  String remoteErrAddressRejected(String address) {
    return '$address refused the connection';
  }

  @override
  String remoteErrSshHostNotFound(String host) {
    return 'Host $host not found';
  }

  @override
  String remoteErrSshAddressUnresponsive(String address) {
    return '$address isn’t responding';
  }

  @override
  String get remoteErrUsernamePassword => 'Incorrect username or password';

  @override
  String get remoteErrPrivateKeyRejected => 'Server doesn’t accept this private key';

  @override
  String remoteAuthorizedKeysHelp(String username, String error) {
    return 'Check that the public key is in $username’s ~/.ssh/authorized_keys.\n$error';
  }

  @override
  String get remoteErrFingerprintUntrusted => 'Host fingerprint isn’t trusted';

  @override
  String get remoteErrSshHandshakeTimeout => 'SSH handshake timed out';

  @override
  String get remoteErrSshInterrupted => 'SSH connection interrupted';

  @override
  String get remoteErrSshConnection => 'Couldn’t connect over SSH';

  @override
  String get remoteErrCommandTimeout => 'Remote command timed out';

  @override
  String get remoteHostedErrNetwork => 'Can’t reach the sharing service. Check your connection and try again.';

  @override
  String get remoteHostedErrTooLarge => 'Chat is too large to create a link';

  @override
  String get remoteHostedErrRateLimited => 'Sharing too often. Try again later.';

  @override
  String get remoteHostedErrCreate => 'Couldn’t create link';

  @override
  String get remoteHostedErrUnavailable => 'Sharing service is unavailable. Try again later.';

  @override
  String get remoteHostedErrGone => 'Link expired or was deleted';

  @override
  String get remoteHostedErrForbidden => 'You don’t have permission to delete this link';

  @override
  String get remoteHostedErrBroken => 'Link is incomplete or damaged';

  @override
  String get remoteChat => 'Chat';

  @override
  String get remoteHostedTtlWeek => '7 days';

  @override
  String get remoteHostedTtlMonth => '30 days';

  @override
  String get remoteHostedTtlForever => 'Forever';

  @override
  String get remoteForumSignIn => 'Sign in to Forum';

  @override
  String get remoteForumSignInBenefits => 'Post, reply and like';

  @override
  String get remoteForumFinishSignIn => 'Finish signing in in your browser';

  @override
  String get remoteReopenBrowser => 'Reopen browser';

  @override
  String get remoteForumSettings => 'Forum settings';

  @override
  String get remoteForumAccount => 'Forum account';

  @override
  String get remoteForumTopic => 'Topic';

  @override
  String get remoteForumLikesReceived => 'Likes received';

  @override
  String get remoteForumDaysVisited => 'Days visited';

  @override
  String get remoteForumNotifications => 'Notifications';

  @override
  String remoteForumUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count unread', one: '1 unread');
    return '$_temp0';
  }

  @override
  String get remoteForumErrAddress => 'Invalid address';

  @override
  String get remoteForumAddress => 'Forum address';

  @override
  String remoteForumDefaultAddress(String host) {
    return 'Default: $host';
  }

  @override
  String get remoteRestoreDefault => 'Restore default';

  @override
  String get remoteForumUploadingImage => 'Uploading image…';

  @override
  String get remoteForumErrUploadImage => 'Couldn’t upload image';

  @override
  String get remoteForumTitleRequired => 'Add a title first';

  @override
  String get remoteForumCategoryRequired => 'Choose a category';

  @override
  String get remoteForumBodyRequired => 'Write something before sending';

  @override
  String remoteForumReplyCaption(String username, String title) {
    return 'Reply to @$username · $title';
  }

  @override
  String get remoteForumNewTopic => 'New topic';

  @override
  String get remoteForumTitle => 'Title';

  @override
  String get remoteForumComposerHint => 'Write something. Markdown supported.';

  @override
  String get remoteForumPublish => 'Publish';

  @override
  String get remoteForumImage => 'Image';

  @override
  String get remoteForumAttachShareCode => 'Attach share code';

  @override
  String get remoteForumPendingApproval => 'Submitted. Visible after approval.';

  @override
  String get remoteForumLatest => 'Latest';

  @override
  String get remoteForumTop => 'Top';

  @override
  String get remoteForumErrOpen => 'Couldn’t open Forum';

  @override
  String get remoteForumNoTopics => 'No topics yet';

  @override
  String get remoteForumPost => 'Post';

  @override
  String get remoteForum => 'Forum';

  @override
  String remoteForumNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Notifications, $count unread',
      one: 'Notifications, 1 unread',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumSearch => 'Search';

  @override
  String get remoteForumSearchHint => 'Search topics and posts';

  @override
  String get remoteForumSignedIn => 'Signed in to Forum';

  @override
  String get remoteForumSignInForNotifications => 'Sign in to see notifications';

  @override
  String get remoteForumErrNotifications => 'Couldn’t load notifications';

  @override
  String get remoteForumNoNotifications => 'No notifications yet';

  @override
  String get remoteForumMarkAllRead => 'Mark all read';

  @override
  String get remoteForumSomeone => 'Someone';

  @override
  String remoteForumNotificationMention(String who) {
    return '$who mentioned you';
  }

  @override
  String remoteForumNotificationGroupMention(String who) {
    return '$who mentioned your group';
  }

  @override
  String remoteForumNotificationReply(String who) {
    return '$who replied to you';
  }

  @override
  String remoteForumNotificationQuote(String who) {
    return '$who quoted you';
  }

  @override
  String remoteForumNotificationEdit(String who) {
    return '$who edited your post';
  }

  @override
  String remoteForumNotificationLikes(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who and others ($count people) liked your post',
      one: '$who liked your post',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationLike(String who) {
    return '$who liked your post';
  }

  @override
  String remoteForumNotificationLikedPosts(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who liked $count of your posts',
      one: '$who liked 1 of your posts',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationReaction(String who) {
    return '$who reacted to your post';
  }

  @override
  String remoteForumNotificationMessage(String who) {
    return '$who sent you a private message';
  }

  @override
  String remoteForumNotificationMessageInvite(String who) {
    return '$who invited you to a private message';
  }

  @override
  String remoteForumNotificationTopicInvite(String who) {
    return '$who invited you to a topic';
  }

  @override
  String remoteForumNotificationNewReply(String who) {
    return '$who posted a new reply';
  }

  @override
  String remoteForumNotificationNewTopic(String who) {
    return '$who posted a new topic';
  }

  @override
  String remoteForumNotificationLink(String who) {
    return '$who linked to your post';
  }

  @override
  String remoteForumNotificationBadge(String badge) {
    return 'Earned the “$badge” badge';
  }

  @override
  String remoteForumNotificationMoved(String who) {
    return '$who moved your post';
  }

  @override
  String get remoteForumBookmarkReminder => 'Bookmark reminder';

  @override
  String get remoteForumTopicReminder => 'Topic reminder';

  @override
  String get remoteForumPostApproved => 'Your post was approved';

  @override
  String get remoteForumAdminProblems => 'Forum has issues to resolve';

  @override
  String get remoteForumNewNotification => 'New notification';

  @override
  String get remoteForumUnread => 'Unread';

  @override
  String get remoteForumErrShareCode => 'Couldn’t open share code';

  @override
  String get remoteForumPoll => 'Poll';

  @override
  String get remoteForumVideo => 'Video';

  @override
  String get remoteForumEmbed => 'Embedded content';

  @override
  String get remoteForumVoteOnWeb => 'Vote on Web';

  @override
  String get remoteForumErrSearch => 'Couldn’t search';

  @override
  String remoteForumNoSearchResults(String term) {
    return 'No results for “$term”';
  }

  @override
  String get remoteForumBookmarkRemoved => 'Bookmark removed';

  @override
  String get remoteForumBookmarkAdded => 'Bookmarked';

  @override
  String get remoteLinkCopied => 'Link copied';

  @override
  String get remoteForumErrTopic => 'Couldn’t open this topic';

  @override
  String get remoteForumTopicClosed => 'Topic is closed';

  @override
  String get remoteForumReplyHint => 'Write a reply…';

  @override
  String get remoteForumSignInToReply => 'Sign in to reply';

  @override
  String remoteForumReplyTo(String username) {
    return 'Reply to @$username';
  }

  @override
  String get remoteForumPostDeleted => 'Post deleted';

  @override
  String get remoteForumPostHidden => 'Post hidden';

  @override
  String get remoteForumUnlike => 'Unlike';

  @override
  String get remoteForumLike => 'Like';

  @override
  String get remoteForumRemoveBookmark => 'Remove bookmark';

  @override
  String get remoteForumBookmark => 'Bookmark';

  @override
  String get remoteForumActionPinned => 'Pinned the topic';

  @override
  String get remoteForumActionUnpinned => 'Unpinned the topic';

  @override
  String get remoteForumActionClosed => 'Closed the topic';

  @override
  String get remoteForumActionReopened => 'Reopened the topic';

  @override
  String get remoteForumActionAutoClosed => 'Topic closed automatically';

  @override
  String get remoteForumActionAutoOpened => 'Topic opened automatically';

  @override
  String get remoteForumActionArchived => 'Archived the topic';

  @override
  String get remoteForumActionUnarchived => 'Unarchived the topic';

  @override
  String get remoteForumActionListed => 'Made the topic public';

  @override
  String get remoteForumActionUnlisted => 'Unlisted the topic';

  @override
  String get remoteForumActionSplit => 'Split the topic';

  @override
  String get remoteForumActionBanner => 'Made the topic a banner';

  @override
  String get remoteForumActionRemoveBanner => 'Removed the banner';

  @override
  String get remoteForumActionUpdated => 'Updated the topic';

  @override
  String get remoteLoading => 'Loading';

  @override
  String get remoteForumJustNow => 'Just now';

  @override
  String remoteForumMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min ago', one: '1 min ago');
    return '$_temp0';
  }

  @override
  String remoteForumHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h ago', one: '1 h ago');
    return '$_temp0';
  }

  @override
  String remoteForumDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count days ago', one: '1 day ago');
    return '$_temp0';
  }

  @override
  String remoteForumReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count replies', one: '1 reply');
    return '$_temp0';
  }

  @override
  String remoteForumNewReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count new replies', one: '1 new reply');
    return '$_temp0';
  }

  @override
  String get remoteForumNew => 'New';

  @override
  String remoteForumErrorRetry(String error) {
    return '$error · Retry';
  }

  @override
  String get remoteForumNoMore => 'No more';

  @override
  String get remoteHostKeyTrustTitle => 'Trust this host?';

  @override
  String remoteHostKeyFirstConnection(String name, String address) {
    return 'First connection to “$name” ($address). Check the fingerprint to confirm it’s your host.';
  }

  @override
  String get remoteHostKeyTrustConnect => 'Trust and connect';

  @override
  String get remoteHostKeyChangedTitle => 'Identity fingerprint changed';

  @override
  String remoteRelayKeyChangedBody(String name) {
    return 'The identity key for “$name” has changed. Continue only if you’ve reinstalled the remote plugin on this host. Someone may be impersonating it.';
  }

  @override
  String remoteRelayKeyFirstBody(String name) {
    return 'First connection to “$name”. Check that the identity fingerprint matches the one shown by the host’s remote plugin before continuing.';
  }

  @override
  String get remoteHostKeyChangeWarning => 'DSH will refuse to connect if the fingerprint changes.';

  @override
  String get remoteHostKeyTrustAgain => 'Trust again';

  @override
  String get remoteHostKeyReading => 'Reading host fingerprint…';

  @override
  String remoteHostSwitcherSemantics(String name, String status) {
    return 'Current host: $name, $status. Switch host';
  }

  @override
  String get remoteSwitchHost => 'Switch host';

  @override
  String get remoteThisPhoneDsh => 'DSH on this phone';

  @override
  String get remoteRemoteLabel => 'Remote';

  @override
  String remoteRemotePlatform(String platform) {
    return 'Remote · $platform';
  }

  @override
  String get remoteRelaySwitchWarning =>
      'DSH Remote connects to one host at a time. Switching disconnects the previous host.';

  @override
  String get remoteConnectComputer => 'Connect a computer or server';

  @override
  String get remoteManageHosts => 'Manage remote hosts';

  @override
  String get remoteConnectionMethods => 'Via SSH or DSH Remote';

  @override
  String get remoteRelayLoginRequired => 'Enter the server address, email and password';

  @override
  String get remoteErrSignIn => 'Couldn’t sign in';

  @override
  String get remoteSelfHostedServer => 'Self-hosted server';

  @override
  String get remoteSelfHostedSignInHelp => 'Sign in to your own liguobao/ds-harness-remote with email and password';

  @override
  String get remoteServerAddress => 'Server address';

  @override
  String get remoteEmail => 'Email';

  @override
  String get remotePassword => 'Password';

  @override
  String get remoteRestoreServer => 'Restore default server dsh.r2049.cn';

  @override
  String get remoteConsole => 'Remote console';

  @override
  String get remoteHostsIntro => 'Keep using DSH from your computer or server on your phone';

  @override
  String get remoteSshHosts => 'SSH hosts';

  @override
  String get remoteSshRequirements => 'Host needs SSH enabled and DSH installed';

  @override
  String get remoteAddSshHost => 'Add SSH host';

  @override
  String get remoteSshDirect => 'No third-party server';

  @override
  String get remoteOtherMethods => 'Other methods';

  @override
  String get remoteWebConsole => 'Web remote console';

  @override
  String get remoteWebConsoleProvider => 'dsh.r2049.cn · Third-party page';

  @override
  String remoteActiveHost(String name) {
    return 'Using “$name”';
  }

  @override
  String get remoteSwitchToPhone => 'Use this phone';

  @override
  String get remoteSignInAgain => 'Sign in again';

  @override
  String get remoteHostSettings => 'Host settings';

  @override
  String get remoteReconnect => 'Reconnect';

  @override
  String get remoteReconnectingEllipsis => 'Reconnecting…';

  @override
  String remoteReconnectReason(String reason) {
    return 'Reconnecting · $reason';
  }

  @override
  String get remoteConnectedEncrypted => 'Connected · End-to-end encrypted';

  @override
  String remoteConnectedSsh(String address) {
    return 'Connected · SSH $address';
  }

  @override
  String get remoteErrRefreshHosts => 'Couldn’t refresh host list';

  @override
  String get remoteSwitchWarning => 'Connects to one host at a time. Switching disconnects the previous host.';

  @override
  String get remoteRefreshHosts => 'Refresh hosts';

  @override
  String get remoteSignOut => 'Sign out';

  @override
  String get remoteErrHostsRetry => 'Couldn’t load hosts · Tap to retry';

  @override
  String get remoteNoHosts => 'No hosts yet';

  @override
  String get remoteRelaySetupHelp => 'Install the remote plugin in the host’s DSH and sign in';

  @override
  String get remoteRelaySignOutTitle => 'Sign out of DSH Remote?';

  @override
  String get remoteRelaySignOutBody =>
      'This phone will be removed from your account. DSH and chats on the host stay. You can sign in again anytime.';

  @override
  String get remoteRelaySignInTitle => 'Sign in to DSH Remote';

  @override
  String get remoteRelaySignInHelp => 'No network setup. End-to-end encrypted connection.';

  @override
  String get remoteBrowserSignIn => 'Sign in in browser';

  @override
  String remoteSignInWithProvider(String provider) {
    return 'Continue with $provider';
  }

  @override
  String get remoteComingSoon => 'Coming soon';

  @override
  String get remoteSelfHostedEmailSignIn => 'Self-hosted server · Email sign-in';

  @override
  String get remoteBrowserSignInPending => 'Finish signing in in your browser…';

  @override
  String get remoteCopySignInLink => 'Copy sign-in link';

  @override
  String get remoteSshAddressRequired => 'Enter a host address (IP or domain)';

  @override
  String get remoteSshUsernameRequired => 'Enter a username';

  @override
  String get remoteSshPasswordRequired => 'Enter an SSH password, or use a private key';

  @override
  String get remoteSshKeyRequired => 'Paste the full private key (starting with -----BEGIN)';

  @override
  String get remoteHostKeyResetTitle => 'Reset host fingerprint?';

  @override
  String get remoteHostKeyResetBody =>
      'Only do this if the host was reinstalled or replaced. You’ll be asked to check the fingerprint next time you connect.';

  @override
  String get remoteReset => 'Reset';

  @override
  String remoteDeleteHostTitle(String name) {
    return 'Delete “$name”?';
  }

  @override
  String get remoteDeleteHostBody =>
      'This host’s settings and the password and private key saved on this phone will be deleted. DSH and chats on the host stay.';

  @override
  String remoteErrReadKey(String error) {
    return 'Couldn’t read: $error';
  }

  @override
  String get remoteErrPublicKeyFile => 'This isn’t a private key. Choose the file without .pub (such as id_ed25519).';

  @override
  String get remotePrivateKeyImported => 'Private key imported. You can delete the original file.';

  @override
  String get remoteEditHost => 'Edit host';

  @override
  String get remoteSshHostIntro => 'Connect to DSH on your computer or server';

  @override
  String get remoteHostBasicInfo => 'Basic information';

  @override
  String get remoteHostNameHint => 'For example: computer, home Mac';

  @override
  String get remoteHost => 'Host';

  @override
  String get remoteHostAddressHint => '192.168.1.20 or example.com';

  @override
  String get remoteUsername => 'Username';

  @override
  String get remotePort => 'Port';

  @override
  String get remoteAuthentication => 'Sign-in method';

  @override
  String get remotePasswordStorageHelp => 'Saved only on this phone, encrypted by Android Keystore';

  @override
  String get remoteKeyStorageHelp =>
      'Saved only on this phone, encrypted by Android Keystore. Supports Ed25519, RSA and ECDSA.';

  @override
  String get remotePrivateKey => 'Private key';

  @override
  String get remoteShow => 'Show';

  @override
  String get remoteImportKeyFile => 'Import from file';

  @override
  String get remotePrivateKeyPassword => 'Private key passphrase (optional)';

  @override
  String get remoteStartCommand => 'Start command';

  @override
  String get remoteStartCommandHelp => 'If installed with nvm, you can enter the full path';

  @override
  String get remoteWorkingDirectory => 'Working directory (optional)';

  @override
  String get remoteWorkingDirectoryHelp => 'Default folder for new chats. Supports ~/.';

  @override
  String get remoteHostFingerprint => 'Host fingerprint';

  @override
  String get remoteHostKeyNotConfirmed => 'Not confirmed yet';

  @override
  String get remoteHostKeyFirstCheck => 'You’ll be asked to check the fingerprint on first connection';

  @override
  String get remoteDeleteHost => 'Delete this host';

  @override
  String get remoteTesting => 'Testing';

  @override
  String get remoteTestConnection => 'Test';

  @override
  String get remoteHostedUpdateRequired => 'Update DSH to open this link';

  @override
  String get remoteHostedCannotOpen => 'Can’t open this link';

  @override
  String get remoteOpening => 'Opening…';

  @override
  String get remoteHostedNeverExpires => 'Never expires';

  @override
  String get remoteHostedExpired => 'Expired';

  @override
  String get remoteHostedExpiresToday => 'Expires today';

  @override
  String get remoteHostedExpiresTomorrow => 'Expires tomorrow';

  @override
  String remoteHostedExpiresOn(String date) {
    return 'Expires $date';
  }

  @override
  String get remoteHostedDeleteTitle => 'Delete this link?';

  @override
  String remoteHostedDeleteBody(String title) {
    return 'The link for “$title” will stop working immediately';
  }

  @override
  String get remoteHostedLinkDeleted => 'Link deleted';

  @override
  String get remoteUndo => 'Undo';

  @override
  String get remoteHostedMyLinks => 'My shared links';

  @override
  String get remoteHostedNoLinks => 'No shared links yet';

  @override
  String get remoteHostedErrDeleteNetwork => 'Couldn’t delete. Check your connection and try again.';

  @override
  String get remoteHostedErrDelete => 'Couldn’t delete. Try again later.';

  @override
  String get remoteDirectoryPickerTitle => 'Choose folder';

  @override
  String get remoteDirectoryChoose => 'Choose';

  @override
  String get remoteDirectoryDefault => 'Default working directory';

  @override
  String get remoteDirectoryHome => 'Home';

  @override
  String get remoteDirectoryPhoneStorage => 'Phone storage';

  @override
  String get remoteDirectoryDownloads => 'Downloads';

  @override
  String get remoteDirectoryDownloadsPath => 'Phone storage/Download';

  @override
  String get remoteDirectoryDocuments => 'Documents';

  @override
  String get remoteDirectoryDocumentsPath => 'Phone storage/Documents';

  @override
  String get remoteDirectoryLocations => 'Locations';

  @override
  String get remoteDirectoryRecent => 'Recent';

  @override
  String get remoteDirectoryEnterPath => 'Enter path';

  @override
  String get remoteDirectoryGo => 'Go';

  @override
  String get remoteDirectoryAbsolutePath => 'Enter the full path, starting with “/”';

  @override
  String get remoteDirectoryNewFolder => 'New folder';

  @override
  String remoteDirectoryParentCaption(String name) {
    return 'In “$name”';
  }

  @override
  String get remoteDirectoryFolderName => 'Folder name';

  @override
  String get remoteDirectoryRoot => 'Root';

  @override
  String get remoteDirectoryErrCreate => 'Couldn’t create folder';

  @override
  String get remoteDirectoryNoSubfolders => 'No subfolders here';

  @override
  String get remoteDirectoryHideHidden => 'Hide hidden folders';

  @override
  String remoteDirectoryShowHidden(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Show $count hidden folders',
      one: 'Show 1 hidden folder',
    );
    return '$_temp0';
  }

  @override
  String get remoteDirectoryTruncated => 'Too many folders. Only the first ones are listed.';

  @override
  String get remoteWorkspaceAdd => 'Add workspace';

  @override
  String remoteWorkspaceAdded(String name) {
    return 'Added “$name”';
  }

  @override
  String get remoteWorkspaceErrAdd => 'Couldn’t add workspace';

  @override
  String get remoteWorkspaceNoChats => 'No chats';

  @override
  String remoteWorkspaceChatCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count chats', one: '1 chat');
    return '$_temp0';
  }

  @override
  String get remoteWorkspaceErrRename => 'Couldn’t rename';

  @override
  String remoteWorkspaceRemoved(String name) {
    return 'Removed “$name”';
  }

  @override
  String get remoteWorkspaceErrRemove => 'Couldn’t remove workspace';

  @override
  String get remoteWorkspaceRename => 'Rename workspace';

  @override
  String get remoteWorkspaceName => 'Workspace name';

  @override
  String get remoteWorkspaceNameRequired => 'Give it a name';

  @override
  String remoteWorkspaceRemoveTitle(String name) {
    return 'Remove “$name”?';
  }

  @override
  String get remoteWorkspaceRemoveBody => 'Folder and chats stay';

  @override
  String get remoteWorkspaceRemove => 'Remove';

  @override
  String get remoteWorkspace => 'Workspace';

  @override
  String get remoteWorkspaceNewChatHere => 'New chat here';

  @override
  String get remoteWorkspaceUnpin => 'Unpin';

  @override
  String get remoteWorkspaceGroup => 'Group';

  @override
  String get remoteWorkspaceUngrouped => 'Ungrouped';

  @override
  String get remoteWorkspaceRemoveAction => 'Remove workspace';

  @override
  String get remoteWorkspaceNewGroup => 'New group';

  @override
  String get remoteWorkspaceGroupName => 'Group name';

  @override
  String remoteDirectoryPhonePath(String path) {
    return 'Phone storage/$path';
  }

  @override
  String get remoteDirectoryInvalidName => 'Name can’t contain “/”';

  @override
  String get remoteWorkspaceErrNameConflict => 'A workspace with this name already exists';

  @override
  String get remoteWorkspaceErrInvalidPath => 'This folder can’t be used as a workspace';

  @override
  String get remoteWorkspaceErrNotFound => 'This workspace no longer exists';

  @override
  String get remoteDirectoryErrUnreadable => 'Couldn’t open this folder';

  @override
  String get remoteDirectoryErrExists => 'A folder with this name already exists';

  @override
  String get remoteDirectoryErrUnavailable => 'This host can’t browse folders here';

  @override
  String get remoteWorkspaceErrUnsupported => 'This host doesn’t support this action';

  @override
  String get remoteWorkspaceAllChats => 'All chats';

  @override
  String remoteWorkspaceSwitcherSemantics(String name) {
    return 'Workspace: $name. Switch workspace';
  }

  @override
  String get remoteWorkspaceManage => 'Manage workspaces';

  @override
  String get remoteWorkspaceErrLoad => 'Couldn’t load workspaces';

  @override
  String get remoteWorkspaceEmpty => 'No workspaces yet';

  @override
  String get remoteWorkspaceEmptyHint => 'Add the folders you use most';

  @override
  String remoteWorkspaceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count workspaces', one: '1 workspace');
    return '$_temp0';
  }

  @override
  String remoteDirectoryConfirmFolder(String action, String name) {
    return '$action “$name”';
  }

  @override
  String remoteHostKeyMismatchDetail(String saved, String received, String type) {
    return 'If the host was reinstalled or replaced, reset its fingerprint in host settings.\nSaved: $saved\nReceived: $received ($type)';
  }

  @override
  String remoteForumCompactReplies(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label replies', one: '$label reply');
    return '$_temp0';
  }

  @override
  String remoteForumCompactViews(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label views', one: '$label view');
    return '$_temp0';
  }

  @override
  String remoteForumYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteHostedMonthDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String remoteHostedYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteForumTenThousands(String value) {
    return '$value × 10,000';
  }

  @override
  String get remoteForumSemanticsSeparator => ', ';

  @override
  String remoteHostKeyVerifyCommand(String command) {
    return 'Run $command on that host to see the same fingerprint. DSH will refuse to connect if it changes.';
  }

  @override
  String remoteSshInstallCommand(String command) {
    return 'DSH not installed? Run $command on the host.';
  }

  @override
  String remoteRelayProvider(String project) {
    return 'Service by $project';
  }

  @override
  String remoteRelayProviderServer(String project, String server) {
    return 'Service by $project · Current server: $server';
  }

  @override
  String remoteQuotedHostName(String name) {
    return '“$name”';
  }

  @override
  String remoteErrorDetail(String message, String detail) {
    return '$message ($detail)';
  }

  @override
  String get riskDontShowAgain => 'Don’t show again';

  @override
  String get riskAskAi => 'Not sure? Ask AI';

  @override
  String get riskConfirmAlwaysAction => 'Skip confirmation';

  @override
  String get riskFullAccessAction => 'Turn on Full access';

  @override
  String get riskAutoReviewAction => 'Turn on Auto review';

  @override
  String get riskAllowForChatTitle => 'Allow everything in this chat?';

  @override
  String get riskAllowForChatBody =>
      'Commands and changes in this chat run without asking. Turn it off above the message box anytime.';

  @override
  String get riskAllowForChatAction => 'Allow all';

  @override
  String get riskPetOverlayTitle => 'Show over other apps?';

  @override
  String get riskPetOverlayBody =>
      'Turn on “Display over other apps” for DSH Go in system settings so your pet can appear outside the app.';

  @override
  String get riskPetOverlayAction => 'Open settings';

  @override
  String get askAiTooltip => 'Ask AI';

  @override
  String get askAiHelpTitle => 'Help';

  @override
  String get askAiHelpSubtitle => 'Ask AI about anything here';

  @override
  String askAiAboutApp(String question) {
    return 'About the DSH Go app: $question';
  }

  @override
  String askAiWithGuide(String question) {
    return 'About the DSH Go app: $question\nPlease answer from the attached guide.';
  }

  @override
  String get askAiNoGuide => 'This host doesn’t have the DSH Go guide, so answers may be off';

  @override
  String get askAiQuestionOverview => 'What can DSH Go do, and where should I start?';

  @override
  String get askAiQuestionPhoneControl => 'How does phone control work, and what are the risks?';

  @override
  String get askAiQuestionPhoneAlways =>
      'What changes with “Always skip confirmation” in phone control, and how is it riskier than asking each time?';

  @override
  String get askAiQuestionAppRules =>
      'What is the app list in phone control for, and what are the risks of allowing banking and payment apps?';

  @override
  String get askAiQuestionFullAccess => 'What happens with full access on, and what are the risks?';

  @override
  String get askAiQuestionPhoneFiles =>
      'With “Access phone files” on, which files can AI read and change, and how do I turn it off?';

  @override
  String get askAiQuestionAllowForChat => 'What does “Allow for chat” let through, and how do I turn it off?';

  @override
  String get askAiQuestionPlugins => 'What can plugins do, and what should I watch for with third-party ones?';

  @override
  String get askAiQuestionRemote =>
      'How do I connect my own computer or server, and how is that different from this phone?';

  @override
  String get schemaDocumentationTitle => 'Field descriptions';

  @override
  String get schemaDocumentationOverview => 'Overview';

  @override
  String get schemaDocumentationEach => 'Each item';

  @override
  String schemaDocumentationPosition(int position) {
    return 'Item $position';
  }

  @override
  String schemaDocumentationOption(int option) {
    return 'Option $option';
  }

  @override
  String get searchApiKey => 'API Key';

  @override
  String get searchNeedsLocal => 'Available on this phone\'s engine';

  @override
  String get searchNeedsPhoneControl => 'Available once phone control is on';

  @override
  String get searchNeedsNativeUi => 'Available in the native interface';

  @override
  String get searchNeedsEngineField => 'Available when the host has it';

  @override
  String get searchNeedsChat => 'Available with a chat open';

  @override
  String get searchKwTheme => 'appearance,colors,colours,accent,icons';

  @override
  String get searchKwPets => 'pet,pets,companion,whale,overlay';

  @override
  String get searchKwPerformance => 'battery,smooth,lag,lite,full,speed';

  @override
  String get searchKwVoice => 'speech recognition,dictation,microphone,mic,voice';

  @override
  String get searchKwNotifications => 'alerts,push,banner,sound';

  @override
  String get searchKwReplyPrefs => 'about me,style,tone,instructions,AGENTS.md';

  @override
  String get searchKwSharedLinks => 'links,share,shared,public link';

  @override
  String get searchKwPhone => 'accessibility,automation,tap,control phone';

  @override
  String get searchKwAppRules => 'apps,blocklist,allowlist,deny,app list';

  @override
  String get searchKwDnd => 'dnd,shizuku,adb,background';

  @override
  String get searchKwEngine => 'engine,runtime,start,stop,restart,DSH';

  @override
  String get searchKwBackground => 'keep alive,background activity,battery optimization,autostart,killed';

  @override
  String get searchKwSystemAccess =>
      'permissions,grant,overlay,display over other apps,accessibility,background pop-ups,microphone,file access,notification permission,restricted settings';

  @override
  String get searchKwDiagnostics => 'logs,troubleshoot,report,bug,errors';

  @override
  String get searchKwModels => 'model providers,providers,provider,switch model,OpenRouter,ChatGPT,Claude';

  @override
  String get searchKwEngineParams => 'engine settings,advanced,parameters,subagent,commands';

  @override
  String get searchKwSubagent => 'subagent settings,depth,concurrency,subtasks';

  @override
  String get searchKwAgentLoop => 'loop,parallel,tool calls';

  @override
  String get searchKwShell => 'commands,timeout,output,terminal,shell,bash';

  @override
  String get searchKwWebSearch => 'search,internet,browse,api key';

  @override
  String get searchKwGeneral => 'general,web settings';

  @override
  String get searchKwPluginInventory => 'inventory,installed plugins,bundles';

  @override
  String get searchKwPlugins => 'extensions,market,install,marketplace';

  @override
  String get searchKwAllFeatures => 'features,catalog,everything';

  @override
  String get searchKwAccount => 'account,balance,top up,sign in,sign out,api key,usage,DeepSeek';

  @override
  String get searchKwRemote => 'remote,ssh,computer,server,DSH Remote,connect';

  @override
  String get searchKwPermission => 'permissions,approval,don\'t ask,read only,full access,auto-run commands';

  @override
  String get searchKwAgentPresets => 'presets,mode,agent mode';

  @override
  String get searchKwUiMode => 'native,web,web mode,interface';

  @override
  String get searchKwLanguage => 'chinese,english,locale';

  @override
  String get searchKwAutoCommands => 'don\'t ask,auto approve,full access,no confirmation';

  @override
  String get searchKwPhoneFiles => 'storage,files,downloads,photos';

  @override
  String get searchKwVisualReplies => 'charts,cards,visual,options';

  @override
  String get searchKwTextSize => 'font,font size,text size,larger text';

  @override
  String get searchKwFoldTurns => 'collapse,fold,steps';

  @override
  String get searchKwWebPhoneLayout => 'web phone layout,layout';

  @override
  String get searchKwShareConfig => 'share,export,share code,config';

  @override
  String get searchKwOpenWeb => 'web,browser,web ui';

  @override
  String get searchKwSafeMode => 'safe mode,leave safe mode,troubleshoot';

  @override
  String get searchKwVersion => 'version,about,build';

  @override
  String get searchKwUpdate => 'update,upgrade,new version';

  @override
  String get searchKwUpdateAuto => 'auto update,updates';

  @override
  String get searchKwHelp => 'help,guide,ask ai,how to';

  @override
  String get searchKwCommunity => 'group,forum,feedback,chat group';

  @override
  String get searchKwStar => 'github,star';

  @override
  String get searchKwLicenses => 'license,open source';

  @override
  String get searchKwDarkMode => 'dark,light,dark mode,night,theme,system,appearance';

  @override
  String get searchKwAccent => 'color,colour,accent,palette,wallpaper';

  @override
  String get searchKwTileStyle => 'icon style,tiles';

  @override
  String get searchKwAppIcon => 'launcher icon,icon';

  @override
  String get searchKwPetSize => 'pet size';

  @override
  String get searchKwPetQuiet => 'quiet,pet quiet';

  @override
  String get searchKwPetOutside => 'overlay,floating pet,outside app';

  @override
  String get searchKwPetDisplayWhen => 'pet display,when to show';

  @override
  String get searchKwBlur => 'blur,glass,frosted';

  @override
  String get searchKwAnimations => 'animation,motion,reduce motion';

  @override
  String get searchKwNotifyEnabled => 'notifications on,turn off notifications';

  @override
  String get searchKwNotifyDone => 'reply done,finished';

  @override
  String get searchKwNotifyFailed => 'error,failed,stopped';

  @override
  String get searchKwNotifyApproval => 'approval,waiting for you';

  @override
  String get searchKwNotifyQuestion => 'question,asks you';

  @override
  String get searchKwNotifySystem => 'sound,banner,lock screen,system';

  @override
  String get searchKwPhoneConfirm => 'don\'t ask,confirm,always ask,no confirmation';

  @override
  String get searchKwPhoneAutoCollapse => 'floating bar,collapse,bubble';

  @override
  String get searchKwPhoneReturn => 'return,come back';

  @override
  String get searchKwPhoneBackgroundGuide => 'background confirmation,return';

  @override
  String get searchKwAutoStart => 'auto start,launch';

  @override
  String get searchKwAutoSafe => 'safe mode,automatic safe mode';

  @override
  String get searchKwEngineReset => 'reset,wipe,restore';

  @override
  String get searchKwEngineUninstall => 'uninstall,remove,free space';

  @override
  String get searchKwAddProvider => 'add model,new provider,custom model,base url';

  @override
  String get searchKwSubagentDepth => 'depth,levels';

  @override
  String get searchKwParallelCalls => 'parallel,concurrent calls';

  @override
  String get searchKwCommandTimeout => 'timeout,time limit';

  @override
  String get searchKwWebSearchKey => 'search key,web search key';

  @override
  String get searchKwChatLogUpload => 'privacy,logs,upload logs,telemetry';

  @override
  String get searchKwAddSshHost => 'ssh,add host,connect computer';

  @override
  String get searchKwRemoteAutoConnect => 'auto connect,on launch';

  @override
  String get searchKwPermissionCurrent => 'allow for this chat,this chat';

  @override
  String get searchKwPermissionDefault =>
      'default permission,read only,workspace,full access,auto-run commands,don\'t ask';

  @override
  String get searchSettingsHint => 'Search settings';

  @override
  String get searchSuggestDark => 'Dark mode';

  @override
  String get searchSuggestBackground => 'Background';

  @override
  String get searchSuggestPermission => 'Permissions';

  @override
  String get searchSuggestTextSize => 'Text size';

  @override
  String get searchCommon => 'Common';

  @override
  String get searchRecent => 'Recent';

  @override
  String get searchFeatures => 'Features';

  @override
  String get searchNoResults => 'No matching settings';

  @override
  String searchAskAi(String query) {
    return 'Ask AI: “$query”';
  }

  @override
  String get searchKwPersonalization => 'personalization,preferences,style';

  @override
  String get searchKwInterface => 'native,web,web mode,web app,general';

  @override
  String get searchKwPrivacy => 'privacy,data,logs,sharing,statistics';

  @override
  String get searchKwAbout => 'about,version,update,licenses';

  @override
  String get searchKwPhoneConfirmEntry => 'confirmation,phone control,don\'t ask';

  @override
  String get searchKwWebCodingView => 'coding view,work view,web';

  @override
  String get searchKwWebCollapse => 'work steps,collapse,web';

  @override
  String get searchKwWebBusySend => 'send,queue,while AI works';

  @override
  String get searchKwPluginsMarket => 'plugin market,install plugins,marketplace';

  @override
  String get searchKwUsageStats => 'statistics,stats,usage data,analytics,telemetry,anonymous,privacy,data';

  @override
  String get setupAppearanceTitle => 'Choose a look';

  @override
  String get setupAppearanceMessage => 'You can change this anytime in Settings';

  @override
  String get setupLightMode => 'Lightweight mode';

  @override
  String get setupCapsulePreparing => 'Preparing runtime';

  @override
  String setupCapsuleProgress(int percent) {
    return 'Runtime $percent%';
  }

  @override
  String setupCapsuleProgressSemantics(int percent) {
    return 'Preparing the runtime, $percent% done';
  }

  @override
  String get setupCapsuleReady => 'Runtime ready';

  @override
  String get setupCapsuleFailed => 'Install failed';

  @override
  String get setupWaitingBody => 'Continues on its own when ready';

  @override
  String get setupNotifyWhenDone => 'We’ll notify you when it’s done';

  @override
  String get setupAwaitSignIn => 'DeepSeek sign-in opens when it’s ready';

  @override
  String get shellApiKeyPrefixWarning => 'DeepSeek keys usually start with sk-. Check you copied the right key.';

  @override
  String get shellApiKeyIncompleteWarning => 'This key looks incomplete. Check you copied it all.';

  @override
  String get shellBrowserUrlCopied => 'Couldn’t open your browser. URL copied.';

  @override
  String get shellSaveTryAgain => 'Couldn’t save. Try again.';

  @override
  String get shellApiKeyUpdated => 'API key updated';

  @override
  String get shellReplaceApiKey => 'Replace API key';

  @override
  String get shellEnterApiKey => 'Enter API key';

  @override
  String get shellApiKeyBilling => 'Billed by the DeepSeek platform based on usage';

  @override
  String get shellSaving => 'Saving';

  @override
  String get shellSaveContinue => 'Save and continue';

  @override
  String get shellSetUpLater => 'Set up later';

  @override
  String get shellClearField => 'Clear';

  @override
  String get shellShow => 'Show';

  @override
  String get shellApiKeyEncrypted => 'Encrypted on this phone';

  @override
  String get shellGetApiKey => 'Get API key';

  @override
  String get shellConnectDeepSeek => 'Connect DeepSeek';

  @override
  String get shellConnectDeepSeekMessage => 'Sign in to DeepSeek to start. No API key needed.';

  @override
  String get shellAccountSignInUnsupported => 'This engine doesn’t support account sign-in';

  @override
  String get shellSignInDeepSeek => 'Sign in with DeepSeek';

  @override
  String get shellUseApiKey => 'Use API key';

  @override
  String get shellOtherProviders => 'Other providers';

  @override
  String shellOnboardingStep(int step, int steps) {
    return 'Step $step of $steps';
  }

  @override
  String get shellRuntimeUpdating => 'Updating runtime';

  @override
  String get shellRuntimePreparing => 'Preparing runtime';

  @override
  String get shellRuntimeReady => 'Ready';

  @override
  String get shellRuntimeIncomplete => 'Installation incomplete';

  @override
  String get shellRuntimeFilesKept => 'Your chats and files stay';

  @override
  String get shellRuntimeFirstSetup => 'First setup takes a minute or two';

  @override
  String get shellRuntimeContinuing => 'Continuing shortly';

  @override
  String get shellRuntimeRestoreFailed => 'Couldn’t restore saved content';

  @override
  String get shellRuntimeExtractFailed => 'Couldn’t extract files';

  @override
  String get shellInstallLogs => 'Installation logs';

  @override
  String get shellRuntimeLocalOnly => 'Everything runs on this phone';

  @override
  String get shellRuntimeContinueWithoutKept => 'Continue without restoring';

  @override
  String get shellRuntimeAlmostDone => 'Almost done';

  @override
  String shellRuntimeSecondsRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'About $count seconds',
      one: 'About 1 second',
    );
    return '$_temp0';
  }

  @override
  String shellRuntimeMinutesRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'About $count minutes',
      one: 'About 1 minute',
    );
    return '$_temp0';
  }

  @override
  String get shellEngineLogs => 'Engine logs';

  @override
  String get shellWelcomeMessage => 'The DeepSeek agent,\nin your pocket';

  @override
  String get shellGetStarted => 'Start';

  @override
  String get shellSearchChats => 'Search chats';

  @override
  String get shellCollapseChatList => 'Collapse chat list';

  @override
  String get shellExpandChatList => 'Expand chat list';

  @override
  String get shellChatList => 'Chats';

  @override
  String get shellChatDetails => 'Chat details';

  @override
  String get shellCollapseDetails => 'Collapse details';

  @override
  String get shellExpand => 'Expand';

  @override
  String get shellUndo => 'Undo';

  @override
  String shellFolderDeleted(String name) {
    return 'Deleted “$name”';
  }

  @override
  String shellMovedToFolder(String name) {
    return 'Moved to “$name”';
  }

  @override
  String get shellMovedOutOfFolder => 'Moved out of folder';

  @override
  String get shellUnpinFailed => 'Couldn’t unpin. Try again later.';

  @override
  String get shellPinFailed => 'Couldn’t pin. Try again later.';

  @override
  String shellChatsUnpinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Unpinned $count chats',
      one: 'Unpinned 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellChatsPinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pinned $count chats',
      one: 'Pinned 1 chat',
    );
    return '$_temp0';
  }

  @override
  String get shellArchiveFailed => 'Couldn’t archive. Try again later.';

  @override
  String shellChatsStoppedArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Stopped and archived $count chats',
      one: 'Stopped and archived 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellChatsArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Archived $count chats',
      one: 'Archived 1 chat',
    );
    return '$_temp0';
  }

  @override
  String shellFilterLabel(String label) {
    return 'Filter: $label';
  }

  @override
  String get shellFolders => 'Folders';

  @override
  String get shellNoRunningChats => 'No running chats';

  @override
  String get shellNoPendingChats => 'No chats need approval';

  @override
  String get shellNoUnreadChats => 'No unread chats';

  @override
  String get shellNoChatsYet => 'No chats yet';

  @override
  String shellFolderLabel(String name) {
    return 'Folder “$name”';
  }

  @override
  String shellFolderChatCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Folder “$name”, $count chats',
      one: 'Folder “$name”, 1 chat',
    );
    return '$_temp0';
  }

  @override
  String get shellSort => 'Sort';

  @override
  String get shellRecentActivity => 'Recent activity';

  @override
  String get shellCreatedTime => 'Date created';

  @override
  String get shellNewFolder => 'New folder';

  @override
  String get shellManageFolders => 'Manage folders';

  @override
  String get shellMultiSelect => 'Select';

  @override
  String get shellFolderNameExists => 'A folder with this name already exists';

  @override
  String get shellEditFolder => 'Edit folder';

  @override
  String get shellFolderMark => 'Mark';

  @override
  String shellFolderColor(int number) {
    return 'Color $number';
  }

  @override
  String get shellMoveToFolder => 'Move to folder';

  @override
  String get shellMoveOutOfFolder => 'Move out of folder';

  @override
  String get shellDeleteFolder => 'Delete folder';

  @override
  String get shellDragToReorder => 'Drag to reorder';

  @override
  String get shellSelectChats => 'Select chats';

  @override
  String shellSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count selected', one: '1 selected');
    return '$_temp0';
  }

  @override
  String get shellDeselectAll => 'Deselect all';

  @override
  String get shellSelectAll => 'Select all';

  @override
  String get shellUnpin => 'Unpin';

  @override
  String get shellArchive => 'Archive';

  @override
  String get shellCurrentlyRunning => 'Running';

  @override
  String get shellUnread => 'Unread';

  @override
  String get shellPinned => 'Pinned';

  @override
  String get shellEngineNotRunning => 'Engine isn’t running';

  @override
  String shellHostNotConnected(String name) {
    return 'Not connected to “$name” yet';
  }

  @override
  String get shellSearchAfterConnecting => 'Connect to search';

  @override
  String get shellChatsLoadFailed => 'Couldn’t load chats';

  @override
  String shellSearchHostChats(String name) {
    return 'Search chats on “$name”';
  }

  @override
  String get shellSearchTitlesHint => 'Search titles, including archived chats';

  @override
  String get shellSearchContentHint => 'Search titles and content, including archived chats';

  @override
  String get shellLoadingChatsEllipsis => 'Loading chats…';

  @override
  String get shellNoMatchingChats => 'No matching chats';

  @override
  String get shellSearchDifferentKeywords => 'Try another keyword, or separate words with spaces';

  @override
  String get shellArchived => 'Archived';

  @override
  String get shellRestoreBeforeOpening => 'Restore this archived chat to open it';

  @override
  String get shellRestoreAndOpen => 'Restore and open';

  @override
  String get shellRestoreFailed => 'Couldn’t restore. Try again later.';

  @override
  String get shellSearchingMessages => 'Searching message content…';

  @override
  String get shellHostTitleSearchOnly => 'This host only supports title search';

  @override
  String get shellContentSearchFailed => 'Couldn’t search content. Showing title matches only.';

  @override
  String get shellContentSearchLimit => 'Content search shows the 20 most relevant chats';

  @override
  String get shellMoveToOtherFolder => 'Move to another folder';

  @override
  String get shellArchiveStopsTurn => 'The current turn will stop';

  @override
  String get shellRenameFailed => 'Couldn’t rename. Try again later.';

  @override
  String shellChatStoppedArchived(String title) {
    return 'Stopped and archived “$title”';
  }

  @override
  String shellChatArchived(String title) {
    return 'Archived “$title”';
  }

  @override
  String get shellRenameChat => 'Rename chat';

  @override
  String get shellChatTitle => 'Chat title';

  @override
  String shellUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count unread', one: '1 unread');
    return '$_temp0';
  }

  @override
  String get shellLoadingChats => 'Loading chats';

  @override
  String get shellWorkspaceNoChats => 'No chats here yet';

  @override
  String get shellWorkspaceNewChatsHint =>
      'New chats go in this workspace. Earlier chats are not moved here automatically; find them in All chats.';

  @override
  String get shellNewChatsHint => 'New chats appear here';

  @override
  String get shellEngineStarting => 'Engine is starting';

  @override
  String get shellChatsAfterStarting => 'Your chats appear once it starts';

  @override
  String get shellStartEngine => 'Start engine';

  @override
  String get shellEngineStatusHint => 'View status in “Engine”';

  @override
  String shellHostUnreachable(String name) {
    return 'Can’t reach “$name”';
  }

  @override
  String shellHostReconnecting(String name) {
    return 'Reconnecting to “$name”…';
  }

  @override
  String get shellRetryNow => 'Retry now';

  @override
  String shellHostConnecting(String name) {
    return 'Connecting to “$name”…';
  }

  @override
  String get shellHostChatsAfterConnecting => 'This host’s chats appear once connected';

  @override
  String shellCurrentHostLabel(String name, String view) {
    return 'Current host: $name, $view. Switch host';
  }

  @override
  String get shellChatGone => 'This chat is gone';

  @override
  String get shellAccentMist => 'Mist';

  @override
  String get shellAccentDaiqing => 'Teal';

  @override
  String get shellAccentDusk => 'Dusk';

  @override
  String get shellAccentTurquoise => 'Aqua';

  @override
  String get shellAccentAmber => 'Amber';

  @override
  String get shellAccentGraphite => 'Slate';

  @override
  String get shellHideTurnFooter => 'Turn footer';

  @override
  String get shellHideTokenCount => 'Token count';

  @override
  String get shellHideReasoning => 'Thinking';

  @override
  String get shellHideActivityStrip => 'Activity strip';

  @override
  String get shellHideWhaleTail => 'Whale tail';

  @override
  String get shellHideTodoPill => 'To-do bar';

  @override
  String get shellHideGoalBar => 'Goal bar';

  @override
  String get shellToday => 'Today';

  @override
  String get shellThisWeek => 'This week';

  @override
  String get shellEarlier => 'Earlier';

  @override
  String get shellSeatNative => 'Native';

  @override
  String get shellSeatIsland => 'Embedded Web';

  @override
  String get shellSeatWeb => 'Open in DSH Web';

  @override
  String get shellPlugins => 'Plugins';

  @override
  String get shellHeaderActions => 'Header buttons';

  @override
  String get shellAllHidden => 'All hidden';

  @override
  String shellSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count items', one: '1 item');
    return '$_temp0';
  }

  @override
  String get shellQuickActions => 'Quick actions';

  @override
  String get shellSuggestionCards => 'Suggestion cards';

  @override
  String shellSuggestionCardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count cards', one: '1 card');
    return '$_temp0';
  }

  @override
  String get shellDrawerGroups => 'Drawer groups';

  @override
  String get shellDrawerSort => 'Drawer sort order';

  @override
  String get shellDrawerFilter => 'Drawer filter';

  @override
  String get shellPending => 'Pending';

  @override
  String get shellAll => 'All';

  @override
  String get shellDensity => 'Density';

  @override
  String get shellCompact => 'Compact';

  @override
  String get shellSpacious => 'Spacious';

  @override
  String get shellThemeMode => 'Appearance mode';

  @override
  String get shellAccentColor => 'Accent color';

  @override
  String get shellPet => 'Pet';

  @override
  String get shellConfigured => 'Set';

  @override
  String get shellShortcuts => 'Keyboard shortcuts';

  @override
  String get shellConfigFileTooLarge => 'File exceeds 64 KiB';

  @override
  String get shellConfigRootNotObject => 'Top level must be an object';

  @override
  String get shellConfigVersionMissing => 'Missing version';

  @override
  String get shellConfigVersionNotInt => 'version must be an integer';

  @override
  String get shellConfigVersionTooLow => 'version starts at 1';

  @override
  String shellConfigVersionTooHigh(int version) {
    return 'Update the app to use version $version';
  }

  @override
  String get shellConfigNotObject => 'Expected an object';

  @override
  String get shellConfigNotArray => 'Expected an array';

  @override
  String get shellConfigNotString => 'Expected a string';

  @override
  String get shellConfigNotBool => 'Expected true or false';

  @override
  String get shellConfigEmpty => 'Can’t be empty';

  @override
  String get shellConfigUnknownKey => 'Unknown key, ignored';

  @override
  String get shellConfigDuplicateKey => 'Duplicate key, only the last one applies';

  @override
  String get shellConfigDuplicateItem => 'Duplicate, ignored';

  @override
  String shellConfigMissing(String key) {
    return 'Missing $key';
  }

  @override
  String shellConfigTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Exceeds $count characters, truncated',
      one: 'Exceeds 1 character, truncated',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooLong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Exceeds $count characters',
      one: 'Exceeds 1 character',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Up to $count items, extras ignored',
      one: 'Up to 1 item, extras ignored',
    );
    return '$_temp0';
  }

  @override
  String get shellConfigValueNoun => 'value';

  @override
  String shellConfigUnsupportedValue(String noun, String value) {
    return 'Unsupported $noun “$value”';
  }

  @override
  String get shellConfigHeaderItem => 'Expected a button ID or object';

  @override
  String get shellConfigHeaderId => 'IDs can use letters, numbers, and -, starting with a lowercase letter';

  @override
  String get shellConfigIdTaken => 'Duplicate ID';

  @override
  String get shellConfigCommandSlash => 'Command names don’t include /, removed';

  @override
  String get shellConfigCommandName => 'Command names can only use letters, numbers, and : . _ -';

  @override
  String get shellConfigNoNewline => 'Line breaks aren’t allowed';

  @override
  String get shellConfigHttpsOnly => 'Only HTTPS links are supported';

  @override
  String get shellConfigBadUrl => 'Invalid link format';

  @override
  String get shellConfigAccentFormat => 'Use #RRGGBB for colors';

  @override
  String get shellConfigAccentBoth => 'Choose either this or accentPreset; accentPreset used';

  @override
  String get shellConfigPetId => 'IDs can only use lowercase letters, numbers, and -';

  @override
  String get shellConfigKeysFormat => 'Invalid format, for example ctrl+k';

  @override
  String get shellConfigSystemKey => 'System keys aren’t allowed';

  @override
  String get shellConfigNeedModifier => 'Include ctrl or alt';

  @override
  String get shellConfigReservedKey => 'Used by the system or keyboard';

  @override
  String shellConfigDuplicateShortcut(String pointer) {
    return 'Duplicates $pointer';
  }

  @override
  String get shellConfigSlotName => 'Invalid slot name format';

  @override
  String get shellConfigUnknownSlot => 'This slot isn’t in DSH yet, kept for later';

  @override
  String get shellConfigUnseatableSlot => 'Plugins aren’t supported here';

  @override
  String get shellConfigPackageName => 'Invalid package name format';

  @override
  String get shellConfigActionNoun => 'action';

  @override
  String get shellConfigPageNoun => 'page';

  @override
  String get shellConfigButtonNoun => 'button';

  @override
  String get shellConfigIconNoun => 'icon';

  @override
  String get shellConfigNotTextFile => 'Not a text file';

  @override
  String shellJsonPosition(int line, int column, String reason) {
    return 'Line $line, column $column: $reason';
  }

  @override
  String get shellJsonEmptyFile => 'File is empty';

  @override
  String get shellJsonExtraContent => 'Extra content at the end';

  @override
  String get shellJsonIncompleteFile => 'File is incomplete';

  @override
  String get shellJsonCommentsUnsupported => 'Comments aren’t supported';

  @override
  String get shellJsonDoubleQuotes => 'Strings need double quotes';

  @override
  String get shellJsonMissingValue => 'Missing a value here';

  @override
  String shellJsonUnknownContent(String value) {
    return 'Unrecognized content “$value”';
  }

  @override
  String get shellJsonTooDeep => 'Nesting is too deep';

  @override
  String get shellJsonExtraComma => 'Extra comma';

  @override
  String get shellJsonQuotedKey => 'Keys need double quotes';

  @override
  String get shellJsonExpectedKey => 'Expected a key here';

  @override
  String get shellJsonMissingColon => 'Missing a colon after the key';

  @override
  String get shellJsonMissingComma => 'Missing a comma here';

  @override
  String shellJsonUnexpectedContent(String value) {
    return 'Unexpected “$value” here';
  }

  @override
  String get shellJsonUnterminatedString => 'Unterminated string';

  @override
  String get shellJsonBadEscape => 'Invalid string escape';

  @override
  String get shellJsonStringNewline => 'Strings can’t contain literal line breaks';

  @override
  String get shellJsonControlCharacter => 'String contains a control character';

  @override
  String get shellJsonBadNumber => 'Invalid number format';

  @override
  String shellSkillInstallPrompt(String skill) {
    return 'Install the DSH Go interface skill $skill on this host:';
  }

  @override
  String shellSkillInstallDirectory(String skill) {
    return '1. Create the target folder `\$DSH_HOME/skills/$skill/` if needed (or `~/.dsh/skills/$skill/` if DSH_HOME isn’t set).';
  }

  @override
  String get shellSkillInstallFiles =>
      '2. Write each file below at its given relative path, keeping the contents exactly as provided.';

  @override
  String get shellSkillInstallConfirm => '4. Tell me when it’s installed.';

  @override
  String shellSkillInstallFile(String path) {
    return 'File `$path`:';
  }

  @override
  String get shellFromUiJson => 'From ui.json';

  @override
  String get shellViewSource => 'View source';

  @override
  String get shellSourcePosition => 'Location';

  @override
  String get shellRestoreDefaults => 'Reset to default';

  @override
  String get shellConfigNotApplied => 'Not applied';

  @override
  String shellConfigDroppedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count issues not applied',
      one: '1 issue not applied',
    );
    return '$_temp0';
  }

  @override
  String shellConfigAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Applied $count items',
      one: 'Applied 1 item',
    );
    return '$_temp0';
  }

  @override
  String get shellInterfaceConfig => 'UI config';

  @override
  String get shellSkillNotInstalled => 'Skill not installed';

  @override
  String get shellInstallInterfaceSkill => 'Install interface skill';

  @override
  String get shellInstallInterfaceSkillMessage => 'Once installed, AI can adjust the app’s interface as you ask';

  @override
  String get shellNoUiJson => 'No ui.json';

  @override
  String get shellConfigUsingPrevious => 'Not applied, still using the previous configuration';

  @override
  String get shellConfigDroppedHeading => 'Not applied';

  @override
  String get shellConfigNotesHeading => 'Warnings';

  @override
  String get shellConfigAppliedHeading => 'Applied';

  @override
  String shellConfigValueOptions(String noun, String value, String options) {
    return 'Unsupported $noun “$value”, options: $options';
  }

  @override
  String get shellListSeparator => ', ';

  @override
  String shellSkillInstallCheck(String command) {
    return '3. Run $command after writing the files. If it runs, installation is complete (a message about ui.json not existing yet is normal).';
  }

  @override
  String get shellSemanticsSeparator => ', ';

  @override
  String shellChatsArchivedPartial(int count, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Archived $count chats',
      one: 'Archived 1 chat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failed,
      locale: localeName,
      other: 'couldn’t archive $failed chats',
      one: 'couldn’t archive 1 chat',
    );
    return '$_temp0; $_temp1';
  }

  @override
  String starPromptTitle(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'I’ve kept you company in DSH Go for $hours hours now~',
      one: 'I’ve kept you company in DSH Go for an hour now~',
      zero: 'I’ve kept you company in DSH Go for half an hour now~',
    );
    return '$_temp0';
  }

  @override
  String get starPromptBody =>
      'DSH Go is free and open source. If it’s made your phone a little nicer to use, please give it a Star — it means so much to this little whale!';

  @override
  String get starPromptPlea => 'Pretty please~ It really matters!!';

  @override
  String get starPromptStar => 'Star it on GitHub';

  @override
  String get starPromptDone => 'Already starred';

  @override
  String get starPromptLater => 'Maybe later';

  @override
  String get starSettingsTitle => 'Star DSH Go on GitHub';

  @override
  String get stateDiagnosticsSubject => 'DSH Go diagnostics bundle';

  @override
  String get stateStoragePermission => 'No storage permission to save to Downloads';

  @override
  String get stateDiagnosticsStorageFull => 'Not enough storage to create the diagnostics bundle';

  @override
  String get stateDiagnosticsExportFailed => 'Couldn’t export diagnostics bundle';

  @override
  String get stateForumUnreachable => 'Can’t reach the forum';

  @override
  String get stateSignInExpired => 'Sign-in expired. Sign in again.';

  @override
  String get stateForbidden => 'Permission denied';

  @override
  String get stateForumContentMissing => 'Content not found or deleted';

  @override
  String get stateTooManyActions => 'Too many actions. Try again later.';

  @override
  String get stateForumSendFailed => 'Couldn’t send';

  @override
  String get stateForumServerError => 'The forum is having trouble';

  @override
  String get stateBrowserOpenFailed => 'Couldn’t open the browser';

  @override
  String get stateSignInStartFailed => 'Couldn’t start sign-in';

  @override
  String get stateSignInIncompleteRetry => 'Sign-in didn’t finish. Try again.';

  @override
  String get statePluginLabel => 'Plugin';

  @override
  String get stateConfigLabel => 'Configuration';

  @override
  String get stateConfigShare => 'Shared configuration';

  @override
  String get stateShareCode => 'Share code';

  @override
  String get stateCopyShareCodeFirst => 'Copy a share code from Share first';

  @override
  String get stateFileOpenFailed => 'Can’t open this file';

  @override
  String get stateLinkOpenFailed => 'Can’t open this link';

  @override
  String get stateAlertPublicDone => 'A turn finished';

  @override
  String get stateAlertPublicFailed => 'A turn failed';

  @override
  String get stateAlertPublicStopped => 'A turn stopped';

  @override
  String get stateAlertPublicApproval => 'A step needs your approval';

  @override
  String get stateAlertPublicQuestion => 'A question needs your answer';

  @override
  String get stateAlertTurnDone => 'This turn finished';

  @override
  String get stateAlertOutputLimit => 'Ended · Output limit reached';

  @override
  String get stateAlertTurnBlocked => 'This turn was blocked';

  @override
  String get stateAlertEngineRestarted => 'Interrupted · Engine restarted';

  @override
  String get stateAlertMissingKey => 'Error · No API key set';

  @override
  String get stateAlertTurnFailed => 'This turn failed';

  @override
  String get stateRunCommand => 'Run command';

  @override
  String get stateWriteFile => 'Write file';

  @override
  String get stateEditFile => 'Edit file';

  @override
  String get stateOpenPage => 'Open web page';

  @override
  String get stateWebSearch => 'Web search';

  @override
  String get stateAlertQuestion => 'A question for you';

  @override
  String get stateSizeSmall => 'Small';

  @override
  String get stateSizeStandard => 'Standard';

  @override
  String get stateSizeLarge => 'Large';

  @override
  String get statePetDone => 'Done';

  @override
  String get statePetFailed => 'Something went wrong';

  @override
  String get statePhoneNotReady => 'Phone control isn’t ready';

  @override
  String get stateBackgroundRestricted => 'Background network access is restricted';

  @override
  String get stateBackgroundFinish => 'Let chats finish in the background';

  @override
  String get stateDeepSeekAccount => 'DeepSeek account';

  @override
  String get stateAccountUnreachable => 'Can’t reach DeepSeek';

  @override
  String get stateAccountUnavailable => 'DeepSeek sign-in is unavailable';

  @override
  String get stateSignInIncomplete => 'Sign-in didn’t finish';

  @override
  String get stateSignInTimeout => 'Sign-in timed out';

  @override
  String get stateSignInSaveFailed => 'Couldn’t save sign-in details';

  @override
  String get stateEngineNotReady => 'The engine isn’t ready';

  @override
  String get stateSignInInterrupted => 'Sign-in interrupted';

  @override
  String get stateAccountUnsupported => 'This engine doesn’t support account sign-in';

  @override
  String get stateCheckPhoneNetwork => 'Check your phone’s network and try again';

  @override
  String get stateServiceUnavailableRetry => 'Service unavailable. Try again later.';

  @override
  String get stateAuthorizationFailed => 'Authorization failed. Sign in again.';

  @override
  String get stateAuthorizationExpired => 'Authorization page expired. Sign in again.';

  @override
  String get stateRestartEngineRetry => 'Restart from Engine, then try again';

  @override
  String get stateEngineStartingRetry => 'The engine is starting. Try again later.';

  @override
  String get stateEngineDisconnectedSignIn => 'Engine disconnected. Sign in again.';

  @override
  String get stateUpdateRuntimeOrKey => 'Update the runtime or use an API key';

  @override
  String get stateEngineDisconnected => 'Engine disconnected';

  @override
  String get stateAgentError => 'Error';

  @override
  String get stateNotRunning => 'Not running';

  @override
  String get stateAgentOneShot => 'One-shot';

  @override
  String get stateAgentContinuable => 'Continuable';

  @override
  String get stateAgentExternal => 'External task';

  @override
  String get stateSubagent => 'Subagent';

  @override
  String get stateParentChat => 'Parent chat';

  @override
  String get statePreparing => 'Provisioning';

  @override
  String get stateIconMist => 'Mist blue';

  @override
  String get stateIconNight => 'Nightfall';

  @override
  String get stateIconFrost => 'Frost white';

  @override
  String get stateIconInk => 'Ink';

  @override
  String get stateAppDisclaimer => 'Built on DeepSeek Harness · Unofficial DeepSeek app';

  @override
  String get stateWallpaper => 'Wallpaper';

  @override
  String get stateFileMissing => 'File not found. It may have been deleted or moved.';

  @override
  String get stateFileNoApp => 'No app on this phone can open this file type';

  @override
  String get stateFileConnectionLimit => 'File is too large for this connection';

  @override
  String get stateFileReadUnsupported => 'This connection can’t read files';

  @override
  String get stateArtifactImage => 'Image';

  @override
  String get stateArtifactDocument => 'Document';

  @override
  String get stateArtifactSheet => 'Spreadsheet';

  @override
  String get stateArtifactSlides => 'Presentation';

  @override
  String get stateArtifactArchive => 'Archive';

  @override
  String get stateArtifactAudio => 'Audio';

  @override
  String get stateArtifactVideo => 'Video';

  @override
  String get stateArtifactWeb => 'Web page';

  @override
  String get stateArtifactText => 'Text';

  @override
  String get stateArtifactFile => 'File';

  @override
  String get statePrivateKeyTooLarge => 'File is too large to be a private key';

  @override
  String get stateBotTeamBusy => 'Another DSH is using this team';

  @override
  String get stateBotOperationFailed => 'Couldn’t finish. Try again.';

  @override
  String get stateBotMissing => 'This host doesn’t have DS Bot';

  @override
  String get stateHostAuthFailed => 'Host authentication failed';

  @override
  String get stateUnexpectedError => 'Something went wrong';

  @override
  String get stateGroupChat => 'Group chat';

  @override
  String get stateBotNewMessage => 'New bot message';

  @override
  String get stateChatAgentBusy => 'AI is busy. Try again later.';

  @override
  String get stateChatWriterHeld => 'This chat is in use elsewhere';

  @override
  String get stateChatModelUnavailable => 'This model is unavailable';

  @override
  String get stateChatAttachmentInvalid => 'Can’t send this attachment';

  @override
  String get stateChatForkUnavailable => 'Can’t branch here';

  @override
  String get stateChatImagesTooLarge => 'Images are too large. Send fewer at once.';

  @override
  String get stateChatSyncInterrupted => 'Chat sync interrupted';

  @override
  String get stateChatSynchronizing => 'Syncing chat';

  @override
  String get stateChatSyncRetry => 'Sync again';

  @override
  String get stateChatSyncRequired => 'Chat is not synced yet. Sync again and retry.';

  @override
  String get stateChatAutoApproveFailed => 'Couldn’t allow automatically';

  @override
  String get stateCommandMissing => 'Command not found';

  @override
  String get stateCommandFailed => 'Command didn’t run';

  @override
  String get stateChatStopSteered => 'Couldn’t stop this turn. Sent as a steer.';

  @override
  String get stateChatTextOnlyModel =>
      'This model reads text only. Images were sent as files. Switch to V4.1 Flash to let AI view them.';

  @override
  String get stateAttachmentUploadFailed => 'Couldn’t upload attachment';

  @override
  String get stateChatImageModelRequired => 'This model can’t view images. Switch to V4.1 Flash and send again.';

  @override
  String get stateSendFailed => 'Couldn’t send';

  @override
  String get stateChatStopFailed => 'Couldn’t stop. Try again.';

  @override
  String get stateChatTurnEnded => 'This turn has ended. Your message will start a new turn.';

  @override
  String get stateChatSteerFailed => 'Couldn’t steer';

  @override
  String get stateChatUndoTooLate => 'Too late. AI has already read this message.';

  @override
  String get stateChatUndoFailed => 'Couldn’t undo';

  @override
  String get stateChatApprovalFailed => 'Couldn’t submit approval';

  @override
  String get stateChatAnswerFailed => 'Couldn’t submit answer';

  @override
  String get stateChatModelSwitchFailed => 'Couldn’t switch model';

  @override
  String get stateChatHistoryFailed => 'Couldn’t load history';

  @override
  String get stateChatBranchLastReply => 'Branch from the last reply of a finished turn';

  @override
  String get stateChatBranchFailed => 'Couldn’t branch';

  @override
  String get stateChatEarlierHistoryFailed => 'Couldn’t load earlier history';

  @override
  String get stateChatNoEarlierHistory => 'There’s no history before this message. Start a new chat.';

  @override
  String get stateCommandNewDescription => 'Start a new chat';

  @override
  String get stateModelLabel => 'Model';

  @override
  String get stateCommandModelDescription => 'Change model and thinking depth';

  @override
  String get stateCommandExportLabel => 'Export logs';

  @override
  String get stateCommandExportDescription => 'Export this chat’s full history as a ZIP to share or save to Downloads';

  @override
  String get stateAllFeatures => 'All features';

  @override
  String get stateCommandFeaturesDescription => 'Access every feature in DSH Web';

  @override
  String get stateCompactLabel => 'Compact';

  @override
  String get stateCommandCompactDescription => 'Compact the chat above to free up context';

  @override
  String get statePermissionLabel => 'Permission';

  @override
  String get stateCommandPermissionDescription => 'Switch the permission preset (sandbox mode + approval policy)';

  @override
  String get stateCommandPermissionHint => '<preset name>';

  @override
  String get statePlanLabel => 'Plan';

  @override
  String get stateCommandPlanDescription => 'Enter or leave Plan mode';

  @override
  String get stateGoalLabel => 'Goal';

  @override
  String get stateCommandGoalDescription => 'Set or view the goal for a long-running task';

  @override
  String get stateFeedbackLabel => 'Feedback';

  @override
  String get stateCommandFeedbackDescription => 'Send feedback on this chat';

  @override
  String get stateCommandFeedbackHint => '<message>';

  @override
  String get stateShareFileTooLarge => 'A file was too large and wasn’t added';

  @override
  String get stateShareFileUnreadable => 'Couldn’t read a file';

  @override
  String get stateShareImagesOnly => 'This host can only send images';

  @override
  String get stateComposerInserted => 'Added to the composer';

  @override
  String get stateCordisPending => 'Pending';

  @override
  String get stateCordisStarting => 'Starting';

  @override
  String get stateCordisRunFailed => 'Run failed';

  @override
  String get stateCordisNoApproval => 'Run permission wasn’t granted';

  @override
  String get stateCordisBackendFailed => 'Couldn’t start the background component';

  @override
  String get stateCordisClientLoadFailed => 'Couldn’t load the interface';

  @override
  String get stateCordisRenderFailed => 'Couldn’t display the interface';

  @override
  String get stateCordisFailed => 'Couldn’t run';

  @override
  String get stateDrawerAll => 'All';

  @override
  String get stateDrawerUnread => 'Unread';

  @override
  String get stateDrawerToday => 'Today';

  @override
  String get stateDrawerThisWeek => 'This week';

  @override
  String get stateDrawerEarlier => 'Earlier';

  @override
  String get stateEngineAuthFailed => 'Engine authentication failed';

  @override
  String get stateChatMissing => 'This chat is gone';

  @override
  String get stateEngineUnsupported => 'Not supported by this engine version';

  @override
  String get stateSettingsRefreshed => 'Changed elsewhere. Refreshed.';

  @override
  String get stateCredentialFromEnvironment => 'This key comes from the engine’s environment and can’t be changed here';

  @override
  String get stateSettingsFromFile => 'Set by configuration file';

  @override
  String get stateSettingsInteger => 'Enter a whole number';

  @override
  String get stateSettingsInvalidFormat => 'Invalid format';

  @override
  String get stateSettingsReadOnly => 'Engine settings are read-only';

  @override
  String get statePluginDisabled => 'Plugin is disabled';

  @override
  String get stateSettingsRestartRequired => 'Restart the engine to change this';

  @override
  String get stateSettingsInvalidValue => 'Invalid value';

  @override
  String get stateSettingsRejected => 'The engine didn’t accept this value';

  @override
  String get stateInventoryEnabled => 'Enabled';

  @override
  String get stateInventoryDisabled => 'Disabled';

  @override
  String get stateLoading => 'Loading';

  @override
  String get stateInventoryWaiting => 'Waiting for dependencies';

  @override
  String get stateInventoryConditional => 'Conditional';

  @override
  String get stateBundleBuiltIn => 'Built into DSH';

  @override
  String get stateBundleHeadless => 'Headless';

  @override
  String get stateConfigFile => 'Configuration file';

  @override
  String get stateGoalEmpty => 'Goal can’t be empty';

  @override
  String get stateGoalPauseFailed => 'Couldn’t pause';

  @override
  String get stateGoalResumeFailed => 'Couldn’t resume';

  @override
  String get stateGoalClearOffline => 'Couldn’t clear: Can’t reach the engine';

  @override
  String get stateGoalClearFailed => 'Couldn’t clear';

  @override
  String get stateGoalStale => 'Goal changed. Try again.';

  @override
  String get stateGoalMissing => 'Goal is gone';

  @override
  String get stateGoalChatNotReady => 'Chat isn’t ready. Try again later.';

  @override
  String get stateGoalTurnsExhausted => 'No turns left';

  @override
  String get stateGoalStateChanged => 'Goal status changed';

  @override
  String get stateSshHost => 'SSH host';

  @override
  String get stateHostBrowserFailed => 'Couldn’t open the browser. Copy the sign-in link and open it in a browser.';

  @override
  String get stateSignInFailed => 'Couldn’t sign in';

  @override
  String get stateMarketTooLarge => 'Plugin catalog is too large. Download stopped.';

  @override
  String get stateMarketUnreachable => 'Can’t reach the plugin catalog';

  @override
  String get stateMarketInsecure => 'Couldn’t connect securely to the plugin catalog';

  @override
  String get stateMarketTimeout => 'Plugin catalog timed out';

  @override
  String get stateMarketInterrupted => 'Plugin catalog download interrupted';

  @override
  String get stateRegistryDefault => 'Default registry';

  @override
  String get stateRegistryNpm => 'Official npm registry';

  @override
  String get stateRegistryMirror => 'npmmirror mirror';

  @override
  String get statePluginIncompatible => 'This plugin doesn’t support the current DSH version.';

  @override
  String get statePluginInstallCancelled => 'Installation cancelled';

  @override
  String get statePluginNoChanges => 'Nothing was changed';

  @override
  String get statePluginIncompatibleTitle => 'Incompatible with this DSH';

  @override
  String get statePluginNetworkFailed => 'Can’t connect';

  @override
  String get statePluginSourceUnreachable => 'Can’t reach the plugin’s source website';

  @override
  String get statePluginDownloadTimeout => 'Download timed out';

  @override
  String get statePluginRegistryUnavailable => 'Registry isn’t responding';

  @override
  String get statePluginPnpmMissing => 'pnpm missing';

  @override
  String get statePluginPhonePnpmMissing => 'pnpm is missing on this phone';

  @override
  String get statePluginHostPnpmMissing => 'pnpm is missing on this host';

  @override
  String get statePluginNotFound => 'Plugin not found';

  @override
  String get statePluginPackageMissing => 'Package not found in the registry';

  @override
  String get statePluginTooNew => 'Version is too new';

  @override
  String get statePluginWaitForRelease => 'Available to install 24 hours after release';

  @override
  String get statePluginVersionMissing => 'Version not found';

  @override
  String get statePluginRegistryVersionMissing => 'This version isn’t in the registry yet';

  @override
  String get stateDeviceStorageFull => 'Not enough device storage';

  @override
  String get statePluginNoWritePermission => 'No write permission';

  @override
  String get statePluginConfigReadOnly => 'Engine configuration directory isn’t writable';

  @override
  String get statePluginIntegrityFailed => 'File verification failed';

  @override
  String get statePluginDownloadIncomplete => 'Downloaded file is incomplete';

  @override
  String get statePluginBuildScripts => 'Build scripts required';

  @override
  String get statePluginBuildApproval => 'Build scripts need approval';

  @override
  String get statePluginAlreadyInstalled => 'Already installed';

  @override
  String get statePluginUninstallFirst => 'Uninstall before switching versions';

  @override
  String get statePluginInvalid => 'Not a DSH plugin';

  @override
  String get statePluginNoEntry => 'This package has no plugin entry. Installation rolled back.';

  @override
  String get statePluginInUse => 'Plugin is in use';

  @override
  String get statePluginHasDependents => 'Other plugins depend on it';

  @override
  String get statePluginManagedElsewhere => 'Can’t change this here';

  @override
  String get statePluginEngineManaged => 'This plugin is managed by the engine';

  @override
  String get statePluginAuthorizationExpired => 'Authorization expired';

  @override
  String get statePluginBuildChanged => 'Build scripts changed. Reinstall the plugin.';

  @override
  String get statePluginInvalidAddress => 'Invalid installation URL';

  @override
  String get statePluginCatalogInvalidAddress => 'The catalog’s installation URL is invalid';

  @override
  String get statePluginOperationIncomplete => 'Operation didn’t finish';

  @override
  String get statePluginRemoteForbidden => 'This host doesn’t allow remote installation';

  @override
  String get statePluginRelayToggleOnly => 'Relay connections can only turn plugins on or off';

  @override
  String get statePluginManagementUnsupported => 'Host doesn’t support plugin management';

  @override
  String get statePluginEngineUnsupported => 'This engine doesn’t support plugin management';

  @override
  String get statePluginResultMissing => 'Couldn’t get the installation result';

  @override
  String get statePluginResultPending => 'Installation result pending';

  @override
  String get statePluginDisconnected => 'Disconnected';

  @override
  String get statePluginQueued => 'Queued';

  @override
  String get statePluginRemoving => 'Uninstalling old version';

  @override
  String get statePluginInstalling => 'Downloading and installing';

  @override
  String get statePluginApplying => 'Enabling';

  @override
  String get statePluginCancelling => 'Cancelling';

  @override
  String get statePluginInstalledRestart => 'Installed. Restart to apply.';

  @override
  String get statePluginInstallFailed => 'Couldn’t install';

  @override
  String get statePluginConnectFirst => 'Connect to install plugins';

  @override
  String get stateProviderOpenAi => 'OpenAI compatible';

  @override
  String get stateProviderAnthropic => 'Anthropic compatible';

  @override
  String get stateProviderUrlRequired => 'Enter a Base URL';

  @override
  String get stateProviderUrlInvalid => 'Enter a full URL starting with http:// or https://';

  @override
  String get stateProviderUrlSuffix => 'Remove the part after ? or #';

  @override
  String get stateProviderKeyRequired => 'Enter an API key';

  @override
  String get stateProviderKeyOnly => 'Paste only the key, without the variable name';

  @override
  String get stateProviderKeyQuotes => 'Remove the surrounding quotes';

  @override
  String get stateProviderKeyInvalid => 'Key contains invalid characters';

  @override
  String get stateProviderModelRequired => 'Enter a model ID';

  @override
  String get stateProviderModelSpaces => 'Model ID can’t contain spaces';

  @override
  String get stateProviderAlreadyAdded => 'Already added';

  @override
  String get stateProviderConflict => 'Provider changed. Go back and try again.';

  @override
  String get stateProviderUnsupported => 'This engine version doesn’t support this action';

  @override
  String get stateProviderKeyRejected => 'API key is invalid or lacks permission';

  @override
  String get stateProviderModelsMissing => 'Model list not found. Check the Base URL.';

  @override
  String get stateProviderRateLimited => 'Too many requests. Try again later.';

  @override
  String get stateProviderResponseTooLarge => 'Response is too large';

  @override
  String get stateProviderUnreachable => 'Can’t reach this address. Check the Base URL and network.';

  @override
  String get stateProviderModelsUnreadable => 'Couldn’t read the model list. Check the Base URL.';

  @override
  String get stateProviderManualModels => 'This protocol can’t list models. Add them manually.';

  @override
  String get stateProviderConfigRejected => 'The engine rejected this configuration. Check the protocol and model.';

  @override
  String get stateProviderOffline => 'Can’t reach the engine';

  @override
  String get stateSafeStartupFailed => 'Failed to start';

  @override
  String get stateSafeCrashedEarly => 'Crashed shortly after starting';

  @override
  String get stateSafeCrashedLate => 'Crashed while running';

  @override
  String get stateSafeKilled => 'Stopped by the system';

  @override
  String get stateSafeManualEntry => 'I entered Safe mode manually';

  @override
  String get stateScheduleNotCreated => 'Chat ended without creating the automation';

  @override
  String get stateScheduleChatFailed => 'Chat failed';

  @override
  String get stateScheduleResultPending => 'Still waiting for a result';

  @override
  String get statePlanPending => 'Plan review';

  @override
  String get stateQuestionPending => 'Needs an answer';

  @override
  String get stateExportRelayUnsupported => 'Export isn’t available over Relay yet';

  @override
  String get stateExportChatMissing => 'Chat not found';

  @override
  String get stateExportFailed => 'Couldn’t export';

  @override
  String get stateSizeExtraLarge => 'Extra large';

  @override
  String get stateSubscriptionUnsupported => 'This engine doesn’t support subscription sign-in';

  @override
  String get stateSubscriptionUnreachable => 'Can’t reach the sign-in service. Check your network and try again.';

  @override
  String get stateSubscriptionSignInFailed => 'Couldn’t finish signing in. Try again.';

  @override
  String get stateSubscriptionTimeout => 'Request timed out. Check your network and try again.';

  @override
  String get stateSubscriptionDisconnected => 'Engine disconnected. Try again later.';

  @override
  String get stateTerminalLimit => 'Terminal limit reached';

  @override
  String get stateTerminalStartFailed => 'Couldn’t start terminal';

  @override
  String get stateTileDuotone => 'Duotone';

  @override
  String get stateTileGeometric => 'Geometric';

  @override
  String get stateTileGlassy => 'Glass';

  @override
  String get stateUiNative => 'Native';

  @override
  String get stateDefaultWorkspace => 'Default workspace';

  @override
  String stateDiagnosticsSaved(String where) {
    return 'Saved to $where';
  }

  @override
  String get stateDownloadsPrefix => 'Downloads/';

  @override
  String stateSharePluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count plugins', one: '1 plugin');
    return '$_temp0';
  }

  @override
  String stateShareSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count skills', one: '1 skill');
    return '$_temp0';
  }

  @override
  String stateShareSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count settings groups',
      one: '1 settings group',
    );
    return '$_temp0';
  }

  @override
  String stateAlertCompletedReply(String reply) {
    return 'Completed · $reply';
  }

  @override
  String stateAlertErrorDetail(String detail) {
    return 'Error · $detail';
  }

  @override
  String stateAlertUseTool(String name) {
    return 'Use tool $name';
  }

  @override
  String stateAlertApprovalAction(String action) {
    return 'Needs approval: $action';
  }

  @override
  String stateAlertApprovalReason(String action, String reason) {
    return 'Needs approval: $action · $reason';
  }

  @override
  String stateAlertQuestions(String question, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Question for you: $question ($count total)',
      one: 'Question for you: $question (1 total)',
    );
    return '$_temp0';
  }

  @override
  String stateAlertQuestionText(String question) {
    return 'Question for you: $question';
  }

  @override
  String statePetChatsDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats finished',
      one: '1 chat finished',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats failed',
      one: '1 chat failed',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsApproval(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats need approval',
      one: '1 chat needs approval',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chats need your answer',
      one: '1 chat needs your answer',
    );
    return '$_temp0';
  }

  @override
  String stateAttachmentEmpty(String name) {
    return '“$name” is empty';
  }

  @override
  String stateAttachmentImageLimit(String name) {
    return 'Image “$name” exceeds 20 MB';
  }

  @override
  String stateAttachmentFileLimit(String name) {
    return 'File “$name” exceeds 30 MB';
  }

  @override
  String stateBotFinished(String name) {
    return '$name finished working';
  }

  @override
  String stateBotQuestion(String name, String text) {
    return '$name asks: $text';
  }

  @override
  String stateBotApproval(String name, String text) {
    return '$name needs approval: $text';
  }

  @override
  String get stateCommandPlanHint => '[off | request]';

  @override
  String get stateCommandGoalHint => '[goal | clear | pause | resume]';

  @override
  String stateShareReadFailed(String name) {
    return 'Couldn’t read “$name”';
  }

  @override
  String stateShareAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Up to $count attachments per message',
      one: 'Up to 1 attachment per message',
    );
    return '$_temp0';
  }

  @override
  String stateShareNamedFileTooLarge(String name) {
    return '“$name” is too large and wasn’t added';
  }

  @override
  String stateShareTextTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Text is too long. Kept the first $count characters.',
      one: 'Text is too long. Kept the first character.',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMinimum(String bound) {
    return 'Must be at least $bound';
  }

  @override
  String stateSettingsMaximum(String bound) {
    return 'Must be at most $bound';
  }

  @override
  String stateSettingsMultiple(String bound) {
    return 'Must be a multiple of $bound';
  }

  @override
  String stateSettingsMinLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'At least $count characters',
      one: 'At least 1 character',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMaxLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'At most $count characters',
      one: 'At most 1 character',
    );
    return '$_temp0';
  }

  @override
  String stateEngineHttpRejected(int status) {
    return 'The engine rejected the request ($status)';
  }

  @override
  String stateGoalActionOffline(String action) {
    return '$action: Can’t reach the engine';
  }

  @override
  String stateHostRemoteLabel(String name) {
    return '$name · Remote';
  }

  @override
  String stateMarketHttpError(int status) {
    return 'Can’t open the plugin catalog (HTTP $status)';
  }

  @override
  String statePluginRuntimeIncompatible(String version) {
    return 'This plugin doesn’t support the current DSH version ($version).';
  }

  @override
  String statePluginRequiredVersion(String wanted, String current) {
    return 'This plugin requires DSH $wanted. Current version: $current.';
  }

  @override
  String get statePluginRegistryUnreachable => 'Can’t reach the registry';

  @override
  String statePluginNamedRegistryUnreachable(String registry) {
    return 'Can’t reach the registry ($registry)';
  }

  @override
  String statePluginBuildsPending(String builds) {
    return 'Needs approval: $builds';
  }

  @override
  String statePluginRegistryProgress(String registry, int attempt, int attempts) {
    return 'Downloading from $registry (registry $attempt/$attempts)';
  }

  @override
  String stateProviderServiceUnavailable(int status) {
    return 'Service unavailable ($status)';
  }

  @override
  String stateProviderServiceStatus(int status) {
    return 'Service returned $status';
  }

  @override
  String stateProviderKeySaveFailed(String reason) {
    return 'Provider saved, but the key wasn’t: $reason';
  }

  @override
  String stateSafeSuspectPlugins(String what, String plugins) {
    return '$what, suspected plugins: $plugins';
  }

  @override
  String stateSafePreflightFailed(String what, String checks) {
    return '$what, startup checks failed: $checks';
  }

  @override
  String get stateListSeparator => ', ';

  @override
  String stateSafeRepairPrompt(String what) {
    return 'My DSH has a problem in normal mode ($what). Follow the Safe mode instructions to find the cause. Fix the web configuration using reversible changes, verify startup with dsh-app-plugins trial, then tell me what changed.';
  }

  @override
  String stateScheduleCreatePrompt(String title, String rule, String args) {
    return 'Create automation “$title”: $rule.\nCall schedule_create exactly once, using these arguments unchanged. Don’t run the task now.\n\n```json\n$args\n```';
  }

  @override
  String stateActionReason(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String stateAlertPreviewRun(String value) {
    return 'Run: $value';
  }

  @override
  String stateAlertPreviewWrite(String value) {
    return 'Write: $value';
  }

  @override
  String stateAlertPreviewEdit(String value) {
    return 'Edit: $value';
  }

  @override
  String stateAlertPreviewOpen(String value) {
    return 'Open: $value';
  }

  @override
  String stateAlertPreviewUse(String value) {
    return 'Use tool: $value';
  }

  @override
  String get stateUiWeb => 'Web';

  @override
  String statePluginRegistryProgressUnknown(String registry, int attempt) {
    return 'Downloading from $registry (registry $attempt/null)';
  }

  @override
  String get stateProviderTokenCountInvalid => 'Enter a number, like 128K';

  @override
  String get appSlogan => 'Anytime, anywhere. Just Go!';

  @override
  String get updateCheck => 'Check for updates';

  @override
  String get updateAutoCheck => 'Check automatically';

  @override
  String get updateAutoCheckDaily => 'Once a day';

  @override
  String get updateTileDownloading => 'Downloading';

  @override
  String updateTileDownloadingPercent(int percent) {
    return 'Downloading $percent%';
  }

  @override
  String get updateTileVerifying => 'Verifying';

  @override
  String get updateTileReady => 'Ready to install';

  @override
  String get updateTileInstalling => 'Installing';

  @override
  String updateTileSkipped(String version) {
    return 'Skipped $version';
  }

  @override
  String updateTileNewVersion(String version) {
    return 'New: $version';
  }

  @override
  String get updateTileUpToDate => 'Up to date';

  @override
  String get updateTileUnavailable => 'Can’t check right now';

  @override
  String get updateUpToDate => 'You’re up to date';

  @override
  String get updateCheckUnavailable => 'Can’t check for updates right now. Try again later.';

  @override
  String get updateDownloadInterrupted => 'Download interrupted';

  @override
  String get updateDownloadInterruptedMessage => 'The network is disconnected or too slow. Retry to resume.';

  @override
  String get updateDownloadUnavailable => 'Download link unavailable';

  @override
  String get updateDownloadUnavailableMessage => 'Try again later, or download from the release page.';

  @override
  String get updateChecksumFailed => 'Package verification failed';

  @override
  String get updateChecksumFailedMessage => 'The file doesn’t match the release and was deleted. Try again.';

  @override
  String get updateChecksumMissing => 'Verification info missing';

  @override
  String get updateChecksumMissingMessage => 'For safety, download from the release page to install.';

  @override
  String get updateStorageWriteFailed => 'Couldn’t save package';

  @override
  String get updateStorageWriteFailedMessage => 'Storage may be full. Free up space and try again.';

  @override
  String get updateFreeSpaceRetry => 'Free up space and try again.';

  @override
  String updateSpaceRequired(String size) {
    return 'About $size of free space needed. Free up space and try again.';
  }

  @override
  String get updateSettingsOpenFailed => 'Couldn’t open system settings';

  @override
  String get updateSettingsOpenFailedMessage =>
      'Allow “Install unknown apps” in Settings → Apps → DSH Go, then return to install.';

  @override
  String get updateInstallCancelled => 'Installation cancelled';

  @override
  String get updateInstallCancelledMessage => 'The package is saved. You can install it anytime.';

  @override
  String get updateSignatureMismatch => 'App signatures don’t match';

  @override
  String get updateSignatureMismatchMessage =>
      'The DSH Go on your phone has a different signature (usually a test build). Uninstall it before installing this version. Uninstalling erases your chats, Linux environment, and settings.';

  @override
  String get updateWrongPackage => 'This isn’t a DSH package';

  @override
  String get updateWrongPackageMessage => 'The wrong file was downloaded and deleted. Try again later.';

  @override
  String get updateDowngradeBlocked => 'Can’t install an older version';

  @override
  String get updateDowngradeBlockedMessage => 'The DSH on your phone is newer than this package.';

  @override
  String get updateIncompatible => 'Incompatible with this phone';

  @override
  String get updateIncompatibleMessage =>
      'The package’s required Android version or processor architecture doesn’t match your phone.';

  @override
  String get updatePackageCorrupt => 'Package is damaged';

  @override
  String get updatePackageCorruptMessage => 'It was deleted. Download it again.';

  @override
  String get updateInstallBlocked => 'Installation blocked';

  @override
  String get updateInstallBlockedMessage =>
      'Allow installation in the system prompt, or download from the release page.';

  @override
  String get updateInstallIncomplete => 'Installation incomplete';

  @override
  String get updateInstallIncompleteMessage => 'Try again, or download from the release page.';

  @override
  String updateBrowserOpenFailed(String host, String path) {
    return 'Couldn’t open your browser. Visit $host$path manually.';
  }

  @override
  String updateUpToDateVersion(String version) {
    return 'You’re up to date: $version';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Current $version';
  }

  @override
  String get updateNewVersionFound => 'New version available';

  @override
  String get updateReleaseNotes => 'What’s new';

  @override
  String get updateNoReleaseNotes => 'No release notes for this version.';

  @override
  String get updateInstallKeepsData => 'DSH Go closes to install. Your chats and settings stay.';

  @override
  String get updateNoCompatiblePackage => 'No package for this phone';

  @override
  String get updateDownloading => 'Downloading';

  @override
  String updateDownloadSource(String source) {
    return 'Via $source';
  }

  @override
  String get updateDownloadInBackgroundNote => 'Download continues after you close this window';

  @override
  String get updateVerifyingPackage => 'Verifying package…';

  @override
  String get updateVerifyingPackageNote => 'Checking the file matches the release';

  @override
  String get updateInstalling => 'Installing…';

  @override
  String get updateConfirmInstallNote => 'Confirm installation in the system prompt';

  @override
  String get updatePackageDownloaded => 'Package downloaded';

  @override
  String get updateReadyToInstall => 'Verified and ready to install.';

  @override
  String get updateAllowInstall => 'Allow DSH Go to install apps';

  @override
  String get updateAllowInstallMessage =>
      'Turn on “Install unknown apps” in system settings. Installation resumes when you return.';

  @override
  String get updateOpenReleasePage => 'Open release page';

  @override
  String get updateUpdateNow => 'Update now';

  @override
  String get updateSkipVersion => 'Skip this version';

  @override
  String get updateStarProject => 'Star it';

  @override
  String get updateCancelDownload => 'Cancel download';

  @override
  String get updateDownloadInBackground => 'Download in background';

  @override
  String get updateVerifying => 'Verifying…';

  @override
  String get updateInstallingBusy => 'Installing…';

  @override
  String get updateOpenPermissionSettings => 'Turn on';

  @override
  String updateNoAbiPackage(String abi) {
    return 'No $abi package for this release yet. Check the release page.';
  }

  @override
  String get updateNoPackage => 'No package for this release yet. Check the release page.';

  @override
  String updateDownloadingPercent(int percent) {
    return 'Downloading $percent%';
  }

  @override
  String get usageStatsTitle => 'Send anonymous usage stats';

  @override
  String get usageStatsSection => 'Improve DSH Go';

  @override
  String get usageStatsFooter => 'Only usage counts, versions and the phone’s maker. Never chats, files or accounts.';

  @override
  String get usageNoticeBody => 'No chats or personal info.\nTurn off anytime.';

  @override
  String get usageUpgradeNotice => 'New: anonymous usage stats, to help improve DSH Go.\nNo chats or personal info.';

  @override
  String get usageUpgradeLearn => 'Learn more';

  @override
  String get usageUpgradeOff => 'Turn off';

  @override
  String viewArtifactSaved(String value) {
    return 'Saved to $value';
  }

  @override
  String get viewDownloadFolder => 'Downloads/';

  @override
  String get viewArtifactNoPreview => 'Can’t preview';

  @override
  String get viewArtifactNotText => 'Not a text file';

  @override
  String get viewArtifactLarge => 'Large file';

  @override
  String get viewArtifactMissing => 'This file is no longer available';

  @override
  String get viewArtifactNotFile => 'This isn’t a file';

  @override
  String get viewArtifactOpenFailed => 'Couldn’t open';

  @override
  String get viewArtifactMore => 'More actions';

  @override
  String get viewWorkspace => 'Workspace';

  @override
  String get viewArtifactEmpty => 'Empty file';

  @override
  String viewArtifactLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count lines', one: '1 line');
    return 'Large file. Showing the first $_temp0';
  }

  @override
  String viewArtifactRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count rows', one: '1 row');
    return 'Showing the first $_temp0';
  }

  @override
  String get viewArtifactColumns => 'Showing the first 200 columns';

  @override
  String viewArtifactWorksheet(int value) {
    return 'Sheet $value';
  }

  @override
  String get viewArtifactEmptySheet => 'Empty sheet';

  @override
  String get viewArtifactEmptyTable => 'Empty table';

  @override
  String get viewArtifactConvertFailed => 'Couldn’t convert';

  @override
  String get viewArtifactConverting => 'Converting to PDF…';

  @override
  String get viewArtifactImageFailed => 'Can’t display this image';

  @override
  String get viewArtifactPhoneOpen => 'Open in an app on this phone';

  @override
  String get viewArtifactPdfFailed => 'Can’t open this PDF. Try another app.';

  @override
  String viewArtifactPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count pages', one: '1 page');
    return '$_temp0';
  }

  @override
  String viewArtifactPage(int value) {
    return 'Page $value';
  }

  @override
  String get viewBalanceInvalidKey => 'Invalid key. Can’t check balance.';

  @override
  String get viewBalancePrefix => 'Balance ';

  @override
  String get viewBalanceLowSuffix => ' · Low balance';

  @override
  String get viewBalanceUnavailableSuffix => ' · Calls unavailable';

  @override
  String get viewBalanceTopUp => 'Top up';

  @override
  String get viewBalanceTitle => 'DeepSeek balance';

  @override
  String get viewBalanceKeyRequired => 'Enter an API key to check your balance';

  @override
  String get viewBalanceKeyInvalid => 'Invalid API key. Can’t check balance.';

  @override
  String viewBalancePaid(String value) {
    return 'Paid $value';
  }

  @override
  String viewBalanceGranted(String value) {
    return 'Bonus $value';
  }

  @override
  String get viewBalanceLow => 'Low balance';

  @override
  String get viewBalanceUnavailable => 'Calls unavailable';

  @override
  String get viewBalanceChecking => 'Checking balance…';

  @override
  String get viewBalanceCheckFailed => 'Can’t check balance right now';

  @override
  String get viewBalanceNoAlert => 'Off';

  @override
  String viewBalanceBelow(String value) {
    return 'Below $value';
  }

  @override
  String get viewBalanceAlert => 'Low balance alert';

  @override
  String get viewBalanceThreshold => 'Alert threshold';

  @override
  String get viewBalanceGoTopUp => 'Top up';

  @override
  String viewBalanceRemaining(String value) {
    return 'Only $value left';
  }

  @override
  String get viewBalanceModelDisabled => 'Insufficient balance. Model disabled.';

  @override
  String get viewBalanceRestore => 'Top up to resume';

  @override
  String get viewUiIncomplete => 'View is still generating';

  @override
  String get viewUiInvalid => 'This view has a formatting error';

  @override
  String get viewUiResend => 'Ask to resend';

  @override
  String viewChartUnit(String value) {
    return 'Unit: $value';
  }

  @override
  String viewChartSeries(int value) {
    return 'Series $value';
  }

  @override
  String get viewChartTotal => 'Total';

  @override
  String get viewChartBar => 'Bar chart';

  @override
  String get viewChartHorizontalBar => 'Horizontal bar chart';

  @override
  String get viewChartLine => 'Line chart';

  @override
  String get viewChartDonut => 'Donut chart';

  @override
  String viewUiResendMessage(Object value) {
    return 'The previous dsh-ui view couldn’t be displayed: $value. Fix it and resend.';
  }

  @override
  String viewUiBytesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first bytes', one: 'second byte');
    String _temp1 = intl.Intl.pluralLogic(second, locale: localeName, other: '$second bytes', one: 'second byte');
    return 'View is $_temp0, exceeding the limit of $_temp1';
  }

  @override
  String get viewUiEmptyCode => 'Code block is empty';

  @override
  String viewUiInvalidJson(String message) {
    return 'Invalid JSON ($message)';
  }

  @override
  String get viewUiJsonRepaired => 'Comments or trailing commas ignored';

  @override
  String get viewUiExpectedObject => 'Expected a component object';

  @override
  String viewUiDepthLimit(int first, int second) {
    return 'Depth $first exceeds the limit of $second';
  }

  @override
  String get viewUiMissingType => 'Missing type';

  @override
  String viewUiUnknownComponent(String value) {
    return 'Unknown component $value';
  }

  @override
  String viewUiAvailableTypes(String first, String second) {
    return '$first; available: $second';
  }

  @override
  String viewUiExpectedChildren(int limit) {
    return 'Expected an array of 1 to $limit components';
  }

  @override
  String viewUiHiddenItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count more items hidden',
      one: '1 more item hidden',
    );
    return 'Truncated: $_temp0';
  }

  @override
  String viewUiNodeLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first components',
      one: 'second component',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second items truncated',
      one: 'second item truncated',
    );
    return 'Exceeded $_temp0; last $_temp1';
  }

  @override
  String viewUiChildLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first items', one: 'second item');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second items truncated',
      one: 'second item truncated',
    );
    return 'Exceeded $_temp0; last $_temp1';
  }

  @override
  String get viewUiExpectedString => 'Expected a string';

  @override
  String viewUiTextLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first characters',
      one: 'second character',
    );
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String get viewUiTextTruncated => 'Truncated: text too long';

  @override
  String get viewUiExpectedFinite => 'Expected a finite number';

  @override
  String get viewUiYes => 'Yes';

  @override
  String get viewUiNo => 'No';

  @override
  String get viewUiExpectedStringNumber => 'Expected a string or number';

  @override
  String viewUiUnknownTone(String value) {
    return 'Unknown tone $value, ignored; available: good, warn, bad';
  }

  @override
  String viewUiUnknownChart(String value) {
    return 'Unknown chart $value, drawn as bars; available: bar, hbar, line, donut';
  }

  @override
  String get viewUiExpectedCategories => 'Expected a non-empty array of labels';

  @override
  String viewUiCategoryLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first categories',
      one: 'second category',
    );
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String viewUiFirstPoints(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit points', one: '1 point');
    return 'Showing only the first $_temp0';
  }

  @override
  String viewUiExpectedSeries(String shape) {
    return 'Expected a non-empty array of $shape objects';
  }

  @override
  String get viewUiSkippedSeries => 'Expected an array of numbers; series skipped';

  @override
  String viewUiValuesCategories(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first values', one: 'second value');
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second categories',
      one: 'second category',
    );
    return '$_temp0 for $_temp1; extra values dropped, missing values left blank';
  }

  @override
  String viewUiNonFiniteValues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count non-finite values',
      one: '1 non-finite value',
    );
    return '$_temp0 left blank';
  }

  @override
  String get viewUiNoSeries => 'No series to draw';

  @override
  String viewUiDonutSeries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count other series ignored',
      one: '1 other series ignored',
    );
    return 'Donut chart uses one series; $_temp0';
  }

  @override
  String get viewUiFirstSeries => 'Drawing only the first series';

  @override
  String viewUiSeriesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first series', one: 'second series');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String viewUiFirstSeriesCount(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit series', one: '1 series');
    return 'Showing only the first $_temp0';
  }

  @override
  String get viewUiNoFiniteValues => 'No finite values';

  @override
  String viewUiTruncated(String value) {
    return 'Truncated: $value';
  }

  @override
  String viewUiExpectedCompare(int limit, String shape) {
    return 'Expected an array of 2 to $limit $shape objects';
  }

  @override
  String viewUiItemLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first items', one: 'second item');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String viewUiFirstItems(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit items', one: '1 item');
    return 'Showing only the first $_temp0';
  }

  @override
  String viewUiSkippedCompare(String shape) {
    return 'Expected $shape; item skipped';
  }

  @override
  String get viewUiSkippedItemLabel => 'Expected a non-empty string; item skipped';

  @override
  String viewUiRowLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first rows', one: 'second row');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String get viewUiSkippedRow => 'Expected [name, value]; row skipped';

  @override
  String get viewUiNoItems => 'No items to draw';

  @override
  String viewUiFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit rows', one: '1 row');
    return 'Showing only the first $_temp0 per item';
  }

  @override
  String viewUiExpectedSteps(String shape) {
    return 'Expected a non-empty array of $shape objects';
  }

  @override
  String viewUiStepLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first steps', one: 'second step');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String viewUiFirstSteps(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit steps', one: '1 step');
    return 'Truncated: showing only the first $_temp0';
  }

  @override
  String viewUiSkippedStep(String shape) {
    return 'Expected $shape; step skipped';
  }

  @override
  String viewUiUnknownStatus(String value) {
    return 'Unknown status $value, drawn as todo; available: done, current, todo, failed';
  }

  @override
  String get viewUiNoSteps => 'No steps to draw';

  @override
  String viewUiUnknownCalloutTone(String value) {
    return 'Unknown tone $value, drawn as info; available: info, good, warn, bad';
  }

  @override
  String viewUiExpectedOptions(int limit, String shape) {
    return 'Expected an array of 1 to $limit $shape options';
  }

  @override
  String viewUiOptionLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(first, locale: localeName, other: '$first options', one: 'second option');
    return '$_temp0, exceeding the limit of $second';
  }

  @override
  String viewUiFirstOptions(int limit) {
    String _temp0 = intl.Intl.pluralLogic(limit, locale: localeName, other: '$limit options', one: '1 option');
    return 'Truncated: showing only the first $_temp0';
  }

  @override
  String viewUiDuplicateLabel(String value) {
    return 'Duplicate label $value; skipped';
  }

  @override
  String get viewUiNoOptions => 'No usable options';

  @override
  String viewUiSummaryBody(String value) {
    return '[View] $value';
  }

  @override
  String viewUiSummaryTitleBody(String first, String second) {
    return '[View] $first: $second';
  }

  @override
  String get viewUiSummaryInvalid => '[View] (formatting error, couldn’t display)';

  @override
  String viewUiSummaryText(String value) {
    return 'Text: $value';
  }

  @override
  String viewUiSummaryChart(String summary) {
    return 'Chart: $summary';
  }

  @override
  String viewUiSummaryCompare(String value) {
    return 'Compare: $value';
  }

  @override
  String viewUiSummarySteps(String value) {
    return 'Steps: $value';
  }

  @override
  String viewUiSummaryCallout(String value) {
    return 'Note: $value';
  }

  @override
  String viewUiSummaryOptions(String value) {
    return 'Options: $value';
  }

  @override
  String viewUiSummaryConfirm(String first, String second) {
    return 'Confirm: $first/$second';
  }

  @override
  String viewUiReplyChoice(String value) {
    return 'Select: $value';
  }

  @override
  String viewUiReplyConfirm(String value) {
    return 'Confirm: $value';
  }

  @override
  String viewUiReplyCancel(String value) {
    return 'Cancel: $value';
  }

  @override
  String viewUiChosen(String value) {
    return 'Selected: $value';
  }

  @override
  String get viewUiConfirmed => 'Confirmed';

  @override
  String viewUiConfirmedValue(String value) {
    return 'Confirmed: $value';
  }

  @override
  String viewUiCancelledValue(String value) {
    return 'Cancelled: $value';
  }

  @override
  String get viewUiReplied => 'Replied';

  @override
  String get viewUiGenerating => 'Generating view';

  @override
  String get viewUiReplyAfterEnd => 'Choose when the reply is complete';

  @override
  String get viewUiExpired => 'Expired';

  @override
  String get viewUiNotStarted => 'Not started';

  @override
  String get viewUiMultiple => 'Select multiple';

  @override
  String get viewSuggestWorkspace => 'Explore workspace';

  @override
  String get viewSuggestWorkspacePrompt =>
      'Check what files and projects are in the workspace and give me a brief overview.';

  @override
  String get viewSuggestWordCount => 'Count words';

  @override
  String get viewSuggestWordCountPrompt =>
      'Write a Python script that finds the 20 most frequent words in a text file, then run it and show me the results.';

  @override
  String get viewSuggestNode => 'Start Node.js';

  @override
  String get viewSuggestNodePrompt =>
      'Create a Node.js project in the workspace with TypeScript and a minimal unit test.';

  @override
  String get viewSuggestGit => 'Rebase or merge';

  @override
  String get viewSuggestGitPrompt =>
      'Use a concrete example to explain the difference between git rebase and git merge, and when to use each.';

  @override
  String get viewGreetingMorning => 'Good morning';

  @override
  String get viewGreetingNoon => 'Good afternoon';

  @override
  String get viewGreetingAfternoon => 'Good afternoon';

  @override
  String get viewGreetingEvening => 'Good evening';

  @override
  String get viewGreetingNight => 'It’s late';

  @override
  String get viewEmptySubtitle => 'What would you like to do today?';

  @override
  String get viewEmptyStarting => 'Starting engine…';

  @override
  String get viewEmptyConnecting => 'Connecting to engine…';

  @override
  String get viewEmptyDisconnected => 'Engine not connected';

  @override
  String get viewEmptyReconnect => 'Reconnect';

  @override
  String viewEmptyWorkspace(String value) {
    return 'In “$value”';
  }

  @override
  String get viewEmptySwitchWorkspace => 'Switch workspace';

  @override
  String get viewScheduleTitle => 'Automations';

  @override
  String get viewScheduleRefreshFailed => 'Couldn’t refresh';

  @override
  String get viewScheduleNone => 'No active automations';

  @override
  String viewScheduleNext(String value) {
    return 'Next $value';
  }

  @override
  String get viewScheduleUntitled => 'Untitled automation';

  @override
  String get viewScheduleSendFailed => 'Couldn’t send';

  @override
  String get viewScheduleEnded => 'Ended';

  @override
  String get viewScheduleUpcoming => 'Up next';

  @override
  String get viewScheduleSending => 'Sending…';

  @override
  String get viewScheduleRunNow => 'Run now';

  @override
  String get viewScheduleManage => 'Manage';

  @override
  String viewScheduleToday(String value) {
    return 'Today $value';
  }

  @override
  String viewScheduleTomorrow(String value) {
    return 'Tomorrow $value';
  }

  @override
  String viewScheduleYesterday(String value) {
    return 'Yesterday $value';
  }

  @override
  String viewScheduleWeekday(String first, String second) {
    return '$first $second';
  }

  @override
  String get viewScheduleDue => 'Due now';

  @override
  String viewScheduleDaysAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count days', one: '1 day');
    return 'In $_temp0';
  }

  @override
  String viewScheduleDaysOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count days', one: '1 day');
    return '$_temp0 overdue';
  }

  @override
  String viewScheduleSingleLabel(String title) {
    return 'Automation: $title';
  }

  @override
  String viewScheduleCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automations', one: '1 automation');
    return '$_temp0';
  }

  @override
  String get viewModelSelect => 'Choose model';

  @override
  String get viewModelThinkingOff => 'Off';

  @override
  String get viewModelThinkingMinimal => 'Minimal';

  @override
  String get viewModelThinkingLow => 'Low';

  @override
  String get viewModelThinkingMedium => 'Medium';

  @override
  String get viewModelThinkingHigh => 'High';

  @override
  String get viewModelThinkingMax => 'Max';

  @override
  String viewModelLabel(String value) {
    return 'Model: $value';
  }

  @override
  String viewModelEffortLabel(String value) {
    return 'Thinking effort $value';
  }

  @override
  String get viewModelLoadFailed => 'Couldn’t load models';

  @override
  String get viewModelDisconnected => 'Engine not connected';

  @override
  String get viewModelConnectHint => 'Connect to choose a model';

  @override
  String get viewModelEffort => 'Thinking effort';

  @override
  String get viewModelKeyRequired => 'API key needed';

  @override
  String get viewModelProvidersHint => 'Supports DeepSeek and other model providers';

  @override
  String get viewModelEnterKey => 'Enter API key';

  @override
  String get viewModelAddProvider => 'Add provider';

  @override
  String get viewModelNone => 'No models available';

  @override
  String get viewModelKeyHint => 'Key may not be active or may have expired';

  @override
  String get viewModelManageProviders => 'Manage providers';

  @override
  String get viewContinuePrompt => 'Continue the chat attached here:';

  @override
  String viewContinueRange(int first, int second, int third) {
    String _temp0 = intl.Intl.pluralLogic(third, locale: localeName, other: '$third turns', one: '1 turn');
    return 'Turns $first–$second of $_temp0';
  }

  @override
  String viewContinueHeader(String value) {
    return '> Shared DSH Go chat · $value\n';
  }

  @override
  String get viewContinueUser => '\n## User\n\n';

  @override
  String viewImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count images', one: '1 image');
    return '$_temp0';
  }

  @override
  String viewContinueAttachments(String value) {
    return '\n(Attachments: $value)\n';
  }

  @override
  String get viewContinueAssistant => '\n## Assistant\n\n';

  @override
  String get viewContinueInterrupted => '\n(Reply interrupted)\n';

  @override
  String get viewContinueFailed => '(Failed)';

  @override
  String get viewContinueDeclined => '(Declined)';

  @override
  String get viewContinueCancelled => '(Cancelled)';

  @override
  String get viewLinkWeek => '7 days';

  @override
  String get viewLinkMonth => '30 days';

  @override
  String get viewLinkForever => 'Forever';

  @override
  String get viewShareChat => 'Chat';

  @override
  String get viewShareNoPermission => 'No storage permission. Couldn’t save.';

  @override
  String get viewShareOpenFailed => 'Couldn’t open share sheet';

  @override
  String get viewShareLinkFailed => 'Couldn’t create link. Try again later.';

  @override
  String viewShareLinkText(String first, String second) {
    return '“$first” · DSH Go chat\n$second';
  }

  @override
  String get viewShareEmpty => 'This chat has no content yet';

  @override
  String viewShareMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count messages', one: '1 message');
    return '$_temp0';
  }

  @override
  String viewShareToolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count tool calls', one: '1 tool call');
    return '$_temp0';
  }

  @override
  String get viewShareFileHint => 'Replay and continue in DSH Go';

  @override
  String get viewShareWebHint => 'Opens in any browser, even offline';

  @override
  String get viewShareMarkdownHint => 'Plain text, readable anywhere';

  @override
  String get viewShareLinkHint => 'End-to-end encrypted. The server can’t see your content.';

  @override
  String get viewSharePreview => 'Preview';

  @override
  String get viewShareWhole => 'Entire chat';

  @override
  String get viewShareScopeReply => 'This reply';

  @override
  String get viewShareScopePicked => 'Selected';

  @override
  String get viewShareThinking => 'Thinking';

  @override
  String get viewShareIncludeTools => 'Tool calls';

  @override
  String get viewShareChatFile => 'Chat file';

  @override
  String get viewShareWebPage => 'Web page';

  @override
  String get viewShareLink => 'Link';

  @override
  String get viewShareAsImage => 'Image';

  @override
  String get viewShareAsFile => 'File';

  @override
  String get viewShareAsText => 'Text';

  @override
  String get viewShareRedacted => 'Secrets hidden';

  @override
  String get viewShareAdjust => 'Edit';

  @override
  String viewShareTooLarge(int value) {
    return 'Over $value MB. Select fewer messages.';
  }

  @override
  String get viewShareCreateLink => 'Create link';

  @override
  String get viewShareStop => 'Stop sharing';

  @override
  String get viewShareStopTitle => 'Stop sharing?';

  @override
  String get viewShareStopped => 'Sharing stopped';

  @override
  String get viewQrCode => 'QR code';

  @override
  String viewShareTurn(int value) {
    return 'Turn $value';
  }

  @override
  String get viewReplayContinue => 'Continue chat';

  @override
  String viewReplayTurns(int first, int second) {
    return 'Turns $first–$second';
  }

  @override
  String viewReplaySeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count sec', one: '1 sec');
    return '$_temp0';
  }

  @override
  String viewReplayMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0';
  }

  @override
  String get viewReplayFull => 'Full chat';

  @override
  String get viewReplayPause => 'Pause';

  @override
  String get viewReplayRestart => 'Replay';

  @override
  String get viewReplayPlay => 'Play';

  @override
  String viewReplaySpeed(int value) {
    return 'Speed $value×';
  }

  @override
  String get viewTemplatePaper => 'Paper';

  @override
  String get viewTemplateGlass => 'Glass';

  @override
  String get viewTemplateCard => 'Card';

  @override
  String get viewShareProjectQr => 'Project QR code';

  @override
  String get viewShareBrandLine => 'DSH on your phone · Scan to get it';

  @override
  String get viewShareBrandLineNoQr => 'DSH on your phone';

  @override
  String viewShareSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count steps', one: '1 step');
    return '$_temp0';
  }

  @override
  String get viewShareWebSearch => 'Web search';

  @override
  String get viewShareOpenPage => 'Open web page';

  @override
  String get viewShareRunCommand => 'Run command';

  @override
  String get viewShareReadFile => 'View file';

  @override
  String get viewShareEditFile => 'Edit file';

  @override
  String get viewShareSubagent => 'Subagent';

  @override
  String get viewShareSkill => 'Use skill';

  @override
  String get viewSharePresentFiles => 'Present files';

  @override
  String get viewShareWorkflow => 'Workflow';

  @override
  String get viewSharePlugin => 'Call plugin';

  @override
  String get viewShareStars => 'Stars';

  @override
  String viewSharePluginTitle(String value) {
    return 'DSH plugin “$value”';
  }

  @override
  String viewShareInstallCommand(String value) {
    return 'Install: dsh plugin add $value';
  }

  @override
  String viewSharePhoneInstall(String value) {
    return 'Install on your phone: $value';
  }

  @override
  String get viewShareImages => 'Images';

  @override
  String get viewSharePickMessages => 'Select messages';

  @override
  String viewShareDoneCount(int count) {
    return 'Done ($count)';
  }

  @override
  String get viewShareImageMarker => '[Image]';

  @override
  String viewShareImagesMarker(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count images', one: '1 image');
    return '[$_temp0]';
  }

  @override
  String get viewShareYou => 'You';

  @override
  String get viewShareImageFailed => 'Couldn’t create image. Try again.';

  @override
  String get viewShareQuestion => 'Question';

  @override
  String get viewShareModelSteps => 'Model and steps';

  @override
  String get viewShareImagePreview => 'Share image preview';

  @override
  String get viewShareSaveImage => 'Save image';

  @override
  String viewScheduleHoursAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return 'In $_temp0';
  }

  @override
  String viewScheduleHoursOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0 overdue';
  }

  @override
  String viewScheduleMinutesAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return 'In $_temp0';
  }

  @override
  String viewScheduleMinutesOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count min', one: '1 min');
    return '$_temp0 overdue';
  }

  @override
  String viewScheduleSecondsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count sec', one: '1 sec');
    return 'In $_temp0';
  }

  @override
  String viewScheduleSecondsOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count sec', one: '1 sec');
    return '$_temp0 overdue';
  }

  @override
  String viewScheduleDate(String date, String clock) {
    return '$date $clock';
  }

  @override
  String viewScheduleYearDate(String year, String date, String clock) {
    return '$date, $year $clock';
  }

  @override
  String viewScheduleWeekdayName(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Mon',
      '2': 'Tue',
      '3': 'Wed',
      '4': 'Thu',
      '5': 'Fri',
      '6': 'Sat',
      'other': 'Sun',
    });
    return '$_temp0';
  }

  @override
  String viewReplayDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'Jan',
      '2': 'Feb',
      '3': 'Mar',
      '4': 'Apr',
      '5': 'May',
      '6': 'Jun',
      '7': 'Jul',
      '8': 'Aug',
      '9': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String viewReplayHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count h', one: '1 h');
    return '$_temp0';
  }

  @override
  String viewReplayHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(hours, locale: localeName, other: '$hours h', one: '1 h');
    String _temp1 = intl.Intl.pluralLogic(minutes, locale: localeName, other: '$minutes min', one: '1 min');
    return '$_temp0 $_temp1';
  }

  @override
  String viewUiHundredMillion(String value) {
    return '${value}B';
  }

  @override
  String viewUiTenThousand(String value) {
    return '${value}K';
  }

  @override
  String viewUiMillion(String value) {
    return '${value}M';
  }

  @override
  String get viewListSeparator => ', ';

  @override
  String get viewAttachmentSeparator => ', ';

  @override
  String viewUiInvalidJsonOffset(String message, int offset) {
    return 'Invalid JSON ($message, near character $offset)';
  }

  @override
  String get viewUiUnavailableChart => 'Can’t display chart';

  @override
  String get viewUiUnavailableMetric => 'Can’t display metric';

  @override
  String get viewUiUnavailableCompare => 'Can’t display comparison';

  @override
  String get viewUiUnavailableSteps => 'Can’t display steps';

  @override
  String get viewUiUnavailableCallout => 'Can’t display note';

  @override
  String get viewUiUnavailableOptions => 'Can’t display options';

  @override
  String get viewUiUnavailableConfirm => 'Can’t display confirmation';

  @override
  String get viewUiUnavailableText => 'Can’t display text';

  @override
  String get viewUiUnavailableGroup => 'Can’t display this group';

  @override
  String get viewUiUnavailablePart => 'Can’t display this section';

  @override
  String viewScheduleSingleNextLabel(String title, String when) {
    return 'Automation: $title, next $when';
  }

  @override
  String viewScheduleCountNextLabel(int count, String when) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count automations', one: '1 automation');
    return '$_temp0, next $when';
  }

  @override
  String get viewUiSkippedStepLabel => 'Expected a string; step skipped';

  @override
  String viewLabeledValue(String label, String value) {
    return '$label: $value';
  }

  @override
  String viewDescribedValue(String label, String description) {
    return '$label, $description';
  }

  @override
  String get viewSemicolonSeparator => '; ';

  @override
  String viewChartSemantics(String kind, String data) {
    return '$kind. $data';
  }

  @override
  String viewMetricSemantics(String label, String value) {
    return '$label $value';
  }

  @override
  String viewMetricCaptionSemantics(String label, String value, String caption) {
    return '$label $value, $caption';
  }

  @override
  String viewScheduleZone(String rule, String city, String offset) {
    return '$rule ($city · $offset)';
  }

  @override
  String viewContinueNotice(String text) {
    return '\n($text)\n';
  }

  @override
  String viewShareAltMarker(String alt) {
    return '[$alt]';
  }

  @override
  String get viewModelThinkingXhigh => 'Extra high';

  @override
  String viewUiDialectWebOnly(String kind) {
    return '$kind · View in DSH Web';
  }

  @override
  String get viewUiDialectKindInteractive => 'Interactive part';

  @override
  String get viewUiDialectKindChart => 'Chart';

  @override
  String get viewUiDialectKindDiagram => 'Diagram';

  @override
  String get viewUiDialectKindImage => 'Image';

  @override
  String get viewUiDialectKindAudio => 'Audio';

  @override
  String get viewUiDialectKindVideo => 'Video';

  @override
  String get viewUiDialectKindScene => '3D scene';

  @override
  String get viewUiDialectKindFiles => 'File tree';

  @override
  String get viewUiDialectKindMap => 'Map';

  @override
  String get viewUiDialectKindOther => 'This part';

  @override
  String get viewUiDialectInvalid => 'This block shows in DSH Web';

  @override
  String get viewUiDialectNote => 'Shown in DSH Web';

  @override
  String get voiceSettingsTitle => 'Voice input';

  @override
  String get voiceModeAuto => 'Automatic';

  @override
  String get voiceModeSystem => 'System';

  @override
  String get voiceModeEngine => 'Voice model';

  @override
  String get voiceModeAutoHint => 'Uses the voice model when it’s ready, otherwise the phone’s service';

  @override
  String get voiceModeSystemHint => 'Use the recognition service selected on this phone';

  @override
  String get voiceModeEngineHint => 'Recognizes speech with the engine’s voice model';

  @override
  String get voiceFallbackStarted => 'Switched to the voice model. Please speak again.';

  @override
  String get voiceChooseSystem => 'Select a speech recognition service in system settings';

  @override
  String get voiceConfigureEngine => 'Download the voice model in voice settings first';

  @override
  String get voiceConfigureEither => 'The phone’s service isn’t available. Download the voice model in voice settings.';

  @override
  String get voiceErrorNetworkTimeout => 'Speech recognition timed out. Check your connection.';

  @override
  String get voiceErrorNetwork => 'Speech recognition could not connect to the network';

  @override
  String get voiceErrorAudio => 'Audio recording failed. Check the microphone.';

  @override
  String get voiceErrorServer => 'The system speech service failed. Try again later.';

  @override
  String get voiceErrorClient => 'Could not start system recognition. Check the speech service.';

  @override
  String get voiceErrorSpeechTimeout => 'No speech was detected. Please speak again.';

  @override
  String get voiceErrorNoMatch => 'Didn’t catch that. Try again.';

  @override
  String get voiceErrorBusy => 'The system speech service is busy. Try again later.';

  @override
  String get voiceErrorPermission => 'Voice input needs microphone access';

  @override
  String get voiceErrorTooManyRequests => 'Too many speech requests. Try again later.';

  @override
  String get voiceErrorDisconnected => 'The system speech service disconnected';

  @override
  String get voiceErrorLanguageUnsupported => 'System recognition does not support this language';

  @override
  String get voiceErrorLanguageUnavailable => 'Download this language in the speech service first';

  @override
  String get voiceErrorSupportCheck => 'The speech service cannot check recognition support';

  @override
  String get voiceErrorDownloadEvents => 'The speech service cannot report model download progress';

  @override
  String voiceErrorUnknown(int code) {
    return 'Speech service error $code. Try another recognition service.';
  }

  @override
  String get voiceSettingsFailed => 'Couldn’t read speech settings. Try again.';

  @override
  String get voiceModeSection => 'Recognition';

  @override
  String get voiceModelSection => 'Voice model';

  @override
  String get voiceModelFooter =>
      'Once downloaded, Chinese, English, Cantonese, Japanese and Korean are recognized on the phone; recordings stay on it.';

  @override
  String get voiceModelWaiting => 'Available once the engine is running';

  @override
  String get voiceModelUnsupported => 'This engine has no voice model';

  @override
  String get voiceModelAbsent => 'Not downloaded';

  @override
  String get voiceModelDownloading => 'Downloading';

  @override
  String get voiceModelPreparing => 'Checking and loading';

  @override
  String get voiceModelReady => 'Ready';

  @override
  String get voiceModelFailed => 'Download failed';

  @override
  String voiceModelBytes(String done, String total) {
    return '$done of $total';
  }

  @override
  String voiceModelReadyNote(String size) {
    return 'Uses $size; works offline';
  }

  @override
  String voiceModelAbsentNote(String size) {
    return 'About $size to download';
  }

  @override
  String get voiceModelWaitingNote => 'The download starts once the engine is running';

  @override
  String get voiceModelFailNetwork => 'Couldn’t reach the download source';

  @override
  String get voiceModelFailTimeout => 'The download stopped making progress';

  @override
  String get voiceModelFailCertificate => 'Secure connection failed; check the phone’s date';

  @override
  String get voiceModelFailServer => 'The download source is unavailable for now';

  @override
  String get voiceModelFailIntegrity => 'The files didn’t pass verification';

  @override
  String voiceModelFailStorage(String size) {
    return 'Not enough storage; about $size more is needed';
  }

  @override
  String get voiceModelFailEngine => 'The engine didn’t respond';

  @override
  String get voiceModelFailUnknown => 'The download didn’t finish';

  @override
  String get voiceModelDownload => 'Download';

  @override
  String get voiceModelResume => 'Resume';

  @override
  String get voiceModelRedownload => 'Re-download';

  @override
  String get voiceModelMeteredTitle => 'Download over mobile data?';

  @override
  String voiceModelMeteredBody(String size) {
    return 'The voice model is about $size and will use mobile data.';
  }

  @override
  String get voiceModelDeleteTitle => 'Delete the voice model?';

  @override
  String get voiceModelDeleteBody =>
      'Voice input will use the phone’s service. You can download the model again any time.';

  @override
  String get voiceModelDeleteFailed => 'Couldn’t delete the voice model. Try again.';

  @override
  String get voiceModelDeleteStopping => 'The download is still stopping. Delete again in a moment.';

  @override
  String voiceModelStartedToast(String size) {
    return 'Downloading the voice model · about $size';
  }

  @override
  String voiceModelResumedToast(String size) {
    return 'Resuming the voice model · about $size left';
  }

  @override
  String get voiceModelReadyToast => 'Voice input is ready';

  @override
  String voiceModelFailedToast(String reason) {
    return 'Voice model download failed: $reason';
  }

  @override
  String voiceModelNoticeDownloading(int percent) {
    return 'Downloading the voice model $percent%';
  }

  @override
  String get voiceModelNoticePreparing => 'Checking the voice model';

  @override
  String get voiceModelNoticeFailed => 'Voice model download failed. Open the app to retry.';

  @override
  String get voiceScribeReadFailed => 'Could not read voice settings. Retry.';

  @override
  String get voiceScribeSavedReadFailed => 'Saved. Refresh to see the latest settings.';

  @override
  String get voiceScribeSaveUnconfirmed => 'Couldn’t confirm the save. Refresh or retry.';

  @override
  String get voiceScribeTitle => 'Voice settings';

  @override
  String get voiceScribePolishPrompt => 'Polish prompt';

  @override
  String get voiceScribeLanguage => 'Recognition language';

  @override
  String get voiceScribeRefresh => 'Refresh';

  @override
  String get voiceScribeHostChanged => 'The connection changed. Reopen to continue.';

  @override
  String get voiceScribeUnsupported => 'Voice settings aren’t available on this connection.';

  @override
  String get voiceScribePluginDefault => 'Default';

  @override
  String get voiceScribeBuiltInPrompt => 'Built-in prompt';

  @override
  String get voiceScribeProviders => 'Recognition services';

  @override
  String get voiceScribeKeySet => 'Key set';

  @override
  String get voiceScribeNoKey => 'No key';

  @override
  String get voiceScribeHotwords => 'Hotwords';

  @override
  String voiceScribeHotwordRules(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$count rules', one: '1 rule');
    return '$_temp0';
  }

  @override
  String get wallpaperTitle => 'Wallpaper';

  @override
  String get wallpaperDefault => 'Default';

  @override
  String get wallpaperCustom => 'Custom';

  @override
  String get wallpaperFrame => 'Reposition';

  @override
  String get wallpaperBlur => 'Blur';

  @override
  String get wallpaperLighten => 'Lighten';

  @override
  String get wallpaperDim => 'Dim';

  @override
  String get wallpaperReplace => 'Replace picture';

  @override
  String get wallpaperPreview => 'Preview';

  @override
  String get wallpaperFooter =>
      'Shown on home, in chats and in the drawer. Lighten applies in light mode, Dim in dark mode; text always stays clear. PNG, JPEG or WebP, up to 15 MB.';

  @override
  String get wallpaperChanged => 'Wallpaper changed';

  @override
  String get wallpaperTooLarge => 'The picture is over 15 MB';

  @override
  String get wallpaperUnsupported => 'Use a PNG, JPEG or WebP';

  @override
  String get wallpaperUnreadable => 'Couldn’t read this picture';

  @override
  String get wallpaperUnavailable => 'Couldn’t open your photos';

  @override
  String get wallpaperBroken => 'Can’t be read';

  @override
  String get wallpaperEditorHint => 'Drag or pinch';

  @override
  String get wallpaperEditorReset => 'Reset';

  @override
  String get wallpaperSampleTitle => 'A weekend by the sea';

  @override
  String get wallpaperSampleStatus => 'Just now';

  @override
  String get wallpaperSampleQuestion => 'Is Saturday a good day for the beach?';

  @override
  String get wallpaperSampleAnswer =>
      'Yes. Saturday afternoon is sunny with a light breeze and waves under half a metre, the best day this week.';

  @override
  String get wallpaperSampleNote => 'It cools down fast in the evening, so bring a light jacket.';

  @override
  String get wallpaperSampleTool => 'Checked 3 weather sources';

  @override
  String get searchKwWallpaper => 'background,background image,chat background,custom background,backdrop,blur,photo';

  @override
  String get webTitle => 'DSH Web';

  @override
  String get webSshAppOnly => 'SSH tunnel links only open in the app';

  @override
  String get webRelayUnavailable => 'DSH Web isn’t available through DSH Remote. Open it on that computer.';

  @override
  String get webSshHost => 'SSH host';

  @override
  String get webLocalAppOnly => 'This phone’s link has a launch token and only opens in the app';

  @override
  String get webEngineStatus => 'Engine status';

  @override
  String get webEngineStarting => 'Starting engine';

  @override
  String get webEngineStartFailed => 'Couldn’t start the engine';

  @override
  String get webEngineNotRunning => 'Engine isn’t running';

  @override
  String get webEngineProblem => 'The engine ran into a problem';

  @override
  String get webStartingSoon => 'DSH Web will be ready in a moment';

  @override
  String get webStartToOpen => 'Start this phone’s engine to open DSH Web';

  @override
  String get webRestart => 'Restart';

  @override
  String get webStartEngine => 'Start engine';

  @override
  String get webSwitchToWeb => 'Switch to Web';

  @override
  String get webNativeFeatures => 'Native features';

  @override
  String get webSwitchToNative => 'Switch to native';

  @override
  String get webAppSettings => 'App settings';

  @override
  String get webSwitchHost => 'Switch host';

  @override
  String get webAttachmentTooLarge => 'Attachment is too large for DSH Web';

  @override
  String get webTextCopied => 'Text copied. Paste it into the input box.';

  @override
  String get webAttachmentFailed => 'Couldn’t add attachments to DSH Web';

  @override
  String get webHostUnavailable => 'DSH Web isn’t available on this host';

  @override
  String get webChatGone => 'This chat is gone';

  @override
  String get webPageClosed => 'Page closed';

  @override
  String get webChatsWorkspaces => 'Chats and workspaces';

  @override
  String get webRefresh => 'Refresh';

  @override
  String get webOpenInBrowser => 'Open in browser';

  @override
  String get webBrowserUnavailable => 'Can’t open in browser';

  @override
  String get webReopen => 'Reopen';

  @override
  String get webPageNotOpened => 'Couldn’t open the page';

  @override
  String get webCheckConnection => 'Check your network or engine status and try again';

  @override
  String get webTargetSessionMissing => 'Couldn’t find this chat in DSH Web. You’re on the home page.';

  @override
  String get webTargetNotLoaded => 'DSH Web hasn’t finished loading';

  @override
  String get webTargetSettingsMissing => 'Couldn’t find these settings. You may need to sign in or enable the plugin.';

  @override
  String get webTargetPluginMissing => 'Couldn’t find this plugin. It may be missing from this profile.';

  @override
  String get webTargetSidebarFailed => 'Couldn’t open the sidebar. Open this chat in DSH Web and try again.';

  @override
  String get webTargetCordisMissing => 'Couldn’t find the Cordis panel. The plugin may have been removed.';

  @override
  String get webTargetNewChatFailed => 'Couldn’t start a chat. You’re on the DSH Web home page.';

  @override
  String get webTargetPageFailed => 'Couldn’t open this page. You’re on the DSH Web home page.';

  @override
  String webConnectHostFirst(String name) {
    return 'Connect to “$name” to open DSH Web';
  }
}
