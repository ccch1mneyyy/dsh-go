// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class L10nZh extends L10n {
  L10nZh([String locale = 'zh']) : super(locale);

  @override
  String get accessPickTitle => '想让 DSH Go 帮你做哪些事';

  @override
  String get accessPickMessage => '选好后逐项开启';

  @override
  String get accessPickConfirm => '开启所选';

  @override
  String get accessSkip => '跳过';

  @override
  String get accessFeatureFiles => '读写手机里的文件';

  @override
  String get accessFeatureFilesNeeds => '需要文件访问权限';

  @override
  String get accessFeaturePet => '桌宠与悬浮窗';

  @override
  String get accessFeaturePetNeeds => '需要悬浮窗权限';

  @override
  String get accessFeaturePhone => '手机操控';

  @override
  String get accessFeaturePhoneNeeds => '需要无障碍和通知权限';

  @override
  String get accessFeatureBackground => '后台持续运行';

  @override
  String get accessFeatureBackgroundNeeds => '任务跑完通知你，需要通知和后台权限';

  @override
  String get accessFeatureVoice => '语音输入';

  @override
  String get accessFeatureVoiceNeeds => '需要麦克风权限';

  @override
  String accessVoiceModel(int size) {
    return '离线识别，需下载约 $size MB 语音模型';
  }

  @override
  String get accessVoiceMetered => '当前是移动数据，下载会消耗流量';

  @override
  String get accessFilesRiskBody => 'AI 能读取和修改相册、下载、文档等手机文件。';

  @override
  String accessStepCount(int index, int total) {
    return '$index / $total';
  }

  @override
  String get accessTurnOn => '去开启';

  @override
  String get accessOpenSettings => '去设置';

  @override
  String get accessItsSet => '设好了';

  @override
  String get accessOpenAgain => '再去一次';

  @override
  String get accessIsOn => '已开启';

  @override
  String get accessNotOnYet => '还没开启';

  @override
  String get accessDidYouSet => '在那一页打开了吗？';

  @override
  String accessWhere(String path) {
    return '位置：$path';
  }

  @override
  String get accessOpenFailed => '没能打开系统设置';

  @override
  String get accessMicTitle => '允许使用麦克风';

  @override
  String get accessMicWhy => '语音输入要用到';

  @override
  String get accessStorageTitle => '允许访问文件';

  @override
  String get accessStorageWhy => '让 AI 读写相册、下载和文档';

  @override
  String get accessNotifyTitle => '允许通知';

  @override
  String get accessNotifyWhy => '任务跑完、需要确认时提醒你';

  @override
  String get accessBatteryTitle => '允许在后台运行';

  @override
  String get accessBatteryWhy => '切到别的 App 时任务照常跑';

  @override
  String get accessVendorBackgroundWhy => '锁屏或切走后，不被系统断网、清理';

  @override
  String get accessAutostartTitle => '允许自启动';

  @override
  String get accessAutostartWhy => '被系统清理后能自己恢复';

  @override
  String accessVivoAutostartPath(String app) {
    return '权限管理 › 自启动 › $app';
  }

  @override
  String accessXiaomiAutostartPath(String app) {
    return '应用管理 › $app › 自启动';
  }

  @override
  String get accessA11yTitle => '打开无障碍';

  @override
  String get accessA11yWhy => '手机操控靠它看屏幕、点按';

  @override
  String get accessPopupTitle => '允许后台弹出界面';

  @override
  String get accessPopupWhy => '手机操控做完能回到 DSH Go';

  @override
  String accessVivoPopupPath(String app) {
    return '权限管理 › $app › 后台弹出界面';
  }

  @override
  String accessXiaomiPopupPath(String app) {
    return '应用管理 › $app › 其他权限 › 后台弹出界面';
  }

  @override
  String get accessOverlayTitle => '允许显示在其他应用上层';

  @override
  String get accessOverlayWhy => '宠物才能出现在别的 App 上';

  @override
  String get accessOverlayGreyed => '开关是灰的？';

  @override
  String get accessRestrictedTitle => '先允许受限制的设置';

  @override
  String get accessRestrictedTap => '在无障碍里点一下「DSH 手机操控」，出现「受限制的设置」时点确定';

  @override
  String get accessRestrictedMenu => '在应用信息里点右上角的三个点，选「允许受限制的设置」';

  @override
  String get accessRestrictedAdvanced => '在应用信息的「高级设置」里打开「允许受限制的设置」';

  @override
  String get accessRestrictedBack => '回到无障碍，打开「DSH 手机操控」';

  @override
  String get accessRestrictedHelp => '看图示';

  @override
  String get accessOpenA11y => '去无障碍';

  @override
  String get accessOpenAppInfo => '去应用信息';

  @override
  String get accessStateOn => '已开启';

  @override
  String get accessStateOff => '未开启';

  @override
  String get accessStateVisited => '已去设置';

  @override
  String get accessStateUnknown => '去设置';

  @override
  String get accessSummaryAllSet => '都开好了';

  @override
  String accessSummaryLeft(int count) {
    return '还有 $count 项没开';
  }

  @override
  String get accessSummaryMessage => '随时可在「设置 › 通用 › 系统权限」补开';

  @override
  String get accessFinishFailed => '没能完成设置';

  @override
  String accessVoiceDownload(int size) {
    return '语音模型（约 $size MB）会在引擎就绪后开始下载，进度在「设置 › 通用 › 语音输入」里查看';
  }

  @override
  String get accessPageTitle => '系统权限';

  @override
  String get accessPageSubtitle => '各项功能用到的系统权限';

  @override
  String get activityThinkingUntangle => '嗯…让我捋捋';

  @override
  String get activityThinkingWorkThrough => '盘一下盘一下';

  @override
  String get activityThinkingGears => '大脑转起来了';

  @override
  String get activityThinkingSecond => '给我一秒';

  @override
  String get activityThinkingSmoking => '脑子在冒烟';

  @override
  String get activityThinkingOnIt => '想呢想呢';

  @override
  String get activityThinkingNoRush => '别催别催';

  @override
  String get activityThinkingPonder => '让我琢磨下';

  @override
  String get activityThinkingLogic => '正在盘逻辑';

  @override
  String get activityThinkingBrain => '小脑瓜动一下';

  @override
  String get activityThinkingSort => '让我理理';

  @override
  String get activityThinkingMemory => '翻翻脑子';

  @override
  String get activityThinkingStorm => '脑内风暴中';

  @override
  String get activityThinkingSavor => '嗯…让我品品';

  @override
  String get activityThinkingMoment => '稍等，在想';

  @override
  String get activityThinkingHeadScratch => '挠头…';

  @override
  String get activityThinkingPlayOut => '让子弹飞一会';

  @override
  String get activityThinkingLoading => '思路加载中';

  @override
  String get activityThinkingMulling => '琢磨中';

  @override
  String get activityThinkingBreakDown => '嗯…让我拆一下';

  @override
  String get activityThinkingTrain => '脑内跑火车';

  @override
  String get activityThinkingSomething => '嗯…有点东西';

  @override
  String get activityThinkingJog => '小跑一下思路';

  @override
  String get activityThinkingPicture => '等下，有画面了';

  @override
  String get activityThinkingBubbles => '思考泡泡';

  @override
  String get activityThinkingWaves => '脑电波传输中';

  @override
  String get activityThinkingCoffee => '脑子在煮咖啡';

  @override
  String get activityThinkingDraft => '我打个腹稿';

  @override
  String get activityThinkingComing => '嗯，来了来了';

  @override
  String get activityThinkingBubbling => '脑子冒泡泡';

  @override
  String get activityThinkingTackle => '嗯…盘它';

  @override
  String get activityThinkingSpark => '闪个思路';

  @override
  String get activityThinkingLogicFirst => '先捋一下逻辑';

  @override
  String get activityThinkingLocate => '定位一下';

  @override
  String get activityThinkingInvestigate => '排查一下';

  @override
  String get activityThinkingGif => '思考.gif';

  @override
  String get activityThinkingLook => '让我康康';

  @override
  String get activityThinkingInteresting => '嗯…有点意思';

  @override
  String get activityThinkingHands => '搓搓手想想';

  @override
  String get activityThinkingFiveMinutes => '5 分钟，大工程';

  @override
  String get activityThinkingSerious => '这把我得认真';

  @override
  String get activityThinkingTricky => '确实有点绕';

  @override
  String get activityThinkingAscend => '我在修仙';

  @override
  String get activityThinkingAlmostPromise => '快好了，真的';

  @override
  String get activityThinkingLongWay => '盘了一大圈';

  @override
  String get activityThinkingWrapping => '在收尾了';

  @override
  String get activityThinkingSong => '给我一首歌的时间';

  @override
  String get activityThinkingBigMove => '憋大招中';

  @override
  String get activityThinkingSimple => '这个需求很简单（不是）';

  @override
  String get activityThinkingOneMinute => '1 分钟，还在想';

  @override
  String get activityThinkingChallenge => '这题有点东西';

  @override
  String get activityThinkingDig => '让我再钻研下';

  @override
  String get activityThinkingNotSimple => '问题不简单';

  @override
  String get activityThinkingDeep => '盘得有点深';

  @override
  String get activityThinkingBurning => '脑细胞在燃烧';

  @override
  String get activityThinkingNearlyClear => '快盘清了';

  @override
  String get activityThinkingTwisty => '这个有点绕…';

  @override
  String get activityThinkingWorkout => '烧脑中…';

  @override
  String get activityThinkingStay => '别走，快了';

  @override
  String get activityThinkingCloser => '嗯，让我细想想';

  @override
  String get activityThinkingThirtySeconds => '30 秒了，还在盘';

  @override
  String get activityThinkingSoon => '别急，快出结果了';

  @override
  String get activityThinkingAnotherPass => '让我再捋一捋';

  @override
  String get activityThinkingTrack => '思路没断';

  @override
  String get activityThinkingLead => '有眉目了';

  @override
  String get activityThinkingCircles => '转圈圈…';

  @override
  String get activityThinkingAnyMoment => '马上马上';

  @override
  String get activityThinkingStillLocate => '还在定位';

  @override
  String get activityWaitingCall => '呼叫模型…';

  @override
  String get activityWaitingOnWay => '模型在路上了';

  @override
  String get activityWaitingSpeak => '等它开口…';

  @override
  String get activityWaitingWords => '它在组织语言';

  @override
  String get activityWaitingAwake => '模型醒了么';

  @override
  String get activityWaitingStretch => '等它伸懒腰';

  @override
  String get activityWaitingYawn => '它打了个哈欠';

  @override
  String get activityWaitingComing => '模型：来了来了';

  @override
  String get activityWaitingText => '等它出字';

  @override
  String get activityWaitingQueue => '还在排队';

  @override
  String get activityWaitingBrew => '它在酝酿';

  @override
  String get activityWaitingWater => '模型在喝水';

  @override
  String get activityWaitingWarmup => '等它热身';

  @override
  String get activityWaitingMeditate => '模型在冥想';

  @override
  String get activityWaitingBlink => '等它眨个眼';

  @override
  String get activityWaitingMoment => '它说稍等';

  @override
  String get activityWritingWords => '组织语言中';

  @override
  String get activityWritingTyping => '码字中';

  @override
  String get activityWritingInspired => '下笔如有神';

  @override
  String get activityWritingOnIt => '在写了在写了';

  @override
  String get activityWritingCareful => '字斟句酌';

  @override
  String get activityWritingFlow => '一气呵成';

  @override
  String get activityWritingPlain => '整理成人话';

  @override
  String get activityWritingIdeas => '把想法写下来';

  @override
  String get activityWritingKeys => '敲字中';

  @override
  String get activityWritingAlmost => '马上写完';

  @override
  String get activityWritingTell => '娓娓道来';

  @override
  String get activityWritingFast => '奋笔疾书';

  @override
  String get activityWritingBreeze => '笔下生风';

  @override
  String get activityWritingFormat => '排个版';

  @override
  String get activityNightAscend => '修仙中…';

  @override
  String get activityNightHello => '深夜冒泡';

  @override
  String get activityNightOwl => '你也是夜猫子呀';

  @override
  String get activityNightMoon => '月亮不睡我不睡';

  @override
  String get activityNightSlow => '夜里脑子慢，谅解';

  @override
  String get activityNightChampion => '熬夜冠军上线';

  @override
  String get activityNightSleepy => '困了，但能行';

  @override
  String get activityNightMidnight => '过了零点照样肝';

  @override
  String get activityNightOpen => '深夜档营业';

  @override
  String get activityNightStars => '星星都睡了';

  @override
  String get activityNightDawn => '凌晨还在盘';

  @override
  String get activityWeekendChill => '周末摸鱼中';

  @override
  String get activityWeekendHere => '周末也在！';

  @override
  String get activityWeekendCompany => '放假也陪你';

  @override
  String get activityWeekendOnline => '周末不关机';

  @override
  String get activityWeekendSneak => '周末偷着盘';

  @override
  String get activityWeekendWorking => '周末也在卷？';

  @override
  String get activityWeekendMode => '周末模式 ON';

  @override
  String get activityWeekendBugs => '周末在修 bug';

  @override
  String get activityWeekendSkin => '周末限定皮肤';

  @override
  String get activityNewYearCheers => '新年快乐！';

  @override
  String get activityNewYearDay => '元旦快乐';

  @override
  String get activityNewYearBugs => '新的一年，新的 bug';

  @override
  String get activityNewYearFirstLine => '新年第一行代码';

  @override
  String get activityNewYearWork => '开工大吉';

  @override
  String get activityValentineCode => '情人节也在敲代码';

  @override
  String get activityValentineLove => '代码才是真爱';

  @override
  String get activityValentineDate => '今天不约会？';

  @override
  String get activityValentineKeyboard => '键盘就是玫瑰';

  @override
  String get activityPiDay => 'π 节快乐';

  @override
  String get activityPiCircle => '今天的圆格外圆';

  @override
  String get activityAprilFools => '愚人节快乐';

  @override
  String get activityAprilBug => '这个 bug 是假的吧';

  @override
  String get activityAprilErrors => '小心假报错';

  @override
  String get activityAprilKidding => '骗你的，没报错';

  @override
  String get activityLaborWorking => '劳动节还在卷';

  @override
  String get activityLaborPride => '劳动最光荣';

  @override
  String get activityLaborSpirit => '打工人打工魂';

  @override
  String get activityChildrenDay => '儿童节快乐';

  @override
  String get activityChildrenHeart => '谁还不是个宝宝';

  @override
  String get activityChildrenCode => '今天代码要写得可爱';

  @override
  String get activityProgrammerCheers => '1024 程序员节快乐';

  @override
  String get activityProgrammerDay => '今天是程序员节';

  @override
  String get activityProgrammer1024 => '1024，节日快乐';

  @override
  String get activityProgrammerCode => '程序员节也在写代码';

  @override
  String get activityHalloween => '万圣节快乐';

  @override
  String get activityHalloweenTreat => '不给糖就捣蛋';

  @override
  String get activityHalloweenCode => '代码也会吓人';

  @override
  String get activityChristmasEve => '平安夜快乐';

  @override
  String get activityChristmasEveThinking => '平安夜也在盘';

  @override
  String get activityChristmasEveGift => '今晚写代码有礼物';

  @override
  String get activityChristmas => '圣诞快乐';

  @override
  String get activityChristmasCompany => '圣诞也陪你';

  @override
  String get activityChristmasEgg => '圣诞限定彩蛋';

  @override
  String get activityChristmasReindeer => '麋鹿送代码来了';

  @override
  String get activityYearEndEve => '跨年夜';

  @override
  String get activityYearEndLast => '今年最后一盘';

  @override
  String get activityYearEndReady => '准备跨年';

  @override
  String get activityYearEndSeeYou => '明年见！';

  @override
  String get activityZodiacRat => '鼠';

  @override
  String get activityZodiacOx => '牛';

  @override
  String get activityZodiacTiger => '虎';

  @override
  String get activityZodiacRabbit => '兔';

  @override
  String get activityZodiacDragon => '龙';

  @override
  String get activityZodiacSnake => '蛇';

  @override
  String get activityZodiacHorse => '马';

  @override
  String get activityZodiacGoat => '羊';

  @override
  String get activityZodiacMonkey => '猴';

  @override
  String get activityZodiacRooster => '鸡';

  @override
  String get activityZodiacDog => '狗';

  @override
  String get activityZodiacPig => '猪';

  @override
  String get activityLunarCheers => '春节快乐！';

  @override
  String get activityLunarCode => '过年还在写代码';

  @override
  String get activityLunarEnvelope => '红包拿来';

  @override
  String get activityLunarSpring => '新春快乐';

  @override
  String get activityLunarGreeting => '过年好';

  @override
  String get activityLunarCodeGreeting => '代码也拜个年';

  @override
  String get activityRareSsr => 'SSR！稀有彩蛋';

  @override
  String get activityRareUr => 'UR 掉落';

  @override
  String get activityRareLegend => '金色传说！';

  @override
  String get activityRareOrange => '出橙了';

  @override
  String get activityRareEgg => '彩蛋砸脸';

  @override
  String get activityRareChosen => '天选时刻';

  @override
  String get activityRareHidden => '你发现了隐藏款';

  @override
  String get activityRareChat => '触发隐藏对话';

  @override
  String get activityRareMax => '稀有度 MAX';

  @override
  String get activityRareLucky => '欧皇降临';

  @override
  String get activityRareCritical => '暴击了';

  @override
  String get activityRareNextLevel => '这波在大气层';

  @override
  String get activityFailCrash => '翻车了';

  @override
  String get activityFailOops => '哎呀';

  @override
  String get activityFailRun => '没跑通';

  @override
  String get activityFailTrip => '摔了一跤';

  @override
  String get activityFailWrong => '这不对';

  @override
  String get activityFailHiccup => '出岔子了';

  @override
  String get activityFailBroken => '不灵了';

  @override
  String get activityFailLocal => '我本地能跑啊';

  @override
  String get activityFailYesterday => '昨天还能跑';

  @override
  String get activityFailTough => '难绷';

  @override
  String get activityFailCrack => '裂开';

  @override
  String get activityFailPressure => '血压上来了';

  @override
  String get activityFailCareless => '这波大意了';

  @override
  String get activityFailSlip => '手滑';

  @override
  String get activityFailTryAgain => '换个姿势再来';

  @override
  String get activityFailChance => '再给我一次机会';

  @override
  String get activityTestGreen => '测试全绿';

  @override
  String get activityTestAllGreen => '全绿，舒服';

  @override
  String get activityTestFirstTry => '一次过！';

  @override
  String get activityTestNoErrors => '没报错';

  @override
  String get activityTestPassed => '过了过了';

  @override
  String get activityTestSolid => '稳了';

  @override
  String get activityTestRed => '红了，看看哪挂了';

  @override
  String get activityTestInvestigate => '测试挂了，排查一下';

  @override
  String get activityTestStubborn => '有个用例不服';

  @override
  String get activityTestFix => '红灯，再改改';

  @override
  String get activityGitCommitSave => '提交了，存个档';

  @override
  String get activityGitSaved => '存档成功';

  @override
  String get activityGitCommitRelief => 'commit 一下，安心';

  @override
  String get activityGitPushed => '推上去了';

  @override
  String get activityGitPushDone => 'push 完成，起飞';

  @override
  String get activityGitCodeOut => '代码出门了';

  @override
  String get activityInstallDone => '依赖装好了';

  @override
  String get activityInstallInternet => '下载了半个互联网';

  @override
  String get activityInstallPackages => '包都到齐了';

  @override
  String get activityMilestoneFive => '工具 x5，手感来了';

  @override
  String get activityMilestoneTen => '工具连击 x10';

  @override
  String get activityMilestoneTwenty => '工具 x20，停不下来';

  @override
  String get activityMilestoneFifty => '工具 x50，劳模本模';

  @override
  String get activityRetryWait => '稍等，重试中';

  @override
  String get activityRetryBackoff => '刚被拒了，退避一下';

  @override
  String get activityRetryKnock => '再敲一次门';

  @override
  String get activityRateLimited => '被限流了，缓缓再试';

  @override
  String get activityRate429 => '429 了，歇口气再来';

  @override
  String get activityRateQueue => '排队的人有点多';

  @override
  String get activityCompactContext => '收拾一下上下文…';

  @override
  String get activityCompactBag => '整理背包中…';

  @override
  String get activityCompactSpace => '腾地方中';

  @override
  String get activityCompactMemory => '给记忆瘦个身';

  @override
  String get activityCompactChats => '打包旧对话';

  @override
  String get activityReminderWater => '半小时了，喝口水？';

  @override
  String get activityReminderTenMinutes => '10 分钟了，这活不小';

  @override
  String get activityDiffTitle => '本轮改动';

  @override
  String get activityDiffCopied => '已复制补丁';

  @override
  String get activityDiffNoWrap => '不换行';

  @override
  String get activityDiffWrap => '自动换行';

  @override
  String get activityDiffCopy => '复制补丁';

  @override
  String get activityDiffEmpty => '空文件，没有可显示的改动';

  @override
  String get activityDiffNewFile => '新建文件';

  @override
  String get activityDiffUnknownLines => '行号未知';

  @override
  String get activityDiffCopyPath => '复制路径';

  @override
  String get activityThinking => '思考';

  @override
  String get activityReplyInterrupted => '回复（已中断）';

  @override
  String get activityWaitingApproval => '等待确认';

  @override
  String get activityWaitingAnswer => '等待回答';

  @override
  String get activityWriting => '写回复中';

  @override
  String get activityThinkingNow => '思考中';

  @override
  String get activityRetrying => '重试中';

  @override
  String get activityCompacting => '压缩上下文';

  @override
  String get activityVerbRun => '跑';

  @override
  String get activityVerbWrite => '写';

  @override
  String get activityVerbEdit => '改';

  @override
  String get activityVerbImage => '看图';

  @override
  String get activityVerbRead => '读';

  @override
  String get activityVerbFind => '找';

  @override
  String get activityVerbSearch => '搜';

  @override
  String get activityVerbWebSearch => '搜网页';

  @override
  String get activityVerbWebView => '看网页';

  @override
  String get activityVerbSubagent => '派子代理';

  @override
  String get activityVerbTodo => '更新待办';

  @override
  String get activitySecretHide => '隐藏密钥';

  @override
  String get activitySecretShow => '显示密钥';

  @override
  String get activitySlashNoMatch => '没有匹配的指令，按普通消息发送';

  @override
  String get activitySlashCommands => '指令';

  @override
  String get activitySlashEnterArgs => '输入参数后发送';

  @override
  String get activityStepTitle => '步骤详情';

  @override
  String get activityStepMissing => '这一步不在已加载的记录里';

  @override
  String get activityStepQuestion => '提问';

  @override
  String get activityStepSuccess => '成功';

  @override
  String get activityStepNeedsPermission => '需要授权';

  @override
  String get activityTools => '工具';

  @override
  String get activityStepDispatched => '发出';

  @override
  String get activityStepExecution => '执行';

  @override
  String get activityStepLocation => '所在';

  @override
  String get activityStepArguments => '参数';

  @override
  String get activityStepChanges => '改动';

  @override
  String get activityStepFullScreen => '全屏查看';

  @override
  String get activityStepReadContent => '读到的内容';

  @override
  String get activityStepWrittenContent => '写入的内容';

  @override
  String get activityStepError => '错误';

  @override
  String get activityOutput => '输出';

  @override
  String get activityStepResult => '结果';

  @override
  String get activityStepDeclined => '你拒绝了这次调用';

  @override
  String get activityStepNoOutput => '没有输出';

  @override
  String get activityStepStart => '开始';

  @override
  String get activityDuration => '用时';

  @override
  String get activityFirstToken => '首字';

  @override
  String get activityStepGeneration => '生成';

  @override
  String get activityStepSpeed => '速度';

  @override
  String get activityModel => '模型';

  @override
  String get activityStepTiming => '计时';

  @override
  String get activityUsage => '用量';

  @override
  String get activityInput => '输入';

  @override
  String get activityStepCacheHit => '  命中缓存';

  @override
  String get activityStepCacheMiss => '  未命中';

  @override
  String get activityStepCacheWrite => '  写入缓存';

  @override
  String get activityStepReasoning => '  推理';

  @override
  String get activityStepAnswer => '  回答';

  @override
  String get activityStepThinking => '思考过程';

  @override
  String get activityStepExplanation => '说明';

  @override
  String get activityStepToolCalls => '本步调用的工具';

  @override
  String get activityStepProcessing => '模型正在处理';

  @override
  String get activityApprovalAllowed => '允许了';

  @override
  String get activityApprovalUnanswered => '无人确认';

  @override
  String get activityApprovalAnswered => '已答复';

  @override
  String get activityToolRead => '读取';

  @override
  String get activityToolWrite => '写入';

  @override
  String get activityToolCall => '调用工具';

  @override
  String get activityTraceTitle => '本轮轨迹';

  @override
  String get activityTraceNotLoaded => '本轮记录尚未加载';

  @override
  String get activityTraceOutputLimit => '输出达到上限';

  @override
  String get activityTraceEngineRestarted => '引擎重启，已中断';

  @override
  String get activityTraceBlocked => '已被拦截';

  @override
  String get activityTraceHeading => '本轮轨迹  ';

  @override
  String get activityTraceWaiting => '等你';

  @override
  String get activityTraceNoSteps => '本轮没有可计时的步骤';

  @override
  String get activityUsageInputIncludesCache => '输入含缓存命中';

  @override
  String get activityCacheHit => '缓存命中';

  @override
  String get activitySummaryTodo => '更新了待办';

  @override
  String get activityUsageBalance => 'DeepSeek 余额';

  @override
  String get activityUsageContext => '上下文';

  @override
  String get activityUsageChat => '本对话';

  @override
  String get activityUsageAfterMessage => '发送消息后显示';

  @override
  String get activityUsageContextFull => '上下文将满，发送 /compact 可压缩';

  @override
  String get activitySpanZero => '0 秒';

  @override
  String get activitySpanTiny => '<0.1 秒';

  @override
  String activityTokensTenThousands(String value) {
    return '$value 万';
  }

  @override
  String activityTokensHundredMillions(String value) {
    return '$value 亿';
  }

  @override
  String activityUsageContextSemantics(String percent) {
    return '上下文已用 $percent，查看用量';
  }

  @override
  String activityUsageSystemTokens(String tokens) {
    return '系统 $tokens';
  }

  @override
  String activityUsageToolTokens(String tokens) {
    return '工具 $tokens';
  }

  @override
  String activityUsageMessageTokens(String tokens) {
    return '消息 $tokens';
  }

  @override
  String activityUsageTurns(int count) {
    return '共 $count 轮';
  }

  @override
  String activityUsageCacheWriteTokens(String tokens) {
    return '写入缓存 $tokens';
  }

  @override
  String activitySummaryCommands(int count) {
    return '执行 $count 条命令';
  }

  @override
  String activitySummaryEditedFiles(int count) {
    return '改了 $count 个文件';
  }

  @override
  String activitySummaryReadFiles(int count) {
    return '读了 $count 个文件';
  }

  @override
  String activitySummarySearches(int count) {
    return '搜索 $count 次';
  }

  @override
  String activitySummaryWeb(int count) {
    return '联网 $count 次';
  }

  @override
  String activitySummarySubagents(int count) {
    return '调用子代理 $count 次';
  }

  @override
  String activitySummaryOther(int count) {
    return '其他工具 $count 次';
  }

  @override
  String activitySummaryTotal(int count) {
    return '使用了 $count 个工具';
  }

  @override
  String activityDiffBlockMarker(int index, int total) {
    return '@@ 第 $index/$total 处修改 @@';
  }

  @override
  String activityDiffEditMarker(int index, int total) {
    return '第 $index 次修改（共 $total 次）';
  }

  @override
  String activityTraceSpanSemantics(String title, String detail, String duration) {
    return '$title $detail，用时 $duration';
  }

  @override
  String activityTraceGroupSemantics(String label, String duration) {
    return '$label，用时 $duration';
  }

  @override
  String activityTraceEstimatedCost(String cost) {
    return '$cost（按官方单价估算）';
  }

  @override
  String activityTraceReasoningTokens(String tokens) {
    return '其中推理 $tokens';
  }

  @override
  String activityStepPosition(int turn, Object step) {
    return '第 $turn 轮 · 第 $step 步';
  }

  @override
  String activityStepTokenSpeed(String speed) {
    return '$speed tokens/秒';
  }

  @override
  String activityStepRetryCount(int count) {
    return '$count 次';
  }

  @override
  String activityStepTruncated(String text, int count) {
    return '$text\n…（仅显示前 ${count}k 字，复制可得全文）';
  }

  @override
  String activityStepLiveElapsed(String elapsed, String suffix) {
    return '$elapsed · 进行中$suffix';
  }

  @override
  String activityStepCopySection(String title) {
    return '复制$title';
  }

  @override
  String activityStepCopiedSection(String title) {
    return '已复制$title';
  }

  @override
  String activitySlashDescriptionArgs(String description) {
    return '$description · 输入参数后发送';
  }

  @override
  String activitySpanSecondsText(String seconds) {
    return '$seconds 秒';
  }

  @override
  String activitySpanSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String activitySpanMinutesSeconds(int minutes, String seconds) {
    return '$minutes 分 $seconds 秒';
  }

  @override
  String activitySpanHoursMinutes(int hours, String minutes) {
    return '$hours 小时 $minutes 分';
  }

  @override
  String activityCostUnderCent(String symbol) {
    return '不到 ${symbol}0.01';
  }

  @override
  String activityCostApprox(String symbol, String amount) {
    return '约 $symbol$amount';
  }

  @override
  String activitySpanRetries(int count) {
    return '重试 $count 次';
  }

  @override
  String activitySpanToolCalls(int count) {
    return '决定调用 $count 个工具';
  }

  @override
  String activityRunningItems(int count) {
    return '等 $count 项';
  }

  @override
  String activityRetryAttempt(int count) {
    return '第 $count 次';
  }

  @override
  String activityDiffFileCount(int count) {
    return '$count 个文件';
  }

  @override
  String activityDiffFileSemantics(String path, int added, int removed) {
    return '$path，新增 $added 行，删除 $removed 行';
  }

  @override
  String activityDiffEditNumber(int edit) {
    return '第 $edit 次修改';
  }

  @override
  String activityDiffHunkNumber(int index) {
    return '第 $index 处';
  }

  @override
  String activityDiffFromLine(int line) {
    return '第 $line 行起';
  }

  @override
  String activityDiffEditCount(int count) {
    return '修改 $count 次';
  }

  @override
  String activityLunarZodiac(String animal) {
    return '$animal年大吉';
  }

  @override
  String activityReminderHours(int hours) {
    return '已经连续干了 $hours 小时，歇会儿？';
  }

  @override
  String get activityStepModelRequest => '一次模型请求';

  @override
  String activityStepModelRequestDetail(String detail) {
    return '一次模型请求 · $detail';
  }

  @override
  String activityUsageEstimatedCost(String symbol, String amount) {
    return '约 $symbol$amount';
  }

  @override
  String activitySlashCommandSemantics(String label, String name) {
    return '$label，/$name';
  }

  @override
  String get activityToolListSeparator => '、';

  @override
  String get botsFolderGone => '这个文件夹已经不在了';

  @override
  String get botsFolderReadFailed => '没能读取这个文件夹';

  @override
  String get botsFolderOpenFailed => '打不开这个文件夹';

  @override
  String botsFolderCount(int count) {
    return '$count 个文件夹';
  }

  @override
  String get botsWorkingFolder => '工作目录';

  @override
  String get botsFolderTeamDefault => '团队工作区';

  @override
  String get botsFolderRoomDefault => '每位 Bot 各自的目录';

  @override
  String get botsFolderHint => '目录位于已连接的主机。';

  @override
  String get botsFolderCurrent => '当前目录';

  @override
  String get botsFolderUnavailable => '连接或目录已变化，请重新打开。';

  @override
  String get botsFolderNoChoices => '主机上暂无其他目录。';

  @override
  String get botsFolderConfirm => '使用此工作目录？';

  @override
  String get botsFolderRefused => '主机拒绝了此目录：它可能已不存在、无法访问或受保护。请另选目录或重试。';

  @override
  String botsChildCount(int count) {
    return '$count 个下级';
  }

  @override
  String get botsCurrentChat => '当前对话';

  @override
  String botsSubagentCount(int count) {
    return '$count 个子代理';
  }

  @override
  String botsRunningCount(int count) {
    return '$count 个运行中';
  }

  @override
  String botsFailedCount(int count) {
    return '$count 个出错';
  }

  @override
  String botsNestedCount(int count) {
    return '含 $count 个下级';
  }

  @override
  String botsBackToParent(String title) {
    return '返回「$title」';
  }

  @override
  String botsTeamMemberCount(int count) {
    return '智能体团队，$count 位成员';
  }

  @override
  String get botsAgentTeam => '智能体团队';

  @override
  String botsSubagentRunningCount(int count, int running) {
    return '$count 个子代理，$running 个运行中';
  }

  @override
  String get botsSubagents => '子代理';

  @override
  String get botsNoSubagents => '没有派出子代理';

  @override
  String get botsOpenChatFirst => '先打开一个对话';

  @override
  String get botsTeamReadFailed => '没能读到团队';

  @override
  String get botsNoTeamOnHost => '这台主机没有智能体团队';

  @override
  String get botsTeamNotEnabled => '智能体团队未开启';

  @override
  String get botsTeamDescription => '多个智能体分工协作，共用一块任务板';

  @override
  String get botsTeamEnabling => '正在开启…';

  @override
  String get botsTeamEnable => '开启团队';

  @override
  String botsMembersWorking(int count) {
    return '$count 位成员在工作';
  }

  @override
  String get botsTeamStandby => '都在待命';

  @override
  String get botsMembers => '成员';

  @override
  String get botsTasks => '任务';

  @override
  String get botsTeamRecordUnreadable => '团队记录有一条读不出来';

  @override
  String get botsMessages => '消息';

  @override
  String get botsOwner => '负责人';

  @override
  String get botsTeamCreateHint => '在对话里请 AI 组建团队';

  @override
  String get botsCurrent => '当前';

  @override
  String get botsNoTasks => '还没有任务';

  @override
  String get botsTodo => '待办';

  @override
  String get botsUnassigned => '未分配';

  @override
  String botsTaskWaitingFor(String dependencies) {
    return '等 $dependencies';
  }

  @override
  String get botsWriteOverlap => '写入范围重叠';

  @override
  String get botsWaitingDependencies => '等依赖';

  @override
  String get botsReadyToStart => '可开始';

  @override
  String get botsTaskId => '编号';

  @override
  String get botsDependencies => '依赖';

  @override
  String get botsWriteScopes => '写入范围';

  @override
  String get botsMessagesReadFailed => '没能读到消息';

  @override
  String get botsNoMemberMessages => '成员之间还没有消息';

  @override
  String get botsMessagesIncomplete => '部分成员的消息没能读到 · 重试';

  @override
  String botsDateTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get botsViewDetails => '查看详情';

  @override
  String get botsAdmin => '管理员';

  @override
  String get botsFullTextChanged => '对话已变化';

  @override
  String get botsFullTextReopen => '请重新打开这条消息';

  @override
  String get botsFullTextReadFailed => '没能读取全文';

  @override
  String get botsShowAll => '显示全部';

  @override
  String get botsImagePlaceholder => '［图片］';

  @override
  String get botsSending => '发送中';

  @override
  String get botsWriteOwn => '自己写';

  @override
  String get botsSubmit => '提交';

  @override
  String botsChooseModelFor(String name) {
    return '给 $name 选一个模型';
  }

  @override
  String get botsModelGreeting => '选好后它就会打招呼';

  @override
  String get botsChooseModel => '选择模型';

  @override
  String get botsSkipAnswer => '不回答';

  @override
  String get botsBotGone => '这个 Bot 已不在';

  @override
  String get botsWaitingModel => '等你选模型';

  @override
  String get botsThinking => '正在思考';

  @override
  String get botsMainBot => '主 Bot';

  @override
  String get botsIdle => '空闲';

  @override
  String get botsAnsweredQuestion => '你回答了它的问题';

  @override
  String get botsEarlierMessages => '更早的部分';

  @override
  String botsComposerHint(String name) {
    return '给 $name 发消息…';
  }

  @override
  String botsDeleteNamed(String name) {
    return '删除「$name」？';
  }

  @override
  String get botsDeleteBotBody => '它的对话还在，记忆会移到归档里。';

  @override
  String get botsTokensToday => '24 小时 tokens';

  @override
  String get botsMemoryUnit => '条记忆';

  @override
  String get botsRoomUnit => '个群聊';

  @override
  String get botsProfile => '资料';

  @override
  String get botsModel => '模型';

  @override
  String get botsBotName => '名字';

  @override
  String get botsRole => '角色';

  @override
  String get botsWriterExample => '比如：写手';

  @override
  String get botsInstructions => '说明';

  @override
  String get botsInstructionsHint => '它该怎么做事';

  @override
  String get botsColor => '颜色';

  @override
  String get botsUsage => '用量';

  @override
  String get botsUsageScanning => '正在统计历史对话，数据稍后补全。';

  @override
  String get botsUsageRefresh => '刷新';

  @override
  String get botsToday => '近 24 小时';

  @override
  String get botsLastWeek => '近 7 天';

  @override
  String get botsLastMonth => '近 30 天';

  @override
  String botsMonthCalls(int count) {
    return '近 30 天 · $count 次调用';
  }

  @override
  String get botsFullRecord => '完整记录';

  @override
  String get botsEveryToolCall => '每一步工具调用';

  @override
  String get botsUnsetMain => '取消主 Bot';

  @override
  String get botsSetMain => '设为主 Bot';

  @override
  String get botsDeleteBot => '删除 Bot';

  @override
  String get botsEffortOff => '不思考';

  @override
  String get botsEffortMinimal => '极少';

  @override
  String get botsEffortLow => '低';

  @override
  String get botsEffortMedium => '中';

  @override
  String get botsEffortHigh => '高';

  @override
  String get botsEffortMax => '最高';

  @override
  String botsNamedRecord(String name) {
    return '$name · 完整记录';
  }

  @override
  String get botsOrganizingNotes => '正在整理笔记';

  @override
  String get botsToolRun => '运行命令';

  @override
  String get botsToolRead => '查看文件';

  @override
  String get botsToolEdit => '修改文件';

  @override
  String get botsToolSearch => '联网搜索';

  @override
  String get botsToolBrowse => '看网页';

  @override
  String get botsToolMessage => '联系其他 Bot';

  @override
  String get botsToolGroup => '在群里沟通';

  @override
  String get botsToolMemory => '整理记忆';

  @override
  String get botsToolRecall => '翻看记录';

  @override
  String get botsToolTeam => '安排团队';

  @override
  String get botsToolAsk => '准备问你';

  @override
  String get botsToolWork => '干活';

  @override
  String get botsJustNow => '刚刚';

  @override
  String botsCountHundredMillion(String value) {
    return '$value 亿';
  }

  @override
  String botsCountTenThousand(String value) {
    return '$value 万';
  }

  @override
  String get botsModelNotSelected => '未选择';

  @override
  String botsYourPreview(String preview) {
    return '你：$preview';
  }

  @override
  String botsEventWorking(String name) {
    return '$name 开始干活';
  }

  @override
  String botsEventApproval(String name) {
    return '$name 在等你批准';
  }

  @override
  String botsEventDone(String name) {
    return '$name 完成了工作';
  }

  @override
  String botsEventStopped(String name) {
    return '你停下了 $name 的工作';
  }

  @override
  String botsEventFailed(String name) {
    return '$name 没能回答';
  }

  @override
  String botsEventMissed(String name) {
    return '$name 没有及时回应';
  }

  @override
  String botsEventLookup(String name) {
    return '$name 翻看了自己的聊天';
  }

  @override
  String botsEventLookupQuery(String name, String query) {
    return '$name 在自己的聊天里找「$query」';
  }

  @override
  String botsEventResumed(String name) {
    return '$name 重启后接着干';
  }

  @override
  String botsEventCut(String name) {
    return '$name 又被重启打断，停下了';
  }

  @override
  String get botsAutomation => '定时任务';

  @override
  String botsAutomationText(String text) {
    return '定时任务：$text';
  }

  @override
  String get botsOtherBot => '其他 Bot';

  @override
  String botsMessageFrom(String name) {
    return '来自 $name 的消息';
  }

  @override
  String botsEventReplied(String name) {
    return '$name 回复了';
  }

  @override
  String get botsGroupReplied => '群里有了回复';

  @override
  String botsNamedGroupReplied(String name) {
    return '「$name」里有了回复';
  }

  @override
  String botsEventCalledStop(String name) {
    return '$name 叫停了工作';
  }

  @override
  String get botsChooseMember => '选择成员';

  @override
  String get botsMentionMember => '提到成员';

  @override
  String get botsRelayUnavailable => '经中转连接时用不了 Bot';

  @override
  String get botsUseSsh => '用 SSH 连接这台电脑即可使用';

  @override
  String get botsTeamLoadFailed => '没能读取 Bot 团队';

  @override
  String botsBotCount(int count) {
    return '$count 个 Bot';
  }

  @override
  String botsRoomCount(int count) {
    return '$count 个群聊';
  }

  @override
  String get botsNewBot => '新建 Bot';

  @override
  String get botsGroupChat => '群聊';

  @override
  String get botsNewGroup => '新建群聊';

  @override
  String get botsDuplicateCreated => '已复制，稍后会出现在列表中。';

  @override
  String get botsDuplicate => '复制 Bot';

  @override
  String get botsDuplicateHint => '沿用设置，对话与记忆从头开始';

  @override
  String botsDuplicateNamed(String name) {
    return '复制 $name？';
  }

  @override
  String get botsDuplicateBody => '新 Bot 沿用职责、指令和模型设置，对话与个人记忆从头开始，名称由主机分配。模型可用时，它会先发送一句问候。';

  @override
  String get botsChooseModelStart => '选一个模型开始';

  @override
  String get botsNoChats => '还没有对话';

  @override
  String botsUnreadCount(int count) {
    return '$count 条未读';
  }

  @override
  String get botsMainTag => '主';

  @override
  String get botsMemberNeedsApproval => '有成员等你批准';

  @override
  String botsNamedWorking(String name) {
    return '$name 正在干活';
  }

  @override
  String botsNamesWorking(String names) {
    return '$names 正在干活';
  }

  @override
  String botsMemberCount(int count) {
    return '$count 位成员';
  }

  @override
  String get botsUpdateRequired => 'DS Bot 需要更新';

  @override
  String get botsInstall => '安装 DS Bot';

  @override
  String get botsUpdateForPhone => '新版才能在手机上用';

  @override
  String get botsInstallDescription => '一组长期在线的 Bot，各有记忆和分工';

  @override
  String botsInstallOnHost(String host) {
    return '在$host上装好后就能用';
  }

  @override
  String botsRunsOnHost(String host) {
    return '在$host上运行';
  }

  @override
  String get botsInstalling => '正在安装';

  @override
  String get botsMemory => '记忆';

  @override
  String get botsEditMemory => '编辑记忆';

  @override
  String get botsAddMemory => '添加记忆';

  @override
  String get botsMemoryReplyExample => '比如：回复尽量简短';

  @override
  String get botsMemoryDraftExample => '比如：周五前交初稿';

  @override
  String botsMemoryCount(int count) {
    return '记忆 · $count';
  }

  @override
  String get botsMemoryReadFailed => '没能读取记忆';

  @override
  String get botsSummary => '概要';

  @override
  String get botsNoMemory => '还没有记忆';

  @override
  String get botsTeam => '团队';

  @override
  String get botsSelf => '自己';

  @override
  String get botsWrittenByYou => '你写的';

  @override
  String get botsNameRequired => '起个名字';

  @override
  String get botsRoleHint => '一句话说它是做什么的';

  @override
  String get botsNewInstructionsHint => '它该怎么做事，有什么要注意的';

  @override
  String get botsAppearance => '外观';

  @override
  String get botsCreating => '正在创建';

  @override
  String get botsGroupNameOptional => '群名（可不填）';

  @override
  String botsMembersSelected(int count) {
    return '成员 · 已选 $count';
  }

  @override
  String get botsPickTwoBots => '至少选两个 Bot';

  @override
  String get botsFullText => '全文';

  @override
  String botsTextPartial(String count) {
    return '仅显示前 $count 个字符';
  }

  @override
  String get botsTextCompletenessUnknown => '无法确认是否为完整内容';

  @override
  String get botsRoomGone => '这个群聊已不在';

  @override
  String botsNamedSpeaking(String name) {
    return '$name 正在发言';
  }

  @override
  String botsNamedActivity(String name, String activity) {
    return '$name $activity';
  }

  @override
  String get botsWorking => '正在干活';

  @override
  String get botsDiscussing => '正在讨论';

  @override
  String get botsTyping => '正在输入';

  @override
  String get botsGroupComposerHint => '给大家发消息…';

  @override
  String get botsDecline => '拒绝';

  @override
  String get botsAllowOnce => '允许本次';

  @override
  String get botsPrivateChat => '私聊';

  @override
  String get botsSetAdmin => '设为管理员';

  @override
  String get botsRemoveMember => '移出群聊';

  @override
  String get botsDeleteRoomBody => '群里的记录还在，群记忆会移到归档里。';

  @override
  String botsNamedAdmin(String name) {
    return '管理员 $name';
  }

  @override
  String botsRoomWorkingCount(int count) {
    return '$count 位在干活';
  }

  @override
  String botsMembersCountTitle(int count) {
    return '成员 · $count';
  }

  @override
  String get botsStopMember => '停下';

  @override
  String get botsAddMember => '添加成员';

  @override
  String get botsWhoAnswers => '谁先回答';

  @override
  String get botsAdminFirst => '管理员先答';

  @override
  String get botsEveryoneInTurn => '全员轮流';

  @override
  String get botsGroupName => '群名';

  @override
  String get botsGroupNotice => '群公告';

  @override
  String get botsGroupNoticeHint => '每个成员发言前都会看到';

  @override
  String get botsDeleteGroup => '删除群聊';

  @override
  String get botsDiscardTitle => '放弃修改？';

  @override
  String get botsKeepEditing => '继续编辑';

  @override
  String get botsDiscard => '放弃';

  @override
  String get botsProgress => '进度';

  @override
  String get botsGlyphRun => '运行';

  @override
  String get botsGlyphJobOutput => '查看后台任务';

  @override
  String get botsGlyphJobs => '后台任务';

  @override
  String get botsGlyphStopJob => '停止后台任务';

  @override
  String get botsGlyphRead => '读取';

  @override
  String get botsGlyphImage => '查看图片';

  @override
  String get botsGlyphDeliver => '交付文件';

  @override
  String get botsGlyphWrite => '写入';

  @override
  String get botsGlyphSearch => '搜索';

  @override
  String get botsGlyphFindFiles => '查找文件';

  @override
  String get botsGlyphOpenWeb => '打开网页';

  @override
  String get botsGlyphMessageAgent => '发消息给子代理';

  @override
  String get botsGlyphInterruptAgent => '打断子代理';

  @override
  String get botsGlyphListModels => '列出子代理模型';

  @override
  String get botsGlyphWorkflow => '工作流';

  @override
  String get botsGlyphLoop => '循环任务';

  @override
  String get botsGlyphSkill => '使用技能';

  @override
  String get botsGlyphTodo => '更新待办';

  @override
  String get botsGlyphSetGoal => '设定目标';

  @override
  String get botsGlyphViewGoal => '查看目标';

  @override
  String get botsGlyphUpdateGoal => '更新目标';

  @override
  String get botsGlyphAsk => '提问';

  @override
  String get botsCommunityEmpty => '暂时没有内容';

  @override
  String get botsCommunityGroups => '交流群';

  @override
  String get botsCommunity => '社区';

  @override
  String get botsForum => '论坛';

  @override
  String get botsForumSubtitle => '提问、分享、找同好';

  @override
  String get botsProjectHome => 'DSH Go 项目主页';

  @override
  String get botsOpenSource => '开源项目';

  @override
  String get botsPluginCatalogFailed => '插件目录没打开';

  @override
  String get botsTapRetry => '点一下重试';

  @override
  String get botsFeaturedPlugins => '精选插件';

  @override
  String get botsPluginSource => '插件信息来自 dshfind';

  @override
  String get botsPromptIdeas => '玩法';

  @override
  String get botsUpdates => '更新动态';

  @override
  String get botsLink => '链接';

  @override
  String botsLinkOpenFailed(String host) {
    return '没能打开 $host';
  }

  @override
  String botsYearMonth(int year, String month) {
    return '$year年$month月';
  }

  @override
  String get botsCopyGroupNumber => '复制群号';

  @override
  String botsQrCodeLabel(String title) {
    return '$title二维码';
  }

  @override
  String get botsFiles => '文件';

  @override
  String get botsEmptyCell => '（空）';

  @override
  String botsYesterdayTime(String time) {
    return '昨天 $time';
  }

  @override
  String get botsOutsideWorkspace => '不在工作区里';

  @override
  String get botsNotFolder => '这不是文件夹';

  @override
  String get botsChatNotFound => '找不到这个对话';

  @override
  String get botsBrowseUnsupported => '这个连接不支持浏览文件';

  @override
  String get botsWorkspace => '工作区';

  @override
  String get botsSearchFiles => '搜索文件';

  @override
  String get botsGoUp => '回到上一级';

  @override
  String get botsEmptyFolder => '空文件夹';

  @override
  String botsFileCount(int count) {
    return '$count 个文件';
  }

  @override
  String botsTruncatedItems(int count) {
    return '只列出了前 $count 项';
  }

  @override
  String get botsMoreActions => '更多操作';

  @override
  String get botsSearchFailed => '没能搜索';

  @override
  String get botsNoResults => '没有找到';

  @override
  String get botsCopyPath => '复制路径';

  @override
  String get botsPetOutsideApp => 'App 外显示';

  @override
  String get botsPetNotAuthorized => '未授权';

  @override
  String get botsPetDisplayWhen => '显示时机';

  @override
  String get botsPetWhenActive => '有事时显示';

  @override
  String get botsPetAlways => '一直显示';

  @override
  String get botsPetSwitchDisabled => '开关点不动';

  @override
  String get botsPetRestrictedSettings => '允许受限制的设置';

  @override
  String get botsPetHiddenToday => '今天不再显示';

  @override
  String get botsPetRestore => '恢复';

  @override
  String get botsPetChange => '换宠物';

  @override
  String get botsPetHideHour => '藏起来 1 小时';

  @override
  String get botsPetSettings => '宠物设置';

  @override
  String get botsPetDeepy => 'Deepy 小鲸鱼';

  @override
  String get botsPetWhaleGirl => '鲸娘';

  @override
  String get botsPetNone => '不显示';

  @override
  String get botsPets => '宠物';

  @override
  String get botsPetSource => '来自 DSH-TUI';

  @override
  String get botsPetSize => '大小';

  @override
  String get botsPetQuiet => '安静模式';

  @override
  String get botsPetQuietSubtitle => '只做动作，不冒气泡';

  @override
  String get botsPetShowNow => '立即显示';

  @override
  String botsPetHiddenUntil(String time) {
    return '藏到 $time';
  }

  @override
  String get botsKeyEsc => '发送 Esc';

  @override
  String get botsKeyTab => '发送 Tab';

  @override
  String get botsKeyLeft => '左';

  @override
  String get botsKeyUp => '上';

  @override
  String get botsKeyDown => '下';

  @override
  String get botsKeyRight => '右';

  @override
  String get botsKeyPipe => '竖线';

  @override
  String get botsKeyTilde => '波浪号';

  @override
  String get botsKeySlash => '斜杠';

  @override
  String get botsKeyDash => '短横线';

  @override
  String get botsTerminal => '终端';

  @override
  String get botsTerminalRename => '重命名终端';

  @override
  String get botsTerminalName => '终端名称';

  @override
  String get botsTerminalRenameFailed => '没能重命名';

  @override
  String botsTerminalCloseNamed(String title) {
    return '关闭「$title」？';
  }

  @override
  String get botsTerminalCloseBody => '里面的进程会结束';

  @override
  String get botsTerminalUnsupported => '这个连接用不了终端';

  @override
  String get botsTerminalSupportedHosts => '在本机或 SSH 主机上可用';

  @override
  String get botsTerminalOpening => '正在打开终端…';

  @override
  String get botsTerminalNone => '没有打开的终端';

  @override
  String get botsTerminalNew => '新建终端';

  @override
  String get botsTerminalClose => '关闭终端';

  @override
  String get botsTerminalChooseShell => '选择 Shell';

  @override
  String get botsTerminalShellFailed => '没能读取 Shell';

  @override
  String get botsTerminalReading => '正在读取…';

  @override
  String get botsTerminalDefaultShell => '默认 Shell';

  @override
  String get botsTerminalOtherDevice => '其他设备正在输入';

  @override
  String get botsTerminalTakeOver => '接管';

  @override
  String get botsTerminalStarting => '正在启动…';

  @override
  String get botsTerminalConnecting => '正在连接…';

  @override
  String get botsTerminalDisconnected => '连接已断开';

  @override
  String get botsTerminalReconnect => '重新连接';

  @override
  String get botsTerminalEnded => '已结束';

  @override
  String botsTerminalExitCode(int code) {
    return '已结束 · 退出码 $code';
  }

  @override
  String get botsTerminalGone => '这个终端已不在了';

  @override
  String get botsTerminalLimit => '先关掉不用的终端';

  @override
  String get botsToolWorkingRun => '正在运行命令';

  @override
  String botsToolApprovalRun(String name) {
    return '$name 想运行命令';
  }

  @override
  String get botsToolWorkingRead => '正在查看文件';

  @override
  String botsToolApprovalRead(String name) {
    return '$name 想查看文件';
  }

  @override
  String get botsToolWorkingEdit => '正在修改文件';

  @override
  String botsToolApprovalEdit(String name) {
    return '$name 想修改文件';
  }

  @override
  String get botsToolWorkingSearch => '正在联网搜索';

  @override
  String botsToolApprovalSearch(String name) {
    return '$name 想联网搜索';
  }

  @override
  String get botsToolWorkingBrowse => '正在看网页';

  @override
  String botsToolApprovalBrowse(String name) {
    return '$name 想看网页';
  }

  @override
  String get botsToolWorkingMessage => '正在联系其他 Bot';

  @override
  String botsToolApprovalMessage(String name) {
    return '$name 想联系其他 Bot';
  }

  @override
  String get botsToolWorkingGroup => '正在在群里沟通';

  @override
  String botsToolApprovalGroup(String name) {
    return '$name 想在群里沟通';
  }

  @override
  String get botsToolWorkingMemory => '正在整理记忆';

  @override
  String botsToolApprovalMemory(String name) {
    return '$name 想整理记忆';
  }

  @override
  String get botsToolWorkingRecall => '正在翻看记录';

  @override
  String botsToolApprovalRecall(String name) {
    return '$name 想翻看记录';
  }

  @override
  String get botsToolWorkingTeam => '正在安排团队';

  @override
  String botsToolApprovalTeam(String name) {
    return '$name 想安排团队';
  }

  @override
  String get botsToolWorkingAsk => '正在准备问你';

  @override
  String botsToolApprovalAsk(String name) {
    return '$name 想准备问你';
  }

  @override
  String get botsToolWorkingWork => '正在干活';

  @override
  String botsToolApprovalWork(String name) {
    return '$name 想干活';
  }

  @override
  String get botsEveryone => '所有人';

  @override
  String get botsActivelyRunning => '正在运行';

  @override
  String get botsListSeparator => '，';

  @override
  String get botsNameSeparator => '、';

  @override
  String get botsGlyphSubagent => '子代理';

  @override
  String get botsGlyphWebSearch => '联网搜索';

  @override
  String botsSenderPreview(String name, String preview) {
    return '$name：$preview';
  }

  @override
  String botsAgentSemantics(String title, String state) {
    return '$title，$state';
  }

  @override
  String botsViewMetric(Object label, Object value) {
    return '$label：$value';
  }

  @override
  String get botsEffortXhigh => '超高';

  @override
  String get botsRelayLimit => 'Bot 互叫上限';

  @override
  String get botsRelayLimitHint => '从你最近一次发言起，Bot 之间互叫达到此次数后暂停。填写 1–200 的整数，留空使用默认值。';

  @override
  String botsRelayLimitDefault(int count) {
    return '默认：$count';
  }

  @override
  String get botsRelayLimitInvalid => '请填写 1–200 的整数';

  @override
  String get botsRelayLimitRestore => '恢复默认';

  @override
  String get botsRelayLimitConnectionChanged => '连接已变化，请关闭后重新打开。';

  @override
  String get botsMobileUnsupportedTitle => 'DS Bot 暂不支持手机端';

  @override
  String get botsMobileApiRequired => '可先在网页版中使用';

  @override
  String get botsMobileApiMissing => '手机端暂不支持，可先在网页版中使用';

  @override
  String get botsCreationConnectionChanged => '连接已变化，请重新打开创建页面后再操作。';

  @override
  String get brandXiaomi => '小米 / Redmi';

  @override
  String get brandHuawei => '华为';

  @override
  String get brandHonor => '荣耀';

  @override
  String get brandOppo => 'OPPO / 一加 / realme';

  @override
  String get brandSamsung => '三星';

  @override
  String get brandVivoOs => 'vivo / iQOO（OriginOS）';

  @override
  String get brandXiaomiOs => '小米 / Redmi（HyperOS、MIUI）';

  @override
  String get brandHuaweiOs => '华为 / 荣耀（HarmonyOS、MagicOS）';

  @override
  String get brandOppoOs => 'OPPO / 一加 / realme（ColorOS）';

  @override
  String get brandSamsungOs => '三星（One UI）';

  @override
  String get brandZhihu => '知乎';

  @override
  String get catalogCurrentChat => '当前对话';

  @override
  String get catalogChatDetails => '对话详情';

  @override
  String get catalogChatDetailsSummary => '轨迹、改动与进度';

  @override
  String get catalogArtifacts => '产出的文件';

  @override
  String get catalogArtifactsSummary => '预览、分享、保存';

  @override
  String get catalogFiles => '文件';

  @override
  String get catalogFilesSummary => '浏览与预览';

  @override
  String get catalogTerminal => '终端';

  @override
  String get catalogTerminalSummary => '工作区里的终端';

  @override
  String get catalogExport => '导出对话日志';

  @override
  String get catalogExportSummary => '打包成 ZIP';

  @override
  String get catalogJobs => '后台任务';

  @override
  String get catalogJobsSummary => '查看输出、停止';

  @override
  String get catalogPlanGoal => '计划与目标';

  @override
  String get catalogPlanGoalSummary => '目标、计划与待办';

  @override
  String get catalogSkills => '技能';

  @override
  String get catalogSkillsSummary => '在对话里用技能';

  @override
  String get catalogSubagents => '子代理';

  @override
  String get catalogSubagentsSummary => '谱系与状态，点开接着聊';

  @override
  String get catalogReference => '引用文件和对话';

  @override
  String get catalogReferenceSummary => '在输入框用 @ 引用';

  @override
  String get catalogAutomationSection => '自动化';

  @override
  String get catalogSchedules => '自动化任务';

  @override
  String get catalogSchedulesSummary => '定时与周期任务';

  @override
  String get catalogAgentModelsSection => 'Agent 与模型';

  @override
  String get catalogPermission => '权限';

  @override
  String get catalogPermissionSummary => '执行前是否确认';

  @override
  String get catalogAgentPresets => 'Agent 预设';

  @override
  String get catalogAgentPresetsSummary => '新对话的工作方式';

  @override
  String get catalogModels => '模型';

  @override
  String get catalogModelsSummary => '订阅与自定义渠道';

  @override
  String get catalogSubagentSettings => '子代理设置';

  @override
  String get catalogSubagentSettingsSummary => '层数、并行与模型';

  @override
  String get catalogAgentLoop => 'Agent 循环';

  @override
  String get catalogAgentLoopSummary => '工具并行上限';

  @override
  String get catalogShellSettings => '命令执行';

  @override
  String get catalogShellSettingsSummary => '超时与输出上限';

  @override
  String get catalogWebSearch => '联网搜索';

  @override
  String get catalogWebSearchSummary => '搜索服务与预算';

  @override
  String get catalogPlugins => '插件';

  @override
  String get catalogPluginsSummary => '已安装与插件市场';

  @override
  String get catalogPluginInventory => '插件清单';

  @override
  String get catalogPluginInventorySummary => '已加载的全部插件';

  @override
  String get catalogCordisSummary => '插件创建的动态面板';

  @override
  String get catalogAgentTeam => '智能体团队';

  @override
  String get catalogAgentTeamSummary => '成员、任务板与消息';

  @override
  String get catalogCotTranslation => '思考过程翻译';

  @override
  String get catalogCotTranslationSummary => '展开思考后点「翻译」';

  @override
  String get catalogVoiceInput => '语音输入';

  @override
  String get catalogVoiceInputSummary => '输入框里的麦克风';

  @override
  String get catalogCommunitySharingSection => '社区与分享';

  @override
  String get catalogForum => '论坛';

  @override
  String get catalogForumSummary => '提问、分享、找同好';

  @override
  String get catalogCommunity => '社区';

  @override
  String get catalogCommunitySummary => '精选与交流群';

  @override
  String get catalogBotSummary => 'Bot 团队与群聊';

  @override
  String get catalogShareProfile => '分享配置';

  @override
  String get catalogShareProfileSummary => '插件、设置与技能';

  @override
  String get catalogHostsSettingsSection => '主机与设置';

  @override
  String get catalogSearch => '搜索对话';

  @override
  String get catalogSearchSummary => '按标题和正文查找';

  @override
  String get catalogNotifications => '通知';

  @override
  String get catalogNotificationsSummary => '完成与待确认提醒';

  @override
  String get catalogWorkspaces => '工作区';

  @override
  String get catalogWorkspacesSummary => '添加与切换目录';

  @override
  String get catalogGeneral => '通用设置';

  @override
  String get catalogGeneralSummary => '显示、发送与日志上传';

  @override
  String get catalogAccount => '账号与余额';

  @override
  String get catalogAccountSummary => '登录、余额与充值';

  @override
  String get catalogRemoteSummary => '连接电脑或服务器';

  @override
  String get catalogPhoneControl => '手机操控';

  @override
  String get catalogPhoneControlSummary => '看屏幕、帮你点按';

  @override
  String get catalogEngine => '本机引擎';

  @override
  String get catalogEngineSummary => '本机引擎状态与日志';

  @override
  String get catalogDiagnostics => '诊断';

  @override
  String get catalogDiagnosticsSummary => '导出诊断包';

  @override
  String get catalogWebSummary => 'DSH 官方界面';

  @override
  String get catalogPluginPanel => '插件面板';

  @override
  String get catalogHostPluginMissing => '这台主机没有这个插件';

  @override
  String get catalogAllFeatures => '全部功能';

  @override
  String get catalogAllFeaturesSubtitle => '网页版的功能，也都在这里';

  @override
  String get catalogOpenChatFirst => '先打开一个对话';

  @override
  String get catalogNoOpenChat => '还没打开对话';

  @override
  String get catalogOpenChat => '当前打开的对话';

  @override
  String get catalogOpenOrCreateChat => '先在聊天里打开或新建一个';

  @override
  String get catalogCordisHostClient => '后台和界面';

  @override
  String get catalogCordisHostOnly => '仅后台';

  @override
  String get catalogCordisClientOnly => '仅界面';

  @override
  String get catalogCordisPluginGone => '插件已经不在了';

  @override
  String get catalogCordisStopFailed => '没能停止';

  @override
  String get catalogCordisRemoveOne => '会停止它并删除。';

  @override
  String get catalogCordisRemove => '移除';

  @override
  String get catalogCordisRemoved => '已移除';

  @override
  String get catalogCordisRemoveFailed => '没能移除';

  @override
  String get catalogCordisChat => '所属对话';

  @override
  String get catalogCordisMakeup => '组成';

  @override
  String get catalogCordisStopping => '正在停止…';

  @override
  String get catalogCordisRemoving => '正在移除…';

  @override
  String get catalogSeatGone => '插件已不可用';

  @override
  String catalogCordisRemoveTitle(String name) {
    return '移除「$name」？';
  }

  @override
  String catalogCordisRemoveVersions(int versions) {
    return '会停止它，并删除全部 $versions 个版本。';
  }

  @override
  String catalogCordisVersionCount(int count) {
    return '$count 个';
  }

  @override
  String get catalogToolsSection => '工具';

  @override
  String get catalogAllSettings => '全部设置';

  @override
  String get chatBackgroundTaskNotice => '后台任务通知';

  @override
  String get chatBackgroundTaskMessage => '后台任务消息';

  @override
  String get chatDeclineQuestion => '不回答';

  @override
  String get chatChats => '对话列表';

  @override
  String get chatViewChatDetails => '查看对话详情';

  @override
  String get chatUnsent => '未发送';

  @override
  String get chatSteerNextStep => '插话 · 下一步生效';

  @override
  String get chatQueuedAfterTurn => '排队中 · 本轮结束后发送';

  @override
  String get chatSteering => '插话中';

  @override
  String get chatQueued => '排队中';

  @override
  String get chatStoppingTurn => '正在停止本轮';

  @override
  String get chatSending => '发送中';

  @override
  String get chatSendNow => '立即发送';

  @override
  String get chatSwitchToSteer => '改为插话';

  @override
  String get chatWithdraw => '撤回';

  @override
  String get chatContinuedInNewChat => '已在新对话中继续';

  @override
  String get chatReadOriginalImageFailed => '读取原图失败，请重试';

  @override
  String get chatRegenerateFailed => '重新回答失败';

  @override
  String get chatRegeneratedInNewChat => '已在新对话中重新回答';

  @override
  String get chatOpenedInNewChatReattach => '已在新对话中打开，附件需重新添加';

  @override
  String get chatOpenedInNewChat => '已在新对话中打开';

  @override
  String chatForkQueuedLeft(String message, int left) {
    return '$message（$left 条排队消息未能带走）';
  }

  @override
  String get chatReturnToOriginal => '返回原对话';

  @override
  String chatWaitingCount(int count) {
    return '$count 项待确认';
  }

  @override
  String chatWaitingBackToBottom(int count) {
    return '$count 项待确认，回到底部';
  }

  @override
  String get chatBackToBottom => '回到底部';

  @override
  String get chatCreateFailed => '新建对话失败';

  @override
  String get chatSendMode => '发送方式';

  @override
  String get chatSteer => '插话';

  @override
  String get chatSteerHint => '不打断，AI 下一步会看到';

  @override
  String get chatInterruptAndSend => '中断并发送';

  @override
  String get chatInterruptHint => '停下当前任务，先处理这条';

  @override
  String get chatQueue => '排队';

  @override
  String get chatQueueHint => '本轮结束后发送';

  @override
  String get chatWithdrawnEditable => '已撤回，可修改后再发';

  @override
  String get chatWithdrawn => '已撤回';

  @override
  String chatAttachmentLimit(int count) {
    return '每条消息最多 $count 个附件';
  }

  @override
  String get chatAttachmentPermission => '没有权限，可在系统设置中开启';

  @override
  String get chatOpenAttachmentFailed => '没能打开附件';

  @override
  String get chatReadFailed => '读取失败';

  @override
  String get chatReadImageFailed => '没能读取图片';

  @override
  String get chatOpenChatFirst => '先打开一个对话';

  @override
  String get chatTurnCompleted => '这一轮已完成';

  @override
  String get chatTurnError => '这一轮出错了';

  @override
  String get chatAnswerHint => '输入回答…';

  @override
  String get chatStarting => '正在启动';

  @override
  String get chatConnecting => '正在连接';

  @override
  String get chatDisconnected => '连接已断开';

  @override
  String get chatReconnecting => '重新连接中';

  @override
  String get chatGenerating => '生成中';

  @override
  String get chatGoToSettings => '去设置';

  @override
  String get chatListeningEllipsis => '正在聆听…';

  @override
  String get chatTranscribingEllipsis => '正在转写…';

  @override
  String get chatConnectToSend => '连接引擎后即可发送';

  @override
  String get chatGeneratingSteerHint => '生成中 · 可直接插话';

  @override
  String get chatComposerHint => '给 DSH 发消息…';

  @override
  String get chatStopGenerating => '停止生成';

  @override
  String get chatVoiceInput => '语音输入';

  @override
  String get chatStopVoiceInput => '停止语音输入';

  @override
  String get chatGoal => '目标';

  @override
  String get chatGoalActions => '目标操作';

  @override
  String get chatGoalBlocked => '受阻';

  @override
  String chatGoalRoundLimit(int rounds, int max) {
    return '第 $rounds / $max 轮';
  }

  @override
  String chatGoalRound(int rounds) {
    return '第 $rounds 轮';
  }

  @override
  String get chatEditGoal => '编辑目标';

  @override
  String get chatPauseGoal => '暂停';

  @override
  String get chatPauseGoalHint => '先不自动推进';

  @override
  String get chatResumeGoal => '恢复';

  @override
  String get chatResumeGoalHint => '继续自动推进';

  @override
  String get chatClearGoal => '清除目标';

  @override
  String get chatGoalHint => '要完成什么';

  @override
  String get chatClearGoalTitle => '清除目标？';

  @override
  String chatTodoCurrent(String content) {
    return '正在：$content';
  }

  @override
  String chatTodoNext(String content) {
    return '下一步：$content';
  }

  @override
  String get chatTodoAllDone => '全部完成';

  @override
  String chatTodoSemantics(String count, String label) {
    return '待办 $count，$label';
  }

  @override
  String get chatCollapseTodos => '收起清单';

  @override
  String get chatExpandTodos => '展开清单';

  @override
  String get chatTodoNotStarted => '未开始';

  @override
  String get chatFile => '文件';

  @override
  String get chatFolder => '文件夹';

  @override
  String get chatChat => '对话';

  @override
  String get chatSubagent => '子代理';

  @override
  String get chatRecent => '最近';

  @override
  String get chatMentionSearching => '正在查找…';

  @override
  String get chatMentionNoFiles => '没有匹配的文件';

  @override
  String get chatMentionNoMatches => '没有匹配的文件或对话';

  @override
  String get chatQuote => '引用';

  @override
  String get chatOpenFolder => '打开文件夹';

  @override
  String get chatJustNow => '刚刚';

  @override
  String chatMentionAgeMinutes(int count) {
    return '$count分钟';
  }

  @override
  String chatMentionAgeHours(int count) {
    return '$count小时';
  }

  @override
  String chatMentionAgeDays(int count) {
    return '$count天';
  }

  @override
  String chatMentionAgeMonths(int count) {
    return '$count个月';
  }

  @override
  String chatMentionAgeYears(int count) {
    return '$count年';
  }

  @override
  String get chatMermaidChart => 'Mermaid 图表';

  @override
  String get chatPreview => '预览';

  @override
  String get chatUnwrapLines => '不换行';

  @override
  String get chatWrapLines => '自动换行';

  @override
  String get chatAlertNote => '注意';

  @override
  String get chatAlertTip => '提示';

  @override
  String get chatAlertImportant => '重要';

  @override
  String get chatAlertWarning => '警告';

  @override
  String get chatAlertCaution => '小心';

  @override
  String get chatImage => '图片';

  @override
  String get chatImageNotFound => '找不到图片';

  @override
  String get chatImageOffline => '未连接 DSH';

  @override
  String get chatImageTooLarge => '图片过大';

  @override
  String get chatImageReadFailed => '无法读取文件';

  @override
  String get chatImageDisplayFailed => '无法显示';

  @override
  String get chatImageTapToView => '轻点查看';

  @override
  String get chatImageTapToRetry => '轻点重试';

  @override
  String get chatImageUnsupportedAddress => '不支持的地址';

  @override
  String get chatMermaidNeedsNetwork => '需要联网';

  @override
  String get chatMermaidSyntaxError => '图表语法有误';

  @override
  String get chatChartPreview => '图表预览';

  @override
  String get chatCopyCode => '复制代码';

  @override
  String get chatChartClosed => '图表已关闭';

  @override
  String get chatVoiceMicrophoneFailed => '没能打开麦克风';

  @override
  String get chatVoicePermissionOff => '麦克风权限已关闭';

  @override
  String get chatVoicePermissionNeeded => '需要麦克风权限才能语音输入';

  @override
  String get chatVoiceUnavailable => '这台手机没有可用的语音识别';

  @override
  String get chatVoiceNotHeard => '没有听清，再说一次';

  @override
  String get chatVoiceTranscriptionFailed => '没能转写这段语音';

  @override
  String get chatVoiceNetworkFailed => '网络不太好，没能识别';

  @override
  String get chatVoiceLanguageUnsupported => '暂不支持这种语言';

  @override
  String get chatVoiceMicrophoneBusy => '麦克风正被占用';

  @override
  String get chatVoiceBusy => '语音识别正忙，稍后再试';

  @override
  String get chatVoiceRecognitionFailed => '语音识别出错了';

  @override
  String get chatListening => '正在聆听';

  @override
  String get chatTranscribing => '正在转写';

  @override
  String get chatCancelVoiceInput => '取消语音输入';

  @override
  String get chatViewTurnTrace => '查看本轮轨迹';

  @override
  String chatTokensPerSecond(int count) {
    return '约 $count tokens/秒';
  }

  @override
  String get chatNoTokensStreaming => '没有在出字';

  @override
  String chatCurrentStep(String step) {
    return '这一步 $step';
  }

  @override
  String chatTodoProgress(int done, int total) {
    return '待办进度 $done/$total';
  }

  @override
  String chatProgress(int done, int total) {
    return '进度 $done/$total';
  }

  @override
  String get chatApproveCommand => '允许运行这条命令？';

  @override
  String get chatApproveWrite => '允许写入这个文件？';

  @override
  String get chatApproveEdit => '允许修改这个文件？';

  @override
  String get chatApproveWebpage => '允许打开这个网页？';

  @override
  String get chatApproveSearch => '允许联网搜索？';

  @override
  String chatApproveTool(String name) {
    return '允许使用「$name」？';
  }

  @override
  String get chatDecline => '拒绝';

  @override
  String get chatAllowOnce => '允许本次';

  @override
  String get chatAllowForChat => '本对话都允许';

  @override
  String get chatSaveToDownloads => '存到「下载」';

  @override
  String get chatCopyPath => '复制路径';

  @override
  String get chatOpenInDefaultApp => '用默认应用打开';

  @override
  String get chatDownloadsFolderHint => '下载/DSH-Go 文件夹';

  @override
  String chatSavedToDownloadsPath(String path) {
    return '已存到 下载/$path';
  }

  @override
  String chatSavedToPath(String path) {
    return '已存到 $path';
  }

  @override
  String chatDeliveredFiles(int count) {
    return '交付了 $count 个文件';
  }

  @override
  String chatGeneratedFiles(int count) {
    return '生成了 $count 个文件';
  }

  @override
  String chatAllFiles(int count) {
    return '全部 $count 个文件';
  }

  @override
  String get chatCollapseFileList => '收起文件列表';

  @override
  String chatExpandAllFiles(int count) {
    return '展开全部 $count 个文件';
  }

  @override
  String get chatDownloading => '正在下载…';

  @override
  String chatDownloadingPercent(int percent) {
    return '正在下载… $percent%';
  }

  @override
  String get chatOpening => '正在打开…';

  @override
  String get chatSavingToDownloads => '正在存到「下载」…';

  @override
  String get chatOpenInPhoneApp => '用手机上的应用打开';

  @override
  String get chatMoreActions => '更多操作';

  @override
  String get chatAlreadyInDownloads => '已在手机的「下载」里';

  @override
  String get chatArtifactCopyPathOnly => '当前连接无法读取文件，只能复制路径';

  @override
  String get chatReplying => '正在回复';

  @override
  String get chatInterrupted => '已中断';

  @override
  String get chatGallery => '相册';

  @override
  String get chatTakePhoto => '拍照';

  @override
  String get chatAddAttachment => '添加图片或文件';

  @override
  String chatRemoveAttachment(String name) {
    return '移除「$name」';
  }

  @override
  String get chatAutoApproveCommands => '自动允许命令';

  @override
  String get chatAutoApproving => '自动允许中';

  @override
  String chatViewMoreChanges(int count) {
    return '查看改动，还有 $count 个文件';
  }

  @override
  String get chatViewChanges => '查看改动';

  @override
  String chatChangedFiles(int count) {
    return '改动了 $count 个文件';
  }

  @override
  String chatMoreFiles(int count) {
    return '还有 $count 个文件';
  }

  @override
  String chatFileChangeSemantics(String path, int added, int removed) {
    return '$path，新增 $added 行，删除 $removed 行';
  }

  @override
  String get chatNewFileSuffix => '  新建';

  @override
  String get chatPathCopied => '已复制路径';

  @override
  String chatCommandCompacted(int count, String tokens) {
    return '已压缩 $count 条历史记录（约 $tokens tokens）';
  }

  @override
  String chatCommandPermissionChanged(String name) {
    return '已切换为$name';
  }

  @override
  String chatCommandCurrentPermission(String name) {
    return '当前权限：$name';
  }

  @override
  String get chatCommandUnknownPermission => '没有这个权限预设';

  @override
  String get chatCommandFeedbackRequired => '写上反馈内容再发送';

  @override
  String get chatCommandFeedbackSubmitted => '反馈已提交';

  @override
  String get chatCommandNothingToCompact => '还没有可压缩的内容';

  @override
  String get chatCommandCompactionCancelled => '已取消压缩';

  @override
  String get chatCommandCompactionBusy => '正在忙，稍后再压缩';

  @override
  String get chatCommandCompactedSaveFailed => '已压缩，但没能保存';

  @override
  String get chatCommandCompactUsage => '/compact 不带参数';

  @override
  String get chatCommandHistoryChanged => '对话有变化，请再试一次';

  @override
  String get chatCommandCompactionFailed => '没能完成压缩，请再试一次';

  @override
  String get chatCommandCompactionIncomplete => '压缩未完成，请查看对话';

  @override
  String get chatCommandPlanEnabled => '已进入计划模式';

  @override
  String get chatCommandPlanEnabling => '下一步起进入计划模式';

  @override
  String get chatCommandPlanDisabled => '已退出计划模式';

  @override
  String get chatCommandPlanDisabling => '下一步起退出计划模式';

  @override
  String get chatCommandPlanCancelled => '已取消进入计划模式';

  @override
  String get chatCommandPlanInactive => '当前未开启计划模式';

  @override
  String get chatCommandPlanNoAttachments => '退出计划模式时不能附带文件';

  @override
  String get chatCommandNoGoal => '还没有目标';

  @override
  String get chatCommandGoalRequired => '写上新的目标再发送';

  @override
  String get chatCommandGoalAttachments => '附件需要和目标一起发送';

  @override
  String get chatCommandGoalCleared => '已清除目标';

  @override
  String get chatCommandGoalInvalid => '当前无法执行，请查看目标';

  @override
  String get chatCommandGoalExists => '已有目标，请编辑或清除后再设置';

  @override
  String get chatCommandGoalCreated => '已设置目标';

  @override
  String get chatCommandGoalUpdated => '已更新目标';

  @override
  String get chatCommandGoalPaused => '已暂停目标';

  @override
  String get chatCommandGoalResumed => '已继续目标';

  @override
  String get chatCommandCurrentGoal => '当前目标';

  @override
  String get chatCommandGoalBlocked => '等待处理';

  @override
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max) {
    return '$title\n$objective\n$status · 第 $rounds/$max 轮';
  }

  @override
  String get chatCommandFailed => '执行失败';

  @override
  String get chatImageStorageDenied => '没有存储权限，未能保存';

  @override
  String get chatImageCannotSave => '这张图片无法保存';

  @override
  String get chatImageDownloadFailed => '图片下载失败，请重试';

  @override
  String get chatImageSaveFailed => '保存失败，请重试';

  @override
  String get chatImageSavedToPhotos => '已保存到相册';

  @override
  String get chatShareFailed => '无法打开分享';

  @override
  String get chatSubmit => '提交';

  @override
  String get chatSelectText => '选择文字';

  @override
  String get chatRegenerate => '重新回答';

  @override
  String get chatBranchFromHere => '从这里分叉';

  @override
  String get chatEditAndResend => '编辑后重发';

  @override
  String get chatRegenerateHint => '在新对话中重新生成，原对话不变';

  @override
  String get chatBranchHint => '在新对话中继续，原对话不变';

  @override
  String get chatEditResendHint => '在新对话中改写，原对话不变';

  @override
  String get chatSaveToPhotos => '保存到相册';

  @override
  String get chatCopyAll => '全部复制';

  @override
  String get chatRequestRetrying => '请求失败，正在重试';

  @override
  String chatRequestRetryAttempt(int count) {
    return '请求失败，正在重试（第 $count 次）';
  }

  @override
  String chatRequestRetryLimit(int count, int max) {
    return '请求失败，正在重试（$count/$max）';
  }

  @override
  String chatSubscriptionExpired(String name) {
    return '$name 登录已失效';
  }

  @override
  String get chatProviderKeyMissing => '这个模型渠道还没有密钥';

  @override
  String get chatDeepSeekKeyMissing => '还没有 DeepSeek API Key';

  @override
  String get chatOutputLimitReached => '已达单次输出上限';

  @override
  String get chatTurnBlocked => '本轮已被拦截';

  @override
  String get chatTurnEngineRestarted => '引擎重启过，本轮已中断';

  @override
  String get chatSignInAgain => '重新登录';

  @override
  String chatQuestionsTitle(int count) {
    return '有 $count 个问题想问你';
  }

  @override
  String get chatOneQuestion => '有个问题想问你';

  @override
  String get chatMultipleChoices => '可多选';

  @override
  String get chatCustomAnswer => '其他回答';

  @override
  String get chatCustomAnswerHint => '输入你的回答';

  @override
  String chatQuoteSemantics(String text) {
    return '引用：$text';
  }

  @override
  String get chatRemoveQuote => '移除引用';

  @override
  String get chatReadOnlySubagent => '一次性子代理，只能查看';

  @override
  String get chatThinkingActive => '思考中';

  @override
  String get chatThinking => '思考';

  @override
  String get chatTranslate => '翻译';

  @override
  String get chatTranslationUnavailable => '翻译暂不可用';

  @override
  String get chatViewOriginal => '查看原文';

  @override
  String get chatViewTranslation => '查看译文';

  @override
  String get chatTranslating => '正在翻译';

  @override
  String chatToolFailures(String label, int count) {
    return '$label,$count 个失败';
  }

  @override
  String get chatToolNeedsApproval => '需要授权后才能执行';

  @override
  String get chatCommand => '命令';

  @override
  String chatToolLineRange(int first, int last) {
    return ' · 第 $first⁠–⁠$last 行';
  }

  @override
  String get chatParameters => '参数';

  @override
  String get chatOutput => '输出';

  @override
  String get chatResult => '结果';

  @override
  String get chatError => '错误';

  @override
  String get chatChanges => '改动';

  @override
  String get chatContent => '内容';

  @override
  String get chatNoOutput => '没有输出';

  @override
  String get chatToolDeclined => '已拒绝这次调用';

  @override
  String get chatToolRunning => '正在执行…';

  @override
  String get chatNoDetails => '暂无详情';

  @override
  String get chatErrApiKey => 'API Key 无效或已过期';

  @override
  String get chatErrBalance => '余额不足';

  @override
  String get chatErrAccountQuota => '账号额度已用完';

  @override
  String get chatErrRateLimit => '请求太频繁，稍后再试';

  @override
  String get chatErrContextLength => '对话太长，发送 /compact 压缩后再试';

  @override
  String get chatErrModelUnavailable => '模型服务暂时不可用';

  @override
  String get chatErrModelTimeout => '模型响应超时';

  @override
  String get chatErrModelConnection => '没能连上模型服务';

  @override
  String get chatErrModelEmpty => '模型没有返回内容';

  @override
  String get chatErrEngineOutdated => '这个模型需要新版引擎';

  @override
  String get chatErrModelUnsupported => '当前模型不可用';

  @override
  String get chatSwitchModel => '换模型';

  @override
  String get chatErrTurn => '本轮出错了';

  @override
  String chatTurnSteps(int count) {
    return '$count 步';
  }

  @override
  String chatTurnFootnoteSemantics(String summary) {
    return '本轮 $summary，查看本轮轨迹';
  }

  @override
  String chatTurnToolCalls(int count) {
    return '$count 次工具调用';
  }

  @override
  String chatTurnMessages(int count) {
    return '$count 条消息';
  }

  @override
  String chatTurnThoughts(int count) {
    return '$count 段思考';
  }

  @override
  String get chatMe => '我';

  @override
  String chatGoalSemantics(String objective) {
    return '目标，$objective';
  }

  @override
  String chatGoalStateSemantics(String objective, String state) {
    return '目标，$objective，$state';
  }

  @override
  String chatTodoItemSemantics(String content, String state) {
    return '$content，$state';
  }

  @override
  String chatMentionSemantics(String kind, String label) {
    return '$kind：$label';
  }

  @override
  String chatArtifactSemantics(String name, String description) {
    return '$name，$description';
  }

  @override
  String get commonCancel => '取消';

  @override
  String get commonRetry => '重试';

  @override
  String get commonClose => '关闭';

  @override
  String get commonCopied => '已复制';

  @override
  String get commonSave => '保存';

  @override
  String get commonSettings => '设置';

  @override
  String get commonBack => '返回';

  @override
  String get commonCopy => '复制';

  @override
  String get commonDone => '完成';

  @override
  String get commonDelete => '删除';

  @override
  String get commonInstall => '安装';

  @override
  String get commonShare => '分享';

  @override
  String get commonAdd => '添加';

  @override
  String get commonEdit => '编辑';

  @override
  String get commonClear => '清除';

  @override
  String get commonCollapse => '收起';

  @override
  String get commonEnable => '启用';

  @override
  String get commonOpen => '打开';

  @override
  String get commonDetails => '详情';

  @override
  String get commonMore => '更多';

  @override
  String get commonCreate => '创建';

  @override
  String get commonSend => '发送';

  @override
  String get commonStop => '停止';

  @override
  String get commonPaste => '粘贴';

  @override
  String get commonHide => '隐藏';

  @override
  String get commonLater => '稍后';

  @override
  String get commonConfirm => '确认';

  @override
  String get commonRename => '重命名';

  @override
  String get commonContinue => '继续';

  @override
  String get commonNotSet => '未设置';

  @override
  String get commonDefault => '默认';

  @override
  String get commonSaved => '已保存';

  @override
  String get commonSaveFailed => '没能保存';

  @override
  String get commonSaveFailedRetry => '没能保存，请重试';

  @override
  String get commonFailedTryAgain => '没能完成，再试一次';

  @override
  String get commonEngineUnreachable => '没能连上引擎';

  @override
  String get commonStorageFull => '存储空间不足';

  @override
  String get commonConnectionFailed => '连接失败';

  @override
  String get commonCopyLink => '复制链接';

  @override
  String get commonOpenWith => '用其他应用打开';

  @override
  String get commonOpenInWeb => '在网页版打开';

  @override
  String get commonUntitledChat => '未命名对话';

  @override
  String get commonNewChat => '新对话';

  @override
  String get commonYesterday => '昨天';

  @override
  String get commonSignedIn => '已登录';

  @override
  String get commonSignIn => '登录';

  @override
  String get commonSignOut => '退出登录';

  @override
  String get commonThisPhone => '本机';

  @override
  String get commonRemoteHost => '远程主机';

  @override
  String get commonWeb => '网页版';

  @override
  String get commonFollowSystem => '跟随系统';

  @override
  String get commonLight => '浅色';

  @override
  String get commonDark => '深色';

  @override
  String get commonInProgress => '进行中';

  @override
  String get commonCompleted => '已完成';

  @override
  String get commonStopped => '已停止';

  @override
  String get commonCancelled => '已取消';

  @override
  String get commonRunning => '运行中';

  @override
  String get commonPaused => '已暂停';

  @override
  String get commonDeclined => '已拒绝';

  @override
  String get commonFailed => '失败';

  @override
  String get commonStopping => '正在停止';

  @override
  String get commonWaitingApproval => '等你确认';

  @override
  String get commonWaitingAnswer => '等你回答';

  @override
  String get commonNotConnected => '未连接';

  @override
  String get commonInstalled => '已安装';

  @override
  String get commonName => '名称';

  @override
  String get commonStatus => '状态';

  @override
  String get commonVersion => '版本';

  @override
  String get commonOther => '其他';

  @override
  String get commonPin => '置顶';

  @override
  String get commonReply => '回复';

  @override
  String get commonUpdate => '更新';

  @override
  String get commonViewLogs => '查看日志';

  @override
  String commonItemCount(int count) {
    return '$count 项';
  }

  @override
  String commonMonthDay(String month, int day) {
    return '$month月$day日';
  }

  @override
  String get engineAccountSignedIn => '已登录 DeepSeek 账号';

  @override
  String get engineAccountSignOutTitle => '退出 DeepSeek 账号？';

  @override
  String get engineAccountSignOutBusy => '有任务正在使用账号模型，退出会立即中断它们。对话和文件都会保留。';

  @override
  String get engineAccountSignOutBody => '账号模型将不可用。对话、文件和 API Key 都会保留，随时可以重新登录。';

  @override
  String get engineAccountSignOutUnknown => '无法确认是否有任务在使用账号模型；如果有，退出会中断它们。';

  @override
  String get engineAccountSignOutFailed => '没能退出，稍后再试';

  @override
  String get engineAccountTitle => '账号';

  @override
  String get engineAccountRefresh => '刷新';

  @override
  String get engineAccountDeepSeek => 'DeepSeek 账号';

  @override
  String get engineAccountProfileUnavailable => '资料暂时读不到';

  @override
  String get engineAccountBalance => '余额';

  @override
  String get engineAccountBalanceHint => '账号模型的费用从余额中扣除';

  @override
  String get engineAccountBalanceEngineOff => '引擎未运行，启动后显示余额';

  @override
  String get engineAccountTopUp => '去充值';

  @override
  String get engineAccountUsageDetails => '用量明细';

  @override
  String get engineAccountToppedUpBalance => '充值余额';

  @override
  String get engineAccountGrantedBalance => '赠送余额';

  @override
  String get engineAccountBalanceUnavailable => '余额暂时读不到';

  @override
  String get engineAccountNoKeyNeeded => '登录后无需 API Key';

  @override
  String get engineAccountUnsupported => '当前引擎不支持账号登录';

  @override
  String get engineAccountSignInDeepSeek => '用 DeepSeek 账号登录';

  @override
  String get engineAccountAutoStart => '引擎未运行，登录时会自动启动';

  @override
  String get engineAccountReplaceKey => '更换 Key';

  @override
  String get engineAccountClearKeyTitle => '清除 API Key？';

  @override
  String get engineAccountClearKeyBody => '删除 App 里保存的 Key。本机引擎运行时，引擎里的 Key 也会一并删除。';

  @override
  String get engineAccountBrowserFailed => '没能打开浏览器';

  @override
  String get engineAccountSignInSuccess => '登录成功';

  @override
  String get engineAccountAlmostReady => '马上就好';

  @override
  String get engineAccountStartingEngine => '正在启动引擎';

  @override
  String get engineAccountOpenSignInNext => '随后打开登录页';

  @override
  String get engineAccountPreparingSignIn => '正在准备登录';

  @override
  String get engineAccountOpenDeepSeekNext => '马上打开 DeepSeek 登录页';

  @override
  String get engineAccountFinishInBrowser => '在浏览器中完成登录';

  @override
  String get engineAccountReturnToDsh => '登录完成后回到 DSH Go';

  @override
  String get engineAccountFinishingSignIn => '正在完成登录';

  @override
  String get engineAccountSavingSignIn => '正在保存登录信息';

  @override
  String get engineAccountAwaitingResult => '还没收到登录结果';

  @override
  String get engineAccountCopySignInLink => '复制登录链接';

  @override
  String get engineAccountReopenSignIn => '重新打开登录页';

  @override
  String get engineAccountCancelSignIn => '取消登录';

  @override
  String get engineAccountSignInLinkCopied => '登录链接已复制';

  @override
  String get engineAccountSigningIn => '登录中';

  @override
  String get engineAccountSignedOut => '未登录';

  @override
  String get engineAccountUsageFact => '用量从账号余额中扣除';

  @override
  String get engineAccountBrowserFact => '在浏览器中登录，密码不经过 DSH';

  @override
  String get engineAccountCredentialsFact => '登录凭据只保存在本机';

  @override
  String get engineSubagentTitle => '子代理';

  @override
  String get engineAgentLoopTitle => 'Agent 循环';

  @override
  String get engineShellTitle => '命令执行';

  @override
  String get engineSearchTitle => '联网搜索';

  @override
  String get engineSearchNewApiBadge => '新版 API';

  @override
  String get engineGeneralTitle => '通用设置';

  @override
  String get engineSettingsTitle => '引擎参数';

  @override
  String get engineSettingsReadFailed => '没能读取设置';

  @override
  String get engineSettingsRun => '运行';

  @override
  String get engineSettingsPlugins => '插件';

  @override
  String get engineSettingsPluginInventory => '插件清单';

  @override
  String get engineSettingsPluginStopped => '插件没有在运行';

  @override
  String get engineSettingsEnablePlugin => '启用后再来设置';

  @override
  String get engineSettingsNoEditableFields => '没有可以在这里改的设置';

  @override
  String get engineFieldRestoreDefault => '恢复默认';

  @override
  String get engineFieldDecrease => '减少';

  @override
  String get engineFieldIncrease => '增加';

  @override
  String get engineFieldRemove => '移除';

  @override
  String get engineFieldShow => '显示';

  @override
  String get engineFieldFromEnvironment => '由启动环境提供';

  @override
  String get engineFieldItem => '项';

  @override
  String get engineFieldAlreadyAdded => '已经添加过';

  @override
  String get engineFieldEnterName => '填写名称';

  @override
  String get engineFieldEnterNumber => '填写数值';

  @override
  String get engineFieldValue => '值';

  @override
  String get engineFieldNew => '新建';

  @override
  String get engineFieldRequired => '必填';

  @override
  String get engineGeneralMissing => '这台主机没有通用设置';

  @override
  String get engineSettingsVersionRequired => '需要 DSH 0.2.1 或更新版本';

  @override
  String get engineGeneralWebDisplay => '网页版显示';

  @override
  String get engineGeneralWebSending => '网页版发送';

  @override
  String get engineGeneralData => '数据';

  @override
  String get engineSubagentModelsTitle => '子代理模型';

  @override
  String get engineChatLogTitle => '对话日志';

  @override
  String get engineThinkingTranslationTitle => '思考过程翻译';

  @override
  String get enginePluginIndexesTitle => '插件市场索引';

  @override
  String get enginePermissionTitle => '权限';

  @override
  String get engineAgentPresetsTitle => 'Agent 预设';

  @override
  String get engineDefaultModelTitle => '默认模型';

  @override
  String get engineWebAppearanceTitle => '网页版外观';

  @override
  String get engineLanguageTitle => '语言';

  @override
  String get engineFieldCommandTimeout => '命令超时';

  @override
  String get engineFieldMaxOutput => '输出上限';

  @override
  String get engineFieldMaxTimeout => '最长可申请超时';

  @override
  String get engineFieldMaxSpill => '转存文件上限';

  @override
  String get engineFieldGracePeriod => '终止宽限时间';

  @override
  String get engineFieldDefaultCwd => '默认工作目录';

  @override
  String get engineFieldFollowChat => '跟随对话';

  @override
  String get engineSubagentMaxDepth => '最大递归深度';

  @override
  String get engineFieldLayersUnit => '层';

  @override
  String get engineSubagentMaxActive => '同时运行上限';

  @override
  String get engineFieldCountUnit => '个';

  @override
  String get engineSubagentAllowModelChoice => '允许 AI 给子代理选模型';

  @override
  String get engineSubagentAllowedModels => '可选模型';

  @override
  String get engineAgentMaxParallelCalls => '每步并行工具调用上限';

  @override
  String get engineFieldSearchProvider => '搜索服务';

  @override
  String get engineFieldFetchProvider => '网页抓取服务';

  @override
  String get engineFieldBaseUrl => '服务地址';

  @override
  String get engineSearchMaxUses => '每次请求最多搜索';

  @override
  String get engineFieldTimesUnit => '次';

  @override
  String get engineSearchHelperModel => '辅助模型';

  @override
  String get engineFieldApiVersion => 'API 版本';

  @override
  String get engineFieldMaxTokens => '最大输出长度';

  @override
  String get engineSearchResultsPerSearch => '每次搜索结果数';

  @override
  String get engineFieldResultsUnit => '条';

  @override
  String get engineSearchSendOriginalQuestion => '搜索时附带用户原问题';

  @override
  String get engineChatLogUpload => '向 DeepSeek 上传对话日志';

  @override
  String get engineTranslationProvider => '翻译服务';

  @override
  String get engineTranslationAccountPaid => 'DeepSeek 账号（付费）';

  @override
  String get engineTranslationApiPaid => 'DeepSeek API（付费）';

  @override
  String get engineTranslationTargetLanguage => '目标语言';

  @override
  String get engineTranslationFollowLanguage => '跟随界面语言';

  @override
  String get engineTranslationLanguageHint => '填 auto 或语言代码，如 zh、en、ja';

  @override
  String get enginePluginIndexSources => '索引源';

  @override
  String get enginePluginIndexUrl => '索引地址';

  @override
  String get engineFieldHttpUrlHint => '以 http:// 或 https:// 开头的地址';

  @override
  String get enginePermissionNewChat => '新对话默认权限';

  @override
  String get engineAgentDefaultPreset => '默认 Agent 预设';

  @override
  String get engineProviderTitle => '渠道';

  @override
  String get engineModelTitle => '模型';

  @override
  String get engineFieldReasoningEffort => '思考深度';

  @override
  String get engineGeneralShowCodingView => '显示代码工作视图';

  @override
  String get engineGeneralWorkDetails => '工作步骤展示';

  @override
  String get engineFieldCompact => '简洁';

  @override
  String get engineFieldStandard => '标准';

  @override
  String get engineFieldDetailed => '详细';

  @override
  String get engineFieldVerbose => '完全展开';

  @override
  String get engineGeneralCollapseTiming => '工作步骤收起时机';

  @override
  String get engineGeneralOnCompletion => '回答结束后';

  @override
  String get engineGeneralOnNewMessage => '有新消息时';

  @override
  String get engineGeneralPerformanceUsage => '性能与用量';

  @override
  String get engineGeneralLinkOpening => '链接打开方式';

  @override
  String get engineGeneralAppSidebar => '应用内侧栏';

  @override
  String get engineGeneralDefaultBrowser => '默认浏览器';

  @override
  String get engineGeneralBusySend => 'AI 工作时发送';

  @override
  String get engineGeneralQueueSend => '排队发送';

  @override
  String get engineGeneralSteerSend => '插话发送';

  @override
  String get engineFieldTheme => '主题';

  @override
  String get engineFieldFontSize => '字号';

  @override
  String get engineFieldCodeFontSize => '代码字号';

  @override
  String get engineFieldTerminalFontSize => '终端字号';

  @override
  String get engineFieldTextFont => '正文字体';

  @override
  String get engineFieldCodeFont => '代码字体';

  @override
  String get engineFieldTerminalFont => '终端字体';

  @override
  String get engineFieldInterfaceLanguage => '界面语言';

  @override
  String get engineFieldSecondsUnit => '秒';

  @override
  String get engineFieldBytesUnit => '字节';

  @override
  String get engineFieldGreaterThanZero => '大于 0';

  @override
  String get engineFieldEnterNumeric => '请填数字';

  @override
  String get engineFieldEnterInteger => '请填整数';

  @override
  String get engineFieldInvalidFormat => '格式不对';

  @override
  String get engineFieldAddress => '地址';

  @override
  String get engineFieldToken => '令牌';

  @override
  String get engineFieldService => '服务';

  @override
  String get engineFieldTimeout => '超时';

  @override
  String get engineFieldQuantity => '数量';

  @override
  String get engineFieldMaxUses => '最多次数';

  @override
  String get engineFieldMaxRetries => '最多重试次数';

  @override
  String get engineFieldConcurrency => '并发数';

  @override
  String get engineFieldInterval => '间隔';

  @override
  String get engineFieldPrompt => '提示词';

  @override
  String get engineFieldSystemPrompt => '系统提示词';

  @override
  String get engineFieldTemperature => '温度';

  @override
  String get engineFieldDebugMode => '调试模式';

  @override
  String get engineFieldVerboseLogs => '详细日志';

  @override
  String get engineFieldPath => '路径';

  @override
  String get engineFieldCwd => '工作目录';

  @override
  String get engineFieldCommand => '命令';

  @override
  String get engineFieldArguments => '参数';

  @override
  String get engineFieldEnvironment => '环境变量';

  @override
  String get engineFieldHeaders => '请求头';

  @override
  String get engineFieldProxy => '代理';

  @override
  String get engineFieldAuto => '自动';

  @override
  String get engineFieldEnabled => '开启';

  @override
  String get engineFieldOn => '开';

  @override
  String get engineFieldOff => '关';

  @override
  String get engineFieldLow => '低';

  @override
  String get engineFieldMedium => '中';

  @override
  String get engineFieldHigh => '高';

  @override
  String get engineFieldMax => '最高';

  @override
  String get engineFieldNone => '无';

  @override
  String get engineFieldModified => '已修改';

  @override
  String get engineFieldLocked => '由配置文件固定';

  @override
  String get engineFieldSharedWithModel => '与模型共用';

  @override
  String get engineFieldNotConfigured => '未配置';

  @override
  String get engineFieldConfigured => '已配置';

  @override
  String get engineSettingsMissing => '这台主机没有这项设置';

  @override
  String get engineSettingsPluginDisabled => '相关插件未启用';

  @override
  String get engineSettingsReadOnly => '引擎设置是只读的，这里只能查看';

  @override
  String get engineSubagentSavedUnavailable => '已保存但当前不可用';

  @override
  String get engineSubagentKeepOneModel => '至少保留一个模型';

  @override
  String get engineSubagentLimits => '运行限制';

  @override
  String get engineSubagentModelSelection => '模型选择';

  @override
  String get engineSubagentPickFirstModel => '选一个模型后生效';

  @override
  String get engineSubagentReadModelsFailed => '没能读取模型';

  @override
  String get engineSubagentNoModels => '还没有可选的模型';

  @override
  String get engineSubagentConnectModel => '接入模型';

  @override
  String get engineSearchDeepSeek => 'DeepSeek 搜索';

  @override
  String get engineSearchNewApi => '新版搜索 API';

  @override
  String get engineProviderDeleteBody => '渠道和它的 API Key 会一起删除，用它的对话需要换个模型。';

  @override
  String get engineProviderReadFailed => '没能读取渠道';

  @override
  String get engineProviderGone => '这个渠道已不在';

  @override
  String get engineProviderProtocol => '协议';

  @override
  String get engineProviderEnterKey => '填写 API Key';

  @override
  String get engineProviderIssues => '问题';

  @override
  String get engineProviderRejectedConfig => '引擎拒绝了部分配置';

  @override
  String get engineProviderConnection => '连接';

  @override
  String get engineProviderDefaultUrl => '默认地址';

  @override
  String get engineProviderKeyNotRequired => '不需要';

  @override
  String get engineProviderNoModels => '还没有模型';

  @override
  String get engineProviderWebConfigured => '这个渠道在网页版里配置，这里只能查看和删除';

  @override
  String get engineProviderDelete => '删除渠道';

  @override
  String get engineProviderConfigFile => '由引擎配置文件提供，无法在这里删除';

  @override
  String get engineProviderTesting => '正在测试';

  @override
  String get engineProviderTestConnection => '测试连接';

  @override
  String get engineProviderKeyFirst => '先填写 API Key';

  @override
  String get engineProviderNoDiscoveredModels => '服务没有列出模型，请手动添加';

  @override
  String get engineProviderNeedModel => '至少添加一个模型';

  @override
  String get engineProviderEdit => '编辑渠道';

  @override
  String get engineProviderAdd => '添加渠道';

  @override
  String get engineProviderBasicInfo => '基本信息';

  @override
  String get engineProviderNameHint => '比如：我的网关';

  @override
  String get engineProviderCompatibleProtocol => '兼容协议';

  @override
  String get engineProviderKeepStoredKey => '已保存，留空则不修改';

  @override
  String get engineProviderSaving => '正在保存';

  @override
  String get engineProviderWaitingEngine => '等待引擎连接';

  @override
  String get engineProviderFetchingModels => '正在获取模型';

  @override
  String get engineProviderFetchModels => '获取模型';

  @override
  String get engineProviderAddManually => '手动添加';

  @override
  String get engineProviderManualModel => '手动添加模型';

  @override
  String get engineProviderModelId => '模型 ID';

  @override
  String get engineProviderSelectModels => '选择模型';

  @override
  String get engineProviderSearchModels => '搜索模型';

  @override
  String get engineProviderDeselectAll => '全不选';

  @override
  String get engineProviderSelectAll => '全选';

  @override
  String get engineProviderNoMatchingModels => '没有匹配的模型';

  @override
  String get engineProviderAlreadyAdded => '已添加';

  @override
  String get engineProviderReady => '可用';

  @override
  String get engineProviderMissingKey => '缺少 API Key';

  @override
  String get engineProviderMisconfigured => '配置有误';

  @override
  String get engineProviderInactive => '未启用';

  @override
  String get engineProviderConfiguredInWeb => '网页版配置';

  @override
  String get engineProvidersTitle => '模型';

  @override
  String get engineProvidersNotConnected => '没有连上引擎';

  @override
  String get engineProvidersStartEngine => '引擎运行后可添加渠道';

  @override
  String get engineProvidersUnsupported => '这台主机不支持自定义渠道';

  @override
  String get engineProvidersNotConfiguredHere => '未在这台主机上配置';

  @override
  String get engineProvidersSigningIn => '正在登录…';

  @override
  String get engineProvidersSignInOrKey => '登录账号或填写 API Key';

  @override
  String get engineProvidersOfficial => '官方';

  @override
  String get engineProvidersSubscription => '订阅';

  @override
  String get engineProvidersCustom => '自定义';

  @override
  String get engineProvidersCompatibleHint => 'OpenAI、Anthropic 兼容的服务';

  @override
  String get engineProvidersReadOnly => '引擎设置是只读的，无法添加';

  @override
  String get engineSubscriptionSignOutBody => '它的模型会从模型选择里移除。';

  @override
  String get engineSubscriptionNoModels => '暂无模型';

  @override
  String get engineSubscriptionModelsFailed => '没能读取模型';

  @override
  String get engineSubscriptionPreparing => '正在准备…';

  @override
  String get engineSubscriptionCancelled => '登录已取消';

  @override
  String get engineSubscriptionIncomplete => '登录没有完成';

  @override
  String get engineSubscriptionWaitingSignIn => '等待登录…';

  @override
  String get engineSubscriptionReopen => '重新打开';

  @override
  String get engineSubscriptionCode => '验证码';

  @override
  String get engineSubscriptionWaitingVerification => '等待验证…';

  @override
  String get engineSubscriptionCopyCode => '复制验证码';

  @override
  String get engineSubscriptionOpenVerification => '打开验证页';

  @override
  String get engineSubscriptionPasteRedirect => '粘贴跳转后的链接';

  @override
  String get engineSubscriptionPasteCode => '粘贴授权码';

  @override
  String get engineSubscriptionPasteHere => '粘贴到这里';

  @override
  String get engineSubscriptionConfirm => '确定';

  @override
  String get engineSubscriptionTryAgain => '再试一次';

  @override
  String engineAccountWelcome(String name) {
    return '欢迎，$name';
  }

  @override
  String engineLayerCount(int count) {
    return '$count 层';
  }

  @override
  String engineFieldDefaultValue(String value) {
    return '默认 $value';
  }

  @override
  String engineFieldDefaultValueUnit(String value, String unit) {
    return '默认 $value $unit';
  }

  @override
  String engineFieldCurrentValue(String value) {
    return '当前 $value';
  }

  @override
  String engineFieldRemoveItem(String name) {
    return '移除 $name';
  }

  @override
  String engineFieldAddItem(String item) {
    return '添加$item';
  }

  @override
  String engineFieldItemIndex(int index) {
    return '第 $index 项';
  }

  @override
  String engineFieldByteCount(int count) {
    return '$count 字节';
  }

  @override
  String engineFieldHours(String value) {
    return '$value 小时';
  }

  @override
  String engineFieldMinutes(String value) {
    return '$value 分钟';
  }

  @override
  String engineFieldSeconds(String value) {
    return '$value 秒';
  }

  @override
  String engineFieldMilliseconds(String value) {
    return '$value 毫秒';
  }

  @override
  String engineFieldPositiveMax(String max) {
    return '大于 0，不超过 $max';
  }

  @override
  String engineFieldMin(String min) {
    return '不小于 $min';
  }

  @override
  String engineFieldMaxBound(String max) {
    return '不超过 $max';
  }

  @override
  String engineFieldBelowMin(String min) {
    return '不能小于 $min';
  }

  @override
  String engineFieldAboveMax(String max) {
    return '不能大于 $max';
  }

  @override
  String engineFieldMultiple(String step) {
    return '需是 $step 的倍数';
  }

  @override
  String engineFieldMinCharacters(int count) {
    return '至少 $count 个字符';
  }

  @override
  String engineFieldMaxCharacters(int count) {
    return '最多 $count 个字符';
  }

  @override
  String engineSubagentUnavailableProvider(String provider) {
    return '$provider · 当前不可用';
  }

  @override
  String engineProviderDeleteTitle(String name) {
    return '删除「$name」？';
  }

  @override
  String engineProviderDeleteFailed(String error) {
    return '没能删除：$error';
  }

  @override
  String engineProviderModelCount(int count) {
    return '模型 · $count';
  }

  @override
  String engineProviderContext(String size) {
    return '上下文 $size';
  }

  @override
  String engineProviderTestPassed(int count) {
    return '连接正常 · 列出 $count 个模型';
  }

  @override
  String engineProviderCompletedUrl(String url) {
    return '已补全为 $url';
  }

  @override
  String engineProviderSaveFailed(String error) {
    return '没能保存：$error';
  }

  @override
  String engineProviderCandidateCount(int count) {
    return '共 $count 个';
  }

  @override
  String engineProviderAddModels(int count) {
    return '添加 $count 个模型';
  }

  @override
  String engineProviderModels(int count) {
    return '$count 个模型';
  }

  @override
  String engineProvidersSummary(int total, int ready) {
    return '$total 个渠道 · $ready 个可用';
  }

  @override
  String engineProvidersAccount(String name) {
    return '账号 · $name';
  }

  @override
  String engineProvidersSignedInAccount(String account) {
    return '已登录 · $account';
  }

  @override
  String engineSubscriptionSignIn(String provider) {
    return '登录 $provider';
  }

  @override
  String engineSubscriptionSignOutTitle(String provider) {
    return '退出 $provider？';
  }

  @override
  String engineSubscriptionSignOutFailed(String error) {
    return '没能退出：$error';
  }

  @override
  String engineSubscriptionCodeSemantics(String code) {
    return '验证码 $code';
  }

  @override
  String engineFieldItemCount(int count) {
    return '$count 个';
  }

  @override
  String engineFieldUseCount(int count) {
    return '$count 次';
  }

  @override
  String engineFieldResultCount(int count) {
    return '$count 条';
  }

  @override
  String engineFieldMinCharactersDecimal(String bound) {
    return '至少 $bound 个字符';
  }

  @override
  String engineFieldMaxCharactersDecimal(String bound) {
    return '最多 $bound 个字符';
  }

  @override
  String engineLayerValue(String value) {
    return '$value 层';
  }

  @override
  String engineFieldEnterPositiveRange(String max) {
    return '请填 大于 0，不超过 $max 之间的数';
  }

  @override
  String engineFieldEnterBoundedRange(String min, String max) {
    return '请填 $min–$max 之间的数';
  }

  @override
  String get engineModelTokenLimits => 'Token 上限';

  @override
  String get engineModelContextLength => '上下文长度';

  @override
  String get engineModelMaxOutput => '最大输出';

  @override
  String engineModelDefaultSize(String size) {
    return '默认 $size';
  }

  @override
  String get engineModelCapabilities => '能力';

  @override
  String get engineModelInputType => '输入类型';

  @override
  String get engineModelInputText => '文本';

  @override
  String get engineModelInputTextImage => '文本和图片';

  @override
  String get engineModelThinking => '思考';

  @override
  String get engineModelVision => '识图';

  @override
  String get engineModelLevels => '可选档位';

  @override
  String get engineModelNeedLevel => '至少选一个档位';

  @override
  String get engineFieldEditOnWeb => '在网页版编辑此项';

  @override
  String get engineSettingsHostChanged => '主机已切换，请重新打开设置后编辑。';

  @override
  String get engineSecretTargetChanged => '此项已变化，请重新打开后编辑。';

  @override
  String engineSettingsGroupCount(int count) {
    return '$count 项';
  }

  @override
  String get featuresCordisSubtitle => '动态插件 · 引擎重启后清空';

  @override
  String get featuresCordisUnavailable => '这个连接看不到 Cordis';

  @override
  String get featuresCordisRemoteUnavailable => '经 DSH Remote 中转时不可用';

  @override
  String get featuresCordisReadFailed => '没能读取插件';

  @override
  String get featuresCordisEmpty => '还没有动态插件';

  @override
  String get featuresCordisEmptyHint => '插件创建后会出现在这里';

  @override
  String get featuresCurrentChat => '当前对话';

  @override
  String get featuresOtherChats => '其他对话';

  @override
  String featuresPresetDefaultSet(String name) {
    return '新对话将使用「$name」';
  }

  @override
  String get featuresPresetDefaultFailed => '没能设为默认';

  @override
  String featuresPresetDeleteTitle(String name) {
    return '删除「$name」？';
  }

  @override
  String get featuresPresetDeleteHint => '新对话不能再选它，已开始的对话不受影响。';

  @override
  String get featuresDeleted => '已删除';

  @override
  String get featuresDeleteFailed => '没能删除';

  @override
  String get featuresPresetAlreadyDefault => '已是新对话默认';

  @override
  String get featuresPresetSetDefault => '设为新对话默认';

  @override
  String get featuresPresetViewConfig => '查看配置';

  @override
  String get featuresPresetDuplicate => '复制为新预设';

  @override
  String get featuresPresetDefaultDeleteHint => '先把别的预设设为新对话默认';

  @override
  String get featuresAgentPresets => 'Agent 预设';

  @override
  String get featuresAgentPresetsSubtitle => '新对话的工具与工作方式';

  @override
  String get featuresNew => '新建';

  @override
  String get featuresPresetsReadFailed => '没能读取 Agent 预设';

  @override
  String get featuresLoadFailed => '加载失败';

  @override
  String get featuresNewChatDefault => '新对话默认';

  @override
  String get featuresEmptyDocument => '（空）';

  @override
  String get featuresReadFailed => '没能读取';

  @override
  String featuresTodayTime(String time) {
    return '今天 $time';
  }

  @override
  String featuresTomorrowTime(String time) {
    return '明天 $time';
  }

  @override
  String featuresYesterdayTime(String time) {
    return '昨天 $time';
  }

  @override
  String featuresScheduleSummaryNext(String rule, String time) {
    return '$rule · 下次 $time';
  }

  @override
  String get featuresEnded => '已结束';

  @override
  String featuresScheduleSummaryEnded(String time) {
    return '已结束 · $time 运行过';
  }

  @override
  String featuresJobElapsed(String span) {
    return '已运行 $span';
  }

  @override
  String featuresJobDuration(String span) {
    return '用时 $span';
  }

  @override
  String get featuresPermissionReadOnly => '仅可查看';

  @override
  String get featuresPermissionWorkspaceWrite => '工作区内修改';

  @override
  String get featuresPermissionFullAccess => '完全权限';

  @override
  String get featuresPermissionAutoReview => '自动审查';

  @override
  String get featuresPermissionCustom => '自定义';

  @override
  String get featuresPermissionReadOnlyHint => '只看文件，不做修改';

  @override
  String get featuresPermissionWorkspaceWriteHint => '可改工作区内的文件，越界先问你';

  @override
  String get featuresPermissionFullAccessHint => '不再确认，直接执行';

  @override
  String get featuresPermissionAutoReviewHint => '由模型逐次审查，拿不准再问你';

  @override
  String get featuresPresetStandard => '标准模式';

  @override
  String get featuresPresetPtc => 'PTC 模式';

  @override
  String get featuresPresetMinimal => '极简模式';

  @override
  String get featuresPresetCreator => '创造模式';

  @override
  String get featuresPresetStandardDescription => '代码、文件和资料，适合大多数任务';

  @override
  String get featuresPresetPtcDescription => '批量调用工具，再筛选、统计、汇总';

  @override
  String get featuresPresetMinimalDescription => '只用终端和读图，适合测试对比';

  @override
  String get featuresPresetCreatorDescription => '让 Agent 写插件，定制 DSH 本身';

  @override
  String featuresHostUnreachable(String name) {
    return '连不上「$name」';
  }

  @override
  String featuresHostConnecting(String name) {
    return '正在连接「$name」…';
  }

  @override
  String get featuresJobs => '后台任务';

  @override
  String get featuresJobsSubtitle => '引擎重启后清空';

  @override
  String get featuresJobsReadFailed => '没能读取后台任务';

  @override
  String get featuresJobsEmpty => '没有后台任务';

  @override
  String get featuresJobsEmptyHint => '开发服务器这类命令会在这里';

  @override
  String featuresJobsEndedCount(int count) {
    return '已结束 · $count';
  }

  @override
  String get featuresJobStopTitle => '停止这个任务？';

  @override
  String get featuresJobAlreadyEnded => '任务已经结束了';

  @override
  String get featuresJobStopFailed => '没能停止';

  @override
  String get featuresJobOutput => '任务输出';

  @override
  String get featuresOutput => '输出';

  @override
  String featuresJobRecentLines(int count) {
    return '最近 $count 行';
  }

  @override
  String get featuresJobOutputSubject => 'DSH 任务输出';

  @override
  String get featuresJobOutputReadFailed => '没能读取输出';

  @override
  String get featuresJobOutputWaiting => '等待输出…';

  @override
  String get featuresJobOutputEmpty => '没有输出';

  @override
  String get featuresPermissionAutoTitle => '开启自动审查？';

  @override
  String get featuresPermissionAutoWarning => '每次操作由模型判断放不放行，可能误判。';

  @override
  String get featuresSwitchFailed => '没能切换';

  @override
  String get featuresPermissions => '权限';

  @override
  String get featuresPermissionsSubtitle => '执行命令、修改文件前，要不要先问你';

  @override
  String get featuresPermissionsReadFailed => '没能读取权限设置';

  @override
  String get featuresPermissionCustomHint => '当前用的是自定义权限，选预设会替换它';

  @override
  String get featuresModuleInstructions => '工作区指令加载';

  @override
  String get featuresModuleTime => '时间感知';

  @override
  String get featuresModuleBash => 'Bash 命令工具';

  @override
  String get featuresModulePersistentBash => '持久 Bash 工具';

  @override
  String get featuresModulePowerShell => 'PowerShell 命令工具';

  @override
  String get featuresModuleFiles => '文件读写工具';

  @override
  String get featuresModuleFileSearch => '文件搜索工具';

  @override
  String get featuresModuleJobs => '后台任务工具';

  @override
  String get featuresModuleSchedule => '自动化任务工具';

  @override
  String get featuresModuleLocalSkills => '本地技能加载';

  @override
  String get featuresModuleSkillTool => '技能加载工具';

  @override
  String get featuresModuleGoalCommand => '目标管理命令';

  @override
  String get featuresModuleGoalTool => '目标管理工具';

  @override
  String get featuresModulePlan => '计划模式';

  @override
  String get featuresModuleCompaction => '上下文压缩';

  @override
  String get featuresModuleCompactCommand => '上下文压缩命令';

  @override
  String get featuresModuleAskUser => '向用户提问工具';

  @override
  String get featuresModuleTodo => '待办清单工具';

  @override
  String get featuresModuleWeb => '网页搜索与读取工具';

  @override
  String get featuresModulePresent => '文件交付工具';

  @override
  String get featuresModuleCordis => '插件 API 查询工具';

  @override
  String get featuresModuleSubagent => '子代理委派工具';

  @override
  String get featuresModuleSubagentControl => '子代理控制工具';

  @override
  String get featuresModuleWorkflow => '工作流工具';

  @override
  String get featuresModulePluginManager => '插件管理工具';

  @override
  String get featuresModulePluginMarket => '插件市场工具';

  @override
  String get featuresModuleToolCalls => '工具调用方式';

  @override
  String get featuresModuleTerminal => '持久终端服务';

  @override
  String get featuresModulePersona => '智能体角色设定';

  @override
  String get featuresGroupDelegation => '子代理委派';

  @override
  String get featuresGroupTerminal => '持久终端';

  @override
  String get featuresPresetIdRequired => '填写标识';

  @override
  String get featuresPresetIdLength => '最多 40 个字符';

  @override
  String get featuresPresetIdFormat => '只用小写字母、数字和连字符';

  @override
  String get featuresPresetIdTaken => '这个标识已被使用';

  @override
  String featuresPresetCopyName(String name) {
    return '$name 副本';
  }

  @override
  String get featuresPresetBasedOn => '基于';

  @override
  String get featuresNameRequired => '填写名称';

  @override
  String get featuresCreatorOpenFailed => '没能打开创造模式';

  @override
  String get featuresPresetNameHint => '比如：代码审查';

  @override
  String get featuresPresetId => '标识';

  @override
  String get featuresPresetIdHint => '小写字母、数字和连字符';

  @override
  String get featuresPresetDescription => '说明';

  @override
  String get featuresPresetDescriptionHint => '一句话说明它适合做什么';

  @override
  String get featuresPresetConfigReadFailed => '没能读取预设配置';

  @override
  String get featuresPresetCreateTitle => '新建 Agent 预设';

  @override
  String get featuresPresetDuplicateTitle => '复制 Agent 预设';

  @override
  String get featuresPresetEditTitle => '编辑 Agent 预设';

  @override
  String get featuresCreatorOpening => '正在打开创造模式';

  @override
  String get featuresWaitingEngine => '等待引擎连接';

  @override
  String get featuresCreatorUnavailable => '创造模式不可用';

  @override
  String get featuresPresetStartUpdate => '开始更新';

  @override
  String get featuresPresetStartCreate => '开始创建';

  @override
  String get featuresPresetSystemPrompt => '系统提示';

  @override
  String get featuresPresetSystemPromptHint => '你是谁、怎么工作';

  @override
  String get featuresPresetReplaceSystemPrompt => '完整替换系统提示';

  @override
  String get featuresPresetTools => '工具';

  @override
  String get featuresSkills => '技能';

  @override
  String get featuresPresetContextModes => '上下文与模式';

  @override
  String get featuresCronMinute => '分钟';

  @override
  String get featuresCronHour => '小时';

  @override
  String get featuresDate => '日期';

  @override
  String get featuresCronMonth => '月份';

  @override
  String get featuresCronWeekday => '星期';

  @override
  String get featuresCronRequired => '填写 5 段 Cron 表达式';

  @override
  String get featuresCronWhitespace => '首尾不能有空格';

  @override
  String featuresCronFieldCount(int count) {
    return '需要 5 段，现在是 $count 段';
  }

  @override
  String featuresCronInvalidField(int index, String name) {
    return '第 $index 段（$name）写法不对';
  }

  @override
  String get featuresWeekdayMon => '一';

  @override
  String get featuresWeekdayTue => '二';

  @override
  String get featuresWeekdayWed => '三';

  @override
  String get featuresWeekdayThu => '四';

  @override
  String get featuresWeekdayFri => '五';

  @override
  String get featuresWeekdaySat => '六';

  @override
  String get featuresWeekdaySun => '日';

  @override
  String get featuresMonthJan => '一月';

  @override
  String get featuresMonthFeb => '二月';

  @override
  String get featuresMonthMar => '三月';

  @override
  String get featuresMonthApr => '四月';

  @override
  String get featuresMonthMay => '五月';

  @override
  String get featuresMonthJun => '六月';

  @override
  String get featuresMonthJul => '七月';

  @override
  String get featuresMonthAug => '八月';

  @override
  String get featuresMonthSep => '九月';

  @override
  String get featuresMonthOct => '十月';

  @override
  String get featuresMonthNov => '十一月';

  @override
  String get featuresMonthDec => '十二月';

  @override
  String featuresWeekdayName(String day) {
    return '周$day';
  }

  @override
  String featuresCronWeekdayRange(String first, String last) {
    return '$first至$last';
  }

  @override
  String featuresCronEveryDay(String months) {
    return '每天$months';
  }

  @override
  String featuresCronMonthDays(String days, String months) {
    return '每月 $days 日$months';
  }

  @override
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months) {
    return '每月 $days 日且$weekdays$months';
  }

  @override
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months) {
    return '每月 $days 日或$weekdays$months';
  }

  @override
  String featuresCronHourRange(String first, String last) {
    return '$first 至 $last';
  }

  @override
  String get featuresEveryMinute => '每分钟';

  @override
  String featuresCronEveryMinutes(int count) {
    return '每 $count 分钟';
  }

  @override
  String get featuresEveryHour => '每小时';

  @override
  String featuresCronHourlyMinutes(String minutes) {
    return '每小时的第 $minutes 分钟';
  }

  @override
  String featuresCronHoursEveryMinute(String hours) {
    return '$hours 点的每分钟';
  }

  @override
  String featuresCronHoursEveryMinutes(String hours, int count) {
    return '$hours 点内每 $count 分钟';
  }

  @override
  String featuresCronEveryHours(int count) {
    return '每 $count 小时';
  }

  @override
  String featuresCronHoursMinutes(String hours, String minutes) {
    return '$hours 点的第 $minutes 分钟';
  }

  @override
  String get featuresRepeatDaily => '每天';

  @override
  String get featuresRepeatWeekdays => '工作日';

  @override
  String get featuresRepeatWeekly => '每周';

  @override
  String get featuresRepeatMonthly => '每月';

  @override
  String get featuresRepeatInterval => '间隔';

  @override
  String get featuresRepeatOnce => '仅一次';

  @override
  String get featuresRepeatAdvanced => '高级';

  @override
  String get featuresIntervalSeconds => '秒';

  @override
  String get featuresZoneUnavailable => '时区不可用';

  @override
  String get featuresChooseDay => '至少选一天';

  @override
  String get featuresIntervalMinimum => '间隔至少为 1';

  @override
  String get featuresMinimumMinute => '至少 1 分钟';

  @override
  String get featuresTimeDoesNotExist => '这个时间在该时区不存在';

  @override
  String get featuresChooseFutureTime => '选一个以后的时间';

  @override
  String get featuresCronNeverRuns => '这个表达式不会运行';

  @override
  String featuresRuleDaily(String time) {
    return '每天 $time';
  }

  @override
  String featuresRuleWeekdays(String time) {
    return '每个工作日 $time';
  }

  @override
  String featuresRuleWeekends(String time) {
    return '每个周末 $time';
  }

  @override
  String featuresRuleWeekly(String days, String time) {
    return '每周$days $time';
  }

  @override
  String featuresRuleMonthly(String days, String time) {
    return '每月 $days 日 $time';
  }

  @override
  String get featuresRepeat => '重复';

  @override
  String get featuresChat => '对话';

  @override
  String get featuresWorkspace => '工作区';

  @override
  String get featuresInstructionRequired => '填写指令';

  @override
  String featuresScheduleSaveError(String reason) {
    return '没能保存：$reason';
  }

  @override
  String featuresScheduleCreateError(String reason) {
    return '没能创建：$reason';
  }

  @override
  String get featuresScheduleNameHint => '比如：每日站会提醒';

  @override
  String get featuresScheduleInstruction => '指令';

  @override
  String get featuresScheduleInstructionHint => '比如：整理昨天的提交，发我摘要';

  @override
  String get featuresScheduleRunTime => '运行时间';

  @override
  String get featuresScheduleOpenChat => '去对话里看看';

  @override
  String get featuresScheduleEditTitle => '编辑自动化任务';

  @override
  String get featuresScheduleCreateTitle => '新建自动化任务';

  @override
  String get featuresScheduleSaving => '正在保存';

  @override
  String get featuresScheduleCreating => '正在对话里创建';

  @override
  String get featuresTime => '时间';

  @override
  String get featuresNotSelected => '未选';

  @override
  String featuresMonthDaysLabel(String days) {
    return '$days 日';
  }

  @override
  String get featuresTimeZone => '时区';

  @override
  String get featuresScheduleRunLocation => '在哪里运行';

  @override
  String get featuresJustCreatedChat => '刚建的对话';

  @override
  String get featuresModel => '模型';

  @override
  String get featuresRequestRefused => '引擎没有接受这个请求';

  @override
  String get featuresScheduleNotFound => '这个任务已经不在了';

  @override
  String get featuresScheduleEndedError => '任务已结束，不能再改';

  @override
  String get featuresScheduleConflict => '任务刚被改过，返回后再试';

  @override
  String get featuresScheduleInvalidPrompt => '名称和指令不能为空，名称最多 120 字';

  @override
  String get featuresScheduleInvalidTime => '运行时间不对';

  @override
  String get featuresScheduleIntervalTooShort => '间隔至少 1 分钟';

  @override
  String get featuresScheduleTimeOutOfRange => '时间超出范围';

  @override
  String get featuresScheduleSubagentError => '这个对话收不到自动化任务';

  @override
  String get featuresEvery => '每';

  @override
  String get featuresCronExpression => 'Cron 表达式';

  @override
  String get featuresCronFieldGuide => '分  时  日  月  周';

  @override
  String featuresZoneTimeSuffix(String city) {
    return '（$city时间）';
  }

  @override
  String get featuresScheduleNextLocal => '接下来（本机时间）';

  @override
  String get featuresScheduleNext => '接下来';

  @override
  String featuresMonthDayChoice(int day) {
    return '$day 日';
  }

  @override
  String get featuresZonesCommon => '常用';

  @override
  String get featuresZonesAll => '全部';

  @override
  String get featuresZoneSearchHint => '搜索城市、时区或 UTC 偏移';

  @override
  String get featuresZonesNoMatch => '没有匹配的时区';

  @override
  String get featuresZoneUTC => '协调世界时';

  @override
  String get featuresZoneShanghai => '上海';

  @override
  String get featuresZoneUrumqi => '乌鲁木齐';

  @override
  String get featuresZoneHongKong => '香港';

  @override
  String get featuresZoneMacau => '澳门';

  @override
  String get featuresZoneTaipei => '台北';

  @override
  String get featuresZoneTokyo => '东京';

  @override
  String get featuresZoneSeoul => '首尔';

  @override
  String get featuresZoneSingapore => '新加坡';

  @override
  String get featuresZoneKualaLumpur => '吉隆坡';

  @override
  String get featuresZoneBangkok => '曼谷';

  @override
  String get featuresZoneHoChiMinh => '胡志明市';

  @override
  String get featuresZoneJakarta => '雅加达';

  @override
  String get featuresZoneManila => '马尼拉';

  @override
  String get featuresZoneKolkata => '加尔各答';

  @override
  String get featuresZoneDubai => '迪拜';

  @override
  String get featuresZoneJerusalem => '耶路撒冷';

  @override
  String get featuresZoneLondon => '伦敦';

  @override
  String get featuresZoneDublin => '都柏林';

  @override
  String get featuresZoneLisbon => '里斯本';

  @override
  String get featuresZoneParis => '巴黎';

  @override
  String get featuresZoneBerlin => '柏林';

  @override
  String get featuresZoneMadrid => '马德里';

  @override
  String get featuresZoneRome => '罗马';

  @override
  String get featuresZoneAmsterdam => '阿姆斯特丹';

  @override
  String get featuresZoneZurich => '苏黎世';

  @override
  String get featuresZoneStockholm => '斯德哥尔摩';

  @override
  String get featuresZoneWarsaw => '华沙';

  @override
  String get featuresZoneAthens => '雅典';

  @override
  String get featuresZoneIstanbul => '伊斯坦布尔';

  @override
  String get featuresZoneMoscow => '莫斯科';

  @override
  String get featuresZoneCairo => '开罗';

  @override
  String get featuresZoneJohannesburg => '约翰内斯堡';

  @override
  String get featuresZoneLagos => '拉各斯';

  @override
  String get featuresZoneNewYork => '纽约';

  @override
  String get featuresZoneToronto => '多伦多';

  @override
  String get featuresZoneChicago => '芝加哥';

  @override
  String get featuresZoneDenver => '丹佛';

  @override
  String get featuresZonePhoenix => '凤凰城';

  @override
  String get featuresZoneLosAngeles => '洛杉矶';

  @override
  String get featuresZoneVancouver => '温哥华';

  @override
  String get featuresZoneAnchorage => '安克雷奇';

  @override
  String get featuresZoneMexicoCity => '墨西哥城';

  @override
  String get featuresZoneBogota => '波哥大';

  @override
  String get featuresZoneLima => '利马';

  @override
  String get featuresZoneSantiago => '圣地亚哥';

  @override
  String get featuresZoneSaoPaulo => '圣保罗';

  @override
  String get featuresZoneBuenosAires => '布宜诺斯艾利斯';

  @override
  String get featuresZoneHonolulu => '檀香山';

  @override
  String get featuresZoneAuckland => '奥克兰';

  @override
  String get featuresZoneSydney => '悉尼';

  @override
  String get featuresZoneMelbourne => '墨尔本';

  @override
  String get featuresZoneBrisbane => '布里斯班';

  @override
  String get featuresZonePerth => '珀斯';

  @override
  String get featuresScheduleCreated => '已创建';

  @override
  String get featuresSchedulesReadFailed => '没能读取自动化任务';

  @override
  String get featuresSchedulesEmpty => '还没有自动化任务';

  @override
  String get featuresSchedulesEmptyHint => '到点自动发进对话，替你跑一遍';

  @override
  String get featuresScheduleNewTask => '新建任务';

  @override
  String get featuresSchedulesNoMatch => '没有匹配的任务';

  @override
  String get featuresSchedulesNoActive => '没有开启中的任务';

  @override
  String get featuresSchedulesNoEnded => '没有已结束的任务';

  @override
  String get featuresSchedules => '自动化任务';

  @override
  String get featuresSchedulesSubtitle => '到点自动发进原来的对话';

  @override
  String get featuresSchedulesSearch => '搜索任务';

  @override
  String featuresSchedulesAllCount(int count) {
    return '全部 $count';
  }

  @override
  String get featuresScheduleUntitled => '未命名任务';

  @override
  String get featuresScheduleSent => '已发进对话';

  @override
  String get featuresView => '查看';

  @override
  String get featuresSendFailed => '没能发送';

  @override
  String get featuresScheduleDeleteTitle => '删除这个任务？';

  @override
  String get featuresScheduleDeleteHint => '会停止之后的运行，并删掉它的运行记录。原来的对话不受影响。';

  @override
  String get featuresScheduleDeleted => '任务已删除';

  @override
  String get featuresScheduleActive => '已开启';

  @override
  String get featuresScheduleRun => '运行';

  @override
  String get featuresScheduleNextRun => '下次';

  @override
  String get featuresScheduleLastRun => '上次';

  @override
  String get featuresScheduleRule => '规则';

  @override
  String get featuresScheduleLinkedChat => '关联对话';

  @override
  String get featuresScheduleChatDeleted => '对话已删除';

  @override
  String get featuresScheduleEdit => '编辑任务';

  @override
  String get featuresScheduleRunNow => '立即运行';

  @override
  String get featuresScheduleHistory => '运行记录';

  @override
  String get featuresScheduleNeverRun => '还没有运行过';

  @override
  String get featuresScheduleHistoryUnavailable => '记录不可用';

  @override
  String get featuresScheduleHistoryReadFailed => '没能读取运行记录';

  @override
  String get featuresScheduleDelete => '删除任务';

  @override
  String featuresExportSavedTo(String path) {
    return '已存到 $path';
  }

  @override
  String get featuresExportTitle => '导出对话日志';

  @override
  String get featuresExportSubtitle => '打包成一个 ZIP，用于反馈或备份';

  @override
  String get featuresExportUnavailable => '这个连接导不了';

  @override
  String get featuresExportRemoteHint => '经 DSH Remote 中转时拿不到日志，可以在电脑上的网页版导出';

  @override
  String get featuresExportShareHint => '附在问题反馈里，或发给自己';

  @override
  String get featuresExportSaveDownloads => '存到「下载」';

  @override
  String get featuresExportDownloadsHint => '存进 下载/DSH-Go';

  @override
  String get featuresExportContents => '含这个对话和子代理的全部记录与附件';

  @override
  String get featuresSkillUseHere => '在对话里用';

  @override
  String get featuresSkillUseNew => '新对话里用';

  @override
  String get featuresSkillsCallHint => '输入 /技能名 调用';

  @override
  String get featuresSkillsReadFailed => '没能读取技能';

  @override
  String get featuresSkillsEmpty => '这个对话还没有技能';

  @override
  String get featuresSkillsEmptyHint => '放进 .dsh/skills 的技能会出现在这里';

  @override
  String get featuresSkillsSourceHint => '来自项目和 ~/.dsh 下的 skills 目录';

  @override
  String featuresSkillUsage(String usage) {
    return '适用：$usage';
  }

  @override
  String get featuresSkillManual => '仅手动';

  @override
  String featuresArtifactsSemantic(int count) {
    return '产出的文件，共 $count 个，查看全部';
  }

  @override
  String get featuresArtifactsTitle => '产出的文件';

  @override
  String featuresArtifactsAllCount(int count) {
    return '全部 $count 个';
  }

  @override
  String featuresArtifactsCount(int count) {
    return '$count 个';
  }

  @override
  String get featuresArtifactsNoFiles => '还没有文件';

  @override
  String featuresArtifactsTotal(int count) {
    return '$count 个文件 · 交付的和生成的';
  }

  @override
  String get featuresArtifactsEmpty => '还没有产出文件';

  @override
  String get featuresArtifactsEmptyHint => 'AI 交付或生成的文件会出现在这里';

  @override
  String get featuresListSeparator => '、';

  @override
  String featuresErrorReason(String title, String reason) {
    return '$title：$reason';
  }

  @override
  String featuresYearDate(int year, String date) {
    return '$year年$date';
  }

  @override
  String featuresDateWeekdayTime(String date, String week, String time) {
    return '$date $week $time';
  }

  @override
  String featuresDateWeekday(String date, String day) {
    return '$date 周$day';
  }

  @override
  String featuresOnceDescription(String rule, String date, String time) {
    return '$rule · $date $time';
  }

  @override
  String featuresCronMonthSuffix(String months) {
    return '（$months）';
  }

  @override
  String featuresRuleIntervalSeconds(int count) {
    return '每 $count 秒';
  }

  @override
  String featuresRuleIntervalMinutes(int count) {
    return '每 $count 分钟';
  }

  @override
  String featuresRuleIntervalHours(int count) {
    return '每 $count 小时';
  }

  @override
  String featuresSchedulesActiveCount(int count) {
    return '已开启 $count';
  }

  @override
  String featuresSchedulesEndedCount(int count) {
    return '已结束 $count';
  }

  @override
  String featuresScheduleRetention(int days, int count) {
    return '只保留最近 $days 天、最多 $count 条';
  }

  @override
  String featuresScheduleRetentionUnknown(int days) {
    return '只保留最近 $days 天、最多 — 条';
  }

  @override
  String featuresArtifactsDeliveredTurn(int turn) {
    return '第 $turn 轮 · 交付';
  }

  @override
  String featuresArtifactsGeneratedTurn(int turn) {
    return '第 $turn 轮 · 生成';
  }

  @override
  String featuresPresetCreateRequest(String name, String id, String directory) {
    return '新建 Agent 预设「$name」（$id）：在工作区写下这两个文件（内容原样），再用 plugin_manager 的 install_bundle 安装 `$directory` 目录。只做这些。\n\n';
  }

  @override
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory) {
    return '更新 Agent 预设「$name」（$id）：在工作区写下这两个文件（内容原样），用 plugin_manager 先移除组合包 `$replacing`，再用 install_bundle 安装 `$directory` 目录。只做这些。\n\n';
  }

  @override
  String featuresZoneThisPhone(String city) {
    return '$city · 本机';
  }

  @override
  String get featuresPermissionResetHint => '新对话的默认权限已失效';

  @override
  String get featuresPermissionResetDefault => '恢复默认';

  @override
  String get fileImageName => '图片';

  @override
  String get fileSharedText => '分享的文字.txt';

  @override
  String get fileChatFallback => '对话';

  @override
  String get hubSessionDetails => '对话详情';

  @override
  String get hubTerminal => '终端';

  @override
  String get hubSessionNoTurns => '还没有完整的一轮';

  @override
  String get hubSessionElapsed => '用时';

  @override
  String get hubSessionSteps => '步骤';

  @override
  String get hubSessionChangedFiles => '改动文件';

  @override
  String get hubSessionTrajectoryHint => '每一轮的步骤和用时会排在这里';

  @override
  String get hubSessionLoadEarlier => '加载更早的轮次';

  @override
  String get hubSessionError => '出错';

  @override
  String get hubSessionInterrupted => '被中断';

  @override
  String get hubSessionOutputLimit => '达到输出上限';

  @override
  String get hubSessionNoChanges => '还没有改过文件';

  @override
  String get hubSessionShellChangesHint => '用 shell 命令改的文件不在这里';

  @override
  String get hubSessionChanges => '对话改动';

  @override
  String get hubSessionChangesNote => '只统计已加载的记录里，用写入和编辑工具做的改动';

  @override
  String get hubSessionNoGoal => '还没有目标或待办';

  @override
  String get hubSessionGoalHint => '复杂任务里 AI 会列出待办，进度在这里看';

  @override
  String get hubSessionGoal => '目标';

  @override
  String get hubSessionPlanMode => '计划模式';

  @override
  String get hubSessionPlanSwitching => '正在切换计划模式';

  @override
  String get hubSessionPlanHint => 'AI 先出方案，不改文件';

  @override
  String get hubSessionTodos => '待办';

  @override
  String get hubSessionNotStarted => '未开始';

  @override
  String get hubSessionTurnUsage => '每轮用量';

  @override
  String get hubSessionNoSubagents => '没有派出子代理';

  @override
  String get hubSessionDelegations => '派活记录';

  @override
  String get hubTabTrajectory => '轨迹';

  @override
  String get hubTabChanges => '改动';

  @override
  String get hubTabFiles => '文件';

  @override
  String get hubTabProgress => '进度';

  @override
  String get hubTabContext => '上下文';

  @override
  String get hubTabSubagents => '子代理';

  @override
  String get hubPlugins => '插件';

  @override
  String get hubSettingsFullAccessTitle => '开启完全权限？';

  @override
  String get hubSettingsFullAccessBody => 'AI 执行命令、改动文件前不再问你。';

  @override
  String get hubSettingsStorageTitle => '让 AI 访问手机文件？';

  @override
  String get hubSettingsStorageAllow => '允许读写';

  @override
  String get hubSettingsStorageDenied => '没有拿到存储权限。到系统设置里给 DSH Go 开启「所有文件访问」后再试';

  @override
  String get hubSettingsRestartRequired => '重启引擎后生效';

  @override
  String get hubSettingsRestartNow => '立即重启';

  @override
  String get hubSettingsInterface => '界面';

  @override
  String get hubSettingsChat => '对话';

  @override
  String get hubSettingsAutoCommands => '自动执行命令';

  @override
  String get hubSettingsPhoneFiles => '访问手机文件';

  @override
  String get hubSettingsPhoneFilesHint => 'AI 可读写手机存储';

  @override
  String get hubSettingsVisualReplies => '可视化回复';

  @override
  String get hubSettingsVisualRepliesHint => '图表、对比卡和可点的选项';

  @override
  String get hubSettingsPhoneControl => '手机操控';

  @override
  String get hubSettingsPhoneControlHint => '看屏幕、帮你点按';

  @override
  String get hubSettingsPreferences => '个人偏好';

  @override
  String get hubSettingsAppearance => '外观';

  @override
  String get hubSettingsChatTextSize => '对话字号';

  @override
  String get hubSettingsCollapseSteps => '完成后收起过程';

  @override
  String get hubSettingsCollapseStepsHint => '思考与工具调用收成一行';

  @override
  String get hubSettingsWebPhoneLayout => '网页版手机布局';

  @override
  String get hubSettingsWebPhoneLayoutHint => '为手机屏幕重排网页版';

  @override
  String get hubSettingsEngineExtensions => '引擎与扩展';

  @override
  String get hubSettingsEngine => '本机引擎';

  @override
  String get hubSettingsProviders => '模型';

  @override
  String get hubSettingsEngineSettings => '引擎参数';

  @override
  String get hubSettingsShareConfig => '分享配置';

  @override
  String get hubSettingsAllFeatures => '全部功能';

  @override
  String get hubSettingsAbout => '关于';

  @override
  String get hubSettingsCommunity => '社区';

  @override
  String get hubSettingsLicenses => '开源许可';

  @override
  String get hubSettingsAccount => 'DeepSeek 账号';

  @override
  String get hubSettingsSigningIn => '正在登录…';

  @override
  String get hubSettingsInvalidKey => 'Key 无效，查不到余额';

  @override
  String get hubSettingsNoApiKey => '未设置 API Key';

  @override
  String get hubSettingsApiKeyHint => '填写 Key 后即可对话';

  @override
  String get hubSettingsSignInAccount => '登录 DeepSeek 账号';

  @override
  String get hubSettingsOrApiKey => '或填写 API Key';

  @override
  String get hubPluginShare => '分享插件';

  @override
  String get hubPluginDetails => '插件详情';

  @override
  String get hubPluginFeatured => 'dshfind 推荐';

  @override
  String get hubPluginWebOnly => '仅网页版';

  @override
  String get hubPluginStars => '星标';

  @override
  String get hubPluginSource => '来源';

  @override
  String get hubPluginInstalledVersion => '已装版本';

  @override
  String get hubPluginRequiresDsh => '需要 DSH';

  @override
  String get hubPluginPackageName => '包名';

  @override
  String get hubPluginHomepage => '主页';

  @override
  String get hubPluginRepository => '代码仓库';

  @override
  String get hubPluginManageTitle => '管理插件';

  @override
  String get hubPluginManage => '管理';

  @override
  String get hubPluginSafeModeInstall => '安全模式下不能安装';

  @override
  String get hubPluginInstallCommand => '获取安装命令';

  @override
  String get hubPluginInstallComputer => '在电脑上安装';

  @override
  String get hubPluginInstalling => '安装中…';

  @override
  String get hubPluginAllowBuilds => '允许构建脚本并重试';

  @override
  String get hubPluginRetryInstall => '重试安装';

  @override
  String get hubPluginOfficial => 'DSH 官方';

  @override
  String get hubPluginNotLoaded => '没有正常加载';

  @override
  String get hubPluginComponents => '组件';

  @override
  String get hubPluginSafeModeRemove => '安全模式下不能卸载';

  @override
  String get hubPluginRemoveCommand => '获取卸载命令';

  @override
  String get hubPluginRemoveComputer => '在电脑上卸载';

  @override
  String get hubPluginUninstall => '卸载';

  @override
  String hubSessionTurns(int count) {
    return '共 $count 轮';
  }

  @override
  String hubSessionTurnsRunning(int count) {
    return '共 $count 轮 · 进行中';
  }

  @override
  String hubSessionStepCount(int count) {
    return '$count 步';
  }

  @override
  String hubSessionWaitTime(String duration) {
    return '等你 $duration';
  }

  @override
  String hubSessionTurn(int turn) {
    return '第 $turn 轮';
  }

  @override
  String hubSessionFileCount(int count) {
    return '改动了 $count 个文件';
  }

  @override
  String hubSessionEditCount(int count) {
    return '改了 $count 次';
  }

  @override
  String hubSessionTurnOf(int turn, int total) {
    return '第 $turn / $total 轮';
  }

  @override
  String hubSessionCacheHit(String percent) {
    return '命中 $percent';
  }

  @override
  String get hubSessionBlocked => '受阻';

  @override
  String hubSessionBlockedReason(String reason) {
    return '受阻：$reason';
  }

  @override
  String hubSessionTodoSemantics(String content, String status) {
    return '$content,$status';
  }

  @override
  String get hubSettingsStorageBody => 'AI 能读取和修改相册、下载、文档等手机文件，引擎会重启一次。';

  @override
  String hubSettingsBalance(String amount) {
    return '余额 $amount';
  }

  @override
  String hubSettingsBalanceLow(String amount) {
    return '余额 $amount · 余额不足';
  }

  @override
  String hubSettingsAccountSemantics(String title, String subtitle) {
    return '账号：$title，$subtitle';
  }

  @override
  String hubSettingsHostSemantics(String name, String status) {
    return '远程主机：$name，$status';
  }

  @override
  String get hubSettingsApiKey => 'DeepSeek API Key';

  @override
  String hubPluginBrowserFailed(String address) {
    return '没能打开浏览器，请手动访问 $address';
  }

  @override
  String hubPluginYearMonth(int year, String month) {
    return '$year年$month月';
  }

  @override
  String hubPluginUpdateTo(String version) {
    return '更新到 $version';
  }

  @override
  String hubPluginInstallOn(String host) {
    return '安装到$host';
  }

  @override
  String hubPluginComponentCount(int count) {
    return '$count 个';
  }

  @override
  String get hubPluginComponentSeparator => '、';

  @override
  String get hubGroupAi => 'AI';

  @override
  String get hubGroupCapabilities => '能力';

  @override
  String get hubGroupGeneral => '通用';

  @override
  String get hubGroupHosts => '主机';

  @override
  String get hubGroupHelp => '帮助与关于';

  @override
  String get hubPersonalization => '个性化';

  @override
  String get hubPersonalizationAboutYou => '关于你';

  @override
  String get hubPersonalizationReplies => '回答';

  @override
  String get hubPersonalizationWorkStyle => '工作方式';

  @override
  String get hubPrivacy => '隐私与分享';

  @override
  String get hubPrivacySharing => '分享';

  @override
  String get hubInterfaceHome => '首页';

  @override
  String get hubInterfaceWebHint => 'DSH 官方网页版';

  @override
  String get hubInterfaceOpenWeb => '打开网页版';

  @override
  String get hubInterfacePhoneLayout => '手机布局';

  @override
  String get hubAbout => '关于 DSH Go';

  @override
  String get hubAboutNewVersion => '有新版本';

  @override
  String get hubValueSet => '已设置';

  @override
  String get hubValueOff => '未开启';

  @override
  String get hubValueOneStep => '还差一步';

  @override
  String get hubValueAllowed => '已允许';

  @override
  String get hubValueNeedsSetup => '需设置';

  @override
  String hubValueHosts(int count) {
    return '$count 台';
  }

  @override
  String get hubValueNoHosts => '未添加';

  @override
  String hubValuePlugins(int count) {
    return '$count 个';
  }

  @override
  String get hubEngineStartup => '启动';

  @override
  String get hubThemeLightDark => '明暗';

  @override
  String get hubPermissionPhone => '手机';

  @override
  String get hubPermissionPhoneConfirm => '手机操控确认';

  @override
  String get launchScreenTitle => '启动画面';

  @override
  String get launchDefault => '默认';

  @override
  String get launchCustom => '自定义';

  @override
  String get launchFit => '适配方式';

  @override
  String get launchFitFill => '填满';

  @override
  String get launchFitCenter => '居中';

  @override
  String get launchBackground => '背景色';

  @override
  String get launchBackdropAuto => '自动';

  @override
  String get launchBackdropEdge => '取自图片';

  @override
  String get launchBackdropWhite => '白色';

  @override
  String get launchBackdropBlack => '黑色';

  @override
  String get launchReplace => '更换图片或视频';

  @override
  String get launchPreview => '预览';

  @override
  String get launchFooter => '图片、动图 8 MB 以内，视频 30 MB 以内。冷启动时完整播放一遍，轻点可跳过';

  @override
  String get launchChanged => '启动画面已更换';

  @override
  String launchChangedSize(String size) {
    return '启动画面已更换 · $size';
  }

  @override
  String get launchTooLarge => '图片超过 8 MB';

  @override
  String get launchOverLimit => '文件超过 30 MB';

  @override
  String get launchUnsupported => '支持 PNG、JPEG、WebP、GIF 和 MP4';

  @override
  String get launchUnreadable => '无法读取这个文件';

  @override
  String get launchUnavailable => '无法打开相册';

  @override
  String get launchBroken => '无法读取';

  @override
  String get iconShortcutRow => '图片快捷方式';

  @override
  String get iconShortcutRowSubtitle => '用自己的图片在桌面放一个入口';

  @override
  String get iconShortcutPick => '选择图片';

  @override
  String get iconShortcutChange => '换一张';

  @override
  String get iconShortcutHint => '拖动或双指缩放';

  @override
  String get iconShortcutName => '名称';

  @override
  String get iconShortcutAdd => '添加到桌面';

  @override
  String get iconShortcutNote => '系统不允许把桌面图标换成任意图片，这里会另放一个打开 DSH Go 的快捷方式；部分桌面会在它的角上加一个小标';

  @override
  String get iconShortcutAdded => '已添加到桌面';

  @override
  String get iconShortcutConfirm => '在弹出的窗口里确认';

  @override
  String get iconShortcutNoDialog => '没有弹窗？在系统设置里允许 DSH Go 创建桌面快捷方式';

  @override
  String get iconShortcutSettings => '去设置';

  @override
  String get iconShortcutUnsupported => '这个桌面不支持添加快捷方式';

  @override
  String get iconShortcutFailed => '没能添加，稍后再试';

  @override
  String get searchKwLaunchScreen => '开屏,启动动画,闪屏,开机画面,欢迎画面';

  @override
  String get searchKwIconShortcut => '快捷方式,自定义图标,桌面图片,换图标';

  @override
  String get localeTitle => '语言';

  @override
  String get localeSystem => '跟随系统';

  @override
  String get localeZh => '简体中文';

  @override
  String get localeEn => 'English';

  @override
  String get localEnvChooseTitle => 'DSH 在哪里运行？';

  @override
  String get localEnvChooseMessage => '之后可以在设置里更改';

  @override
  String localEnvThisPhoneDetail(int storage, int memory) {
    return '存储约 $storage MB · 内存约 $memory MB';
  }

  @override
  String localEnvThisPhoneDetailShort(int memory) {
    return '内存约 $memory MB';
  }

  @override
  String localEnvLowStorage(int needed) {
    return '存储空间不足，需要约 $needed MB';
  }

  @override
  String get localEnvRemoteDetail => '连接电脑或服务器上的 DSH';

  @override
  String get localEnvRecommended => '推荐';

  @override
  String get localEnvInstallTitle => '安装本机运行环境';

  @override
  String get localEnvInstallMessage => '在这台手机上运行 DSH';

  @override
  String localEnvFactStorage(int storage) {
    return '约 $storage MB 存储空间';
  }

  @override
  String localEnvFactMemory(int memory) {
    return '运行时约 $memory MB 内存';
  }

  @override
  String get localEnvUseRemote => '改用远程主机';

  @override
  String get localEnvNotInstalled => '本机未安装运行环境';

  @override
  String get localEnvUninstall => '卸载运行环境';

  @override
  String get localEnvUninstallHint => '释放存储空间';

  @override
  String get localEnvUninstallTitle => '卸载运行环境？';

  @override
  String get localEnvUninstallBody => '本机的对话、工作区、插件、设置、界面配置和技能会一并删除。';

  @override
  String get localEnvUninstallConfirm => '卸载';

  @override
  String get localEnvUninstallFailed => '没能卸载，再试一次';

  @override
  String get localEnvPhoneNeedsRuntime => '安装本机运行环境后可用';

  @override
  String get localEnvSignInNeedsRuntime => '需要本机运行环境';

  @override
  String get localEnvSignInInstallFirst => '安装后即可登录';

  @override
  String get mediaGenerateTile => '生成';

  @override
  String get mediaAiGenerated => 'AI 生成';

  @override
  String mediaCostEstimate(String amount) {
    return '约 $amount';
  }

  @override
  String mediaSavedCount(int count) {
    return '已保存 $count 张到相册';
  }

  @override
  String get mediaRegenerate => '重新生成';

  @override
  String get mediaCopyPrompt => '复制提示词';

  @override
  String get mediaFileGone => '文件已不在';

  @override
  String get mediaKindImage => '图像';

  @override
  String get mediaKindVideo => '视频';

  @override
  String get mediaTitleImage => '生成图像';

  @override
  String get mediaTitleVideo => '生成视频';

  @override
  String get mediaOpenElsewhere => '在其他应用中打开';

  @override
  String get mediaShowInFiles => '在文件中显示';

  @override
  String get mediaGenerating => '生成中';

  @override
  String mediaGeneratingProgress(String progress) {
    return '生成中 · $progress';
  }

  @override
  String get mediaCancelled => '已取消';

  @override
  String get mediaNotGenerated => '未生成';

  @override
  String mediaPartial(int done, int total) {
    return '$done / $total 张';
  }

  @override
  String mediaCount(int count) {
    return '$count 张';
  }

  @override
  String mediaSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String mediaImageOf(int index, int count) {
    return '第 $index 张，共 $count 张';
  }

  @override
  String mediaPageOf(int index, int count) {
    return '$index / $count';
  }

  @override
  String get mediaErrorPolicyInput => '描述未通过内容审核';

  @override
  String get mediaErrorPolicyOutput => '生成结果未通过内容审核';

  @override
  String get mediaErrorAuth => '服务未授权';

  @override
  String get mediaErrorBalance => '余额不足';

  @override
  String get mediaErrorQuota => '今天的额度已用完';

  @override
  String get mediaErrorUnavailable => '服务暂时不可用';

  @override
  String get mediaErrorExpired => '结果已过期';

  @override
  String get mediaErrorGeneric => '没能生成';

  @override
  String get mediaVary => '变体';

  @override
  String get mediaEdit => '编辑';

  @override
  String get mediaRevise => '修改';

  @override
  String get mediaUpscale => '放大';

  @override
  String get mediaMakeVideo => '做成视频';

  @override
  String get mediaDetailModel => '模型';

  @override
  String get mediaDetailSize => '尺寸';

  @override
  String get mediaDetailCost => '费用';

  @override
  String get mediaDetailProvenance => '来源标识';

  @override
  String get mediaDetailFile => '文件';

  @override
  String mediaOriginalPrompt(String text) {
    return '原文：$text';
  }

  @override
  String get mediaProvenanceC2pa => 'C2PA';

  @override
  String get mediaProvenanceImplicit => '隐式';

  @override
  String get mediaProvenanceVisible => '可见水印';

  @override
  String get mediaModeExit => '退出生成';

  @override
  String mediaModeLabel(String summary) {
    return '生成参数：$summary';
  }

  @override
  String get mediaParamModel => '模型';

  @override
  String get mediaParamAspect => '比例';

  @override
  String get mediaParamCount => '数量';

  @override
  String get mediaParamQuality => '清晰度';

  @override
  String get mediaParamDuration => '时长';

  @override
  String get mediaQualityAuto => '自动';

  @override
  String get mediaQualityStandard => '标准';

  @override
  String get mediaQualityHigh => '高清';

  @override
  String get mediaQuality4k => '4K';

  @override
  String get mediaQualityLevelLow => '低';

  @override
  String get mediaQualityLevelMedium => '中';

  @override
  String get mediaQualityLevelHigh => '高';

  @override
  String get mediaModelPick => '请选择';

  @override
  String get mediaPickModelFirst => '先选一个模型';

  @override
  String mediaPricePerImage(String price) {
    return '$price / 张';
  }

  @override
  String mediaPricePerSecond(String price) {
    return '$price / 秒';
  }

  @override
  String get mediaManageModels => '管理';

  @override
  String get mediaHintImage => '描述你想要的画面…';

  @override
  String get mediaHintVideo => '描述画面和镜头…';

  @override
  String get mediaHintEdit => '想怎么改…';

  @override
  String get mediaFirstFrame => '首帧';

  @override
  String get mediaLastFrame => '尾帧';

  @override
  String get mediaNoLastFrame => '这个模型不支持尾帧';

  @override
  String get mediaNoRefs => '这个模型不支持参考图';

  @override
  String mediaRefLimit(int count) {
    return '最多 $count 张参考图';
  }

  @override
  String get mediaNoDescription => '先写下想要的画面';

  @override
  String get mediaDescriptionTooLong => '描述太长，删短一些再生成';

  @override
  String get mediaInstallTitle => '图像与视频';

  @override
  String get mediaInstallBody => '这台主机还没有图像与视频插件';

  @override
  String get mediaInstallAction => '在此主机上安装';

  @override
  String get mediaUnavailableTitle => '生成模式不可用';

  @override
  String get mediaUnavailableBody => '这台主机的图像与视频插件版本不兼容。仍可直接在对话里描述想要的画面。';

  @override
  String get mediaUnavailableAction => '管理插件';

  @override
  String get mediaSettingsTitle => '图像与视频';

  @override
  String get searchKwMediaGeneration => '生图,画图,文生图,视频生成,AI 绘画,生成图片,生成视频';

  @override
  String get nearbyThisChat => '本对话';

  @override
  String get nearbyPermissionTitle => '本对话的权限';

  @override
  String nearbyNewChatDefault(String name) {
    return '新对话默认：$name';
  }

  @override
  String get nearbySetAsDefault => '设为新对话默认';

  @override
  String get nearbyManageModels => '管理模型';

  @override
  String nearbyPermissionPill(String name) {
    return '本对话的权限：$name';
  }

  @override
  String get nearbyChange => '更换';

  @override
  String get performanceTitle => '性能';

  @override
  String get performanceAuto => '自动';

  @override
  String get performanceFull => '完整';

  @override
  String get performanceLight => '轻量';

  @override
  String get performanceAutoHint => '按设备调整默认效果';

  @override
  String get performanceFullHint => '保留模糊与动效';

  @override
  String get performanceLightHint => '减少常驻效果和资源占用';

  @override
  String get performanceChoiceHint => '手动选择的宠物和引擎设置优先';

  @override
  String get performanceCooling => '正在减少效果，降温后恢复';

  @override
  String get performanceEffects => '界面效果';

  @override
  String get performanceBlur => '玻璃模糊';

  @override
  String get performanceAnimations => '界面动效';

  @override
  String get performanceSystemMotion => '同时遵循系统的移除动画设置';

  @override
  String get performanceFollowMode => '效果跟随性能模式';

  @override
  String get performanceRemoteHint => '推荐连接电脑或服务器，减少本机负担';

  @override
  String get phoneDiagnosticsCollecting => '正在收集…';

  @override
  String get phoneDiagnosticsPacking => '正在打包…';

  @override
  String get phoneDiagnosticsSharing => '正在打开分享…';

  @override
  String get phoneDiagnosticsSaving => '正在存到「下载」…';

  @override
  String get phoneDiagnosticsShare => '分享诊断包';

  @override
  String get phoneDiagnosticsShareHint => '附在问题反馈里';

  @override
  String get phoneDiagnosticsSave => '存到「下载」';

  @override
  String get phoneDiagnosticsSaveHint => '存进 下载/DSH-Go';

  @override
  String get phoneDiagnosticsNote => '含版本、设备、日志和最近一次崩溃，不含 Key 和令牌';

  @override
  String get phoneDiagnosticsExport => '导出诊断包';

  @override
  String get phoneSafeMode => '安全模式';

  @override
  String get phoneEngineStartingSafeEllipsis => '正在以安全模式启动…';

  @override
  String get phoneEngineStartingEllipsis => '正在启动…';

  @override
  String get phoneEngineTidyingFilesEllipsis => '正在整理插件文件…';

  @override
  String get phoneEngineStoppingEllipsis => '正在停止…';

  @override
  String get phoneEngineStoppedNextSafe => '已停止 · 下次以安全模式启动';

  @override
  String get phoneEngineInstallingRuntime => '正在安装运行环境…';

  @override
  String get phoneEngineRuntimeNotInstalled => '运行环境未安装';

  @override
  String get phoneEngineErrorSeeLogs => '引擎出错了，日志里有详情';

  @override
  String get phoneEngineTitle => '本机引擎';

  @override
  String get phoneEngineLocal => '本机引擎';

  @override
  String get phoneEngineLogs => '日志';

  @override
  String get phoneEngineAutoStart => '打开 App 时自动启动';

  @override
  String get phoneEngineKeepAlive => '后台运行';

  @override
  String get phoneEngineKeepAliveHint => '防止引擎被系统结束';

  @override
  String get phoneEngineDiagnostics => '诊断';

  @override
  String get phoneEngineDiagnosticsHint => '运行信息与问题反馈';

  @override
  String get phoneEngineRuntime => '运行环境';

  @override
  String get phoneEngineArchitecture => '架构';

  @override
  String get phoneEngineStopTitle => '停止引擎？';

  @override
  String get phoneEngineStopBody => '进行中的对话会中断，随时可以再启动。';

  @override
  String get phoneEngineInstallRuntime => '安装运行环境';

  @override
  String get phoneEngineStartAgain => '重新启动';

  @override
  String get phoneEngineStart => '启动';

  @override
  String get phoneEngineRestart => '重启';

  @override
  String get phoneEngineResetFailed => '没能重置';

  @override
  String get phoneEngineReset => '重置运行环境';

  @override
  String get phoneEngineResetHint => '删除对话和文件后重新解压';

  @override
  String get phoneEngineResetTitle => '重置运行环境？';

  @override
  String get phoneEngineKeepUiSkills => '保留界面配置和技能';

  @override
  String get phoneEngineKeepPluginsSettings => '保留已装插件和设置';

  @override
  String get phoneEngineDeleteReset => '删除并重置';

  @override
  String get phoneEngineNotInstalled => '未安装';

  @override
  String get phoneEngineInstalling => '正在安装';

  @override
  String get phoneEngineStoppedSafe => '已停止 · 安全模式';

  @override
  String get phoneEngineStartingSafe => '正在以安全模式启动';

  @override
  String get phoneEngineStarting => '正在启动';

  @override
  String get phoneEngineTidyingFiles => '正在整理插件文件';

  @override
  String get phoneEngineRunningProbation => '运行中 · 试用';

  @override
  String get phoneEngineStartupFailed => '启动失败';

  @override
  String get phoneEngineCrashed => '已崩溃';

  @override
  String get phoneEngineKilled => '被系统结束';

  @override
  String get phoneEngineError => '出错了';

  @override
  String get phoneEngineRuntimeCorrupt => 'App 内的运行环境包已损坏，请重新安装 App';

  @override
  String get phoneEngineExited => '引擎意外退出了';

  @override
  String get phoneEngineRuntimeMissing => '运行环境还没有安装';

  @override
  String get phoneEngineSafeUnsupported => '这个版本的运行环境不支持安全模式，请更新 App';

  @override
  String get phoneEngineRuntimeIncomplete => 'App 内的运行环境包不完整，请重新安装 App';

  @override
  String get phoneLogEmpty => '还没有日志';

  @override
  String get phoneLogShareTitle => 'DSH 引擎日志';

  @override
  String get phoneLogCopyAll => '复制全部';

  @override
  String get phoneBackgroundAllow => '去放行';

  @override
  String get phoneToolScreen => '看屏幕';

  @override
  String get phoneToolCollect => '滚动收集';

  @override
  String get phoneToolTap => '点按';

  @override
  String get phoneToolType => '输入';

  @override
  String get phoneToolScroll => '滑动';

  @override
  String get phoneToolKey => '按键';

  @override
  String get phoneToolTapCoordinates => '点坐标';

  @override
  String get phoneToolHandoff => '交还给你';

  @override
  String get phoneToolOpenApp => '打开 App';

  @override
  String get phoneToolListApps => '查看应用';

  @override
  String get phoneToolIntent => '系统动作';

  @override
  String get phoneToolNotify => '发通知';

  @override
  String get phoneToolClipboard => '剪贴板';

  @override
  String get phoneToolAction => '操作';

  @override
  String get phoneDecisionContinued => '你点了继续';

  @override
  String get phoneDecisionDone => '已执行';

  @override
  String get phoneDecisionAllowed => '你允许了';

  @override
  String get phoneDecisionPauseExpired => '暂停太久';

  @override
  String get phoneDecisionBlocked => '已拦下';

  @override
  String get phoneDecisionTimeout => '超时';

  @override
  String get phoneDecisionUnavailable => '不可用';

  @override
  String get phoneDecisionScreenChanged => '屏幕变了';

  @override
  String get phoneDecisionFailed => '没成功';

  @override
  String get phoneActionLogTitle => '操作记录';

  @override
  String get phoneActionLogSubtitle => '只记做了什么，不记屏幕内容';

  @override
  String get phoneActionLogRefresh => '刷新';

  @override
  String get phoneActionLogEmpty => '还没有记录';

  @override
  String get phoneActionLogEmptyHint => 'DSH 在手机上的每一步都会记在这里';

  @override
  String get phoneAppRuleDeny => '不碰';

  @override
  String get phoneAppRuleConfirm => '每一步都确认';

  @override
  String get phoneAppRuleNormal => '照常';

  @override
  String get phoneAppRuleDenyHint => '不读也不点，银行、支付类默认如此';

  @override
  String get phoneAppRuleConfirmHint => '可以读，点按和输入前先问你';

  @override
  String get phoneAppRuleNormalHint => '只有发送这类敏感操作先问你';

  @override
  String get phoneAppRulesTitle => '应用名单';

  @override
  String get phoneAppRulesSubtitle => '没列出的 App 照常处理，敏感操作仍先问你';

  @override
  String get phoneAppRulesUnavailable => '读不到应用名单';

  @override
  String get phoneTryLater => '稍后再试';

  @override
  String get phoneAppRulesChanged => '照常 · 你改过的';

  @override
  String get phoneAppRulesAdd => '添加 App';

  @override
  String get phoneAppRulesAddHint => '按包名添加';

  @override
  String get phoneSensitiveActionsNote => '密码、验证码、付款和系统设置都由你来';

  @override
  String get phoneAppRulesSaveFailed => '没有保存成功，稍后再试';

  @override
  String get phoneAppRulesAcceptRisk => '我知道风险，仍然修改';

  @override
  String get phoneAppRulesPackage => '包名';

  @override
  String get phoneAppRulesPackageHint => '在「设置 → 应用 → 应用信息」里能找到';

  @override
  String get phoneDndRequiresAndroid => '需要 Android 14 及以上';

  @override
  String get phoneDndHiddenScreen => '在看不见的屏幕上操作';

  @override
  String get phoneDndShizukuReady => 'Shizuku · 可以用了';

  @override
  String get phoneNotReadyYet => '还没准备好';

  @override
  String get phoneDndAdbReady => '自连 ADB · 可以用了';

  @override
  String get phoneActionFailedLater => '没有成功，稍后再试';

  @override
  String get phoneDndDisabled => '不打扰模式已关闭';

  @override
  String get phoneDndEnabled => '不打扰模式已启用';

  @override
  String get phoneDndShizukuPermissionFailed => '没有拿到授权。可以在 Shizuku 的「应用管理」里给 DSH Go 授权';

  @override
  String get phoneDndPairedConnect => '配对成功，点「连接」';

  @override
  String get phoneDndTitle => '不打扰模式';

  @override
  String get phoneDndSubtitle => '在看不见的屏幕上操作，不耽误你用手机';

  @override
  String get phoneDndUnsupported => '这台手机用不了：需要 Android 14 及以上。';

  @override
  String get phoneDndRequirements => '使用条件';

  @override
  String get phoneDndKeepUnlocked => '保持亮屏、解锁。';

  @override
  String get phoneDndReactivate => '重启手机后重新激活。';

  @override
  String get phoneDndKeepDebugging => '连接 Wi-Fi，并保持开发者选项和无线调试开启。';

  @override
  String get phoneDndUsingShizuku => '正在使用：Shizuku';

  @override
  String get phoneDndUsingAdb => '正在使用：自连 ADB';

  @override
  String get phoneReady => '可以用了';

  @override
  String get phoneDndUseShizuku => '用 Shizuku';

  @override
  String get phoneDndDirectAdb => '自连 ADB';

  @override
  String get phoneDndInstallShizuku => '先装 Shizuku（免费、开源）。已经在用冰箱、黑阈这类工具的话，多半已经装了。';

  @override
  String get phoneDndOpenShizukuSite => '打开 Shizuku 官网';

  @override
  String get phoneDndStartShizuku => '打开 Shizuku，按里面「通过无线调试启动」的说明做一遍（要连 Wi‑Fi）。回到这里会自动刷新。';

  @override
  String get phoneDndGrantShizukuHint => 'Shizuku 已在运行，还要给 DSH Go 授权。';

  @override
  String get phoneDndGrantShizuku => '授权给 DSH Go';

  @override
  String get phoneDndShizukuAllSet => 'Shizuku 这边准备好了。';

  @override
  String get phoneDndShizukuInstalled => '已安装 Shizuku';

  @override
  String get phoneDndShizukuRunning => 'Shizuku 正在运行';

  @override
  String get phoneDndShizukuGranted => '已授权给 DSH Go';

  @override
  String get phoneDndShizukuCompatibility => '这版 Android 与官方版 Shizuku 存在兼容问题。';

  @override
  String get phoneDndWirelessDebuggingOn => '无线调试已打开';

  @override
  String get phoneDndPaired => '已配对';

  @override
  String get phoneDndConnected => '已连接';

  @override
  String get phoneDndPairOnce => '配对一次（不用装别的 App）';

  @override
  String get phoneDndDeveloperOptionsStep => '打开开发者选项：在「关于手机」里连点「版本号」7 次。小米在「我的设备 → 全部参数与信息」里点「OS 版本」，vivo 点「软件版本号」。';

  @override
  String get phoneDndWirelessDebuggingStep => '在开发者选项里打开「无线调试」，要连着 Wi‑Fi。开发者选项一般在「系统」或「其他设置」里。';

  @override
  String get phoneDndStartPairingStep => '回到这里点「开始配对」，DSH 会发一条通知。';

  @override
  String get phoneDndGetPairingCodeStep => '在「无线调试」里点「使用配对码配对设备」，屏幕上会出现 6 位配对码。';

  @override
  String get phoneDndEnterPairingCodeStep => '下拉通知栏，把配对码填进 DSH 的通知。配对成功后点「连接」。';

  @override
  String get phoneDndStartPairing => '开始配对';

  @override
  String get phoneDndPairingNotificationSent => '通知已发出，去「无线调试」里拿配对码';

  @override
  String get phoneDndManualEntry => '手动填写';

  @override
  String get phoneDndConnect => '连接';

  @override
  String get phoneDndManualEntryHint => '通知里没有输入框时，用「手动填写」';

  @override
  String get phoneDndXiaomiUsbHint => '打开「USB 调试（安全设置）」需插入 SIM 卡并登录小米账号。';

  @override
  String get phoneDndEnable => '启用不打扰模式';

  @override
  String get phoneDndEnterCodeTitle => '填写配对码';

  @override
  String get phoneDndCodeLabel => '6 位配对码';

  @override
  String get phoneDndPortLabel => '端口（可不填）';

  @override
  String get phoneDndPortHint => '配对码下面「IP 地址和端口」冒号后的数字';

  @override
  String get phoneDndPair => '配对';

  @override
  String get phoneConfirmAsk => '每次都询问';

  @override
  String get phoneConfirmTask => '本任务免确认';

  @override
  String get phoneConfirmAlways => '始终免确认';

  @override
  String get phoneConfirmAskHint => '进新 App、发送、删除、付款前先问你';

  @override
  String get phoneConfirmTaskHint => '每个任务只问一次';

  @override
  String get phoneConfirmAlwaysHint => '从不询问，直接操作';

  @override
  String get phoneConfirmTitle => '确认方式';

  @override
  String get phoneConfirmAlwaysTitle => '始终免确认？';

  @override
  String get phoneConfirmAlwaysBody => '打开 App、点按、发送、删除都直接做，不再问你。';

  @override
  String get phoneConfirmSaveFailed => '没改成，稍后再试';

  @override
  String get phoneEnableFailed => '没能开启，稍后再试';

  @override
  String get phoneDisableFailed => '没能关闭，稍后再试';

  @override
  String get phoneEnabled => '已开启';

  @override
  String get phoneDisabled => '已关闭';

  @override
  String get phoneOpenAccessibilityFailed => '打不开系统设置，请到「设置 → 无障碍」里找到 DSH';

  @override
  String get phoneOpenAppInfoFailed => '打不开应用信息，请到「设置 → 应用」里找到 DSH Go';

  @override
  String get phoneStopFailed => '没能停止，可以点悬浮条或通知上的「停止」';

  @override
  String get phoneControlTitle => '手机操控';

  @override
  String get phoneControlSubtitle => '看屏幕、帮你点按，随时可以停';

  @override
  String get phoneControlWorking => '正在操作手机';

  @override
  String get phoneControlTaskNoConfirmHint => '本任务免确认 · 悬浮条上也能暂停或停止';

  @override
  String get phoneControlFloatingBarHint => '悬浮条上也能暂停或停止';

  @override
  String get phoneControlAdvanced => '进阶';

  @override
  String get phoneControlKeepAliveHint => '防止系统关掉无障碍';

  @override
  String get phoneControlReadingEllipsis => '正在读取…';

  @override
  String get phoneControlNotReady => '未就绪';

  @override
  String get phoneControlNotEnabled => '未开启';

  @override
  String get phoneControlSafeModeNotLoaded => '安全模式下不加载';

  @override
  String get phoneControlLocalOnly => '只在本机引擎可用';

  @override
  String get phoneControlAfterEngineStarts => '引擎启动后生效';

  @override
  String get phoneControlNeedsAccessibility => '还差一步：打开无障碍';

  @override
  String get phoneControlReady => '可以操作手机';

  @override
  String get phoneControlSetup => '准备';

  @override
  String get phoneControlAccessibilityService => '无障碍服务';

  @override
  String get phoneControlAccessibilityReady => '能看屏幕、帮你点按了';

  @override
  String get phoneControlAccessibilityReconnect => '服务没连上，关掉再打开一次';

  @override
  String get phoneControlAccessibilityHint => '看屏幕和点按都靠它';

  @override
  String get phoneControlGoSettings => '去设置';

  @override
  String get phoneControlGoEnable => '去开启';

  @override
  String get phoneControlAccessibilityBlocked => '无障碍开关点不动？';

  @override
  String get phoneControlRestrictedAfterAttempt => '看起来没开成。侧载的 App 要先「允许受限制的设置」';

  @override
  String get phoneControlRestrictedHint => '侧载安装的 App 要先「允许受限制的设置」';

  @override
  String get phoneControlNotifications => '通知';

  @override
  String get phoneControlNotificationsPairingHint => '确认、停止和配对码都走通知';

  @override
  String get phoneControlNotificationsHint => '确认和「停止」按钮要用到';

  @override
  String get phoneControlAllowed => '已允许';

  @override
  String get phoneControlTry => '试一下';

  @override
  String get phoneControlReadScreen => '读一下当前屏幕';

  @override
  String get phoneControlReadScreenHint => '看看 DSH 读到了什么，不发给模型';

  @override
  String get phoneControlEnableAccessibilityFirst => '先打开无障碍服务';

  @override
  String get phoneControlLoading => '读取中';

  @override
  String get phoneControlRules => '规则';

  @override
  String get phoneControlRecentActions => '最近操作';

  @override
  String get phoneControlRecentActionsHint => '每一步都会记下，不含屏幕内容';

  @override
  String get phoneControlAllActions => '全部记录';

  @override
  String get phoneControlModuleNotReady => '这个版本里，手机操控模块还没有就绪';

  @override
  String get phoneControlSafeModeUnavailable => '安全模式下不可用';

  @override
  String get phoneControlSafeModeHint => '安全模式不加载插件，恢复正常模式后可用';

  @override
  String get phoneControlRemoteHost => '当前连的是远程主机';

  @override
  String get phoneControlCapabilities => '开启后能做什么';

  @override
  String get phoneControlIntents => '定闹钟、建日程、导航、分享';

  @override
  String get phoneControlNoExtraPermissions => '不用额外权限';

  @override
  String get phoneControlReadToTable => '读屏幕，整理成表格或待办';

  @override
  String get phoneControlNeedsAccessibilityHint => '需要打开无障碍';

  @override
  String get phoneControlTapType => '帮你点按、输入';

  @override
  String get phoneControlSensitiveHint => '默认对发送、下单等操作先确认；调整设置可放宽这些保护';

  @override
  String get phoneDisclosureWhatTitle => '读什么';

  @override
  String get phoneDisclosureWhatBody => '当前屏幕上的文字。用能看图的模型时，可能附一张截图。';

  @override
  String get phoneDisclosureWhenTitle => '什么时候读';

  @override
  String get phoneDisclosureWhenBody => '只在你发起任务，或点「读一下当前屏幕」时。平时不读。';

  @override
  String get phoneDisclosureWhoTitle => '发给谁';

  @override
  String get phoneDisclosureWhoBody => '任务中的屏幕信息可能发送给你配置的第三方模型提供方。部分卡号、证件号会尝试遮盖，但不保证全部识别；截图可能包含敏感内容。';

  @override
  String get phoneDisclosureNeverTitle => '默认不做';

  @override
  String get phoneDisclosureNeverBody => '默认不代填密码和验证码、不改系统设置，银行及支付类 App 默认不碰；这些限制可由你在设置里主动放宽。';

  @override
  String get phoneDisclosureStopTitle => '你随时能停';

  @override
  String get phoneDisclosureStopBody => '操作时屏幕上有悬浮条，可以暂停、停止或插话。手机要亮屏、解锁。';

  @override
  String get phoneDisclosureTitle => '开启手机操控前';

  @override
  String get phoneDisclosureIntro => '手机操控可读取屏幕、点按和输入。请只在自有或获授权的设备上使用，并先了解以下事项：';

  @override
  String get phoneDisclosureRestartNote => '开启后引擎会重启一次，进行中的回复会中断';

  @override
  String get phoneDisclosureNotNow => '先不开';

  @override
  String get phoneDisclosureAgreeEnable => '我了解并同意开启';

  @override
  String get phoneCheckUnknown => '不确定';

  @override
  String get phoneCheckYes => '是';

  @override
  String get phoneCheckNotYet => '还没有';

  @override
  String get phoneRomStock => '原生 / 其他';

  @override
  String get phoneRestrictedAccessibility => '无障碍';

  @override
  String get phoneRestrictedOpenAccessibility => '去开无障碍';

  @override
  String get phoneRestrictedOverlay => '悬浮窗';

  @override
  String get phoneRestrictedOpenOverlay => '去开悬浮窗';

  @override
  String get phoneRestrictedTryAccessibility => '先去「无障碍」里点一次 DSH 的开关，看到「受限制的设置」提示后点「确定」。做过这一步，下面的选项才会出现。';

  @override
  String get phoneRestrictedOpenInfoStep => '回到这里，点「打开应用信息」。';

  @override
  String get phoneRestrictedBackAccessibility => '回到「无障碍」，打开 DSH。';

  @override
  String get phoneRestrictedMenuStep => '点右上角的三个点，选「允许受限制的设置」，按提示验证锁屏密码。';

  @override
  String get phoneRestrictedTryOverlay => '先去「悬浮窗」设置里点一次 DSH Go 的开关，看到「受限制的设置」提示后点「确定」。做过这一步，下面的选项才会出现。';

  @override
  String get phoneRestrictedBackOverlay => '回到「悬浮窗」设置，打开 DSH Go。';

  @override
  String get phoneRestrictedHuaweiOverlay => '华为 HarmonyOS 4 及更早的系统大多没有这一步，直接去「悬浮窗」设置打开 DSH Go。';

  @override
  String get phoneRestrictedHuaweiAccessibility => '华为 HarmonyOS 4 及更早的系统大多没有这一步，直接去「无障碍」打开 DSH。';

  @override
  String get phoneRestrictedVivoNote => '不同 OriginOS 版本位置可能不同。右上角没有三个点时，把应用信息页往下翻到底找一找。';

  @override
  String get phoneRestrictedAdvancedStep => '在「高级设置」里找到「允许受限制的设置」，打开它。';

  @override
  String get phoneRestrictedOppoNote => 'ColorOS 有时找不到这个选项。这时用系统自带的「文件管理」找到 DSH 的安装包，点它覆盖安装一次（不用卸载，对话和设置都在），再去开无障碍。';

  @override
  String get phoneRestrictedHuaweiNote => '如果在无障碍里看到「受限制的设置」提示，按「原生 / 其他」的步骤做。';

  @override
  String get phoneRestrictedTitle => '允许受限制的设置';

  @override
  String get phoneRestrictedSteps => '步骤';

  @override
  String get phoneRestrictedDiagram => '图示';

  @override
  String get phoneRestrictedOpenInfo => '打开应用信息';

  @override
  String get phoneRestrictedOpenOverlayFailed => '打不开悬浮窗设置，请到「设置」里搜索「悬浮窗」';

  @override
  String get phoneRestrictedOpenAccessibilityFailed => '打不开无障碍设置，请到「设置」里搜索「无障碍」';

  @override
  String get phoneRestrictedFootnote => '名称因系统而异，找不到就在设置里搜「受限制」；仍打不开时重启手机再试';

  @override
  String get phoneRestrictedAppInfo => '应用信息';

  @override
  String get phoneRestrictedPermissionsManager => '权限管理';

  @override
  String get phoneRestrictedBatterySaver => '省电策略';

  @override
  String get phoneRestrictedAdvanced => '高级设置';

  @override
  String get phoneRestrictedPermissions => '权限';

  @override
  String get phoneRestrictedBattery => '电池';

  @override
  String get phoneRestrictedDiagramAdvanced => '图示：应用信息页里点「高级设置」，再打开「允许受限制的设置」';

  @override
  String get phoneRestrictedDiagramMenu => '图示：应用信息页点右上角三个点，再选「允许受限制的设置」';

  @override
  String get phoneRestrictedCaptionAdvanced => '① 点「高级设置」';

  @override
  String get phoneRestrictedCaptionMenu => '① 点右上角三个点';

  @override
  String get phoneRestrictedCaptionToggle => '② 打开这个开关';

  @override
  String get phoneRestrictedCaptionOption => '② 选这一项';

  @override
  String get phoneScreenReadFailed => '没能读到屏幕';

  @override
  String get phoneScreenUnknownReason => '原因不明';

  @override
  String get phoneScreenReadFailedHint => '确认无障碍已开启。密码、支付这类页面系统不让读';

  @override
  String get phoneScreenCurrent => '当前屏幕';

  @override
  String get phoneScreenEmpty => '（屏幕上没有可读的文字）';

  @override
  String get phoneScreenReadNote => '模型看到的就是这些文字，这次读取没有发给模型';

  @override
  String get phoneFailureSafeStartup => '安全模式也没能启动';

  @override
  String get phoneFailureSafeStartupHint => '问题多半在全局配置或运行环境';

  @override
  String get phoneFailureKilled => '引擎被系统结束了';

  @override
  String get phoneFailureKilledHint => '多半是内存不足或系统省电';

  @override
  String get phoneFailureLaunch => '本机运行环境未能启动';

  @override
  String get phoneFailureLaunchHint => '查看日志了解原因，或连接远程主机继续使用';

  @override
  String get phoneFailureNoSpaceHint => '清理一些空间后重试';

  @override
  String get phoneFailureStartup => 'DSH 启动失败';

  @override
  String get phoneFailureCrashedEarly => 'DSH 启动后很快崩溃了';

  @override
  String get phoneFailureCrashedLate => 'DSH 运行中崩溃了';

  @override
  String get phoneFailureFatal => '引擎报告了致命错误';

  @override
  String get phoneFailureRestore => '恢复配置';

  @override
  String get phoneFailureEnterSafe => '进入安全模式';

  @override
  String get phoneFailureStartNormal => '正常启动';

  @override
  String get phoneFailureGlobalPatch => '全局补丁';

  @override
  String get phoneFailureEnvironment => '环境变量';

  @override
  String get phoneSafeMoveAsideTitle => '先移开这些文件？';

  @override
  String get phoneSafeMoveAsideIntro => '它们对所有配置都生效，安全模式也会受影响：';

  @override
  String get phoneSafeMoveAsideNote => '只是改名（加上 .off-时间），不会删除，修好后可以改回来。';

  @override
  String get phoneSafeStartDirectly => '直接启动';

  @override
  String get phoneSafeMoveAsideStart => '移开并启动';

  @override
  String get phoneSafeNoRestoreNeeded => '配置和上次正常时一样，无需恢复';

  @override
  String get phoneSafeNoRestoreRecord => '还没有正常运行过的配置记录';

  @override
  String get phoneSafeRestoreTitle => '恢复上次正常的配置？';

  @override
  String get phoneSafeRestoreStart => '恢复并启动';

  @override
  String get phoneSafeRestoredStarting => '已恢复上次正常的配置，正在启动…';

  @override
  String get phoneSafeRestoreFailed => '没能恢复';

  @override
  String get phoneSafeRestoreIntro => 'DSH 会回到上次正常运行时的配置：';

  @override
  String get phoneSafeRestoreSettings => '• 设置恢复到当时的版本（现在的另存为备份）';

  @override
  String get phoneSafeRestoreNote => '不会卸载任何插件，也不需要联网。停用的插件以后可以重新打开。';

  @override
  String get phoneSafeLeaveTitle => '恢复正常模式？';

  @override
  String get phoneSafeLeaveBody => '用原来的配置和插件启动。安全模式期间改的网页版设置不会保留。';

  @override
  String get phoneSafeLeave => '恢复正常模式';

  @override
  String get phoneSafeMovePatch => '移开补丁';

  @override
  String get phoneSafeMoveFiles => '移开文件';

  @override
  String get phoneSafeFailureLog => '失败前后的日志';

  @override
  String get phoneSafeFailureLogEmpty => '没有记录到失败时的输出';

  @override
  String get phoneSafeBannerTitle => '安全模式 · 插件没有加载';

  @override
  String get phoneSafeBannerProbation => '正在试用正常模式';

  @override
  String get phoneSafeBannerProbationHint => '2 分钟内不再出错就算恢复，否则自动回到安全模式';

  @override
  String get phoneSafeBannerRunningHint => '对话都在，修好配置后恢复正常模式';

  @override
  String get phoneSafeBannerFailedHint => '安全模式也没能启动，去引擎页查看';

  @override
  String get phoneSafeBannerStoppedHint => '引擎已停止，下次启动仍是安全模式';

  @override
  String get phoneSafeRepair => '帮我修复';

  @override
  String get phoneSafeReasonStartup => '连续两次启动失败';

  @override
  String get phoneSafeReasonProbation => '恢复正常后又崩溃了';

  @override
  String get phoneSafeReasonManual => '手动开启';

  @override
  String get phoneSafeNormalSettingsHint => '用原有配置和插件重启';

  @override
  String get phoneSafeStartSettings => '以安全模式启动';

  @override
  String get phoneSafeStartSettingsHint => '不加载插件，排查启动问题';

  @override
  String get phoneSafeAutoSettings => '自动进入安全模式';

  @override
  String get phoneSafeAutoSettingsHint => '连续启动失败时自动启用';

  @override
  String get phoneAccentMist => '雾蓝';

  @override
  String get phoneAccentDaiqing => '黛青';

  @override
  String get phoneAccentDusk => '暮紫';

  @override
  String get phoneAccentTurquoise => '松石';

  @override
  String get phoneAccentAmber => '琥珀';

  @override
  String get phoneAccentGraphite => '石墨';

  @override
  String get phoneAccentCustom => '自定义';

  @override
  String phoneEngineInstallPercent(int percent) {
    return '正在安装 · $percent%';
  }

  @override
  String phoneEngineStatusSemantics(String prefix, String status) {
    return '$prefix引擎：$status';
  }

  @override
  String phoneLogLineCount(int count) {
    return '$count 行';
  }

  @override
  String phoneLogCopiedLines(int count) {
    return '已复制 $count 行';
  }

  @override
  String phoneAppRuleDefault(String rule) {
    return '默认：$rule';
  }

  @override
  String phoneAppRulesLoosenTitle(String app) {
    return '让 DSH 操作「$app」？';
  }

  @override
  String phoneAppRulesSkipStepsTitle(String app) {
    return '「$app」不再逐步确认？';
  }

  @override
  String phoneDndShizukuStatus(String reason) {
    return 'Shizuku · $reason';
  }

  @override
  String phoneDndAdbStatus(String reason) {
    return '自连 ADB · $reason';
  }

  @override
  String phoneDndBrowserFailed(String url) {
    return '打不开浏览器。网址：$url';
  }

  @override
  String phoneControlWorkingApp(String app) {
    return '正在操作「$app」';
  }

  @override
  String phoneControlPolicySummary(int denied, int confirmed) {
    return '$denied 个不碰 · $confirmed 个每步确认';
  }

  @override
  String phoneControlRemoteHint(String host) {
    return '「$host」上的 DSH 操作不了这台手机，切回「本机」后可用';
  }

  @override
  String phoneRestrictedSubtitle(String place) {
    return '侧载的 App 要先放行这一项，$place开关才点得动';
  }

  @override
  String phoneRestrictedDone(String place) {
    return '$place已开好，可以返回了';
  }

  @override
  String phoneFailurePlugins(String plugins) {
    return '可能和插件「$plugins」有关';
  }

  @override
  String phoneFailureRequired(String components) {
    return '必需组件 $components 没通过启动检查';
  }

  @override
  String phoneSafeRestoreAt(String when) {
    return 'DSH 会回到 $when 正常运行时的配置：';
  }

  @override
  String phoneSafeRestoreDisable(String plugins) {
    return '• 停用：$plugins';
  }

  @override
  String phoneSafeRestoreChanged(String plugins) {
    return '  （$plugins 之后升级过，只能先停用）';
  }

  @override
  String phoneSafeRestoreEnable(String plugins) {
    return '• 重新启用：$plugins';
  }

  @override
  String phoneSafeTodayTime(String time) {
    return '今天 $time';
  }

  @override
  String phoneSafeReasonPlugins(String plugins) {
    return '连续两次启动失败，可疑插件：$plugins';
  }

  @override
  String get phoneListSeparator => '、';

  @override
  String get phonePluginQuoteSeparator => '」「';

  @override
  String phoneEngineRunningAt(String address) {
    return '运行中 · $address';
  }

  @override
  String phoneEngineSafeAt(String address) {
    return '安全模式 · $address';
  }

  @override
  String get phoneAppRulesLoosenBody => '银行、支付类 App 会检测自动操作，可能限制登录甚至冻结账号；DSH 默认不输密码、不付款。';

  @override
  String get phoneAppRulesSkipStepsBody => '微信这类 App 有风控，曾有手机助手操作后账号被强制下线。改成照常后，只有发消息这类操作还会先问你。';

  @override
  String get phoneResetDeletesChatsWorkspaces => '对话和工作区';

  @override
  String get phoneResetBodyChatsWorkspaces => '会删除对话和工作区，然后重新安装运行环境。';

  @override
  String get phoneResetDeletesWithPlugins => '对话、工作区、插件和设置';

  @override
  String get phoneResetBodyWithPlugins => '会删除对话、工作区、插件和设置，然后重新安装运行环境。';

  @override
  String get phoneResetDeletesWithUi => '对话、工作区、界面配置和技能';

  @override
  String get phoneResetBodyWithUi => '会删除对话、工作区、界面配置和技能，然后重新安装运行环境。';

  @override
  String get phoneResetDeletesEverything => '对话、工作区、插件、设置、界面配置和技能';

  @override
  String get phoneResetBodyEverything => '会删除对话、工作区、插件、设置、界面配置和技能，然后重新安装运行环境。';

  @override
  String phoneEngineStorageDetails(String needed, String free) {
    return '存储空间不足：需要约 $needed MB，当前可用 $free MB';
  }

  @override
  String get phoneControlEnabledRestarting => '已开启，引擎正在重启';

  @override
  String get phoneControlDisabledRestarting => '已关闭，引擎正在重启';

  @override
  String get phoneControlEnabledPending => '已开启，引擎启动后生效';

  @override
  String get phoneReturnAfterDone => '完成后返回 DSH Go';

  @override
  String get phoneReturnAfterDoneHint => '收起悬浮条，回到对话看结果';

  @override
  String get phoneFloatingBar => '悬浮条';

  @override
  String get phoneIdleOpacity => '闲置时不透明度';

  @override
  String get phoneAutoCollapse => '闲置时自动收起';

  @override
  String get phoneAutoCollapseHint => '收成小球，点按展开';

  @override
  String get phoneDeveloperOptions => '开发者选项';

  @override
  String get phoneDirectEngine => '直接启动本机引擎';

  @override
  String get phoneDirectHint => '实验功能，默认关闭，下次启动生效。部分手机（例如 Android 16）会拦截直接启动，届时自动改用兼容启动，数据不受影响。';

  @override
  String get phoneDirectFailedHint => '这台手机上直接启动没有成功，已改用兼容启动。停止引擎后打开可再试一次。';

  @override
  String get phoneDirectCompatibleHint => '这次用了兼容启动，原因见上方。已保留此选项，下次启动会再试。';

  @override
  String get phoneDirectStopFirst => '请先停止本机引擎，再切换启动方式。';

  @override
  String get phoneDirectSafeHint => '安全模式使用兼容启动；恢复正常模式后应用此选项。';

  @override
  String get phoneDirectNeedsRuntime => '此选项需要支持直接启动的运行环境。';

  @override
  String get phoneDirectChangeFailed => '未能切换启动方式，请停止本机引擎后重试。';

  @override
  String get phoneActualLaunchMode => '当前运行方式';

  @override
  String get phoneLaunchNotObserved => '未运行';

  @override
  String get phoneLastLaunchSelection => '上次启动方式';

  @override
  String get phoneDirectRejectedReason => '兼容启动原因';

  @override
  String get phoneLaunchFailureReason => '上次启动失败';

  @override
  String get phoneReturnCompatible => '切回兼容启动';

  @override
  String get phoneLaunchDirect => '直接启动';

  @override
  String get phoneLaunchCompatible => '兼容启动';

  @override
  String get phoneDirectIncompatibleFiles => '插件文件待整理，暂用兼容启动';

  @override
  String get phoneDirectNotEnoughSpace => '空间不足，暂用兼容启动';

  @override
  String get phoneDirectMigrationFailed => '文件整理未完成，暂用兼容启动';

  @override
  String get phoneDirectLaunchFailed => '直接启动未成功';

  @override
  String get phoneLaunchStartFailed => '未能完成启动';

  @override
  String phoneLaunchExited(String code) {
    return '退出码 $code';
  }

  @override
  String get phoneTaskResultReady => '任务完成 · 查看结果';

  @override
  String get phoneTaskEndedResult => '任务已结束 · 查看结果';

  @override
  String get phoneBackgroundGuideTitle => '后台确认与返回';

  @override
  String get phoneBackgroundGuideSubtitle => '让确认卡和任务结果及时出现';

  @override
  String get phoneBackgroundGuideBody => '需要你确认时，会显示 DSH Go 卡片。卡片不可用时会尝试通知或回到 App。请在系统设置中允许手机操控通知和弹出提醒。';

  @override
  String get phoneBackgroundOemHint => '在 DSH Go 的系统权限页检查「后台弹出界面」（若提供）。允许后可改善自动返回；菜单名称随系统版本变化。';

  @override
  String get phoneBackgroundReturnHint => '如果任务完成后没有自动返回，可点通知「任务完成 · 查看结果」。系统关闭通知或限制后台弹出时，可能需要手动打开 DSH Go。';

  @override
  String get phoneBackgroundGotIt => '知道了';

  @override
  String get phoneBackgroundOpenSettings => '打开系统设置';

  @override
  String get phoneBackgroundNotificationBlocked => '请允许手机操控通知的弹出提醒';

  @override
  String get phoneModeTitle => '选择确认方式';

  @override
  String get phoneModeMessage => '随时可在设置里更改';

  @override
  String get phoneModeAsk => '关键步骤先问我';

  @override
  String get phoneModeAskHint => '进新 App、发送、删除、付款前先问';

  @override
  String get phoneModeAuto => '全程自动';

  @override
  String get phoneModeAutoHint => '不再询问，全程免打扰';

  @override
  String get phoneModeAutoNoteTitle => '这些仍由你来操作';

  @override
  String get phoneModeAutoNote => '系统设置和权限页面、密码和验证码、DSH Go 自身仍由你来操作；银行、支付类 App 默认不碰，可在设置里调整。';

  @override
  String get phoneModeAutoUnlockNote => '如需让 AI 操作系统设置、密码等，可在 设置 › 手机操控 › 解除限制 中开启。';

  @override
  String get phoneModeConfirmAuto => '开启全程自动';

  @override
  String get phoneYoursTitle => '这些由你来操作';

  @override
  String get phoneYoursSystem => '系统设置和权限页面';

  @override
  String get phoneYoursSecrets => '密码和验证码';

  @override
  String get phoneYoursOwnApp => 'DSH Go 自身';

  @override
  String get phoneYoursDenyList => '应用名单里「不碰」的 App，默认含银行、支付类';

  @override
  String get phoneUnlockTitle => '解除限制';

  @override
  String get phoneUnlockSubtitle => '让 AI 去做默认由你来做的事';

  @override
  String get phoneUnlockSystem => '系统设置';

  @override
  String get phoneUnlockSystemHint => '含权限页、安装器、安全中心、通知栏';

  @override
  String get phoneUnlockSecrets => '密码和验证码';

  @override
  String get phoneUnlockSecretsHint => '填写密码、验证码和支付密码';

  @override
  String get phoneUnlockOwnApp => 'DSH Go 自身';

  @override
  String get phoneUnlockOwnAppHint => '在 DSH Go 里点按和输入';

  @override
  String get phoneUnlockBusy => '任务进行中，结束后才能开启';

  @override
  String get phoneUnlockFootnote => '解除限制会扩大 AI 的操作权限，可能造成不可逆损失。仅在需要时开启，用完关闭。';

  @override
  String get phoneUnlockBanks => '银行、支付类 App';

  @override
  String get phoneUnlockBanksHint => '在应用名单里调整';

  @override
  String get phoneUnlockNone => '均未开启';

  @override
  String phoneUnlockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '已开启 $count 项');
    return '$_temp0';
  }

  @override
  String get phoneUnlockedBadge => '已解除限制';

  @override
  String get phoneUnlockConfirmSystemTitle => '允许 AI 操作系统设置？';

  @override
  String get phoneUnlockConfirmSecretsTitle => '允许 AI 填写密码和验证码？';

  @override
  String get phoneUnlockConfirmOwnAppTitle => '允许 AI 操作 DSH Go 自身？';

  @override
  String get phoneUnlockCanTitle => '开启后，AI 可以';

  @override
  String get phoneUnlockRiskTitle => '可能出什么事';

  @override
  String get phoneUnlockDisclaimerTitle => '免责声明';

  @override
  String get phoneUnlockSystemCan1 => '打开和更改系统设置，包括权限、无障碍和开发者选项';

  @override
  String get phoneUnlockSystemCan2 => '在安装器里安装、更新或卸载应用';

  @override
  String get phoneUnlockSystemCan3 => '在安全中心和通知栏里点按，包括通知上的按钮';

  @override
  String get phoneUnlockSystemRisk1 => '网页、消息或文件里的恶意指令可能诱导 AI 关掉保护、给其他应用授权或安装应用';

  @override
  String get phoneUnlockSystemRisk2 => '改错的网络、账号或安全设置，需要你自己改回来';

  @override
  String get phoneUnlockSecretsCan1 => '在密码、验证码和支付密码框里输入';

  @override
  String get phoneUnlockSecretsCan2 => '用它在对话、短信或通知里看到的验证码完成登录或验证';

  @override
  String get phoneUnlockSecretsCan3 => '操作记录里只显示 ••••，不记下填写的内容';

  @override
  String get phoneUnlockSecretsRisk1 => '恶意指令可能诱导 AI 把验证码填到别处，让他人登录你的账号';

  @override
  String get phoneUnlockSecretsRisk2 => '可能完成你并不想要的付款或转账';

  @override
  String get phoneUnlockOwnAppCan1 => '在 DSH Go 里点按和输入，包括修改设置';

  @override
  String get phoneUnlockOwnAppCan2 => '读取 DSH Go 界面上的对话和设置';

  @override
  String get phoneUnlockOwnAppRisk1 => '恶意指令可能诱导 AI 批准它自己发起的操作，或关掉确认';

  @override
  String get phoneUnlockOwnAppRisk2 => '这些界面上的内容会发给模型';

  @override
  String get phoneUnlockDisclaimer1 => '解除限制后，AI 可能不经逐步确认便执行上述高风险操作。';

  @override
  String get phoneUnlockDisclaimer2 => 'AI 可能误判界面，或被网页、消息与文件中的恶意指令诱导。';

  @override
  String get phoneUnlockDisclaimer3 => '可能造成账号、资金、数据、设备或隐私损失，请自行核对重要操作及结果。';

  @override
  String get phoneUnlockDisclaimer4 => '软件按现状提供；免责仅在适用法律允许范围内有效，不影响依法不得排除的责任。';

  @override
  String get phoneUnlockDisclaimer5 => '仅在自有或获授权的设备上临时开启，用后关闭；请勿在存有真实支付信息的主力机上测试。';

  @override
  String get phoneUnlockHold => '我了解风险，开启';

  @override
  String get phoneUnlockHoldHint => '按住按钮约 1.5 秒';

  @override
  String phoneUnlockOnNotice(String name) {
    return '已开启「$name」';
  }

  @override
  String phoneUnlockOffNotice(String name) {
    return '已关闭「$name」';
  }

  @override
  String get searchKwPhoneUnlock => '解除限制,放开限制,密码,验证码,系统设置,自身,风险,免责';

  @override
  String get pluginConfigUnsaved => '未保存';

  @override
  String get pluginConfigSecretSet => '已设置';

  @override
  String get pluginConfigAdvanced => '高级';

  @override
  String get pluginConfigSearchHint => '搜索设置';

  @override
  String get pluginConfigNoMatch => '没有匹配的设置';

  @override
  String get pluginConfigOpenWeb => '在网页版设置';

  @override
  String get pluginConfigOpenWebHint => '插件自带的设置页';

  @override
  String get pluginConfigResetAll => '全部恢复默认';

  @override
  String get pluginConfigResetAllTitle => '全部恢复默认？';

  @override
  String get pluginConfigReset => '恢复';

  @override
  String pluginConfigChanges(int count) {
    return '$count 项更改';
  }

  @override
  String get pluginConfigAppliesOnReload => '保存后重新载入插件';

  @override
  String get pluginConfigSaving => '正在保存…';

  @override
  String get pluginConfigReloading => '正在重新载入…';

  @override
  String get pluginConfigApplied => '已生效';

  @override
  String get pluginConfigFailed => '没能生效';

  @override
  String get pluginConfigRestored => '已恢复原设置';

  @override
  String get pluginConfigStopped => '没能生效，原设置也没能恢复';

  @override
  String get pluginConfigRestore => '恢复原设置';

  @override
  String get pluginConfigDiscard => '放弃';

  @override
  String get pluginConfigNotStarted => '插件没有启动';

  @override
  String get pluginConfigNone => '没有可设置的项';

  @override
  String get pluginConfigInvalidOperation => '这项改动无法应用';

  @override
  String get pluginConfigGone => '插件已不在运行，已刷新';

  @override
  String get pluginConfigUnknown => '连接中断，已重新读取';

  @override
  String get pluginConfigUnsupported => '暂不支持在这里设置';

  @override
  String get pluginConfigSecretUnbound => '需插件适配后设置';

  @override
  String get pluginConfigListFailed => '插件清单读取失败，稍后重试';

  @override
  String get pluginConfigListUpdating => '插件清单正在更新，请稍后再试';

  @override
  String get pluginConfigFixed => '由配置文件固定';

  @override
  String get pluginConfigFixedNote => '由配置文件固定，这里只能查看';

  @override
  String get pluginConfigReadOnly => '只读';

  @override
  String pluginConfigEntryTitle(String bundle, String entry) {
    return '$bundle · $entry';
  }

  @override
  String get pluginConfigNameSpeechToText => '语音识别';

  @override
  String get pluginConfigNameSenseVoice => 'SenseVoice 识别';

  @override
  String get pluginConfigNameSpeechApi => '转写接口';

  @override
  String get pluginConfigNameTranslator => '翻译服务';

  @override
  String get pluginConfigNameSessionIndex => '会话索引';

  @override
  String get pluginConfigNameSessionSearchTool => '会话搜索工具';

  @override
  String get pluginConfigNameTerminalService => '终端服务';

  @override
  String get pluginConfigNameTerminalBash => 'Bash 终端';

  @override
  String get pluginConfigNameTerminalPwsh => 'PowerShell 终端';

  @override
  String get pluginConfigNameTerminalTools => '终端工具';

  @override
  String get pluginConfigNameWorktree => '工作树管理';

  @override
  String get pluginConfigNameWorktreeTools => '工作树工具';

  @override
  String get pluginConfigNameRalphWorkflow => '工作流引擎';

  @override
  String get pluginConfigNameRalphTools => 'Ralph 工具';

  @override
  String get plugInputRequired => '请填写此项';

  @override
  String get plugInputInvalidValue => '此处的值无效';

  @override
  String get plugInputNumber => '请输入有效数字';

  @override
  String plugInputBounds(String min, String max) {
    return '请输入 $min–$max 之间的值';
  }

  @override
  String plugInputLength(int min, int max) {
    return '长度需为 $min–$max 个字符';
  }

  @override
  String get plugInputPattern => '格式不正确';

  @override
  String get plugInputDate => '请选择有效日期';

  @override
  String get plugInputTime => '请选择有效时间';

  @override
  String get plugInputUnavailable => '此处不支持这个组件';

  @override
  String get plugInputNoPassword => '插件不能使用密码输入框';

  @override
  String get plugInputBadBinding => '输入绑定必须是 data 下的字段路径';

  @override
  String get plugInputDuplicateBinding => '一个字段只能绑定一个输入组件';

  @override
  String get plugInputNamedPattern => '只支持内置的格式校验';

  @override
  String get plugInputNestedForm => '表单不能嵌套';

  @override
  String get plugInputSubmitMissing => '表单缺少提交动作';

  @override
  String get plugInputTooLarge => '内容过多，请缩短后重试';

  @override
  String get plugInputCheckFields => '请检查标出的项目';

  @override
  String get plugInputFailed => '未保存，请重试';

  @override
  String get plugInputSubmit => '保存';

  @override
  String get plugInputChoose => '选择';

  @override
  String get plugInputPrevious => '上一页';

  @override
  String get plugInputNext => '下一页';

  @override
  String plugInputDecrease(String label) {
    return '减少$label';
  }

  @override
  String plugInputIncrease(String label) {
    return '增加$label';
  }

  @override
  String plugInputRating(String label, int value, int max) {
    return '$label：$value 分，共 $max 分';
  }

  @override
  String get plugInputFormula => '公式无效或超出上限';

  @override
  String get plugInputDatePicker => '插件日期';

  @override
  String get plugInputTimePicker => '插件时间';

  @override
  String get plugInputChoices => '插件选项';

  @override
  String get plugInputGestureRequired => '该效果需要用户点按';

  @override
  String get pluginsOperationHostChanged => '主机已切换，未执行';

  @override
  String get pluginsReloadLocal => '重启内核以重载';

  @override
  String get pluginsReloadInterrupts => '会中断正在运行的任务';

  @override
  String pluginsReloadConfirm(String name) {
    return '重载「$name」？';
  }

  @override
  String get pluginsReloadExplanation => '将重启本机内核，重新加载插件。正在运行的任务会中断。';

  @override
  String get pluginsReloadProceed => '重启并重载';

  @override
  String get pluginsReloadRequested => '已请求重启内核';

  @override
  String get pluginsReloadChanged => '主机或插件状态已变化，请重试';

  @override
  String get pluginsReloadFailed => '未能重启内核，请查看引擎日志';

  @override
  String get pluginsFile => '文件';

  @override
  String get pluginsChat => '对话';

  @override
  String get pluginsImage => '图片';

  @override
  String get pluginsNamespaceDefaultModel => '默认模型';

  @override
  String get pluginsNamespaceDefaultPreset => '默认预设';

  @override
  String get pluginsNamespaceAgent => '智能体';

  @override
  String get pluginsNamespaceSubagent => '子代理';

  @override
  String get pluginsNamespaceSubagentModels => '子代理模型';

  @override
  String get pluginsNamespaceDeepSeekModel => 'DeepSeek 模型';

  @override
  String get pluginsNamespaceAccountModel => 'DeepSeek 账号模型';

  @override
  String get pluginsNamespaceCustomModels => '自定义模型服务';

  @override
  String get pluginsNamespaceNetwork => '联网';

  @override
  String get pluginsNamespaceWebSearch => '联网搜索';

  @override
  String get pluginsNamespaceSearchApi => '联网搜索接口';

  @override
  String get pluginsNamespaceCommands => '命令执行';

  @override
  String get pluginsNamespacePermissions => '权限';

  @override
  String get pluginsNamespaceChatLog => '对话日志';

  @override
  String get pluginsNamespaceThinkingTranslation => '思考翻译';

  @override
  String get pluginsNamespaceTranslation => '翻译';

  @override
  String get pluginsNamespaceLanguage => '语言';

  @override
  String get pluginsNamespaceWebAppearance => '网页版外观';

  @override
  String get pluginsNamespaceWebChat => '网页版对话';

  @override
  String get pluginsNamespaceWebInput => '网页版输入';

  @override
  String get pluginsNamespaceWebSettings => '网页版设置';

  @override
  String get pluginsNamespaceWebGeneral => '网页版通用';

  @override
  String get pluginsNamespaceAutoReview => '自动审查';

  @override
  String get pluginsNamespaceAgentTeam => '智能体团队';

  @override
  String get pluginsNamespaceVoiceInput => '语音输入';

  @override
  String get pluginsOfficialPlugin => '官方插件';

  @override
  String get pluginsLocalUnshareable => '本地安装，无法分享';

  @override
  String pluginsIncludesPresets(String names) {
    return '含预设「$names」';
  }

  @override
  String get pluginsSecretsUnshareable => '含有密钥，无法分享';

  @override
  String pluginsLineCount(int count) {
    return '$count 行';
  }

  @override
  String get pluginsEmptyValue => '空';

  @override
  String get pluginsOnValue => '开';

  @override
  String get pluginsOffValue => '关';

  @override
  String get pluginsOfficialUnavailable => '这台主机没有这个官方插件';

  @override
  String get pluginsEnabled => '已启用';

  @override
  String get pluginsVersionMismatch => '与分享时的版本不一致';

  @override
  String get pluginsCurrentVersion => '当前版本';

  @override
  String get pluginsNewVersion => '新版本';

  @override
  String pluginsAddedWith(String title) {
    return '随「$title」添加';
  }

  @override
  String pluginsApplyAfterInstall(String detail) {
    return '装好插件后应用 · $detail';
  }

  @override
  String get pluginsSettingsReadFailed => '没能读取这台主机的设置';

  @override
  String get pluginsSettingUnavailable => '这台主机没有这项设置';

  @override
  String get pluginsSettingsReadOnly => '这台主机的设置是只读的';

  @override
  String get pluginsImportLocalOnly => '只能导入到本机';

  @override
  String get pluginsReplaceSkill => '替换同名技能';

  @override
  String get pluginsReplaceContent => '替换现有内容';

  @override
  String get pluginsSafeModeInstallBlocked => '安全模式下不能安装插件';

  @override
  String get pluginsHostInstallBlocked => '这台主机不能从这里安装插件';

  @override
  String get pluginsInstallFailed => '安装失败';

  @override
  String get pluginsAfterRestart => '重启后生效';

  @override
  String get pluginsSettingsChanged => '设置刚被改过';

  @override
  String get pluginsWriteFailed => '没能写入';

  @override
  String get pluginsHostUnreachable => '没能连上主机';

  @override
  String get pluginsFileWriteFailed => '没能写入文件';

  @override
  String get pluginsProfileTitle => 'DSH Go 配置';

  @override
  String get pluginsGistTokenInvalid => 'GitHub 令牌无效或没有 Gist 权限';

  @override
  String pluginsGistCreateHttpFailed(int status) {
    return '没能创建 Gist（HTTP $status）';
  }

  @override
  String get pluginsGistCreateFailed => '没能创建 Gist';

  @override
  String get pluginsGitHubUnreachable => '连不上 GitHub';

  @override
  String get pluginsGitHubTimeout => '连接 GitHub 超时';

  @override
  String get pluginsGistNotFound => '找不到这个 Gist';

  @override
  String get pluginsGistNoProfile => '这个 Gist 里没有可导入的配置';

  @override
  String get pluginsGistReadFailed => '没能读取 Gist';

  @override
  String get pluginsListReadFailed => '没能读取插件列表';

  @override
  String get pluginsReadingPlugins => '正在读取插件…';

  @override
  String get pluginsDshOfficial => 'DSH 官方';

  @override
  String get pluginsOfficialToggleOnly => '官方组件只能开关，不能卸载；对这台主机上的所有对话生效';

  @override
  String get pluginsOfficial => '官方';

  @override
  String get pluginsNoThirdParty => '还没装第三方插件';

  @override
  String get pluginsPluginsDescription => '插件能给 DSH 加工具、记忆和模型';

  @override
  String get pluginsBrowseMarket => '逛逛插件市场';

  @override
  String get pluginsLoading => '正在加载';

  @override
  String get pluginsIslandClosed => '插件界面已关闭';

  @override
  String get pluginsReopen => '重新打开';

  @override
  String pluginsOpenBrowserHost(String host) {
    return '在浏览器打开 $host？';
  }

  @override
  String get pluginsSearch => '搜索插件';

  @override
  String get pluginsMarketLoading => '正在载入插件目录…';

  @override
  String get pluginsMarketLoadFailed => '插件目录没打开';

  @override
  String get pluginsMarketInvalid => '目录格式有误';

  @override
  String get pluginsAll => '全部';

  @override
  String pluginsMarketCount(int count) {
    return '$count 个插件 · 来自 dshfind';
  }

  @override
  String get pluginsHideWeb => '隐藏网页版插件';

  @override
  String pluginsShowWebCount(int count) {
    return '显示 $count 个网页版插件';
  }

  @override
  String get pluginsNoCategoryPlugins => '这个分类下没有插件';

  @override
  String pluginsNoSearchResults(String query) {
    return '没有找到「$query」';
  }

  @override
  String pluginsFailureDetails(String title) {
    return '$title · 点开查看';
  }

  @override
  String get pluginsFeatured => '推荐';

  @override
  String pluginsInstalledRemoteRestart(String name, String host) {
    return '已安装「$name」，重启$host上的 DSH 后生效';
  }

  @override
  String pluginsInstalledNamed(String name) {
    return '已安装「$name」';
  }

  @override
  String get pluginsInstallCancelled => '已取消安装';

  @override
  String pluginsInstallFailureNamed(String name, String reason) {
    return '「$name」$reason';
  }

  @override
  String get pluginsRestartRequired => '需要重启引擎';

  @override
  String pluginsRestartExplanation(String name) {
    return '「$name」重启引擎后生效，进行中的回复会中断。';
  }

  @override
  String get pluginsRestartEngine => '重启引擎';

  @override
  String get pluginsAllowBuildScripts => '允许构建脚本？';

  @override
  String get pluginsBuildScriptPackages => '下面这些包要在安装时运行脚本：';

  @override
  String pluginsBuildScriptWarning(String host) {
    return '脚本会以 DSH 的权限在$host上执行，能读写文件、联网。只在你信任这个插件时允许。';
  }

  @override
  String get pluginsThisDevice => '这台设备';

  @override
  String get pluginsAllowRetry => '允许并重试';

  @override
  String pluginsUpdateNamed(String name) {
    return '更新「$name」？';
  }

  @override
  String pluginsUninstallNamed(String title) {
    return '卸载「$title」？';
  }

  @override
  String pluginsUninstallExplanation(String host) {
    return '插件会从$host上移除，它保存的数据和设置不会删除。';
  }

  @override
  String get pluginsThisHost => '这台主机';

  @override
  String get pluginsUninstall => '卸载';

  @override
  String pluginsUninstalledNamed(String title) {
    return '已卸载「$title」';
  }

  @override
  String get pluginsRestartNow => '立即重启';

  @override
  String get pluginsUninstallFailed => '没能卸载';

  @override
  String get pluginsThatComputer => '那台电脑';

  @override
  String get pluginsCommandAfterInstall => '装好后重启那台电脑上的 DSH，再回来刷新';

  @override
  String get pluginsError => '出错';

  @override
  String get pluginsInventoryTitle => '插件清单';

  @override
  String get pluginsGlobalPlugins => '全局插件';

  @override
  String get pluginsAgentPresets => 'Agent 预设';

  @override
  String get pluginsInventoryReadFailed => '没能读取插件清单';

  @override
  String pluginsComponentCount(int count) {
    return '$count 个组件';
  }

  @override
  String pluginsEnabledCount(int count) {
    return '$count 个已启用';
  }

  @override
  String pluginsErrorCount(int count) {
    return '$count 个出错';
  }

  @override
  String get pluginsNoPlugins => '没有插件';

  @override
  String get pluginsNoMatchingPlugins => '没有匹配的插件';

  @override
  String get pluginsPresetLoadFailed => '这个预设没能加载';

  @override
  String get pluginsPresetNoPlugins => '这个预设没有插件';

  @override
  String get pluginsStandard => '标准';

  @override
  String get pluginsMinimal => '精简';

  @override
  String pluginsDefaultPresetName(String name) {
    return '$name（默认）';
  }

  @override
  String get pluginsSystemComponents => '系统组件';

  @override
  String pluginsCount(int count) {
    return '$count 个';
  }

  @override
  String get pluginsSource => '来源';

  @override
  String get pluginsDisableCondition => '禁用条件';

  @override
  String get pluginsProvidedByPreset => '由预设提供';

  @override
  String get pluginsDetailsTitle => '插件详情';

  @override
  String pluginsPackageInfoError(String error) {
    return '包信息有误：$error';
  }

  @override
  String get pluginsInstalling => '安装中';

  @override
  String get pluginsGet => '获取';

  @override
  String get pluginsLoadingCannotCancel => '正在加载插件，这一步不能取消';

  @override
  String get pluginsInstallDuration => '约需一两分钟，可以先离开';

  @override
  String get pluginsViewInstallLogs => '查看安装日志';

  @override
  String get pluginsViewDetails => '查看详情';

  @override
  String get pluginsCopyCommand => '复制命令';

  @override
  String get pluginsCommandCopied => '命令已复制';

  @override
  String get pluginsMissingFiles => '插件文件缺失，重新安装可修复';

  @override
  String get pluginsNotDshPlugin => '不是 DSH 插件，无法加载';

  @override
  String get pluginsIncompatible => '与当前 DSH 版本不兼容，未加载';

  @override
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion) {
    return '需要 DSH $requiredVersion，当前 $currentVersion，未加载';
  }

  @override
  String pluginsLoadFailure(String reason) {
    return '加载失败：$reason';
  }

  @override
  String get pluginsUnknownReason => '原因未知';

  @override
  String pluginsBundleProblem(String reason) {
    return '有问题：$reason';
  }

  @override
  String pluginsRefreshFailure(String reason) {
    return '刷新失败：$reason';
  }

  @override
  String get pluginsTitle => '插件';

  @override
  String get pluginsRefresh => '刷新';

  @override
  String get pluginsMarketTitle => '插件市场';

  @override
  String get pluginsConnectToManage => '连上引擎后管理插件';

  @override
  String get pluginsSafeModeOperationsBlocked => '安全模式下不能安装或卸载插件';

  @override
  String pluginsRelayToggleOnly(String host) {
    return '$host · 经中转只能开关，安装请在那台电脑上进行';
  }

  @override
  String get pluginsInstallThisPhone => '安装到：本机';

  @override
  String pluginsInstallHost(String host) {
    return '安装到：$host';
  }

  @override
  String get pluginsOfflineDescription => '引擎运行后显示已装插件，插件市场现在就能逛';

  @override
  String get pluginsIconChanged => '桌面图标已更换，几秒后生效';

  @override
  String get pluginsIconChangeFailed => '没能更换，稍后再试';

  @override
  String get pluginsTheme => '主题';

  @override
  String get pluginsAppearance => '外观';

  @override
  String get pluginsColors => '配色';

  @override
  String get pluginsFeatureIcons => '功能图标';

  @override
  String get pluginsAppIcon => '桌面图标';

  @override
  String get pluginsPet => '宠物';

  @override
  String get pluginsCustomColor => '自定义';

  @override
  String pluginsColorLabel(String label) {
    return '配色：$label';
  }

  @override
  String get pluginsCoral => '珊瑚';

  @override
  String get pluginsRouge => '胭脂';

  @override
  String get pluginsOchre => '赭石';

  @override
  String get pluginsMoss => '苔绿';

  @override
  String get pluginsLake => '湖蓝';

  @override
  String get pluginsIndigo => '靛紫';

  @override
  String get pluginsHue => '色相';

  @override
  String get pluginsWallpaper => '壁纸';

  @override
  String get pluginsFollowWallpaper => '跟随壁纸';

  @override
  String get pluginsAllowHighPower => '允许后台高耗电';

  @override
  String pluginsVivoBatteryPath(String app) {
    return '电池 › 后台耗电管理 › $app';
  }

  @override
  String get pluginsXiaomiBatterySetting => '省电策略：无限制';

  @override
  String pluginsXiaomiBatteryPath(String app) {
    return '应用管理 › $app › 省电策略';
  }

  @override
  String get pluginsHuaweiBatterySetting => '允许后台活动';

  @override
  String pluginsHuaweiBatteryPath(String app) {
    return '电池 › 应用启动管理 › $app';
  }

  @override
  String get pluginsOppoBatterySetting => '允许后台行为';

  @override
  String pluginsOppoBatteryPath(String app) {
    return '电池 › 应用耗电管理 › $app';
  }

  @override
  String get pluginsSamsungBatterySetting => '电池：不受限制';

  @override
  String pluginsSamsungBatteryPath(String app) {
    return '应用程序 › $app › 电池';
  }

  @override
  String get pluginsVivoBatteryStep => '打开「允许后台高耗电」';

  @override
  String pluginsXiaomiBatteryFullPath(String app) {
    return '应用设置 › 应用管理 › $app › 省电策略 › 无限制';
  }

  @override
  String get pluginsXiaomiAutostart => '同一页打开「自启动」';

  @override
  String get pluginsHuaweiBatteryStep => '关闭「自动管理」，打开「允许后台活动」';

  @override
  String get pluginsOppoBatteryStep => '打开「允许后台行为」';

  @override
  String get pluginsSamsungBatteryStep => '选择「不受限制」';

  @override
  String get pluginsBackgroundTitle => '后台运行';

  @override
  String get pluginsBackgroundDescription => '让对话在后台也能跑完';

  @override
  String get pluginsSystem => '系统';

  @override
  String get pluginsSystemBatteryOptimization => '系统电池优化';

  @override
  String get pluginsTurnedOff => '已关闭';

  @override
  String get pluginsNotTurnedOff => '未关闭';

  @override
  String get pluginsStayOnline => '保持在线';

  @override
  String get pluginsKeepEngineNotification => '保留「引擎运行中」通知';

  @override
  String pluginsLockInRecents(String app) {
    return '在最近任务里锁定 $app';
  }

  @override
  String get pluginsPhoneBrands => '各品牌';

  @override
  String get pluginsOtherBrands => '其他品牌';

  @override
  String pluginsConnectedHost(String host) {
    return '已连接（$host）';
  }

  @override
  String pluginsConnectionError(String error) {
    return '连接失败：$error';
  }

  @override
  String get pluginsConnecting => '正在连接';

  @override
  String get pluginsDiagnosticsCopied => '已复制诊断信息';

  @override
  String get pluginsDiagnostics => '诊断';

  @override
  String get pluginsDiagnosticsDescription => '反馈问题时附上，不含 Key 和令牌';

  @override
  String get pluginsRuntime => '运行环境';

  @override
  String get pluginsArchitecture => '架构';

  @override
  String get pluginsBundledVersion => '内置版本';

  @override
  String get pluginsInstalledVersion => '已安装版本';

  @override
  String get pluginsErrorLabel => '错误';

  @override
  String get pluginsConnection => '连接';

  @override
  String get pluginsAddress => '地址';

  @override
  String get pluginsClient => '客户端';

  @override
  String get pluginsConfigured => '已设置';

  @override
  String get pluginsExport => '导出';

  @override
  String get pluginsCopyDiagnostics => '复制诊断信息';

  @override
  String get pluginsDiagnosticsContents => '只含版本和连接状态';

  @override
  String get pluginsNotificationsPartlyBlocked => '部分被系统关闭';

  @override
  String get pluginsNotificationsBlocked => '系统已关闭';

  @override
  String get pluginsTurnedOn => '已开启';

  @override
  String get pluginsNotifications => '通知';

  @override
  String get pluginsNotificationSettingsFailed => '没能打开系统设置。到「设置 → 应用 → DSH Go → 通知」里开启';

  @override
  String get pluginsSystemNotificationsOff => '系统通知已关闭';

  @override
  String get pluginsBackgroundNoAlerts => 'App 在后台时收不到任何提醒';

  @override
  String get pluginsApprovalNotificationsOff => '「等你确认」通知已关闭';

  @override
  String get pluginsBackgroundNoApprovalAlerts => 'App 在后台时，等你确认不会提醒';

  @override
  String get pluginsDoneNotificationsOff => '「一轮结束」通知已关闭';

  @override
  String get pluginsBackgroundNoDoneAlerts => 'App 在后台时，完成或出错不会提醒';

  @override
  String get pluginsTurnOn => '去开启';

  @override
  String get pluginsNotificationsDescription => '对话完成或需要你时提醒你';

  @override
  String get pluginsAllowNotifications => '允许通知';

  @override
  String get pluginsNotificationsAndBanners => '系统通知与顶部横幅';

  @override
  String get pluginsAlerts => '提醒';

  @override
  String get pluginsRemoteAlertsRequirement => '远程主机的提醒需要 App 在运行、连接在线';

  @override
  String get pluginsTurnComplete => '一轮完成';

  @override
  String get pluginsReplyPreview => '附带回复的开头';

  @override
  String get pluginsErrorOrStopped => '出错或被停下';

  @override
  String get pluginsErrorOrStoppedDescription => '请求失败、引擎重启或被停止';

  @override
  String get pluginsApprovalDescription => '运行命令、改文件等需要批准';

  @override
  String get pluginsQuestions => '向你提问';

  @override
  String get pluginsQuestionsDescription => 'AI 需要你回答';

  @override
  String get pluginsSystemSettings => '系统设置';

  @override
  String get pluginsLockScreenPrivacy => '锁屏不显示对话内容';

  @override
  String get pluginsSoundBannerLockScreen => '声音、横幅与锁屏';

  @override
  String get pluginsEnableFloatingNotifications => '横幅不弹时，开启「悬浮通知」';

  @override
  String get pluginsPersonalPreferences => '个人偏好';

  @override
  String get pluginsPreferencesDescription => '新对话会照这里的要求回答';

  @override
  String get pluginsPreferencesHint => '比如：用中文回答，我主要写 Flutter';

  @override
  String get pluginsSaving => '正在保存';

  @override
  String get pluginsShareLink => '分享链接';

  @override
  String get pluginsInstallPlugin => '安装插件';

  @override
  String get pluginsImportProfile => '导入配置';

  @override
  String get pluginsImportTo => '导入到';

  @override
  String get pluginsInstallTo => '安装到';

  @override
  String get pluginsVerification => '校验';

  @override
  String get pluginsSize => '大小';

  @override
  String get pluginsVerified => '校验通过';

  @override
  String get pluginsVerificationMismatch => '校验不一致';

  @override
  String get pluginsCannotVerify => '无法校验';

  @override
  String get pluginsVerifying => '校验中';

  @override
  String get pluginsPresets => '预设';

  @override
  String get pluginsSkills => '技能';

  @override
  String get pluginsAdded => '新增';

  @override
  String get pluginsModified => '修改';

  @override
  String get pluginsNoChanges => '无需改动';

  @override
  String get pluginsUnavailable => '不可用';

  @override
  String get pluginsHostProfileReadFailed => '没能读取这台主机的配置';

  @override
  String get pluginsAlreadyMatches => '这台主机上已经是这样了';

  @override
  String get pluginsUnsuccessful => '没成功';

  @override
  String get pluginsSkipped => '已跳过';

  @override
  String get pluginsView => '查看';

  @override
  String get pluginsImport => '导入';

  @override
  String get pluginsHostPluginsReadFailed => '没能读取这台主机的插件';

  @override
  String pluginsUpdateTo(String version) {
    return '更新到 $version';
  }

  @override
  String pluginsImportCount(int count) {
    return '导入 $count 项';
  }

  @override
  String get pluginsImporting => '正在导入';

  @override
  String get pluginsInstallingActive => '正在安装';

  @override
  String pluginsImportFailedCount(int count) {
    return '$count 项没成功';
  }

  @override
  String get pluginsCouldNotInstall => '没能安装';

  @override
  String get pluginsEngineRestartToApply => '重启引擎后生效';

  @override
  String pluginsRemoteRestartToApply(String host) {
    return '重启$host上的 DSH 后生效';
  }

  @override
  String pluginsImportedCount(int count) {
    return '已导入 $count 项';
  }

  @override
  String get pluginsLocalPluginUnshareable => '这个插件是本地安装的，无法分享';

  @override
  String get pluginsSharePlugin => '分享插件';

  @override
  String pluginsPluginCount(int count) {
    return '$count 个插件';
  }

  @override
  String pluginsSettingsCount(int count) {
    return '$count 项设置';
  }

  @override
  String pluginsPresetCount(int count) {
    return '$count 个预设';
  }

  @override
  String pluginsSkillCount(int count) {
    return '$count 个技能';
  }

  @override
  String get pluginsNothingSelected => '未选择内容';

  @override
  String get pluginsNext => '下一步';

  @override
  String get pluginsNothingToShare => '没有可以分享的内容';

  @override
  String get pluginsProfileReadFailed => '没能读取配置';

  @override
  String get pluginsShareProfile => '分享配置';

  @override
  String pluginsFileCount(int count) {
    return '$count 个文件';
  }

  @override
  String get pluginsShareNeedsUpdate => '需要更新 App 才能打开';

  @override
  String get pluginsShareUnusable => '这个分享码无法使用';

  @override
  String get pluginsShareDamaged => '这个分享码不完整或已损坏';

  @override
  String get pluginsShareFileReadFailed => '没能读取这个文件';

  @override
  String get pluginsShareOpenFailed => '没能打开这个分享码';

  @override
  String get pluginsPluginShareTitle => 'DSH Go 插件';

  @override
  String get pluginsShareSheetOpenFailed => '没能打开分享';

  @override
  String get pluginsSavePermissionDenied => '没有存储权限，没能保存';

  @override
  String get pluginsQrCode => '二维码';

  @override
  String get pluginsSaveAsFile => '存为文件';

  @override
  String get pluginsGistLinkReady => '已生成 Gist 链接';

  @override
  String get pluginsTooLargeShareFile => '内容较多，以文件分享';

  @override
  String get pluginsGenerateLink => '生成链接';

  @override
  String get pluginsGitHubToken => 'GitHub 令牌';

  @override
  String get pluginsGistPermissionNeeded => '需要 gist 权限';

  @override
  String get pluginsGenerateGistLink => '用 Gist 生成链接';

  @override
  String get pluginsShareQrCode => '分享码二维码';

  @override
  String pluginsUpdateCurrentWarning(String to) {
    return '会先卸载当前版本，再安装 $to。如果新版本没装上，插件会处于未安装状态，需要重新安装。';
  }

  @override
  String pluginsUpdateVersionWarning(String from, String to) {
    return '会先卸载 $from，再安装 $to。如果新版本没装上，插件会处于未安装状态，需要重新安装。';
  }

  @override
  String pluginsUninstalledRestartLocal(String title) {
    return '已卸载「$title」，重启引擎后完全移除';
  }

  @override
  String pluginsUninstalledRestartRemote(String title, String host) {
    return '已卸载「$title」，重启$host上的 DSH 后完全移除';
  }

  @override
  String get pluginsEnableFailed => '没能启用';

  @override
  String get pluginsDisableFailed => '没能停用';

  @override
  String get pluginsEnabledRestartLocal => '已启用，重启引擎后生效';

  @override
  String pluginsEnabledRestartRemote(String host) {
    return '已启用，重启$host上的 DSH 后生效';
  }

  @override
  String get pluginsDisabledRestartLocal => '已停用，重启引擎后生效';

  @override
  String pluginsDisabledRestartRemote(String host) {
    return '已停用，重启$host上的 DSH 后生效';
  }

  @override
  String pluginsRelayCommandInstruction(String host) {
    return '经 DSH Remote 中转时只能开关插件。在$host的终端里运行：';
  }

  @override
  String get pluginsPermissionLocalThirdParty =>
      '插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key 和已授权的手机存储，不受工作区沙箱限制。由第三方提供，DSH 官方未审核。';

  @override
  String get pluginsPermissionLocalTrusted => '插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key 和已授权的手机存储，不受工作区沙箱限制。只装你信任的插件。';

  @override
  String get pluginsPermissionRemoteThirdParty => '插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key，不受工作区沙箱限制。由第三方提供，DSH 官方未审核。';

  @override
  String get pluginsPermissionRemoteTrusted => '插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key，不受工作区沙箱限制。只装你信任的插件。';

  @override
  String pluginsSelectedQrCount(int count) {
    return '已选 $count 项 · 可生成二维码';
  }

  @override
  String pluginsSelectedFileCount(int count) {
    return '已选 $count 项 · 以文件分享';
  }

  @override
  String get pluginsListSeparator => '、';

  @override
  String pluginsActionFailure(String action, String reason) {
    return '$action：$reason';
  }

  @override
  String pluginsInventorySemantics(String title, String status) {
    return '$title，$status';
  }

  @override
  String pluginsSettingsChanges(String shown, int count) {
    return '$shown 等 $count 项';
  }

  @override
  String get pluginsLoadStatus => '加载状态';

  @override
  String get pluginsLoadPartial => '部分生效';

  @override
  String get pluginsLoadFailed => '加载失败';

  @override
  String get pluginsLoadNotReady => '尚未就绪';

  @override
  String get pluginsLoadMetadata => '元数据诊断';

  @override
  String pluginsLoadRunningCount(int running, int total) {
    return '$running / $total 个组件运行中';
  }

  @override
  String get pluginsLoadUnreported => '状态未报告';

  @override
  String get pluginsLoadNoRuntimeDetail => '主机未返回运行时错误详情，请查看引擎日志。';

  @override
  String get pluginsLoadRemoteLogs => '请在这台主机上查看引擎日志。';

  @override
  String get plugslotsSurfaceComposerActions => '输入框按钮';

  @override
  String get plugslotsSurfaceMessageActions => '消息菜单';

  @override
  String get plugslotsSurfaceComposerStrip => '状态条';

  @override
  String get plugslotsSurfacePanel => '面板';

  @override
  String get plugslotsNativeUi => '原生界面';

  @override
  String plugslotsIssueCount(int count) {
    return '$count 项有误';
  }

  @override
  String get plugslotsAllGood => '正常';

  @override
  String plugslotsViewSize(String size) {
    return '视图 $size';
  }

  @override
  String plugslotsInvokeMs(int ms) {
    return '响应 $ms ms';
  }

  @override
  String get plugslotsLastView => '最近视图';

  @override
  String get plugslotsLastInvoke => '最近响应';

  @override
  String get plugslotsProblems => '问题';

  @override
  String get plugslotsNoProblems => '没有问题';

  @override
  String plugslotsWantsDraft(String plugin) {
    return '「$plugin」要读取输入框';
  }

  @override
  String plugslotsWantsClipboard(String plugin) {
    return '「$plugin」要读取剪贴板';
  }

  @override
  String plugslotsWantsBoth(String plugin) {
    return '「$plugin」要读取输入框和剪贴板';
  }

  @override
  String get plugslotsWantsWhen => '只在点按它时读取';

  @override
  String get plugslotsAllow => '允许';

  @override
  String plugslotsNoResponse(String plugin) {
    return '「$plugin」没有响应';
  }

  @override
  String plugslotsFailed(String plugin) {
    return '「$plugin」出错了';
  }

  @override
  String get plugslotsNeedsChat => '先打开一个对话';

  @override
  String plugslotsFromPlugin(String plugin) {
    return '来自「$plugin」';
  }

  @override
  String get plugslotsPanelOffline => '连不上插件';

  @override
  String plugslotsIssueTooMany(int max) {
    return '最多 $max 个，其余不显示';
  }

  @override
  String plugslotsIssueTrimmed(int max) {
    return '超过 $max 字，已截断';
  }

  @override
  String plugslotsIssueNeedsApp(String version) {
    return '需要 DSH Go $version 或更新版本';
  }

  @override
  String get plugslotsIssueNewerProtocol => '需要更新 App';

  @override
  String get plugslotsIssueUnknownIcon => '不认识的图标，已换成默认图标';

  @override
  String plugslotsIssueUnknownEffect(String name) {
    return '不支持的效果「$name」';
  }

  @override
  String get plugslotsIssueLate => '点按 3 秒后才返回，已忽略';

  @override
  String get plugslotsIssueHttps => '只支持 https 链接';

  @override
  String plugslotsIssueUnknownPage(String page) {
    return '没有「$page」这个页面';
  }

  @override
  String get plugslotsIssueThrottled => '提示太频繁，已略过';

  @override
  String plugslotsIssueInvoke(String message) {
    return '调用失败：$message';
  }

  @override
  String plugslotsIssueStream(String message) {
    return '数据出错：$message';
  }

  @override
  String get plugslotsIssueMissing => '缺少必填项';

  @override
  String get plugslotsIssueDuplicate => 'id 重复，已略过';

  @override
  String get plugslotsIssueNoPlacement => '没有可放的位置';

  @override
  String plugslotsWantsMessage(String plugin) {
    return '「$plugin」要读取这条回复';
  }

  @override
  String get plugslotsCodeInvalidManifest => '声明有误，原生部分已停用';

  @override
  String get plugslotsCodeInvalidField => '格式不对，已略过';

  @override
  String get plugslotsCodeUnknownField => '不认识的字段，已忽略';

  @override
  String get plugslotsCodeUnknownSurface => '这个位置还不支持，已忽略';

  @override
  String get plugslotsCodeTooMany => '超出数量，多余的不显示';

  @override
  String get plugslotsCodeTooLong => '文字太长，已截断';

  @override
  String get plugslotsCodeNoHandler => '插件还没处理这一项，暂不显示';

  @override
  String get plugslotsCodeUndeclared => '注册了清单里没有的项，已忽略';

  @override
  String get plugslotsCodeViewFile => '视图文件读不出';

  @override
  String get plugslotsCodeBadEffect => '动作格式不对，已略过';

  @override
  String plugslotsCodeViolation(int count) {
    return '出错 $count 次';
  }

  @override
  String get plugslotsCodeDegraded => '出错太多，已停用到下次启动';

  @override
  String get plugslotsCodeTimeout => '插件没有及时响应';

  @override
  String get plugslotsCodeRateLimited => '点得太快了';

  @override
  String get plugslotsCodeNotFound => '插件已停用或找不到';

  @override
  String get plugslotsCodePluginError => '插件出错';

  @override
  String get plugslotsCodeInvalidView => '视图有误';

  @override
  String get plugslotsCodeLimit => '订阅太多';

  @override
  String get plugslotsCodeOther => '其他问题';

  @override
  String get plugslotsCodeUnknownEffect => '不支持的动作，已略过';

  @override
  String get plugslotsNotDone => '没完成';

  @override
  String get plugslotsWorking => '进行中';

  @override
  String get plugslotsTapToCancel => '点按取消';

  @override
  String get plugslotsCodeTooManyPending => '还有两件没做完';

  @override
  String get plugslotsCodeNoStream => '连接断了';

  @override
  String plugslotsVoiceAsk(String plugin) {
    return '允许「$plugin」听你开口？';
  }

  @override
  String get plugslotsVoiceWhen => '朗读时你一开口就停。声音只在手机上判断，不保存、不上传';

  @override
  String get plugslotsVoiceDeny => '不允许';

  @override
  String get plugslotsVoiceSwitch => '听你开口';

  @override
  String get plugslotsPickerUnavailable => '此设备暂不支持文件选择';

  @override
  String get plugslotsPickerBusy => '请先完成当前文件选择';

  @override
  String plugslotsPickerLimit(int count) {
    return '最多选 $count 个文件，单个 8 MiB，总计 16 MiB';
  }

  @override
  String get plugslotsPickerFailed => '文件未能交给插件，请重试';

  @override
  String get plugslotsWebPlacesTitle => '网页版界面';

  @override
  String get plugslotsPlaceBesideComposer => '输入框旁';

  @override
  String get plugslotsPlaceHeader => '对话顶栏';

  @override
  String get plugslotsPlaceMessages => '消息里';

  @override
  String get plugslotsPlaceOverlay => '浮层';

  @override
  String get plugslotsPlaceSidebar => '侧栏';

  @override
  String get plugslotsPlaceRightbar => '右侧栏';

  @override
  String get plugslotsPlaceFiles => '文件预览';

  @override
  String get plugslotsPlaceSettings => '设置';

  @override
  String get plugslotsPlacePlugins => '插件页';

  @override
  String get plugslotsPlaceNewChat => '新对话页';

  @override
  String get plugslotsPlaceElsewhere => '其他位置';

  @override
  String get plugslotsPlaceUnknown => '它的网页界面';

  @override
  String get plugslotsChatEntry => '插件';

  @override
  String plugslotsChatWebFrom(String names) {
    return '网页插件 · $names';
  }

  @override
  String get plugViewInvalid => '插件界面有误';

  @override
  String get plugViewEmpty => '暂无数据';

  @override
  String get plugViewImageUnavailable => '图片无法显示';

  @override
  String get plugViewUnavailableList => '列表无法显示';

  @override
  String get plugViewUnavailableKeyValue => '信息无法显示';

  @override
  String get plugViewUnavailableProgress => '进度无法显示';

  @override
  String get plugViewUnavailableTable => '表格无法显示';

  @override
  String get plugViewUnavailableActions => '按钮无法显示';

  @override
  String plugViewFrom(String name) {
    return '来自 $name';
  }

  @override
  String plugViewUnknownTone(String value) {
    return '未知 tone $value，已忽略；可用：good, warn, bad, info, muted';
  }

  @override
  String plugViewBadActionId(String value) {
    return '动作 id $value 不合规，这个元素不可点';
  }

  @override
  String plugViewBadAction(String shape) {
    return '动作应该是 id 字符串或 $shape，已忽略';
  }

  @override
  String plugViewArgsLimit(int limit) {
    return '动作参数超过 $limit 字节，已忽略';
  }

  @override
  String plugViewUnknownIcon(String value) {
    return '未知图标 $value，画默认图标';
  }

  @override
  String plugViewExpectedItems(String shape) {
    return '应该是数组，每项是 $shape';
  }

  @override
  String plugViewSkippedItem(String shape) {
    return '应该是 $shape，这项已跳过';
  }

  @override
  String get plugViewBadMax => 'max 应该是大于 0 的数，按 100 算';

  @override
  String plugViewColumnLimit(int first, int second) {
    return '$first 列，超过上限 $second';
  }

  @override
  String plugViewFirstColumns(int limit) {
    return '只显示前 $limit 列';
  }

  @override
  String plugViewFirstRows(int limit) {
    return '只显示前 $limit 行';
  }

  @override
  String get plugViewOnePrimary => '一张视图只能有一个主按钮，这个按普通按钮画';

  @override
  String get plugViewBadImageSource => '图片只收插件资源 asset:<路径>（png、jpg、webp、gif）或 data:image/…';

  @override
  String get plugViewBadAspect => 'aspect 应该是 0.25 到 4 之间的数，已忽略';

  @override
  String plugViewImageTooLarge(int limit) {
    return 'data: 图片超过 $limit 字节';
  }

  @override
  String get plugViewImageDecode => '图片无法解码（只收 PNG、JPEG、WebP、GIF）';

  @override
  String get plugViewImagePixels => '图片尺寸超过上限：单边 4096、总数 400 万像素';

  @override
  String plugViewTooDeep(int limit) {
    return 'JSON 嵌套超过 $limit 层';
  }

  @override
  String get plugViewV2Content => '插件内容';

  @override
  String plugViewVersionFallback(String version) {
    return '暂不支持视图版本 $version，已使用兼容显示';
  }

  @override
  String plugViewStyleInvalid(String values) {
    return '样式无效，支持 $values';
  }

  @override
  String get plugViewStyleReserved => '此样式由 App 保留，已忽略';

  @override
  String get plugViewStyleContainerOnly => '此样式仅用于 stack 和 row';

  @override
  String get plugViewStyleTextOnly => '此样式仅用于 text、metric 和 callout';

  @override
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum) {
    return '$mode：$before 已校正为 $after，对比度至少 $minimum:1';
  }

  @override
  String get plugViewRichLimit => '富文本超出上限，已截断';

  @override
  String plugViewBadTrend(int max) {
    return 'trend 要 2–$max 个数字（可以有 null），已忽略';
  }

  @override
  String plugViewGalleryPicture(int index) {
    return '第 $index 张';
  }

  @override
  String get readListUpdating => '更新中 · 上次结果';

  @override
  String get readListOffline => '离线 · 上次结果';

  @override
  String get readListFailed => '未更新 · 上次结果';

  @override
  String get remoteStartupSection => '启动';

  @override
  String get remoteAutoConnectOnStartup => '连接上次使用的主机';

  @override
  String get remoteAutoConnectOnStartupHint => '关闭后从本机开始';

  @override
  String get remoteStepConnect => '连接服务器';

  @override
  String get remoteStepVerifyHostKey => '验证主机指纹';

  @override
  String get remoteStepStartDsh => '启动 DSH';

  @override
  String get remoteStepTunnel => '建立隧道';

  @override
  String get remoteConnecting => '正在连接';

  @override
  String get remoteConnected => '已连接';

  @override
  String get remoteReconnecting => '重新连接中';

  @override
  String remoteReconnectAttempt(int count) {
    return '重新连接中 · 第 $count 次';
  }

  @override
  String get remoteErrInvalidServer => '服务器地址无效';

  @override
  String get remoteErrEmailPassword => '邮箱或密码不对';

  @override
  String get remoteErrHostNotInAccount => '账号下找不到这台主机';

  @override
  String get remoteHostFallback => '这台主机';

  @override
  String get remoteErrHostOffline => '主机现在不在线';

  @override
  String remoteErrHostRemoved(String name) {
    return '$name已不在你的 DSH Remote 账号下';
  }

  @override
  String get remoteErrRelaySignInExpired => 'DSH Remote 登录已失效';

  @override
  String get remoteErrIdentityKeyChanged => '主机身份密钥和上次不一致';

  @override
  String get remoteErrIdentityUnconfirmed => '还没有确认主机身份指纹';

  @override
  String get remoteErrConnectionReplaced => '远程连接已被替换';

  @override
  String get remoteErrHostRejected => '主机拒绝了连接';

  @override
  String get remoteErrHostNotOwned => '主机不在你的 DSH Remote 账号下';

  @override
  String get remoteErrUpdateNeeded => '版本不匹配，请更新 DSH Go 和主机上的远程插件';

  @override
  String get remoteErrVersionIncompatible => '主机上的 DSH 或远程插件需要更新';

  @override
  String get remoteErrSignInTimeout => '登录超时';

  @override
  String get remoteSignInCancelled => '已取消登录';

  @override
  String get remoteErrBrowserSignInUnsupported => '服务器不支持浏览器登录';

  @override
  String get remoteErrTooManyRequests => '请求太频繁';

  @override
  String get remoteErrHostUnreachable => '没能连上远程主机';

  @override
  String get remoteErrRemoteConnection => '远程连接失败';

  @override
  String get remoteOnline => '在线';

  @override
  String get remoteOffline => '离线';

  @override
  String get remoteUnavailable => '暂不可用';

  @override
  String get remoteErrHostNotFound => '找不到这台主机';

  @override
  String get remoteConnectionStopped => '远程连接已停止';

  @override
  String remoteBootstrapReusePort(int port) {
    return '复用已在运行的 DSH（端口 $port）';
  }

  @override
  String get remoteBootstrapStarting => '正在远端启动 DSH…';

  @override
  String remoteErrCommandNotFound(String command) {
    return '远端找不到「$command」';
  }

  @override
  String get remoteErrDshMissing => '主机上没有 dsh，装好后重试，或在启动命令里填完整路径';

  @override
  String get remoteStartCommandExample => '启动命令示例：~/.nvm/versions/node/v22.0.0/bin/dsh web';

  @override
  String get remoteErrDshStartTimeout => '远端 DSH 启动超时';

  @override
  String get remoteErrDshExited => '远端 DSH 启动后立即退出';

  @override
  String get remoteErrDshStart => '没能在远端启动 DSH';

  @override
  String remoteExitCode(int code) {
    return '退出码 $code';
  }

  @override
  String get remoteErrNoShell => '主机上没有 sh，只支持 Linux 和 macOS';

  @override
  String get remoteErrFingerprintChanged => '主机指纹和上次不一致，已断开';

  @override
  String get remoteErrFingerprintUnconfirmed => '还没有确认主机指纹';

  @override
  String get remoteHostTrustCancelled => '已取消信任主机';

  @override
  String get remoteCheckingDsh => '检查远端的 DSH…';

  @override
  String get remoteErrDshPort => '远端 DSH 端口连不上';

  @override
  String get remoteDshReused => '复用了远端已在运行的 DSH';

  @override
  String get remoteDshStarted => '已在远端启动 DSH';

  @override
  String get remoteErrDshTokenRejected => '远端 DSH 拒绝了登录令牌';

  @override
  String get remoteErrDshSignIn => '没能登录远端 DSH';

  @override
  String get remoteErrDshTunnel => '没能通过隧道连接 DSH';

  @override
  String get remoteErrDshSignInExpired => '远端 DSH 登录已失效';

  @override
  String get remoteErrDshStopped => '远端 DSH 已停止运行';

  @override
  String get remoteErrSshDisconnected => 'SSH 连接已断开';

  @override
  String get remoteErrSshUnresponsive => 'SSH 连接没有响应';

  @override
  String remoteRetryCount(int count) {
    return '已重试 $count 次';
  }

  @override
  String get remoteErrSshNetworkChanged => '网络变化后 SSH 连接已断开';

  @override
  String get remoteErrReadFingerprint => '没能读到主机指纹';

  @override
  String get remoteErrNoFingerprint => '服务器没有提供主机指纹';

  @override
  String get remoteErrPasswordMissing => '还没有填写密码';

  @override
  String remoteErrAddressUnresponsive(String host, int port) {
    return '$host:$port 没有响应';
  }

  @override
  String get remoteErrPrivateKeyMissing => '还没有填写私钥';

  @override
  String get remoteErrKeyNeedsPassword => '这把私钥需要密码';

  @override
  String get remoteErrKeyPassword => '私钥密码不对';

  @override
  String get remoteErrKeyUnreadable => '私钥无法读取';

  @override
  String remotePrivateKeyFormats(String error) {
    return '支持 OpenSSH 与 PEM 格式的 Ed25519、RSA、ECDSA 私钥。\n$error';
  }

  @override
  String remoteErrAddressRejected(String address) {
    return '$address 拒绝了连接';
  }

  @override
  String remoteErrSshHostNotFound(String host) {
    return '找不到主机 $host';
  }

  @override
  String remoteErrSshAddressUnresponsive(String address) {
    return '$address 没有响应';
  }

  @override
  String get remoteErrUsernamePassword => '用户名或密码不对';

  @override
  String get remoteErrPrivateKeyRejected => '服务器不接受这把私钥';

  @override
  String remoteAuthorizedKeysHelp(String username, String error) {
    return '确认公钥已加入 $username 的 ~/.ssh/authorized_keys。\n$error';
  }

  @override
  String get remoteErrFingerprintUntrusted => '主机指纹未被信任';

  @override
  String get remoteErrSshHandshakeTimeout => 'SSH 握手超时';

  @override
  String get remoteErrSshInterrupted => 'SSH 连接已中断';

  @override
  String get remoteErrSshConnection => 'SSH 连接失败';

  @override
  String get remoteErrCommandTimeout => '远端命令超时';

  @override
  String get remoteHostedErrNetwork => '没能连上分享服务，检查网络后重试';

  @override
  String get remoteHostedErrTooLarge => '对话太大，生成不了链接';

  @override
  String get remoteHostedErrRateLimited => '分享太频繁，稍后再试';

  @override
  String get remoteHostedErrCreate => '没能生成链接';

  @override
  String get remoteHostedErrUnavailable => '分享服务暂时不可用，稍后再试';

  @override
  String get remoteHostedErrGone => '链接已过期或被删除';

  @override
  String get remoteHostedErrForbidden => '没有权限删除这个链接';

  @override
  String get remoteHostedErrBroken => '链接不完整或已损坏';

  @override
  String get remoteChat => '对话';

  @override
  String get remoteHostedTtlWeek => '7 天';

  @override
  String get remoteHostedTtlMonth => '30 天';

  @override
  String get remoteHostedTtlForever => '永久';

  @override
  String get remoteForumSignIn => '登录论坛';

  @override
  String get remoteForumSignInBenefits => '发帖、回复、点赞';

  @override
  String get remoteForumFinishSignIn => '在浏览器里完成登录';

  @override
  String get remoteReopenBrowser => '重新打开浏览器';

  @override
  String get remoteForumSettings => '论坛设置';

  @override
  String get remoteForumAccount => '论坛账号';

  @override
  String get remoteForumTopic => '话题';

  @override
  String get remoteForumLikesReceived => '获赞';

  @override
  String get remoteForumDaysVisited => '访问天数';

  @override
  String get remoteForumNotifications => '通知';

  @override
  String remoteForumUnreadCount(int count) {
    return '$count 条未读';
  }

  @override
  String get remoteForumErrAddress => '地址不对';

  @override
  String get remoteForumAddress => '论坛地址';

  @override
  String remoteForumDefaultAddress(String host) {
    return '默认：$host';
  }

  @override
  String get remoteRestoreDefault => '恢复默认';

  @override
  String get remoteForumUploadingImage => '正在上传图片…';

  @override
  String get remoteForumErrUploadImage => '图片没传上去';

  @override
  String get remoteForumTitleRequired => '先写标题';

  @override
  String get remoteForumCategoryRequired => '选一个分类';

  @override
  String get remoteForumBodyRequired => '写点内容再发';

  @override
  String remoteForumReplyCaption(String username, String title) {
    return '回复 @$username · $title';
  }

  @override
  String get remoteForumNewTopic => '新话题';

  @override
  String get remoteForumTitle => '标题';

  @override
  String get remoteForumComposerHint => '写点什么，支持 Markdown';

  @override
  String get remoteForumPublish => '发布';

  @override
  String get remoteForumImage => '图片';

  @override
  String get remoteForumAttachShareCode => '附上分享码';

  @override
  String get remoteForumPendingApproval => '已提交，审核后可见';

  @override
  String get remoteForumLatest => '最新';

  @override
  String get remoteForumTop => '热门';

  @override
  String get remoteForumErrOpen => '没能打开论坛';

  @override
  String get remoteForumNoTopics => '还没有话题';

  @override
  String get remoteForumPost => '发帖';

  @override
  String get remoteForum => '论坛';

  @override
  String remoteForumNotificationsUnread(int count) {
    return '通知，$count 条未读';
  }

  @override
  String get remoteForumSearch => '搜索';

  @override
  String get remoteForumSearchHint => '搜索话题和帖子';

  @override
  String get remoteForumSignedIn => '已登录论坛';

  @override
  String get remoteForumSignInForNotifications => '登录后查看通知';

  @override
  String get remoteForumErrNotifications => '没能读取通知';

  @override
  String get remoteForumNoNotifications => '还没有通知';

  @override
  String get remoteForumMarkAllRead => '全部已读';

  @override
  String get remoteForumSomeone => '有人';

  @override
  String remoteForumNotificationMention(String who) {
    return '$who 提到了你';
  }

  @override
  String remoteForumNotificationGroupMention(String who) {
    return '$who 提到了你所在的群组';
  }

  @override
  String remoteForumNotificationReply(String who) {
    return '$who 回复了你';
  }

  @override
  String remoteForumNotificationQuote(String who) {
    return '$who 引用了你';
  }

  @override
  String remoteForumNotificationEdit(String who) {
    return '$who 编辑了你的帖子';
  }

  @override
  String remoteForumNotificationLikes(String who, int count) {
    return '$who 等 $count 人赞了你';
  }

  @override
  String remoteForumNotificationLike(String who) {
    return '$who 赞了你';
  }

  @override
  String remoteForumNotificationLikedPosts(String who, int count) {
    return '$who 赞了你的 $count 个帖子';
  }

  @override
  String remoteForumNotificationReaction(String who) {
    return '$who 回应了你';
  }

  @override
  String remoteForumNotificationMessage(String who) {
    return '$who 发来私信';
  }

  @override
  String remoteForumNotificationMessageInvite(String who) {
    return '$who 邀请你加入私信';
  }

  @override
  String remoteForumNotificationTopicInvite(String who) {
    return '$who 邀请你参与话题';
  }

  @override
  String remoteForumNotificationNewReply(String who) {
    return '$who 发了新回复';
  }

  @override
  String remoteForumNotificationNewTopic(String who) {
    return '$who 发了新话题';
  }

  @override
  String remoteForumNotificationLink(String who) {
    return '$who 链接了你的帖子';
  }

  @override
  String remoteForumNotificationBadge(String badge) {
    return '获得徽章「$badge」';
  }

  @override
  String remoteForumNotificationMoved(String who) {
    return '$who 移动了你的帖子';
  }

  @override
  String get remoteForumBookmarkReminder => '书签提醒';

  @override
  String get remoteForumTopicReminder => '话题提醒';

  @override
  String get remoteForumPostApproved => '你的帖子已通过审核';

  @override
  String get remoteForumAdminProblems => '论坛有待处理的问题';

  @override
  String get remoteForumNewNotification => '新通知';

  @override
  String get remoteForumUnread => '未读';

  @override
  String get remoteForumErrShareCode => '没能打开分享码';

  @override
  String get remoteForumPoll => '投票';

  @override
  String get remoteForumVideo => '视频';

  @override
  String get remoteForumEmbed => '嵌入内容';

  @override
  String get remoteForumVoteOnWeb => '去网页版投票';

  @override
  String get remoteForumErrSearch => '没能搜索';

  @override
  String remoteForumNoSearchResults(String term) {
    return '没有找到「$term」';
  }

  @override
  String get remoteForumBookmarkRemoved => '已取消书签';

  @override
  String get remoteForumBookmarkAdded => '已加入书签';

  @override
  String get remoteLinkCopied => '已复制链接';

  @override
  String get remoteForumErrTopic => '没能打开这个话题';

  @override
  String get remoteForumTopicClosed => '话题已关闭';

  @override
  String get remoteForumReplyHint => '写回复…';

  @override
  String get remoteForumSignInToReply => '登录后回复';

  @override
  String remoteForumReplyTo(String username) {
    return '回复 @$username';
  }

  @override
  String get remoteForumPostDeleted => '帖子已删除';

  @override
  String get remoteForumPostHidden => '帖子已被隐藏';

  @override
  String get remoteForumUnlike => '取消点赞';

  @override
  String get remoteForumLike => '点赞';

  @override
  String get remoteForumRemoveBookmark => '取消书签';

  @override
  String get remoteForumBookmark => '书签';

  @override
  String get remoteForumActionPinned => '置顶了话题';

  @override
  String get remoteForumActionUnpinned => '取消了置顶';

  @override
  String get remoteForumActionClosed => '关闭了话题';

  @override
  String get remoteForumActionReopened => '重新开放了话题';

  @override
  String get remoteForumActionAutoClosed => '话题已自动关闭';

  @override
  String get remoteForumActionAutoOpened => '话题已自动开放';

  @override
  String get remoteForumActionArchived => '归档了话题';

  @override
  String get remoteForumActionUnarchived => '取消了归档';

  @override
  String get remoteForumActionListed => '公开了话题';

  @override
  String get remoteForumActionUnlisted => '隐藏了话题';

  @override
  String get remoteForumActionSplit => '拆分了话题';

  @override
  String get remoteForumActionBanner => '设为横幅';

  @override
  String get remoteForumActionRemoveBanner => '取消了横幅';

  @override
  String get remoteForumActionUpdated => '更新了话题';

  @override
  String get remoteLoading => '正在加载';

  @override
  String get remoteForumJustNow => '刚刚';

  @override
  String remoteForumMinutesAgo(int count) {
    return '$count 分钟前';
  }

  @override
  String remoteForumHoursAgo(int count) {
    return '$count 小时前';
  }

  @override
  String remoteForumDaysAgo(int count) {
    return '$count 天前';
  }

  @override
  String remoteForumReplyCount(int count) {
    return '$count 回复';
  }

  @override
  String remoteForumNewReplyCount(int count) {
    return '$count 条新回复';
  }

  @override
  String get remoteForumNew => '新';

  @override
  String remoteForumErrorRetry(String error) {
    return '$error · 重试';
  }

  @override
  String get remoteForumNoMore => '没有更多了';

  @override
  String get remoteHostKeyTrustTitle => '信任这台主机？';

  @override
  String remoteHostKeyFirstConnection(String name, String address) {
    return '首次连接「$name」（$address）。核对指纹，确认是你自己的主机。';
  }

  @override
  String get remoteHostKeyTrustConnect => '信任并连接';

  @override
  String get remoteHostKeyChangedTitle => '身份指纹变了';

  @override
  String remoteRelayKeyChangedBody(String name) {
    return '「$name」的身份密钥和上次不一样。只在确认这台主机重装过远程插件时继续，否则可能有人冒充它。';
  }

  @override
  String remoteRelayKeyFirstBody(String name) {
    return '首次连接「$name」。核对身份指纹，与主机上远程插件显示的一致再继续。';
  }

  @override
  String get remoteHostKeyChangeWarning => '之后指纹一旦变化，App 会拒绝连接。';

  @override
  String get remoteHostKeyTrustAgain => '重新信任';

  @override
  String get remoteHostKeyReading => '正在读取主机指纹…';

  @override
  String remoteHostSwitcherSemantics(String name, String status) {
    return '当前主机：$name，$status。切换主机';
  }

  @override
  String get remoteSwitchHost => '切换主机';

  @override
  String get remoteThisPhoneDsh => '这台手机上的 DSH';

  @override
  String get remoteRemoteLabel => '远程';

  @override
  String remoteRemotePlatform(String platform) {
    return '远程 · $platform';
  }

  @override
  String get remoteRelaySwitchWarning => 'DSH Remote 一次只连一台主机，切换会断开上一台';

  @override
  String get remoteConnectComputer => '连接电脑或服务器';

  @override
  String get remoteManageHosts => '管理远程主机';

  @override
  String get remoteConnectionMethods => '通过 SSH 或 DSH Remote';

  @override
  String get remoteRelayLoginRequired => '填写服务器地址、邮箱和密码';

  @override
  String get remoteErrSignIn => '没能登录';

  @override
  String get remoteSelfHostedServer => '自建服务器';

  @override
  String get remoteSelfHostedSignInHelp => '用邮箱和密码登录自己部署的 liguobao/ds-harness-remote';

  @override
  String get remoteServerAddress => '服务器地址';

  @override
  String get remoteEmail => '邮箱';

  @override
  String get remotePassword => '密码';

  @override
  String get remoteRestoreServer => '改回默认服务器 dsh.r2049.cn';

  @override
  String get remoteConsole => '远程控制台';

  @override
  String get remoteHostsIntro => '在手机上接着用电脑或服务器上的 DSH';

  @override
  String get remoteSshHosts => 'SSH 主机';

  @override
  String get remoteSshRequirements => '需要那台主机开着 SSH，并装好 DSH';

  @override
  String get remoteAddSshHost => '添加 SSH 主机';

  @override
  String get remoteSshDirect => '不经过第三方服务器';

  @override
  String get remoteOtherMethods => '其他方式';

  @override
  String get remoteWebConsole => '网页版远程控制台';

  @override
  String get remoteWebConsoleProvider => 'dsh.r2049.cn · 第三方页面';

  @override
  String remoteActiveHost(String name) {
    return '正在使用「$name」';
  }

  @override
  String get remoteSwitchToPhone => '切回本机';

  @override
  String get remoteSignInAgain => '重新登录';

  @override
  String get remoteHostSettings => '主机设置';

  @override
  String get remoteReconnect => '重新连接';

  @override
  String get remoteReconnectingEllipsis => '重新连接中…';

  @override
  String remoteReconnectReason(String reason) {
    return '重新连接中 · $reason';
  }

  @override
  String get remoteConnectedEncrypted => '已连接 · 端到端加密';

  @override
  String remoteConnectedSsh(String address) {
    return '已连接 · SSH $address';
  }

  @override
  String get remoteErrRefreshHosts => '没能刷新主机列表';

  @override
  String get remoteSwitchWarning => '一次只连一台主机，切换会断开上一台';

  @override
  String get remoteRefreshHosts => '刷新主机列表';

  @override
  String get remoteSignOut => '退出';

  @override
  String get remoteErrHostsRetry => '没能获取主机列表 · 轻点重试';

  @override
  String get remoteNoHosts => '还没有主机';

  @override
  String get remoteRelaySetupHelp => '在主机的 DSH 里装好远程插件并登录';

  @override
  String get remoteRelaySignOutTitle => '退出 DSH Remote？';

  @override
  String get remoteRelaySignOutBody => '这台手机会从账号中移除。主机上的 DSH 和对话不受影响，随时可以重新登录。';

  @override
  String get remoteRelaySignInTitle => '登录 DSH Remote';

  @override
  String get remoteRelaySignInHelp => '无需配置网络，连接端到端加密';

  @override
  String get remoteBrowserSignIn => '在浏览器中登录';

  @override
  String remoteSignInWithProvider(String provider) {
    return '使用 $provider 登录';
  }

  @override
  String get remoteComingSoon => '即将接入';

  @override
  String get remoteSelfHostedEmailSignIn => '自建服务器 · 邮箱登录';

  @override
  String get remoteBrowserSignInPending => '在浏览器里完成登录…';

  @override
  String get remoteCopySignInLink => '复制登录链接';

  @override
  String get remoteSshAddressRequired => '填写主机地址（IP 或域名）';

  @override
  String get remoteSshUsernameRequired => '填写登录用户名';

  @override
  String get remoteSshPasswordRequired => '填写 SSH 密码，或改用私钥';

  @override
  String get remoteSshKeyRequired => '粘贴私钥（以 -----BEGIN 开头的整段文本）';

  @override
  String get remoteHostKeyResetTitle => '重置主机指纹？';

  @override
  String get remoteHostKeyResetBody => '只在确认这台主机重装或更换过时才这么做。下次连接会重新请你核对指纹。';

  @override
  String get remoteReset => '重置';

  @override
  String remoteDeleteHostTitle(String name) {
    return '删除「$name」？';
  }

  @override
  String get remoteDeleteHostBody => '这台主机的设置和保存在手机上的密码、私钥都会删除。主机上的 DSH 和对话不受影响。';

  @override
  String remoteErrReadKey(String error) {
    return '没能读取：$error';
  }

  @override
  String get remoteErrPublicKeyFile => '这不是私钥文件，请选不带 .pub 的那个（例如 id_ed25519）';

  @override
  String get remotePrivateKeyImported => '已导入私钥，原文件可以删掉了';

  @override
  String get remoteEditHost => '编辑主机';

  @override
  String get remoteSshHostIntro => '连接你电脑或服务器上的 DSH';

  @override
  String get remoteHostBasicInfo => '基本信息';

  @override
  String get remoteHostNameHint => '比如：电脑、家里的 Mac';

  @override
  String get remoteHost => '主机';

  @override
  String get remoteHostAddressHint => '192.168.1.20 或 example.com';

  @override
  String get remoteUsername => '用户名';

  @override
  String get remotePort => '端口';

  @override
  String get remoteAuthentication => '登录方式';

  @override
  String get remotePasswordStorageHelp => '只保存在这台手机上，由 Android Keystore 加密';

  @override
  String get remoteKeyStorageHelp => '只保存在这台手机上，由 Android Keystore 加密。支持 Ed25519、RSA、ECDSA';

  @override
  String get remotePrivateKey => '私钥';

  @override
  String get remoteShow => '显示';

  @override
  String get remoteImportKeyFile => '从文件导入';

  @override
  String get remotePrivateKeyPassword => '私钥密码（可选）';

  @override
  String get remoteStartCommand => '启动命令';

  @override
  String get remoteStartCommandHelp => '用 nvm 安装的可以填完整路径';

  @override
  String get remoteWorkingDirectory => '工作目录（可选）';

  @override
  String get remoteWorkingDirectoryHelp => '新对话默认在这里，支持 ~/';

  @override
  String get remoteHostFingerprint => '主机指纹';

  @override
  String get remoteHostKeyNotConfirmed => '还没有确认';

  @override
  String get remoteHostKeyFirstCheck => '首次连接时会请你核对指纹';

  @override
  String get remoteDeleteHost => '删除这台主机';

  @override
  String get remoteTesting => '正在测试';

  @override
  String get remoteTestConnection => '测试连接';

  @override
  String get remoteHostedUpdateRequired => '需要更新 App 才能打开';

  @override
  String get remoteHostedCannotOpen => '这个链接无法打开';

  @override
  String get remoteOpening => '正在打开…';

  @override
  String get remoteHostedNeverExpires => '永久有效';

  @override
  String get remoteHostedExpired => '已过期';

  @override
  String get remoteHostedExpiresToday => '今天到期';

  @override
  String get remoteHostedExpiresTomorrow => '明天到期';

  @override
  String remoteHostedExpiresOn(String date) {
    return '$date到期';
  }

  @override
  String get remoteHostedDeleteTitle => '删除这个链接？';

  @override
  String remoteHostedDeleteBody(String title) {
    return '「$title」的链接会立即失效';
  }

  @override
  String get remoteHostedLinkDeleted => '已删除链接';

  @override
  String get remoteUndo => '撤销';

  @override
  String get remoteHostedMyLinks => '我的分享链接';

  @override
  String get remoteHostedNoLinks => '还没有分享链接';

  @override
  String get remoteHostedErrDeleteNetwork => '没能删除，检查网络后重试';

  @override
  String get remoteHostedErrDelete => '没能删除，稍后再试';

  @override
  String get remoteDirectoryPickerTitle => '选择文件夹';

  @override
  String get remoteDirectoryChoose => '选择';

  @override
  String get remoteDirectoryDefault => '默认工作目录';

  @override
  String get remoteDirectoryHome => '主目录';

  @override
  String get remoteDirectoryPhoneStorage => '手机存储';

  @override
  String get remoteDirectoryDownloads => '下载';

  @override
  String get remoteDirectoryDownloadsPath => '手机存储/Download';

  @override
  String get remoteDirectoryDocuments => '文档';

  @override
  String get remoteDirectoryDocumentsPath => '手机存储/Documents';

  @override
  String get remoteDirectoryLocations => '位置';

  @override
  String get remoteDirectoryRecent => '最近';

  @override
  String get remoteDirectoryEnterPath => '输入路径';

  @override
  String get remoteDirectoryGo => '前往';

  @override
  String get remoteDirectoryAbsolutePath => '从「/」开始写完整路径';

  @override
  String get remoteDirectoryNewFolder => '新建文件夹';

  @override
  String remoteDirectoryParentCaption(String name) {
    return '在「$name」里';
  }

  @override
  String get remoteDirectoryFolderName => '文件夹名称';

  @override
  String get remoteDirectoryRoot => '根目录';

  @override
  String get remoteDirectoryErrCreate => '没能新建文件夹';

  @override
  String get remoteDirectoryNoSubfolders => '这里没有子文件夹';

  @override
  String get remoteDirectoryHideHidden => '收起隐藏文件夹';

  @override
  String remoteDirectoryShowHidden(int count) {
    return '显示 $count 个隐藏文件夹';
  }

  @override
  String get remoteDirectoryTruncated => '文件夹太多，只列出了前面一部分';

  @override
  String get remoteWorkspaceAdd => '添加工作区';

  @override
  String remoteWorkspaceAdded(String name) {
    return '已添加「$name」';
  }

  @override
  String get remoteWorkspaceErrAdd => '没能添加工作区';

  @override
  String get remoteWorkspaceNoChats => '没有对话';

  @override
  String remoteWorkspaceChatCount(int count) {
    return '$count 个对话';
  }

  @override
  String get remoteWorkspaceErrRename => '没能重命名';

  @override
  String remoteWorkspaceRemoved(String name) {
    return '已移除「$name」';
  }

  @override
  String get remoteWorkspaceErrRemove => '没能移除工作区';

  @override
  String get remoteWorkspaceRename => '重命名工作区';

  @override
  String get remoteWorkspaceName => '工作区名称';

  @override
  String get remoteWorkspaceNameRequired => '起个名字';

  @override
  String remoteWorkspaceRemoveTitle(String name) {
    return '移除「$name」？';
  }

  @override
  String get remoteWorkspaceRemoveBody => '文件夹和对话都会保留';

  @override
  String get remoteWorkspaceRemove => '移除';

  @override
  String get remoteWorkspace => '工作区';

  @override
  String get remoteWorkspaceNewChatHere => '在这里新建对话';

  @override
  String get remoteWorkspaceUnpin => '取消置顶';

  @override
  String get remoteWorkspaceGroup => '分组';

  @override
  String get remoteWorkspaceUngrouped => '未分组';

  @override
  String get remoteWorkspaceRemoveAction => '移除工作区';

  @override
  String get remoteWorkspaceNewGroup => '新建分组';

  @override
  String get remoteWorkspaceGroupName => '分组名称';

  @override
  String remoteDirectoryPhonePath(String path) {
    return '手机存储/$path';
  }

  @override
  String get remoteDirectoryInvalidName => '名字里不能有「/」';

  @override
  String get remoteWorkspaceErrNameConflict => '已有同名的工作区';

  @override
  String get remoteWorkspaceErrInvalidPath => '这个文件夹不能用作工作区';

  @override
  String get remoteWorkspaceErrNotFound => '这个工作区已经不在了';

  @override
  String get remoteDirectoryErrUnreadable => '打不开这个文件夹';

  @override
  String get remoteDirectoryErrExists => '已经有同名的文件夹';

  @override
  String get remoteDirectoryErrUnavailable => '这台主机不能在这里浏览文件夹';

  @override
  String get remoteWorkspaceErrUnsupported => '这台主机不支持这个操作';

  @override
  String get remoteWorkspaceAllChats => '全部对话';

  @override
  String remoteWorkspaceSwitcherSemantics(String name) {
    return '工作区：$name。切换工作区';
  }

  @override
  String get remoteWorkspaceManage => '管理工作区';

  @override
  String get remoteWorkspaceErrLoad => '没能读取工作区';

  @override
  String get remoteWorkspaceEmpty => '还没有工作区';

  @override
  String get remoteWorkspaceEmptyHint => '把常用的文件夹加进来';

  @override
  String remoteWorkspaceCount(int count) {
    return '$count 个工作区';
  }

  @override
  String remoteDirectoryConfirmFolder(String action, String name) {
    return '$action「$name」';
  }

  @override
  String remoteHostKeyMismatchDetail(String saved, String received, String type) {
    return '确认主机重装或更换后，可在主机设置中重置指纹。\n已记住：$saved\n这次收到：$received（$type）';
  }

  @override
  String remoteForumCompactReplies(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label 回复');
    return '$_temp0';
  }

  @override
  String remoteForumCompactViews(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '$label 浏览');
    return '$_temp0';
  }

  @override
  String remoteForumYearDate(int year, String month, int day) {
    return '$year年$month月$day日';
  }

  @override
  String remoteHostedMonthDate(String month, int day) {
    return '$month 月 $day 日';
  }

  @override
  String remoteHostedYearDate(int year, String month, int day) {
    return '$year 年 $month 月 $day 日';
  }

  @override
  String remoteForumTenThousands(String value) {
    return '$value万';
  }

  @override
  String get remoteForumSemanticsSeparator => '，';

  @override
  String remoteHostKeyVerifyCommand(String command) {
    return '在那台主机上运行 $command 能看到同样的指纹。之后指纹一旦变化，App 会拒绝连接。';
  }

  @override
  String remoteSshInstallCommand(String command) {
    return '还没装 DSH？在主机上运行 $command';
  }

  @override
  String remoteRelayProvider(String project) {
    return '服务由 $project 提供';
  }

  @override
  String remoteRelayProviderServer(String project, String server) {
    return '服务由 $project 提供 · 当前服务器 $server';
  }

  @override
  String remoteQuotedHostName(String name) {
    return '「$name」';
  }

  @override
  String remoteErrorDetail(String message, String detail) {
    return '$message（$detail）';
  }

  @override
  String get riskDontShowAgain => '不再提示';

  @override
  String get riskAskAi => '不确定？问 AI';

  @override
  String get riskConfirmAlwaysAction => '始终免确认';

  @override
  String get riskFullAccessAction => '开启完全权限';

  @override
  String get riskAutoReviewAction => '开启自动审查';

  @override
  String get riskAllowForChatTitle => '本对话都允许？';

  @override
  String get riskAllowForChatBody => '这个对话之后的命令和改动都直接放行，可在输入框上方随时关闭。';

  @override
  String get riskAllowForChatAction => '全部允许';

  @override
  String get riskPetOverlayTitle => '显示在其他应用上层？';

  @override
  String get riskPetOverlayBody => '要在系统设置里为 DSH Go 打开「显示在其他应用上层」，宠物才能出现在别的 App 上。';

  @override
  String get riskPetOverlayAction => '去设置';

  @override
  String get askAiTooltip => '问 AI';

  @override
  String get askAiHelpTitle => '使用帮助';

  @override
  String get askAiHelpSubtitle => '不懂的地方，问 AI';

  @override
  String askAiAboutApp(String question) {
    return '关于 DSH Go App：$question';
  }

  @override
  String askAiWithGuide(String question) {
    return '关于 DSH Go App：$question\n请按附件里的使用说明回答。';
  }

  @override
  String get askAiNoGuide => '这台主机没有 DSH Go 使用说明，回答可能不准确';

  @override
  String get askAiQuestionOverview => 'DSH Go 能做什么？我该从哪里开始？';

  @override
  String get askAiQuestionPhoneControl => '手机操控是怎么工作的？有什么风险？';

  @override
  String get askAiQuestionPhoneAlways => '手机操控选「始终免确认」会怎样？和「每次都询问」比风险在哪？';

  @override
  String get askAiQuestionAppRules => '手机操控的应用名单有什么用？放开银行、支付类 App 有什么风险？';

  @override
  String get askAiQuestionFullAccess => '「完全权限」打开后会怎样？有什么风险？';

  @override
  String get askAiQuestionPhoneFiles => '「访问手机文件」打开后，AI 能读写哪些文件？怎么关掉？';

  @override
  String get askAiQuestionAllowForChat => '「本对话都允许」会放行哪些操作？怎么关掉？';

  @override
  String get askAiQuestionPlugins => '插件能做什么？装第三方插件要注意什么？';

  @override
  String get askAiQuestionRemote => '怎么连接自己的电脑或服务器？和用本机有什么不同？';

  @override
  String get schemaDocumentationTitle => '字段说明';

  @override
  String get schemaDocumentationOverview => '概述';

  @override
  String get schemaDocumentationEach => '每一项';

  @override
  String schemaDocumentationPosition(int position) {
    return '第 $position 项';
  }

  @override
  String schemaDocumentationOption(int option) {
    return '选项 $option';
  }

  @override
  String get searchApiKey => 'API Key';

  @override
  String get searchNeedsLocal => '连接本机时可用';

  @override
  String get searchNeedsPhoneControl => '开启手机操控后可用';

  @override
  String get searchNeedsNativeUi => '原生界面可用';

  @override
  String get searchNeedsEngineField => '当前主机提供时可用';

  @override
  String get searchNeedsChat => '打开对话时可用';

  @override
  String get searchKwTheme => '外观,配色,颜色,主题色,强调色,图标';

  @override
  String get searchKwPets => '宠物,小鲸,桌宠,悬浮,鲸鱼';

  @override
  String get searchKwPerformance => '省电,流畅,卡顿,发热,轻量,完整';

  @override
  String get searchKwVoice => '语音识别,麦克风,听写,说话,语音';

  @override
  String get searchKwNotifications => '提醒,推送,横幅,消息,铃声';

  @override
  String get searchKwReplyPrefs => '偏好,关于我,自我介绍,回答风格,称呼,AGENTS.md';

  @override
  String get searchKwSharedLinks => '分享链接,链接,公开链接,分享';

  @override
  String get searchKwPhone => '无障碍,操作手机,自动点击,代操作,点按';

  @override
  String get searchKwAppRules => '名单,黑名单,白名单,禁止,应用';

  @override
  String get searchKwDnd => '免打扰,Shizuku,ADB,后台操作';

  @override
  String get searchKwEngine => '引擎,运行环境,启动,停止,重启,DSH';

  @override
  String get searchKwBackground => '后台保活,保活,后台,电池优化,自启动,被杀,杀后台,省电';

  @override
  String get searchKwSystemAccess => '权限一览,授权,悬浮窗,无障碍,后台弹出界面,麦克风,文件访问,通知权限,受限制的设置,补开权限';

  @override
  String get searchKwDiagnostics => '日志,排障,诊断包,问题反馈,报错';

  @override
  String get searchKwModels => '模型渠道,渠道,供应商,换模型,OpenRouter,ChatGPT,Claude';

  @override
  String get searchKwEngineParams => '引擎设置,高级,参数,子代理,命令执行';

  @override
  String get searchKwSubagent => '子代理设置,递归,并发,子任务';

  @override
  String get searchKwAgentLoop => '循环,并行,工具调用';

  @override
  String get searchKwShell => '命令,超时,输出,终端,Shell';

  @override
  String get searchKwWebSearch => '搜索,上网,联网,API Key';

  @override
  String get searchKwGeneral => '通用,网页版设置';

  @override
  String get searchKwPluginInventory => '插件清单,已装插件';

  @override
  String get searchKwPlugins => '扩展,市场,安装插件,插件市场';

  @override
  String get searchKwAllFeatures => '功能,目录,所有功能';

  @override
  String get searchKwAccount => '账号,余额,充值,登录,退出登录,API Key,用量,DeepSeek';

  @override
  String get searchKwRemote => '远程,SSH,电脑,服务器,DSH Remote,连接电脑';

  @override
  String get searchKwPermission => '权限,别问我,确认,审批,自动允许,只读,完全权限,自动执行命令';

  @override
  String get searchKwAgentPresets => '预设,模式,工作方式';

  @override
  String get searchKwUiMode => '原生,网页,网页模式,界面,切换界面';

  @override
  String get searchKwLanguage => '中文,英文,简体,English';

  @override
  String get searchKwAutoCommands => '别问我,不要确认,自动允许,完全权限,免确认';

  @override
  String get searchKwPhoneFiles => '存储,文件,相册,下载,手机存储';

  @override
  String get searchKwVisualReplies => '图表,卡片,可视化,选项';

  @override
  String get searchKwTextSize => '字号,字体,文字大小,大字,字体大小';

  @override
  String get searchKwFoldTurns => '收起,折叠,过程,步骤';

  @override
  String get searchKwWebPhoneLayout => '网页版手机布局,布局';

  @override
  String get searchKwShareConfig => '分享,导出配置,分享码,配置';

  @override
  String get searchKwOpenWeb => '网页版,网页,浏览器,官方网页版';

  @override
  String get searchKwSafeMode => '安全模式,恢复正常模式,排障,插件崩溃';

  @override
  String get searchKwVersion => '版本号,关于';

  @override
  String get searchKwUpdate => '更新,升级,新版本';

  @override
  String get searchKwUpdateAuto => '自动更新,检查更新';

  @override
  String get searchKwHelp => '帮助,教程,问 AI,怎么用,说明';

  @override
  String get searchKwCommunity => '交流群,QQ 群,论坛,反馈';

  @override
  String get searchKwStar => 'GitHub,星标,点赞';

  @override
  String get searchKwLicenses => '许可证,开源,License';

  @override
  String get searchKwDarkMode => '深色,浅色,暗色,夜间,深色模式,跟随系统,外观';

  @override
  String get searchKwAccent => '颜色,主题色,强调色,壁纸,取色';

  @override
  String get searchKwTileStyle => '图标风格,磁贴';

  @override
  String get searchKwAppIcon => '启动图标,App 图标,图标';

  @override
  String get searchKwPetSize => '宠物大小,宠物尺寸';

  @override
  String get searchKwPetQuiet => '安静,宠物安静';

  @override
  String get searchKwPetOutside => '悬浮窗,桌面宠物,宠物悬浮';

  @override
  String get searchKwPetDisplayWhen => '宠物显示,显示时机';

  @override
  String get searchKwBlur => '模糊,毛玻璃,玻璃';

  @override
  String get searchKwAnimations => '动画,动效,减少动画';

  @override
  String get searchKwNotifyEnabled => '通知开关,关闭通知';

  @override
  String get searchKwNotifyDone => '完成提醒,回复完成';

  @override
  String get searchKwNotifyFailed => '出错提醒,失败';

  @override
  String get searchKwNotifyApproval => '审批提醒,确认提醒';

  @override
  String get searchKwNotifyQuestion => '提问提醒';

  @override
  String get searchKwNotifySystem => '声音,横幅,锁屏,系统通知';

  @override
  String get searchKwPhoneConfirm => '别问我,免确认,每次都询问,始终免确认,确认';

  @override
  String get searchKwPhoneAutoCollapse => '悬浮条,收起,悬浮球';

  @override
  String get searchKwPhoneReturn => '返回,完成后返回';

  @override
  String get searchKwPhoneBackgroundGuide => '后台确认,返回 App';

  @override
  String get searchKwAutoStart => '自动启动,开机启动,自启';

  @override
  String get searchKwAutoSafe => '安全模式,自动安全模式';

  @override
  String get searchKwEngineReset => '重置,清空,恢复';

  @override
  String get searchKwEngineUninstall => '卸载,删除运行环境,释放空间';

  @override
  String get searchKwAddProvider => '添加模型,新渠道,自定义模型,Base URL';

  @override
  String get searchKwSubagentDepth => '递归深度,层数';

  @override
  String get searchKwParallelCalls => '并行,同时调用';

  @override
  String get searchKwCommandTimeout => '超时,命令超时,时间限制';

  @override
  String get searchKwWebSearchKey => '搜索 Key,联网 Key';

  @override
  String get searchKwChatLogUpload => '隐私,日志,上传日志,对话日志';

  @override
  String get searchKwAddSshHost => 'SSH,添加主机,连接电脑';

  @override
  String get searchKwRemoteAutoConnect => '自动连接,启动时连接';

  @override
  String get searchKwPermissionCurrent => '本对话都允许,这个对话,当前权限';

  @override
  String get searchKwPermissionDefault => '默认权限,只读,工作区内修改,完全权限,自动执行命令,别问我';

  @override
  String get searchSettingsHint => '搜索设置';

  @override
  String get searchSuggestDark => '深色模式';

  @override
  String get searchSuggestBackground => '后台运行';

  @override
  String get searchSuggestPermission => '权限';

  @override
  String get searchSuggestTextSize => '字号';

  @override
  String get searchCommon => '常用';

  @override
  String get searchRecent => '最近';

  @override
  String get searchFeatures => '功能';

  @override
  String get searchNoResults => '没有找到相关设置';

  @override
  String searchAskAi(String query) {
    return '问 AI：「$query」';
  }

  @override
  String get searchKwPersonalization => '个性化,偏好,风格,习惯';

  @override
  String get searchKwInterface => '原生,网页,网页模式,网页版,通用设置';

  @override
  String get searchKwPrivacy => '隐私,数据,日志,分享,统计';

  @override
  String get searchKwAbout => '关于,版本,更新,许可,dsh-go';

  @override
  String get searchKwPhoneConfirmEntry => '确认方式,手机操控,免确认';

  @override
  String get searchKwWebCodingView => '代码视图,工作视图,网页版';

  @override
  String get searchKwWebCollapse => '工作步骤,收起,折叠,网页版';

  @override
  String get searchKwWebBusySend => '发送,排队,插话,AI 工作时';

  @override
  String get searchKwPluginsMarket => '插件市场,安装插件,市场,获取插件';

  @override
  String get searchKwUsageStats => '统计,使用统计,匿名,隐私,数据,改进,遥测,分析';

  @override
  String get setupAppearanceTitle => '选择外观';

  @override
  String get setupAppearanceMessage => '随时可以在设置里更改';

  @override
  String get setupLightMode => '轻量模式';

  @override
  String get setupCapsulePreparing => '准备运行环境';

  @override
  String setupCapsuleProgress(int percent) {
    return '运行环境 $percent%';
  }

  @override
  String setupCapsuleProgressSemantics(int percent) {
    return '正在准备运行环境，已完成 $percent%';
  }

  @override
  String get setupCapsuleReady => '运行环境已就绪';

  @override
  String get setupCapsuleFailed => '安装未完成';

  @override
  String get setupWaitingBody => '完成后自动进入';

  @override
  String get setupNotifyWhenDone => '完成时会通知你';

  @override
  String get setupAwaitSignIn => '就绪后自动打开 DeepSeek 登录';

  @override
  String get shellApiKeyPrefixWarning => 'DeepSeek 的 Key 通常以 sk- 开头，确认没有复制错';

  @override
  String get shellApiKeyIncompleteWarning => 'Key 似乎不完整，确认复制了整串';

  @override
  String get shellBrowserUrlCopied => '没能打开浏览器，网址已复制';

  @override
  String get shellSaveTryAgain => '没能保存，再试一次';

  @override
  String get shellApiKeyUpdated => 'API Key 已更新';

  @override
  String get shellReplaceApiKey => '更换 API Key';

  @override
  String get shellEnterApiKey => '输入 API Key';

  @override
  String get shellApiKeyBilling => '费用由 DeepSeek 开放平台按量结算';

  @override
  String get shellSaving => '正在保存';

  @override
  String get shellSaveContinue => '保存并继续';

  @override
  String get shellSetUpLater => '稍后设置';

  @override
  String get shellClearField => '清空';

  @override
  String get shellShow => '显示';

  @override
  String get shellApiKeyEncrypted => '加密保存在本机';

  @override
  String get shellGetApiKey => '获取 API Key';

  @override
  String get shellConnectDeepSeek => '连接 DeepSeek';

  @override
  String get shellConnectDeepSeekMessage => '登录 DeepSeek 账号即可开始，无需 API Key';

  @override
  String get shellAccountSignInUnsupported => '当前引擎不支持账号登录';

  @override
  String get shellSignInDeepSeek => '用 DeepSeek 账号登录';

  @override
  String get shellUseApiKey => '使用 API Key';

  @override
  String get shellOtherProviders => '其他模型渠道';

  @override
  String shellOnboardingStep(int step, int steps) {
    return '第 $step 步，共 $steps 步';
  }

  @override
  String get shellRuntimeUpdating => '正在更新运行环境';

  @override
  String get shellRuntimePreparing => '正在准备运行环境';

  @override
  String get shellRuntimeReady => '准备就绪';

  @override
  String get shellRuntimeIncomplete => '安装未完成';

  @override
  String get shellRuntimeFilesKept => '对话和文件都会保留';

  @override
  String get shellRuntimeFirstSetup => '首次准备约需一两分钟';

  @override
  String get shellRuntimeContinuing => '即将继续';

  @override
  String get shellRuntimeRestoreFailed => '没能放回保留的内容';

  @override
  String get shellRuntimeExtractFailed => '解压时出错';

  @override
  String get shellInstallLogs => '安装日志';

  @override
  String get shellRuntimeLocalOnly => '全程在本机完成';

  @override
  String get shellRuntimeContinueWithoutKept => '不保留，继续安装';

  @override
  String get shellRuntimeAlmostDone => '马上就好';

  @override
  String shellRuntimeSecondsRemaining(int count) {
    return '约 $count 秒';
  }

  @override
  String shellRuntimeMinutesRemaining(int count) {
    return '约 $count 分钟';
  }

  @override
  String get shellEngineLogs => '引擎日志';

  @override
  String get shellWelcomeMessage => '把 DeepSeek 智能体\n装进口袋';

  @override
  String get shellGetStarted => '开始';

  @override
  String get shellSearchChats => '搜索对话';

  @override
  String get shellCollapseChatList => '收起对话列表';

  @override
  String get shellExpandChatList => '展开对话列表';

  @override
  String get shellChatList => '对话列表';

  @override
  String get shellChatDetails => '对话详情';

  @override
  String get shellCollapseDetails => '收起详情';

  @override
  String get shellExpand => '展开';

  @override
  String get shellUndo => '撤销';

  @override
  String shellFolderDeleted(String name) {
    return '已删除「$name」';
  }

  @override
  String shellMovedToFolder(String name) {
    return '已移到「$name」';
  }

  @override
  String get shellMovedOutOfFolder => '已移出文件夹';

  @override
  String get shellUnpinFailed => '没能取消置顶，稍后再试';

  @override
  String get shellPinFailed => '没能置顶，稍后再试';

  @override
  String shellChatsUnpinned(int count) {
    return '已取消置顶 $count 个对话';
  }

  @override
  String shellChatsPinned(int count) {
    return '已置顶 $count 个对话';
  }

  @override
  String get shellArchiveFailed => '没能归档，稍后再试';

  @override
  String shellChatsStoppedArchived(int count) {
    return '已停止并归档 $count 个对话';
  }

  @override
  String shellChatsArchived(int count) {
    return '已归档 $count 个对话';
  }

  @override
  String shellFilterLabel(String label) {
    return '筛选：$label';
  }

  @override
  String get shellFolders => '文件夹';

  @override
  String get shellNoRunningChats => '没有运行中的对话';

  @override
  String get shellNoPendingChats => '没有待确认的对话';

  @override
  String get shellNoUnreadChats => '没有未读对话';

  @override
  String get shellNoChatsYet => '还没有对话';

  @override
  String shellFolderLabel(String name) {
    return '文件夹「$name」';
  }

  @override
  String shellFolderChatCount(String name, int count) {
    return '文件夹「$name」，$count 个对话';
  }

  @override
  String get shellSort => '排序';

  @override
  String get shellRecentActivity => '最近活动';

  @override
  String get shellCreatedTime => '创建时间';

  @override
  String get shellNewFolder => '新建文件夹';

  @override
  String get shellManageFolders => '管理文件夹';

  @override
  String get shellMultiSelect => '多选';

  @override
  String get shellFolderNameExists => '已有同名文件夹';

  @override
  String get shellEditFolder => '编辑文件夹';

  @override
  String get shellFolderMark => '标记';

  @override
  String shellFolderColor(int number) {
    return '颜色 $number';
  }

  @override
  String get shellMoveToFolder => '移到文件夹';

  @override
  String get shellMoveOutOfFolder => '移出文件夹';

  @override
  String get shellDeleteFolder => '删除文件夹';

  @override
  String get shellDragToReorder => '拖动排序';

  @override
  String get shellSelectChats => '选择对话';

  @override
  String shellSelectedCount(int count) {
    return '已选 $count 个';
  }

  @override
  String get shellDeselectAll => '取消全选';

  @override
  String get shellSelectAll => '全选';

  @override
  String get shellUnpin => '取消置顶';

  @override
  String get shellArchive => '归档';

  @override
  String get shellCurrentlyRunning => '正在运行';

  @override
  String get shellUnread => '未读';

  @override
  String get shellPinned => '已置顶';

  @override
  String get shellEngineNotRunning => '引擎未运行';

  @override
  String shellHostNotConnected(String name) {
    return '还没连上「$name」';
  }

  @override
  String get shellSearchAfterConnecting => '连接后才能搜索';

  @override
  String get shellChatsLoadFailed => '对话列表加载失败';

  @override
  String shellSearchHostChats(String name) {
    return '搜索「$name」上的对话';
  }

  @override
  String get shellSearchTitlesHint => '按标题查找，含已归档的对话';

  @override
  String get shellSearchContentHint => '按标题和内容查找，含已归档的对话';

  @override
  String get shellLoadingChatsEllipsis => '正在加载对话…';

  @override
  String get shellNoMatchingChats => '没有相关对话';

  @override
  String get shellSearchDifferentKeywords => '换个关键词，或用空格分开多个词';

  @override
  String get shellArchived => '已归档';

  @override
  String get shellRestoreBeforeOpening => '已归档的对话需先恢复，才能打开';

  @override
  String get shellRestoreAndOpen => '恢复并打开';

  @override
  String get shellRestoreFailed => '没能恢复，稍后再试';

  @override
  String get shellSearchingMessages => '正在搜索消息内容…';

  @override
  String get shellHostTitleSearchOnly => '这台主机仅支持按标题搜索';

  @override
  String get shellContentSearchFailed => '内容搜索失败，仅显示标题匹配';

  @override
  String get shellContentSearchLimit => '内容匹配仅列出最相关的 20 个对话';

  @override
  String get shellMoveToOtherFolder => '移到其他文件夹';

  @override
  String get shellArchiveStopsTurn => '进行中的一轮会停止';

  @override
  String get shellRenameFailed => '没能重命名，稍后再试';

  @override
  String shellChatStoppedArchived(String title) {
    return '已停止并归档「$title」';
  }

  @override
  String shellChatArchived(String title) {
    return '已归档「$title」';
  }

  @override
  String get shellRenameChat => '重命名对话';

  @override
  String get shellChatTitle => '对话标题';

  @override
  String shellUnreadCount(int count) {
    return '$count 条未读';
  }

  @override
  String get shellLoadingChats => '正在加载对话';

  @override
  String get shellWorkspaceNoChats => '这里还没有对话';

  @override
  String get shellWorkspaceNewChatsHint => '新对话会放进这个工作区。旧对话不会自动移入，可在「全部对话」中找到。';

  @override
  String get shellNewChatsHint => '新对话会出现在这里';

  @override
  String get shellEngineStarting => '引擎正在启动';

  @override
  String get shellChatsAfterStarting => '启动后显示你的对话';

  @override
  String get shellStartEngine => '启动引擎';

  @override
  String get shellEngineStatusHint => '在「引擎」中查看状态';

  @override
  String shellHostUnreachable(String name) {
    return '连不上「$name」';
  }

  @override
  String shellHostReconnecting(String name) {
    return '正在重新连接「$name」…';
  }

  @override
  String get shellRetryNow => '立即重试';

  @override
  String shellHostConnecting(String name) {
    return '正在连接「$name」…';
  }

  @override
  String get shellHostChatsAfterConnecting => '连接后显示这台主机上的对话';

  @override
  String shellCurrentHostLabel(String name, String view) {
    return '当前主机：$name，$view。切换主机';
  }

  @override
  String get shellChatGone => '这个对话已不在了';

  @override
  String get shellAccentMist => '雾蓝';

  @override
  String get shellAccentDaiqing => '黛青';

  @override
  String get shellAccentDusk => '暮紫';

  @override
  String get shellAccentTurquoise => '松石';

  @override
  String get shellAccentAmber => '琥珀';

  @override
  String get shellAccentGraphite => '石墨';

  @override
  String get shellHideTurnFooter => '回合脚注';

  @override
  String get shellHideTokenCount => 'token 数';

  @override
  String get shellHideReasoning => '思考过程';

  @override
  String get shellHideActivityStrip => '活动条';

  @override
  String get shellHideWhaleTail => '鲸尾';

  @override
  String get shellHideTodoPill => '待办条';

  @override
  String get shellHideGoalBar => '目标条';

  @override
  String get shellToday => '今天';

  @override
  String get shellThisWeek => '本周';

  @override
  String get shellEarlier => '更早';

  @override
  String get shellSeatNative => '原生';

  @override
  String get shellSeatIsland => '内嵌网页';

  @override
  String get shellSeatWeb => '网页版打开';

  @override
  String get shellPlugins => '插件';

  @override
  String get shellHeaderActions => '顶栏按钮';

  @override
  String get shellAllHidden => '全部隐藏';

  @override
  String shellSettingCount(int count) {
    return '$count 个';
  }

  @override
  String get shellQuickActions => '快捷胶囊';

  @override
  String get shellSuggestionCards => '建议卡片';

  @override
  String shellSuggestionCardCount(int count) {
    return '$count 张';
  }

  @override
  String get shellDrawerGroups => '抽屉分组';

  @override
  String get shellDrawerSort => '抽屉排序';

  @override
  String get shellDrawerFilter => '抽屉筛选';

  @override
  String get shellPending => '待确认';

  @override
  String get shellAll => '全部';

  @override
  String get shellDensity => '疏密';

  @override
  String get shellCompact => '紧凑';

  @override
  String get shellSpacious => '宽松';

  @override
  String get shellThemeMode => '外观模式';

  @override
  String get shellAccentColor => '强调色';

  @override
  String get shellPet => '宠物';

  @override
  String get shellConfigured => '已设置';

  @override
  String get shellShortcuts => '快捷键';

  @override
  String get shellConfigFileTooLarge => '文件超过 64 KiB';

  @override
  String get shellConfigRootNotObject => '顶层必须是对象';

  @override
  String get shellConfigVersionMissing => '缺少 version';

  @override
  String get shellConfigVersionNotInt => 'version 必须是整数';

  @override
  String get shellConfigVersionTooLow => 'version 从 1 开始';

  @override
  String shellConfigVersionTooHigh(int version) {
    return '需要更新 App 才能使用版本 $version';
  }

  @override
  String get shellConfigNotObject => '应该是对象';

  @override
  String get shellConfigNotArray => '应该是数组';

  @override
  String get shellConfigNotString => '应该是字符串';

  @override
  String get shellConfigNotBool => '应该是 true 或 false';

  @override
  String get shellConfigEmpty => '不能为空';

  @override
  String get shellConfigUnknownKey => '未知的键，已忽略';

  @override
  String get shellConfigDuplicateKey => '重复的键，只认最后一个';

  @override
  String get shellConfigDuplicateItem => '重复了，已忽略';

  @override
  String shellConfigMissing(String key) {
    return '缺少 $key';
  }

  @override
  String shellConfigTruncated(int count) {
    return '超过 $count 个字，已截断';
  }

  @override
  String shellConfigTooLong(int count) {
    return '超过 $count 个字';
  }

  @override
  String shellConfigTooMany(int count) {
    return '最多 $count 个，多出的已忽略';
  }

  @override
  String get shellConfigValueNoun => '值';

  @override
  String shellConfigUnsupportedValue(String noun, String value) {
    return '不支持的$noun「$value」';
  }

  @override
  String get shellConfigHeaderItem => '应该是按钮 id 或对象';

  @override
  String get shellConfigHeaderId => 'id 只能用字母、数字和 -，以小写字母开头';

  @override
  String get shellConfigIdTaken => 'id 重复';

  @override
  String get shellConfigCommandSlash => '命令名不带 /，已去掉';

  @override
  String get shellConfigCommandName => '命令名只能用字母、数字和 : . _ -';

  @override
  String get shellConfigNoNewline => '不能换行';

  @override
  String get shellConfigHttpsOnly => '只支持 https 链接';

  @override
  String get shellConfigBadUrl => '链接格式不对';

  @override
  String get shellConfigAccentFormat => '颜色要写成 #RRGGBB';

  @override
  String get shellConfigAccentBoth => '和 accentPreset 二选一，已用 accentPreset';

  @override
  String get shellConfigPetId => 'id 只能用小写字母、数字和 -';

  @override
  String get shellConfigKeysFormat => '写法不对，例如 ctrl+k';

  @override
  String get shellConfigSystemKey => '不能用系统键';

  @override
  String get shellConfigNeedModifier => '要带 ctrl 或 alt';

  @override
  String get shellConfigReservedKey => '被系统或输入法占用';

  @override
  String shellConfigDuplicateShortcut(String pointer) {
    return '和 $pointer 重复';
  }

  @override
  String get shellConfigSlotName => 'slot 名格式不对';

  @override
  String get shellConfigUnknownSlot => '当前 DSH 没有这个 slot，先保留';

  @override
  String get shellConfigUnseatableSlot => '这个位置不放插件';

  @override
  String get shellConfigPackageName => '包名格式不对';

  @override
  String get shellConfigActionNoun => '动作';

  @override
  String get shellConfigPageNoun => '页面';

  @override
  String get shellConfigButtonNoun => '按钮';

  @override
  String get shellConfigIconNoun => '图标';

  @override
  String get shellConfigNotTextFile => '不是文本文件';

  @override
  String shellJsonPosition(int line, int column, String reason) {
    return '第 $line 行第 $column 列：$reason';
  }

  @override
  String get shellJsonEmptyFile => '文件是空的';

  @override
  String get shellJsonExtraContent => '后面还有多余的内容';

  @override
  String get shellJsonIncompleteFile => '文件不完整';

  @override
  String get shellJsonCommentsUnsupported => '不支持注释';

  @override
  String get shellJsonDoubleQuotes => '字符串要用双引号';

  @override
  String get shellJsonMissingValue => '这里缺少一个值';

  @override
  String shellJsonUnknownContent(String value) {
    return '无法识别的内容「$value」';
  }

  @override
  String get shellJsonTooDeep => '嵌套太深';

  @override
  String get shellJsonExtraComma => '多余的逗号';

  @override
  String get shellJsonQuotedKey => '键要用双引号括起来';

  @override
  String get shellJsonExpectedKey => '这里应该是一个键';

  @override
  String get shellJsonMissingColon => '键后面缺少冒号';

  @override
  String get shellJsonMissingComma => '这里缺少逗号';

  @override
  String shellJsonUnexpectedContent(String value) {
    return '这里不应该出现「$value」';
  }

  @override
  String get shellJsonUnterminatedString => '字符串没有结束';

  @override
  String get shellJsonBadEscape => '字符串里的转义不对';

  @override
  String get shellJsonStringNewline => '字符串里不能直接换行';

  @override
  String get shellJsonControlCharacter => '字符串里有控制字符';

  @override
  String get shellJsonBadNumber => '数字格式不对';

  @override
  String shellSkillInstallPrompt(String skill) {
    return '请在这台主机上安装 DSH Go 的界面技能 $skill：';
  }

  @override
  String shellSkillInstallDirectory(String skill) {
    return '1. 目标目录是 `\$DSH_HOME/skills/$skill/`（没有设置 DSH_HOME 时是 `~/.dsh/skills/$skill/`），不存在就先建。';
  }

  @override
  String get shellSkillInstallFiles => '2. 把下面每个文件按给出的相对路径原样写进去，内容一个字都不要改。';

  @override
  String get shellSkillInstallConfirm => '4. 告诉我装好了。';

  @override
  String shellSkillInstallFile(String path) {
    return '文件 `$path`：';
  }

  @override
  String get shellFromUiJson => '来自 ui.json';

  @override
  String get shellViewSource => '查看来源';

  @override
  String get shellSourcePosition => '位置';

  @override
  String get shellRestoreDefaults => '恢复默认';

  @override
  String get shellConfigNotApplied => '没有生效';

  @override
  String shellConfigDroppedCount(int count) {
    return '$count 处没生效';
  }

  @override
  String shellConfigAppliedCount(int count) {
    return '已应用 $count 项';
  }

  @override
  String get shellInterfaceConfig => '界面配置';

  @override
  String get shellSkillNotInstalled => '未安装技能';

  @override
  String get shellInstallInterfaceSkill => '安装界面技能';

  @override
  String get shellInstallInterfaceSkillMessage => '装好后，可以让 AI 按你的话调整 App 界面';

  @override
  String get shellNoUiJson => '没有 ui.json';

  @override
  String get shellConfigUsingPrevious => '没有生效，仍在用上一次的配置';

  @override
  String get shellConfigDroppedHeading => '没生效';

  @override
  String get shellConfigNotesHeading => '提示';

  @override
  String get shellConfigAppliedHeading => '已应用';

  @override
  String shellConfigValueOptions(String noun, String value, String options) {
    return '不支持的$noun「$value」，可选：$options';
  }

  @override
  String get shellListSeparator => '、';

  @override
  String shellSkillInstallCheck(String command) {
    return '3. 写完运行 $command，能运行就说明装好了（提示还没有 ui.json 是正常的）。';
  }

  @override
  String get shellSemanticsSeparator => '，';

  @override
  String shellChatsArchivedPartial(int count, int failed) {
    return '已归档 $count 个对话，$failed 个没能归档';
  }

  @override
  String starPromptTitle(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '本鱼已经在 DSH Go 里陪你 $hours 个小时啦⁠~',
      one: '本鱼已经在 DSH Go 里陪你一个小时啦⁠~',
      zero: '本鱼已经在 DSH Go 里陪你半个小时啦⁠~',
    );
    return '$_temp0';
  }

  @override
  String get starPromptBody => '这是一个免费开源的项目，如果它让你的移动端体验更好了一点，拜托点个 Star 支持一下，这对本鱼是很大的鼓励！';

  @override
  String get starPromptPlea => '拜托你啦~ 这真的很重要！！';

  @override
  String get starPromptStar => '去 GitHub 点 Star';

  @override
  String get starPromptDone => '已经点过啦';

  @override
  String get starPromptLater => '下次再说';

  @override
  String get starSettingsTitle => '给 DSH Go 点个 star';

  @override
  String get stateDiagnosticsSubject => 'DSH Go 诊断包';

  @override
  String get stateStoragePermission => '没有存储权限，存不进「下载」';

  @override
  String get stateDiagnosticsStorageFull => '存储空间不足，没能生成诊断包';

  @override
  String get stateDiagnosticsExportFailed => '没能导出诊断包';

  @override
  String get stateForumUnreachable => '没能连上论坛';

  @override
  String get stateSignInExpired => '登录已失效，请重新登录';

  @override
  String get stateForbidden => '没有权限';

  @override
  String get stateForumContentMissing => '内容不存在或已删除';

  @override
  String get stateTooManyActions => '操作太频繁，稍后再试';

  @override
  String get stateForumSendFailed => '没能发出去';

  @override
  String get stateForumServerError => '论坛暂时出了问题';

  @override
  String get stateBrowserOpenFailed => '没能打开浏览器';

  @override
  String get stateSignInStartFailed => '没能开始登录';

  @override
  String get stateSignInIncompleteRetry => '登录没有完成，请重试';

  @override
  String get statePluginLabel => '插件';

  @override
  String get stateConfigLabel => '配置';

  @override
  String get stateConfigShare => '配置分享';

  @override
  String get stateShareCode => '分享码';

  @override
  String get stateCopyShareCodeFirst => '先在分享里复制分享码';

  @override
  String get stateFileOpenFailed => '无法打开这个文件';

  @override
  String get stateLinkOpenFailed => '无法打开这个链接';

  @override
  String get stateAlertPublicDone => '有一轮完成了';

  @override
  String get stateAlertPublicFailed => '有一轮出错了';

  @override
  String get stateAlertPublicStopped => '有一轮停下了';

  @override
  String get stateAlertPublicApproval => '有一步等你确认';

  @override
  String get stateAlertPublicQuestion => '有个问题等你回答';

  @override
  String get stateAlertTurnDone => '这一轮已完成';

  @override
  String get stateAlertOutputLimit => '已结束 · 达到单次输出长度上限';

  @override
  String get stateAlertTurnBlocked => '这一轮被拦截了';

  @override
  String get stateAlertEngineRestarted => '已中断 · 引擎重启过';

  @override
  String get stateAlertMissingKey => '出错了 · 还没有配置密钥';

  @override
  String get stateAlertTurnFailed => '这一轮出错了';

  @override
  String get stateRunCommand => '运行命令';

  @override
  String get stateWriteFile => '写入文件';

  @override
  String get stateEditFile => '修改文件';

  @override
  String get stateOpenPage => '打开网页';

  @override
  String get stateWebSearch => '联网搜索';

  @override
  String get stateAlertQuestion => '问你一个问题';

  @override
  String get stateSizeSmall => '小';

  @override
  String get stateSizeStandard => '标准';

  @override
  String get stateSizeLarge => '大';

  @override
  String get statePetDone => '做完了';

  @override
  String get statePetFailed => '出错了';

  @override
  String get statePhoneNotReady => '手机操控模块未就绪';

  @override
  String get stateBackgroundRestricted => '后台联网被系统限制';

  @override
  String get stateBackgroundFinish => '让对话在后台也能跑完';

  @override
  String get stateDeepSeekAccount => 'DeepSeek 账号';

  @override
  String get stateAccountUnreachable => '连不上 DeepSeek';

  @override
  String get stateAccountUnavailable => 'DeepSeek 暂时无法登录';

  @override
  String get stateSignInIncomplete => '登录没有完成';

  @override
  String get stateSignInTimeout => '登录超时';

  @override
  String get stateSignInSaveFailed => '登录信息没能保存';

  @override
  String get stateEngineNotReady => '引擎还没准备好';

  @override
  String get stateSignInInterrupted => '登录被中断';

  @override
  String get stateAccountUnsupported => '当前引擎不支持账号登录';

  @override
  String get stateCheckPhoneNetwork => '检查手机网络后重试';

  @override
  String get stateServiceUnavailableRetry => '服务暂时不可用，稍后重试';

  @override
  String get stateAuthorizationFailed => '授权没有成功，重新登录';

  @override
  String get stateAuthorizationExpired => '授权页面已失效，重新登录';

  @override
  String get stateRestartEngineRetry => '在「引擎」页重启后重试';

  @override
  String get stateEngineStartingRetry => '引擎正在启动，稍后再试';

  @override
  String get stateEngineDisconnectedSignIn => '引擎连接已断开，重新登录';

  @override
  String get stateUpdateRuntimeOrKey => '更新运行环境，或改用 API Key';

  @override
  String get stateEngineDisconnected => '引擎未连接';

  @override
  String get stateAgentError => '出错';

  @override
  String get stateNotRunning => '未运行';

  @override
  String get stateAgentOneShot => '一次性';

  @override
  String get stateAgentContinuable => '可继续';

  @override
  String get stateAgentExternal => '外部任务';

  @override
  String get stateSubagent => '子代理';

  @override
  String get stateParentChat => '上级对话';

  @override
  String get statePreparing => '准备中';

  @override
  String get stateIconMist => '雾蓝';

  @override
  String get stateIconNight => '夜幕';

  @override
  String get stateIconFrost => '霜白';

  @override
  String get stateIconInk => '墨';

  @override
  String get stateAppDisclaimer => '基于 DeepSeek Harness 构建 · 非 DeepSeek 官方应用';

  @override
  String get stateWallpaper => '壁纸';

  @override
  String get stateFileMissing => '找不到这个文件了，可能已被删除或移走';

  @override
  String get stateFileNoApp => '手机上没有能打开这类文件的应用';

  @override
  String get stateFileConnectionLimit => '文件太大，这个连接传不过来';

  @override
  String get stateFileReadUnsupported => '这个连接不支持读取文件';

  @override
  String get stateArtifactImage => '图片';

  @override
  String get stateArtifactDocument => '文档';

  @override
  String get stateArtifactSheet => '表格';

  @override
  String get stateArtifactSlides => '演示文稿';

  @override
  String get stateArtifactArchive => '压缩包';

  @override
  String get stateArtifactAudio => '音频';

  @override
  String get stateArtifactVideo => '视频';

  @override
  String get stateArtifactWeb => '网页';

  @override
  String get stateArtifactText => '文本';

  @override
  String get stateArtifactFile => '文件';

  @override
  String get statePrivateKeyTooLarge => '文件太大，不像是私钥';

  @override
  String get stateBotTeamBusy => '另一个 DSH 正在使用这个团队';

  @override
  String get stateBotOperationFailed => '没能完成操作，再试一次';

  @override
  String get stateBotMissing => '这台主机没有 DS Bot';

  @override
  String get stateHostAuthFailed => '没能通过主机的验证';

  @override
  String get stateUnexpectedError => '出了点问题';

  @override
  String get stateGroupChat => '群聊';

  @override
  String get stateBotNewMessage => 'Bot 有新消息';

  @override
  String get stateChatAgentBusy => 'AI 正忙，稍后再试';

  @override
  String get stateChatWriterHeld => '这个对话正在别处使用';

  @override
  String get stateChatModelUnavailable => '这个模型现在用不了';

  @override
  String get stateChatAttachmentInvalid => '这个附件发不了';

  @override
  String get stateChatForkUnavailable => '这里不能分叉';

  @override
  String get stateChatImagesTooLarge => '图片太大，少选几张再发';

  @override
  String get stateChatSyncInterrupted => '对话同步中断';

  @override
  String get stateChatSynchronizing => '正在同步对话';

  @override
  String get stateChatSyncRetry => '重新同步';

  @override
  String get stateChatSyncRequired => '对话尚未同步，请重新同步后再试';

  @override
  String get stateChatAutoApproveFailed => '自动允许失败';

  @override
  String get stateCommandMissing => '没有这个指令';

  @override
  String get stateCommandFailed => '指令没有执行';

  @override
  String get stateChatStopSteered => '没能停下本轮，已作为插话发送';

  @override
  String get stateChatTextOnlyModel => '当前模型只能读文字，图片已作为文件发给 AI。想让 AI 直接看图，请换成 V4.1 Flash';

  @override
  String get stateAttachmentUploadFailed => '附件上传失败';

  @override
  String get stateChatImageModelRequired => '当前模型看不了图片，换成 V4.1 Flash 再发';

  @override
  String get stateSendFailed => '发送失败';

  @override
  String get stateChatStopFailed => '没能停下，再试一次';

  @override
  String get stateChatTurnEnded => '这一轮已经结束，消息会作为新一轮发送';

  @override
  String get stateChatSteerFailed => '插话失败';

  @override
  String get stateChatUndoTooLate => '来不及了，AI 已经读到这条消息';

  @override
  String get stateChatUndoFailed => '撤回失败';

  @override
  String get stateChatApprovalFailed => '审批提交失败';

  @override
  String get stateChatAnswerFailed => '回答提交失败';

  @override
  String get stateChatModelSwitchFailed => '切换模型失败';

  @override
  String get stateChatHistoryFailed => '加载历史失败';

  @override
  String get stateChatBranchLastReply => '只能从已完成的一轮的最后一条回复分叉';

  @override
  String get stateChatBranchFailed => '分叉失败';

  @override
  String get stateChatEarlierHistoryFailed => '读取更早的记录失败';

  @override
  String get stateChatNoEarlierHistory => '这条消息之前没有能保留的记录，直接新建对话就好';

  @override
  String get stateCommandNewDescription => '开始一个新对话';

  @override
  String get stateModelLabel => '模型';

  @override
  String get stateCommandModelDescription => '切换模型与思考深度';

  @override
  String get stateCommandExportLabel => '导出日志';

  @override
  String get stateCommandExportDescription => '把这个对话的完整记录打包成 ZIP，分享或存到「下载」';

  @override
  String get stateAllFeatures => '全部功能';

  @override
  String get stateCommandFeaturesDescription => '官方网页版每项功能的入口';

  @override
  String get stateCompactLabel => '压缩';

  @override
  String get stateCommandCompactDescription => '压缩以上对话内容，腾出上下文';

  @override
  String get statePermissionLabel => '权限';

  @override
  String get stateCommandPermissionDescription => '切换权限预设（沙箱模式与审批策略）';

  @override
  String get stateCommandPermissionHint => '<预设名>';

  @override
  String get statePlanLabel => '计划';

  @override
  String get stateCommandPlanDescription => '进入或退出计划模式';

  @override
  String get stateGoalLabel => '目标';

  @override
  String get stateCommandGoalDescription => '设置或查看长期任务目标';

  @override
  String get stateFeedbackLabel => '反馈';

  @override
  String get stateCommandFeedbackDescription => '发送关于当前对话的反馈';

  @override
  String get stateCommandFeedbackHint => '<内容>';

  @override
  String get stateShareFileTooLarge => '有文件太大，未添加';

  @override
  String get stateShareFileUnreadable => '有文件没能读取';

  @override
  String get stateShareImagesOnly => '当前主机只能发送图片';

  @override
  String get stateComposerInserted => '已放进输入框';

  @override
  String get stateCordisPending => '待确认';

  @override
  String get stateCordisStarting => '启动中';

  @override
  String get stateCordisRunFailed => '运行失败';

  @override
  String get stateCordisNoApproval => '没有获得运行许可';

  @override
  String get stateCordisBackendFailed => '后台部分没能启动';

  @override
  String get stateCordisClientLoadFailed => '界面没能加载';

  @override
  String get stateCordisRenderFailed => '界面显示出错';

  @override
  String get stateCordisFailed => '没能运行';

  @override
  String get stateDrawerAll => '全部';

  @override
  String get stateDrawerUnread => '未读';

  @override
  String get stateDrawerToday => '今天';

  @override
  String get stateDrawerThisWeek => '本周';

  @override
  String get stateDrawerEarlier => '更早';

  @override
  String get stateEngineAuthFailed => '没能通过引擎的验证';

  @override
  String get stateChatMissing => '这个对话已经不在了';

  @override
  String get stateEngineUnsupported => '当前引擎版本不支持';

  @override
  String get stateSettingsRefreshed => '刚在别处改过，已刷新';

  @override
  String get stateCredentialFromEnvironment => '引擎的启动环境已提供这个 Key，无法在这里修改';

  @override
  String get stateSettingsFromFile => '由配置文件固定';

  @override
  String get stateSettingsInteger => '请填整数';

  @override
  String get stateSettingsInvalidFormat => '格式不对';

  @override
  String get stateSettingsReadOnly => '引擎设置是只读的';

  @override
  String get statePluginDisabled => '插件已停用';

  @override
  String get stateSettingsRestartRequired => '这一项要重启引擎才能改';

  @override
  String get stateSettingsInvalidValue => '值不合法';

  @override
  String get stateSettingsRejected => '引擎没有接受这个值';

  @override
  String get stateInventoryEnabled => '已启用';

  @override
  String get stateInventoryDisabled => '未启用';

  @override
  String get stateLoading => '加载中';

  @override
  String get stateInventoryWaiting => '等待依赖';

  @override
  String get stateInventoryConditional => '条件启用';

  @override
  String get stateBundleBuiltIn => 'DSH 内置';

  @override
  String get stateBundleHeadless => '无界面运行';

  @override
  String get stateConfigFile => '配置文件';

  @override
  String get stateGoalEmpty => '目标不能为空';

  @override
  String get stateGoalPauseFailed => '没能暂停';

  @override
  String get stateGoalResumeFailed => '没能恢复';

  @override
  String get stateGoalClearOffline => '没能清除：没能连上引擎';

  @override
  String get stateGoalClearFailed => '没能清除';

  @override
  String get stateGoalStale => '目标刚有变化，再试一次';

  @override
  String get stateGoalMissing => '目标已不在';

  @override
  String get stateGoalChatNotReady => '对话未就绪，稍后再试';

  @override
  String get stateGoalTurnsExhausted => '轮次已用完';

  @override
  String get stateGoalStateChanged => '目标状态已变化';

  @override
  String get stateSshHost => 'SSH 主机';

  @override
  String get stateHostBrowserFailed => '没能打开浏览器，可以复制登录链接到浏览器里完成。';

  @override
  String get stateSignInFailed => '没能登录';

  @override
  String get stateMarketTooLarge => '插件目录太大，已停止下载';

  @override
  String get stateMarketUnreachable => '没能连上插件目录';

  @override
  String get stateMarketInsecure => '没能和插件目录建立安全连接';

  @override
  String get stateMarketTimeout => '插件目录加载超时';

  @override
  String get stateMarketInterrupted => '插件目录下载中断';

  @override
  String get stateRegistryDefault => '默认安装源';

  @override
  String get stateRegistryNpm => 'npm 官方源';

  @override
  String get stateRegistryMirror => 'npmmirror 镜像';

  @override
  String get statePluginIncompatible => '这个插件不支持当前的 DSH 版本。';

  @override
  String get statePluginInstallCancelled => '已取消安装';

  @override
  String get statePluginNoChanges => '没有改动任何东西';

  @override
  String get statePluginIncompatibleTitle => '和当前 DSH 不兼容';

  @override
  String get statePluginNetworkFailed => '网络连不上';

  @override
  String get statePluginSourceUnreachable => '连不上插件源码所在的网站';

  @override
  String get statePluginDownloadTimeout => '下载超时';

  @override
  String get statePluginRegistryUnavailable => '安装源暂时没有响应';

  @override
  String get statePluginPnpmMissing => '缺少 pnpm';

  @override
  String get statePluginPhonePnpmMissing => '这台手机缺少 pnpm';

  @override
  String get statePluginHostPnpmMissing => '这台主机缺少 pnpm';

  @override
  String get statePluginNotFound => '找不到这个插件';

  @override
  String get statePluginPackageMissing => '安装源里没有这个包';

  @override
  String get statePluginTooNew => '版本太新';

  @override
  String get statePluginWaitForRelease => '发布满 24 小时后才能安装';

  @override
  String get statePluginVersionMissing => '找不到这个版本';

  @override
  String get statePluginRegistryVersionMissing => '安装源里还没有这个版本';

  @override
  String get stateDeviceStorageFull => '设备存储空间不足';

  @override
  String get statePluginNoWritePermission => '没有写入权限';

  @override
  String get statePluginConfigReadOnly => '引擎配置目录不可写';

  @override
  String get statePluginIntegrityFailed => '文件校验失败';

  @override
  String get statePluginDownloadIncomplete => '下载的文件不完整';

  @override
  String get statePluginBuildScripts => '需要运行构建脚本';

  @override
  String get statePluginBuildApproval => '构建脚本等待允许';

  @override
  String get statePluginAlreadyInstalled => '已经装过了';

  @override
  String get statePluginUninstallFirst => '换版本需先卸载';

  @override
  String get statePluginInvalid => '这不是 DSH 插件';

  @override
  String get statePluginNoEntry => '这个包没有插件入口，已撤销安装';

  @override
  String get statePluginInUse => '插件正在被使用';

  @override
  String get statePluginHasDependents => '有其他插件依赖它';

  @override
  String get statePluginManagedElsewhere => '不能在这里修改';

  @override
  String get statePluginEngineManaged => '这个插件由引擎单独管理';

  @override
  String get statePluginAuthorizationExpired => '授权已过期';

  @override
  String get statePluginBuildChanged => '构建脚本已变化，需要重新安装';

  @override
  String get statePluginInvalidAddress => '安装地址无效';

  @override
  String get statePluginCatalogInvalidAddress => '插件目录的安装地址不正确';

  @override
  String get statePluginOperationIncomplete => '操作没有完成';

  @override
  String get statePluginRemoteForbidden => '这台主机不允许远程安装';

  @override
  String get statePluginRelayToggleOnly => '经中转连接只能开关插件';

  @override
  String get statePluginManagementUnsupported => '主机不支持插件管理';

  @override
  String get statePluginEngineUnsupported => '当前引擎不支持插件管理';

  @override
  String get statePluginResultMissing => '没能拿到安装结果';

  @override
  String get statePluginResultPending => '安装结果待确认';

  @override
  String get statePluginDisconnected => '连接断开了';

  @override
  String get statePluginQueued => '排队中';

  @override
  String get statePluginRemoving => '正在卸载旧版本';

  @override
  String get statePluginInstalling => '正在下载安装';

  @override
  String get statePluginApplying => '正在启用';

  @override
  String get statePluginCancelling => '正在取消';

  @override
  String get statePluginInstalledRestart => '已安装，重启后生效';

  @override
  String get statePluginInstallFailed => '安装失败';

  @override
  String get statePluginConnectFirst => '连接后可安装插件';

  @override
  String get stateProviderOpenAi => 'OpenAI 兼容';

  @override
  String get stateProviderAnthropic => 'Anthropic 兼容';

  @override
  String get stateProviderUrlRequired => '填写 Base URL';

  @override
  String get stateProviderUrlInvalid => '以 http:// 或 https:// 开头的完整地址';

  @override
  String get stateProviderUrlSuffix => '去掉 ? 或 # 之后的部分';

  @override
  String get stateProviderKeyRequired => '填写 API Key';

  @override
  String get stateProviderKeyOnly => '只粘贴 Key 本身，不带变量名';

  @override
  String get stateProviderKeyQuotes => '去掉两边的引号';

  @override
  String get stateProviderKeyInvalid => 'Key 含有无效字符';

  @override
  String get stateProviderModelRequired => '填写模型 ID';

  @override
  String get stateProviderModelSpaces => '模型 ID 不能有空格';

  @override
  String get stateProviderAlreadyAdded => '已经添加过';

  @override
  String get stateProviderConflict => '渠道刚被改过，返回后重试';

  @override
  String get stateProviderUnsupported => '当前引擎版本不支持这个操作';

  @override
  String get stateProviderKeyRejected => 'API Key 无效或没有权限';

  @override
  String get stateProviderModelsMissing => '找不到模型列表，检查 Base URL';

  @override
  String get stateProviderRateLimited => '请求太频繁，稍后再试';

  @override
  String get stateProviderResponseTooLarge => '返回的内容过大';

  @override
  String get stateProviderUnreachable => '连不上这个地址，检查 Base URL 和网络';

  @override
  String get stateProviderModelsUnreadable => '没有读到模型列表，检查 Base URL';

  @override
  String get stateProviderManualModels => '这个协议不能获取模型，请手动添加';

  @override
  String get stateProviderConfigRejected => '引擎拒绝了这个配置，检查协议和模型';

  @override
  String get stateProviderOffline => '没有连上引擎';

  @override
  String get stateSafeStartupFailed => '启动失败';

  @override
  String get stateSafeCrashedEarly => '启动后很快崩溃';

  @override
  String get stateSafeCrashedLate => '运行中崩溃';

  @override
  String get stateSafeKilled => '被系统结束';

  @override
  String get stateSafeManualEntry => '我手动进入了安全模式';

  @override
  String get stateScheduleNotCreated => '对话结束了，但没有建成任务';

  @override
  String get stateScheduleChatFailed => '对话出错了';

  @override
  String get stateScheduleResultPending => '还没等到结果';

  @override
  String get statePlanPending => '计划待审';

  @override
  String get stateQuestionPending => '待回答';

  @override
  String get stateExportRelayUnsupported => '经中转连接暂不支持导出';

  @override
  String get stateExportChatMissing => '找不到这个对话了';

  @override
  String get stateExportFailed => '没能导出';

  @override
  String get stateSizeExtraLarge => '特大';

  @override
  String get stateSubscriptionUnsupported => '当前引擎不支持订阅登录';

  @override
  String get stateSubscriptionUnreachable => '连不上登录服务，检查网络后重试';

  @override
  String get stateSubscriptionSignInFailed => '没能完成登录，再试一次';

  @override
  String get stateSubscriptionTimeout => '请求超时，检查网络后重试';

  @override
  String get stateSubscriptionDisconnected => '和引擎的连接断开了，稍后重试';

  @override
  String get stateTerminalLimit => '终端数量已达上限';

  @override
  String get stateTerminalStartFailed => '没能启动终端';

  @override
  String get stateTileDuotone => '扁平双色';

  @override
  String get stateTileGeometric => '极简几何';

  @override
  String get stateTileGlassy => '玻璃渐变';

  @override
  String get stateUiNative => '原生';

  @override
  String get stateDefaultWorkspace => '默认工作区';

  @override
  String stateDiagnosticsSaved(String where) {
    return '已存到 $where';
  }

  @override
  String get stateDownloadsPrefix => '下载/';

  @override
  String stateSharePluginCount(int count) {
    return '$count 个插件';
  }

  @override
  String stateShareSkillCount(int count) {
    return '$count 个技能';
  }

  @override
  String stateShareSettingCount(int count) {
    return '$count 组设置';
  }

  @override
  String stateAlertCompletedReply(String reply) {
    return '已完成 · $reply';
  }

  @override
  String stateAlertErrorDetail(String detail) {
    return '出错了 · $detail';
  }

  @override
  String stateAlertUseTool(String name) {
    return '使用工具 $name';
  }

  @override
  String stateAlertApprovalAction(String action) {
    return '等你确认：$action';
  }

  @override
  String stateAlertApprovalReason(String action, String reason) {
    return '等你确认：$action · $reason';
  }

  @override
  String stateAlertQuestions(String question, int count) {
    return '问你：$question（共 $count 个）';
  }

  @override
  String stateAlertQuestionText(String question) {
    return '问你：$question';
  }

  @override
  String statePetChatsDone(int count) {
    return '$count 个对话做完了';
  }

  @override
  String statePetChatsFailed(int count) {
    return '$count 个对话出错了';
  }

  @override
  String statePetChatsApproval(int count) {
    return '$count 个对话等你确认';
  }

  @override
  String statePetChatsQuestion(int count) {
    return '$count 个对话等你回答';
  }

  @override
  String stateAttachmentEmpty(String name) {
    return '「$name」是空文件';
  }

  @override
  String stateAttachmentImageLimit(String name) {
    return '图片「$name」超过 20 MB';
  }

  @override
  String stateAttachmentFileLimit(String name) {
    return '文件「$name」超过 30 MB';
  }

  @override
  String stateBotFinished(String name) {
    return '$name 完成了工作';
  }

  @override
  String stateBotQuestion(String name, String text) {
    return '$name 问你：$text';
  }

  @override
  String stateBotApproval(String name, String text) {
    return '$name 等你批准：$text';
  }

  @override
  String get stateCommandPlanHint => '[off | 要求]';

  @override
  String get stateCommandGoalHint => '[目标 | clear | pause | resume]';

  @override
  String stateShareReadFailed(String name) {
    return '没能读取「$name」';
  }

  @override
  String stateShareAttachmentLimit(int count) {
    return '每条消息最多 $count 个附件';
  }

  @override
  String stateShareNamedFileTooLarge(String name) {
    return '「$name」太大，未添加';
  }

  @override
  String stateShareTextTruncated(int count) {
    return '文字太长，只保留了前 $count 字';
  }

  @override
  String stateSettingsMinimum(String bound) {
    return '不能小于 $bound';
  }

  @override
  String stateSettingsMaximum(String bound) {
    return '不能大于 $bound';
  }

  @override
  String stateSettingsMultiple(String bound) {
    return '需是 $bound 的倍数';
  }

  @override
  String stateSettingsMinLength(int count) {
    return '至少 $count 个字符';
  }

  @override
  String stateSettingsMaxLength(int count) {
    return '最多 $count 个字符';
  }

  @override
  String stateEngineHttpRejected(int status) {
    return '引擎拒绝了请求（$status）';
  }

  @override
  String stateGoalActionOffline(String action) {
    return '$action：没能连上引擎';
  }

  @override
  String stateHostRemoteLabel(String name) {
    return '$name · 远程';
  }

  @override
  String stateMarketHttpError(int status) {
    return '插件目录暂时打不开（HTTP $status）';
  }

  @override
  String statePluginRuntimeIncompatible(String version) {
    return '这个插件不支持当前的 DSH 版本（$version）。';
  }

  @override
  String statePluginRequiredVersion(String wanted, String current) {
    return '这个插件要求 DSH $wanted，当前是 $current。';
  }

  @override
  String get statePluginRegistryUnreachable => '没能连上安装源';

  @override
  String statePluginNamedRegistryUnreachable(String registry) {
    return '没能连上安装源（$registry）';
  }

  @override
  String statePluginBuildsPending(String builds) {
    return '等待允许：$builds';
  }

  @override
  String statePluginRegistryProgress(String registry, int attempt, int attempts) {
    return '换用$registry下载（第 $attempt/$attempts 个源）';
  }

  @override
  String stateProviderServiceUnavailable(int status) {
    return '服务暂时不可用（$status）';
  }

  @override
  String stateProviderServiceStatus(int status) {
    return '服务返回了 $status';
  }

  @override
  String stateProviderKeySaveFailed(String reason) {
    return '渠道已保存，Key 没有存上：$reason';
  }

  @override
  String stateSafeSuspectPlugins(String what, String plugins) {
    return '$what，可疑插件：$plugins';
  }

  @override
  String stateSafePreflightFailed(String what, String checks) {
    return '$what，启动检查没通过：$checks';
  }

  @override
  String get stateListSeparator => '、';

  @override
  String stateSafeRepairPrompt(String what) {
    return '我的 DSH 正常模式出了问题（$what）。请按「安全模式」说明排查原因，先用可逆的办法修好 web 配置，修完用 dsh-app-plugins trial 试启动验证，再告诉我改了什么。';
  }

  @override
  String stateScheduleCreatePrompt(String title, String rule, String args) {
    return '新建自动化任务「$title」：$rule。\n只调用一次 schedule_create，参数原样使用；现在不要执行任务内容。\n\n```json\n$args\n```';
  }

  @override
  String stateActionReason(String action, String reason) {
    return '$action：$reason';
  }

  @override
  String stateAlertPreviewRun(String value) {
    return '运行：$value';
  }

  @override
  String stateAlertPreviewWrite(String value) {
    return '写入：$value';
  }

  @override
  String stateAlertPreviewEdit(String value) {
    return '修改：$value';
  }

  @override
  String stateAlertPreviewOpen(String value) {
    return '打开：$value';
  }

  @override
  String stateAlertPreviewUse(String value) {
    return '使用工具：$value';
  }

  @override
  String get stateUiWeb => '网页';

  @override
  String statePluginRegistryProgressUnknown(String registry, int attempt) {
    return '换用$registry下载（第 $attempt/null 个源）';
  }

  @override
  String get stateProviderTokenCountInvalid => '填写数字，如 128K';

  @override
  String get appSlogan => '随时随刻，想go就Go！';

  @override
  String get updateCheck => '检查更新';

  @override
  String get updateAutoCheck => '自动检查更新';

  @override
  String get updateAutoCheckDaily => '每天检查一次';

  @override
  String get updateTileDownloading => '下载中';

  @override
  String updateTileDownloadingPercent(int percent) {
    return '下载中 $percent%';
  }

  @override
  String get updateTileVerifying => '校验中';

  @override
  String get updateTileReady => '可以安装';

  @override
  String get updateTileInstalling => '安装中';

  @override
  String updateTileSkipped(String version) {
    return '已跳过 $version';
  }

  @override
  String updateTileNewVersion(String version) {
    return '新版本 $version';
  }

  @override
  String get updateTileUpToDate => '已是最新';

  @override
  String get updateTileUnavailable => '暂时检查不了';

  @override
  String get updateUpToDate => '已是最新版本';

  @override
  String get updateCheckUnavailable => '暂时检查不了更新，稍后再试';

  @override
  String get updateDownloadInterrupted => '下载中断了';

  @override
  String get updateDownloadInterruptedMessage => '网络断开或太慢，重试会接着下载。';

  @override
  String get updateDownloadUnavailable => '下载地址暂时打不开';

  @override
  String get updateDownloadUnavailableMessage => '稍后再试，或去发布页手动下载。';

  @override
  String get updateChecksumFailed => '安装包校验没通过';

  @override
  String get updateChecksumFailedMessage => '文件和发布时不一致，已删除，请重试。';

  @override
  String get updateChecksumMissing => '缺少校验信息';

  @override
  String get updateChecksumMissingMessage => '为了安全不在 App 内安装，可以去发布页手动下载。';

  @override
  String get updateStorageWriteFailed => '写不进安装包';

  @override
  String get updateStorageWriteFailedMessage => '存储可能已满，清理一些空间后重试。';

  @override
  String get updateFreeSpaceRetry => '清理一些空间后重试。';

  @override
  String updateSpaceRequired(String size) {
    return '需要约 $size 可用空间，清理后重试。';
  }

  @override
  String get updateSettingsOpenFailed => '没能打开系统设置';

  @override
  String get updateSettingsOpenFailedMessage => '到「设置 → 应用 → DSH Go」里允许「安装未知应用」，再回来安装。';

  @override
  String get updateInstallCancelled => '已取消安装';

  @override
  String get updateInstallCancelledMessage => '安装包还在，随时可以再装。';

  @override
  String get updateSignatureMismatch => '签名不一致，不能直接覆盖';

  @override
  String get updateSignatureMismatchMessage => '手机上的 DSH Go 签名不同（多半是测试包），需要先卸载旧版再装新版。卸载会清空对话、Linux 环境和设置。';

  @override
  String get updateWrongPackage => '不是 DSH 的安装包';

  @override
  String get updateWrongPackageMessage => '下载到的文件不对，已删除，请稍后重试。';

  @override
  String get updateDowngradeBlocked => '不能降级安装';

  @override
  String get updateDowngradeBlockedMessage => '手机上的 DSH 比这个安装包还新。';

  @override
  String get updateIncompatible => '和这台手机不兼容';

  @override
  String get updateIncompatibleMessage => '安装包要求的系统版本或处理器架构和手机不符。';

  @override
  String get updatePackageCorrupt => '安装包已损坏';

  @override
  String get updatePackageCorruptMessage => '已删除，请重新下载。';

  @override
  String get updateInstallBlocked => '安装被拦截了';

  @override
  String get updateInstallBlockedMessage => '在系统的安装确认里允许，或去发布页手动下载。';

  @override
  String get updateInstallIncomplete => '安装没有完成';

  @override
  String get updateInstallIncompleteMessage => '可以重试，或去发布页手动下载。';

  @override
  String updateBrowserOpenFailed(String host, String path) {
    return '没能打开浏览器，请手动访问 $host$path';
  }

  @override
  String updateUpToDateVersion(String version) {
    return '已是最新版本 $version';
  }

  @override
  String updateCurrentVersion(String version) {
    return '当前 $version';
  }

  @override
  String get updateNewVersionFound => '发现新版本';

  @override
  String get updateReleaseNotes => '更新内容';

  @override
  String get updateNoReleaseNotes => '这个版本没有写更新说明。';

  @override
  String get updateInstallKeepsData => '安装时 DSH Go 会退出，对话和设置都会保留';

  @override
  String get updateNoCompatiblePackage => '没有适合本机的安装包';

  @override
  String get updateDownloading => '正在下载';

  @override
  String updateDownloadSource(String source) {
    return '经由 $source';
  }

  @override
  String get updateDownloadInBackgroundNote => '关掉窗口也会继续下载';

  @override
  String get updateVerifyingPackage => '正在校验安装包…';

  @override
  String get updateVerifyingPackageNote => '确认文件和发布时一致';

  @override
  String get updateInstalling => '正在安装…';

  @override
  String get updateConfirmInstallNote => '在系统弹窗里确认安装';

  @override
  String get updatePackageDownloaded => '安装包已下载';

  @override
  String get updateReadyToInstall => '校验通过，可以安装了。';

  @override
  String get updateAllowInstall => '允许 DSH Go 安装应用';

  @override
  String get updateAllowInstallMessage => '在系统设置里打开「安装未知应用」，回来后自动继续。';

  @override
  String get updateOpenReleasePage => '打开发布页';

  @override
  String get updateUpdateNow => '立即更新';

  @override
  String get updateSkipVersion => '跳过这个版本';

  @override
  String get updateStarProject => '去 Star';

  @override
  String get updateCancelDownload => '取消下载';

  @override
  String get updateDownloadInBackground => '后台下载';

  @override
  String get updateVerifying => '正在校验…';

  @override
  String get updateInstallingBusy => '安装中…';

  @override
  String get updateOpenPermissionSettings => '去开启';

  @override
  String updateNoAbiPackage(String abi) {
    return '这个版本还没有 $abi 安装包，可以去发布页看看。';
  }

  @override
  String get updateNoPackage => '这个版本还没有安装包，可以去发布页看看。';

  @override
  String updateDownloadingPercent(int percent) {
    return '正在下载 $percent%';
  }

  @override
  String get usageStatsTitle => '发送匿名使用统计';

  @override
  String get usageStatsSection => '改进 DSH Go';

  @override
  String get usageStatsFooter => '只含使用次数、版本和手机品牌，不含对话、文件和账号。';

  @override
  String get usageNoticeBody => '不含对话和个人信息，可随时关闭';

  @override
  String get usageUpgradeNotice => '新增匿名使用统计，帮助改进 DSH Go。\n不含对话和个人信息';

  @override
  String get usageUpgradeLearn => '了解';

  @override
  String get usageUpgradeOff => '关闭';

  @override
  String viewArtifactSaved(String value) {
    return '已存到 $value';
  }

  @override
  String get viewDownloadFolder => '下载/';

  @override
  String get viewArtifactNoPreview => '无法预览';

  @override
  String get viewArtifactNotText => '不是文本文件';

  @override
  String get viewArtifactLarge => '文件较大';

  @override
  String get viewArtifactMissing => '文件已经不在了';

  @override
  String get viewArtifactNotFile => '这不是文件';

  @override
  String get viewArtifactOpenFailed => '没能打开';

  @override
  String get viewArtifactMore => '更多操作';

  @override
  String get viewWorkspace => '工作区';

  @override
  String get viewArtifactEmpty => '空文件';

  @override
  String viewArtifactLines(int count) {
    return '文件较大，只显示前 $count 行';
  }

  @override
  String viewArtifactRows(int count) {
    return '只显示前 $count 行';
  }

  @override
  String get viewArtifactColumns => '只显示前 200 列';

  @override
  String viewArtifactWorksheet(int value) {
    return '工作表 $value';
  }

  @override
  String get viewArtifactEmptySheet => '空工作表';

  @override
  String get viewArtifactEmptyTable => '空表格';

  @override
  String get viewArtifactConvertFailed => '没能转换';

  @override
  String get viewArtifactConverting => '正在转换为 PDF 预览…';

  @override
  String get viewArtifactImageFailed => '无法显示这张图片';

  @override
  String get viewArtifactPhoneOpen => '用手机上的应用打开';

  @override
  String get viewArtifactPdfFailed => '无法打开这个 PDF，试试用其他应用打开';

  @override
  String viewArtifactPages(int count) {
    return '共 $count 页';
  }

  @override
  String viewArtifactPage(int value) {
    return '第 $value 页';
  }

  @override
  String get viewBalanceInvalidKey => 'Key 无效，查不到余额';

  @override
  String get viewBalancePrefix => '余额 ';

  @override
  String get viewBalanceLowSuffix => ' · 余额不足';

  @override
  String get viewBalanceUnavailableSuffix => ' · 已不能调用';

  @override
  String get viewBalanceTopUp => '充值';

  @override
  String get viewBalanceTitle => 'DeepSeek 余额';

  @override
  String get viewBalanceKeyRequired => '填写 API Key 后可查询余额';

  @override
  String get viewBalanceKeyInvalid => 'API Key 无效，无法查询余额';

  @override
  String viewBalancePaid(String value) {
    return '充值 $value';
  }

  @override
  String viewBalanceGranted(String value) {
    return '赠送 $value';
  }

  @override
  String get viewBalanceLow => '余额不足';

  @override
  String get viewBalanceUnavailable => '已无法调用';

  @override
  String get viewBalanceChecking => '正在查询余额…';

  @override
  String get viewBalanceCheckFailed => '暂时无法查询余额';

  @override
  String get viewBalanceNoAlert => '不提醒';

  @override
  String viewBalanceBelow(String value) {
    return '低于 $value';
  }

  @override
  String get viewBalanceAlert => '低余额提醒';

  @override
  String get viewBalanceThreshold => '提醒线';

  @override
  String get viewBalanceGoTopUp => '去充值';

  @override
  String viewBalanceRemaining(String value) {
    return '余额仅剩 $value';
  }

  @override
  String get viewBalanceModelDisabled => '余额不足，模型已停用';

  @override
  String get viewBalanceRestore => '充值后恢复';

  @override
  String get viewUiIncomplete => '视图没有生成完';

  @override
  String get viewUiInvalid => '这个视图格式有误';

  @override
  String get viewUiResend => '让它重发';

  @override
  String viewChartUnit(String value) {
    return '单位：$value';
  }

  @override
  String viewChartSeries(int value) {
    return '第 $value 组';
  }

  @override
  String get viewChartTotal => '合计';

  @override
  String get viewChartBar => '柱状图';

  @override
  String get viewChartHorizontalBar => '横向柱状图';

  @override
  String get viewChartLine => '折线图';

  @override
  String get viewChartDonut => '环形图';

  @override
  String viewUiResendMessage(Object value) {
    return '上一个 dsh-ui 视图无法显示：$value。请修正后重发。';
  }

  @override
  String viewUiBytesLimit(int first, int second) {
    return '视图有 $first 字节，超过上限 $second 字节';
  }

  @override
  String get viewUiEmptyCode => '代码块是空的';

  @override
  String viewUiInvalidJson(String message) {
    return '不是合法的 JSON（$message）';
  }

  @override
  String get viewUiJsonRepaired => '含注释或尾逗号，已忽略';

  @override
  String get viewUiExpectedObject => '应该是一个组件对象';

  @override
  String viewUiDepthLimit(int first, int second) {
    return '第 $first 层，超过上限 $second 层';
  }

  @override
  String get viewUiMissingType => '缺少 type';

  @override
  String viewUiUnknownComponent(String value) {
    return '未知组件 $value';
  }

  @override
  String viewUiAvailableTypes(String first, String second) {
    return '$first；可用：$second';
  }

  @override
  String viewUiExpectedChildren(int limit) {
    return '应该是 1 到 $limit 个组件的数组';
  }

  @override
  String viewUiHiddenItems(int count) {
    return '已截断：还有 $count 项没有显示';
  }

  @override
  String viewUiNodeLimit(int first, int second) {
    return '超过 $first 个组件，后 $second 项已截断';
  }

  @override
  String viewUiChildLimit(int first, int second) {
    return '超过 $first 项，后 $second 项已截断';
  }

  @override
  String get viewUiExpectedString => '应该是字符串';

  @override
  String viewUiTextLimit(int first, int second) {
    return '$first 个字符，超过上限 $second';
  }

  @override
  String get viewUiTextTruncated => '已截断：文字过长';

  @override
  String get viewUiExpectedFinite => '应该是有限的数';

  @override
  String get viewUiYes => '是';

  @override
  String get viewUiNo => '否';

  @override
  String get viewUiExpectedStringNumber => '应该是字符串或数字';

  @override
  String viewUiUnknownTone(String value) {
    return '未知 tone $value，已忽略；可用：good, warn, bad';
  }

  @override
  String viewUiUnknownChart(String value) {
    return '未知图表 $value，按柱状图画；可用：bar, hbar, line, donut';
  }

  @override
  String get viewUiExpectedCategories => '应该是非空的标签数组';

  @override
  String viewUiCategoryLimit(int first, int second) {
    return '$first 个类别，超过上限 $second';
  }

  @override
  String viewUiFirstPoints(int limit) {
    return '只显示前 $limit 个点';
  }

  @override
  String viewUiExpectedSeries(String shape) {
    return '应该是非空的数组，每项是 $shape';
  }

  @override
  String get viewUiSkippedSeries => '应该是数字数组，这组已跳过';

  @override
  String viewUiValuesCategories(int first, int second) {
    return '$first 个值对 $second 个类别，多的截掉、缺的留空';
  }

  @override
  String viewUiNonFiniteValues(int count) {
    return '$count 个值不是有限的数，已留空';
  }

  @override
  String get viewUiNoSeries => '没有一组能画的数据';

  @override
  String viewUiDonutSeries(int count) {
    return '环形图只画一组数据，其余 $count 组已忽略';
  }

  @override
  String get viewUiFirstSeries => '只画第一组数据';

  @override
  String viewUiSeriesLimit(int first, int second) {
    return '$first 组数据，超过上限 $second';
  }

  @override
  String viewUiFirstSeriesCount(int limit) {
    return '只显示前 $limit 组数据';
  }

  @override
  String get viewUiNoFiniteValues => '没有一个有限的数值';

  @override
  String viewUiTruncated(String value) {
    return '已截断：$value';
  }

  @override
  String viewUiExpectedCompare(int limit, String shape) {
    return '应该是 2 到 $limit 项的数组，每项是 $shape';
  }

  @override
  String viewUiItemLimit(int first, int second) {
    return '$first 项，超过上限 $second';
  }

  @override
  String viewUiFirstItems(int limit) {
    return '只显示前 $limit 项';
  }

  @override
  String viewUiSkippedCompare(String shape) {
    return '应该是 $shape，已跳过';
  }

  @override
  String get viewUiSkippedItemLabel => '应该是非空字符串，这项已跳过';

  @override
  String viewUiRowLimit(int first, int second) {
    return '$first 行，超过上限 $second';
  }

  @override
  String get viewUiSkippedRow => '应该是 [名称, 值]，已跳过';

  @override
  String get viewUiNoItems => '没有一项能画';

  @override
  String viewUiFirstRows(int limit) {
    return '每项只显示前 $limit 行';
  }

  @override
  String viewUiExpectedSteps(String shape) {
    return '应该是非空数组，每项是 $shape';
  }

  @override
  String viewUiStepLimit(int first, int second) {
    return '$first 步，超过上限 $second';
  }

  @override
  String viewUiFirstSteps(int limit) {
    return '已截断：只显示前 $limit 步';
  }

  @override
  String viewUiSkippedStep(String shape) {
    return '应该是 $shape，已跳过';
  }

  @override
  String viewUiUnknownStatus(String value) {
    return '未知状态 $value，按 todo 画；可用：done, current, todo, failed';
  }

  @override
  String get viewUiNoSteps => '没有一步能画';

  @override
  String viewUiUnknownCalloutTone(String value) {
    return '未知 tone $value，按 info 画；可用：info, good, warn, bad';
  }

  @override
  String viewUiExpectedOptions(int limit, String shape) {
    return '应该是 1 到 $limit 个选项的数组，每项是 $shape';
  }

  @override
  String viewUiOptionLimit(int first, int second) {
    return '$first 个选项，超过上限 $second';
  }

  @override
  String viewUiFirstOptions(int limit) {
    return '已截断：只显示前 $limit 个选项';
  }

  @override
  String viewUiDuplicateLabel(String value) {
    return '重复的 label $value，已跳过';
  }

  @override
  String get viewUiNoOptions => '没有一个能用的选项';

  @override
  String viewUiSummaryBody(String value) {
    return '[视图] $value';
  }

  @override
  String viewUiSummaryTitleBody(String first, String second) {
    return '[视图] $first：$second';
  }

  @override
  String get viewUiSummaryInvalid => '[视图]（格式有误，未能显示）';

  @override
  String viewUiSummaryText(String value) {
    return '文字：$value';
  }

  @override
  String viewUiSummaryChart(String summary) {
    return '图表：$summary';
  }

  @override
  String viewUiSummaryCompare(String value) {
    return '对比：$value';
  }

  @override
  String viewUiSummarySteps(String value) {
    return '步骤：$value';
  }

  @override
  String viewUiSummaryCallout(String value) {
    return '提示：$value';
  }

  @override
  String viewUiSummaryOptions(String value) {
    return '选项：$value';
  }

  @override
  String viewUiSummaryConfirm(String first, String second) {
    return '确认：$first/$second';
  }

  @override
  String viewUiReplyChoice(String value) {
    return '选择：$value';
  }

  @override
  String viewUiReplyConfirm(String value) {
    return '确认：$value';
  }

  @override
  String viewUiReplyCancel(String value) {
    return '取消：$value';
  }

  @override
  String viewUiChosen(String value) {
    return '已选择：$value';
  }

  @override
  String get viewUiConfirmed => '已确认';

  @override
  String viewUiConfirmedValue(String value) {
    return '已确认：$value';
  }

  @override
  String viewUiCancelledValue(String value) {
    return '已取消：$value';
  }

  @override
  String get viewUiReplied => '已回复';

  @override
  String get viewUiGenerating => '正在生成视图';

  @override
  String get viewUiReplyAfterEnd => '回复结束后可选';

  @override
  String get viewUiExpired => '已失效';

  @override
  String get viewUiNotStarted => '未开始';

  @override
  String get viewUiMultiple => '可多选';

  @override
  String get viewSuggestWorkspace => '看看工作区有什么';

  @override
  String get viewSuggestWorkspacePrompt => '看看工作区里现在有哪些文件和项目，简单介绍一下。';

  @override
  String get viewSuggestWordCount => '写个词频统计脚本';

  @override
  String get viewSuggestWordCountPrompt => '写一个 Python 脚本：统计一个文本文件里出现最多的 20 个词，并运行一次给我看结果。';

  @override
  String get viewSuggestNode => '新建 Node.js 项目';

  @override
  String get viewSuggestNodePrompt => '在工作区新建一个 Node.js 项目，配好 TypeScript 和一个最小的单元测试。';

  @override
  String get viewSuggestGit => 'rebase 还是 merge';

  @override
  String get viewSuggestGitPrompt => '用一个具体例子解释 git rebase 和 git merge 的区别，各自什么时候用。';

  @override
  String get viewGreetingMorning => '早上好';

  @override
  String get viewGreetingNoon => '中午好';

  @override
  String get viewGreetingAfternoon => '下午好';

  @override
  String get viewGreetingEvening => '晚上好';

  @override
  String get viewGreetingNight => '夜深了';

  @override
  String get viewEmptySubtitle => '今天想做点什么？';

  @override
  String get viewEmptyStarting => '正在启动引擎…';

  @override
  String get viewEmptyConnecting => '正在连接引擎…';

  @override
  String get viewEmptyDisconnected => '引擎未连接';

  @override
  String get viewEmptyReconnect => '重新连接';

  @override
  String viewEmptyWorkspace(String value) {
    return '在「$value」中';
  }

  @override
  String get viewEmptySwitchWorkspace => '切换工作区';

  @override
  String get viewScheduleTitle => '自动化任务';

  @override
  String get viewScheduleRefreshFailed => '没能刷新';

  @override
  String get viewScheduleNone => '没有进行中的任务';

  @override
  String viewScheduleNext(String value) {
    return '下次 $value';
  }

  @override
  String get viewScheduleUntitled => '未命名任务';

  @override
  String get viewScheduleSendFailed => '没能发送';

  @override
  String get viewScheduleEnded => '已结束';

  @override
  String get viewScheduleUpcoming => '接下来';

  @override
  String get viewScheduleSending => '发送中…';

  @override
  String get viewScheduleRunNow => '立即运行';

  @override
  String get viewScheduleManage => '管理';

  @override
  String viewScheduleToday(String value) {
    return '今天 $value';
  }

  @override
  String viewScheduleTomorrow(String value) {
    return '明天 $value';
  }

  @override
  String viewScheduleYesterday(String value) {
    return '昨天 $value';
  }

  @override
  String viewScheduleWeekday(String first, String second) {
    return '周$first $second';
  }

  @override
  String get viewScheduleDue => '即将运行';

  @override
  String viewScheduleDaysAhead(int count) {
    return '$count 天后';
  }

  @override
  String viewScheduleDaysOverdue(int count) {
    return '已逾期 $count 天';
  }

  @override
  String viewScheduleSingleLabel(String title) {
    return '自动化任务：$title';
  }

  @override
  String viewScheduleCountLabel(int count) {
    return '$count 个自动化任务';
  }

  @override
  String get viewModelSelect => '选择模型';

  @override
  String get viewModelThinkingOff => '不思考';

  @override
  String get viewModelThinkingMinimal => '极少';

  @override
  String get viewModelThinkingLow => '低';

  @override
  String get viewModelThinkingMedium => '中';

  @override
  String get viewModelThinkingHigh => '高';

  @override
  String get viewModelThinkingMax => '最高';

  @override
  String viewModelLabel(String value) {
    return '模型：$value';
  }

  @override
  String viewModelEffortLabel(String value) {
    return '思考深度$value';
  }

  @override
  String get viewModelLoadFailed => '模型列表加载失败';

  @override
  String get viewModelDisconnected => '未连接引擎';

  @override
  String get viewModelConnectHint => '连接后即可选择模型';

  @override
  String get viewModelEffort => '思考深度';

  @override
  String get viewModelKeyRequired => '需要 API Key';

  @override
  String get viewModelProvidersHint => '支持 DeepSeek 和其他模型渠道';

  @override
  String get viewModelEnterKey => '填写 API Key';

  @override
  String get viewModelAddProvider => '添加其他渠道';

  @override
  String get viewModelNone => '暂无可用模型';

  @override
  String get viewModelKeyHint => 'Key 可能尚未生效或已失效';

  @override
  String get viewModelManageProviders => '管理渠道';

  @override
  String get viewContinuePrompt => '接着附件里这段对话聊：';

  @override
  String viewContinueRange(int first, int second, int third) {
    return '第 $first–$second 轮，共 $third 轮';
  }

  @override
  String viewContinueHeader(String value) {
    return '> 分享的 DSH Go 对话 · $value\n';
  }

  @override
  String get viewContinueUser => '\n## 用户\n\n';

  @override
  String viewImageCount(int count) {
    return '$count 张图片';
  }

  @override
  String viewContinueAttachments(String value) {
    return '\n（附件：$value）\n';
  }

  @override
  String get viewContinueAssistant => '\n## 助手\n\n';

  @override
  String get viewContinueInterrupted => '\n（回复被中断）\n';

  @override
  String get viewContinueFailed => '（失败）';

  @override
  String get viewContinueDeclined => '（被拒绝）';

  @override
  String get viewContinueCancelled => '（已取消）';

  @override
  String get viewLinkWeek => '7 天';

  @override
  String get viewLinkMonth => '30 天';

  @override
  String get viewLinkForever => '永久';

  @override
  String get viewShareChat => '对话';

  @override
  String get viewShareNoPermission => '没有存储权限，没能保存';

  @override
  String get viewShareOpenFailed => '没能打开分享';

  @override
  String get viewShareLinkFailed => '没能生成链接，稍后再试';

  @override
  String viewShareLinkText(String first, String second) {
    return '「$first」· DSH Go 对话\n$second';
  }

  @override
  String get viewShareEmpty => '这个对话还没有内容';

  @override
  String viewShareMessageCount(int count) {
    return '$count 条消息';
  }

  @override
  String viewShareToolCount(int count) {
    return '$count 次工具调用';
  }

  @override
  String get viewShareFileHint => '在 DSH Go 里回放、接着聊';

  @override
  String get viewShareWebHint => '任何浏览器都能打开，不用联网';

  @override
  String get viewShareMarkdownHint => '纯文本，随处可读';

  @override
  String get viewShareLinkHint => '端到端加密，服务器看不到内容';

  @override
  String get viewSharePreview => '预览';

  @override
  String get viewShareWhole => '整段对话';

  @override
  String get viewShareScopeReply => '这条回复';

  @override
  String get viewShareScopePicked => '选中消息';

  @override
  String get viewShareThinking => '思考过程';

  @override
  String get viewShareIncludeTools => '工具调用';

  @override
  String get viewShareChatFile => '对话文件';

  @override
  String get viewShareWebPage => '网页';

  @override
  String get viewShareLink => '链接';

  @override
  String get viewShareAsImage => '图片';

  @override
  String get viewShareAsFile => '文件';

  @override
  String get viewShareAsText => '文字';

  @override
  String get viewShareRedacted => '密钥已隐藏';

  @override
  String get viewShareAdjust => '调整';

  @override
  String viewShareTooLarge(int value) {
    return '超过 $value MB，请缩小范围';
  }

  @override
  String get viewShareCreateLink => '生成链接';

  @override
  String get viewShareStop => '停止分享';

  @override
  String get viewShareStopTitle => '停止分享？';

  @override
  String get viewShareStopped => '已停止分享';

  @override
  String get viewQrCode => '二维码';

  @override
  String viewShareTurn(int value) {
    return '第 $value 轮';
  }

  @override
  String get viewReplayContinue => '接着聊';

  @override
  String viewReplayTurns(int first, int second) {
    return '第 $first–$second 轮';
  }

  @override
  String viewReplaySeconds(int count) {
    return '$count 秒';
  }

  @override
  String viewReplayMinutes(int count) {
    return '$count 分钟';
  }

  @override
  String get viewReplayFull => '全文';

  @override
  String get viewReplayPause => '暂停';

  @override
  String get viewReplayRestart => '重新播放';

  @override
  String get viewReplayPlay => '播放';

  @override
  String viewReplaySpeed(int value) {
    return '倍速 $value×';
  }

  @override
  String get viewTemplatePaper => '纸张';

  @override
  String get viewTemplateGlass => '玻璃';

  @override
  String get viewTemplateCard => '卡片';

  @override
  String get viewShareProjectQr => '项目主页二维码';

  @override
  String get viewShareBrandLine => '手机上的 DSH · 扫码获取';

  @override
  String get viewShareBrandLineNoQr => '手机上的 DSH';

  @override
  String viewShareSteps(int count) {
    return '$count 步';
  }

  @override
  String get viewShareWebSearch => '联网搜索';

  @override
  String get viewShareOpenPage => '打开网页';

  @override
  String get viewShareRunCommand => '运行命令';

  @override
  String get viewShareReadFile => '查看文件';

  @override
  String get viewShareEditFile => '修改文件';

  @override
  String get viewShareSubagent => '子代理';

  @override
  String get viewShareSkill => '使用技能';

  @override
  String get viewSharePresentFiles => '交付文件';

  @override
  String get viewShareWorkflow => '工作流';

  @override
  String get viewSharePlugin => '调用插件';

  @override
  String get viewShareStars => '星标';

  @override
  String viewSharePluginTitle(String value) {
    return 'DSH 插件「$value」';
  }

  @override
  String viewShareInstallCommand(String value) {
    return '安装：dsh plugin add $value';
  }

  @override
  String viewSharePhoneInstall(String value) {
    return '手机上一键安装：$value';
  }

  @override
  String get viewShareImages => '图片';

  @override
  String get viewSharePickMessages => '选择消息';

  @override
  String viewShareDoneCount(int count) {
    return '完成（$count）';
  }

  @override
  String get viewShareImageMarker => '〔图片〕';

  @override
  String viewShareImagesMarker(int count) {
    return '〔$count 张图片〕';
  }

  @override
  String get viewShareYou => '你';

  @override
  String get viewShareImageFailed => '没能生成图片，请重试';

  @override
  String get viewShareQuestion => '提问';

  @override
  String get viewShareModelSteps => '模型与过程';

  @override
  String get viewShareImagePreview => '分享图片预览';

  @override
  String get viewShareSaveImage => '保存图片';

  @override
  String viewScheduleHoursAhead(int count) {
    return '$count 小时后';
  }

  @override
  String viewScheduleHoursOverdue(int count) {
    return '已逾期 $count 小时';
  }

  @override
  String viewScheduleMinutesAhead(int count) {
    return '$count 分钟后';
  }

  @override
  String viewScheduleMinutesOverdue(int count) {
    return '已逾期 $count 分钟';
  }

  @override
  String viewScheduleSecondsAhead(int count) {
    return '$count 秒后';
  }

  @override
  String viewScheduleSecondsOverdue(int count) {
    return '已逾期 $count 秒';
  }

  @override
  String viewScheduleDate(String date, String clock) {
    return '$date $clock';
  }

  @override
  String viewScheduleYearDate(String year, String date, String clock) {
    return '$year年$date $clock';
  }

  @override
  String viewScheduleWeekdayName(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': '一',
      '2': '二',
      '3': '三',
      '4': '四',
      '5': '五',
      '6': '六',
      'other': '日',
    });
    return '$_temp0';
  }

  @override
  String viewReplayDate(String month, int day) {
    return '$month 月 $day 日';
  }

  @override
  String viewReplayHours(int count) {
    return '$count 小时';
  }

  @override
  String viewReplayHoursMinutes(int hours, int minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String viewUiHundredMillion(String value) {
    return '$value亿';
  }

  @override
  String viewUiTenThousand(String value) {
    return '$value万';
  }

  @override
  String viewUiMillion(String value) {
    return '${value}M';
  }

  @override
  String get viewListSeparator => '，';

  @override
  String get viewAttachmentSeparator => '、';

  @override
  String viewUiInvalidJsonOffset(String message, int offset) {
    return '不是合法的 JSON（$message，第 $offset 个字符附近）';
  }

  @override
  String get viewUiUnavailableChart => '图表无法显示';

  @override
  String get viewUiUnavailableMetric => '指标无法显示';

  @override
  String get viewUiUnavailableCompare => '对比无法显示';

  @override
  String get viewUiUnavailableSteps => '步骤无法显示';

  @override
  String get viewUiUnavailableCallout => '提示无法显示';

  @override
  String get viewUiUnavailableOptions => '选项无法显示';

  @override
  String get viewUiUnavailableConfirm => '确认无法显示';

  @override
  String get viewUiUnavailableText => '文字无法显示';

  @override
  String get viewUiUnavailableGroup => '这一组无法显示';

  @override
  String get viewUiUnavailablePart => '这部分无法显示';

  @override
  String viewScheduleSingleNextLabel(String title, String when) {
    return '自动化任务：$title，下次$when';
  }

  @override
  String viewScheduleCountNextLabel(int count, String when) {
    return '$count 个自动化任务，下次$when';
  }

  @override
  String get viewUiSkippedStepLabel => '应该是字符串，这步已跳过';

  @override
  String viewLabeledValue(String label, String value) {
    return '$label：$value';
  }

  @override
  String viewDescribedValue(String label, String description) {
    return '$label，$description';
  }

  @override
  String get viewSemicolonSeparator => '；';

  @override
  String viewChartSemantics(String kind, String data) {
    return '$kind。$data';
  }

  @override
  String viewMetricSemantics(String label, String value) {
    return '$label $value';
  }

  @override
  String viewMetricCaptionSemantics(String label, String value, String caption) {
    return '$label $value，$caption';
  }

  @override
  String viewScheduleZone(String rule, String city, String offset) {
    return '$rule（$city · $offset）';
  }

  @override
  String viewContinueNotice(String text) {
    return '\n（$text）\n';
  }

  @override
  String viewShareAltMarker(String alt) {
    return '〔$alt〕';
  }

  @override
  String get viewModelThinkingXhigh => '超高';

  @override
  String viewUiDialectWebOnly(String kind) {
    return '$kind · 在网页版查看';
  }

  @override
  String get viewUiDialectKindInteractive => '可交互内容';

  @override
  String get viewUiDialectKindChart => '图表';

  @override
  String get viewUiDialectKindDiagram => '示意图';

  @override
  String get viewUiDialectKindImage => '图片';

  @override
  String get viewUiDialectKindAudio => '音频';

  @override
  String get viewUiDialectKindVideo => '视频';

  @override
  String get viewUiDialectKindScene => '3D 场景';

  @override
  String get viewUiDialectKindFiles => '文件树';

  @override
  String get viewUiDialectKindMap => '地图';

  @override
  String get viewUiDialectKindOther => '这部分';

  @override
  String get viewUiDialectInvalid => '这块内容在网页版查看';

  @override
  String get viewUiDialectNote => '在网页版查看';

  @override
  String get voiceSettingsTitle => '语音输入';

  @override
  String get voiceModeAuto => '自动';

  @override
  String get voiceModeSystem => '系统';

  @override
  String get voiceModeEngine => '语音模型';

  @override
  String get voiceModeAutoHint => '有语音模型时用它，否则用系统识别';

  @override
  String get voiceModeSystemHint => '使用手机设置中的识别服务';

  @override
  String get voiceModeEngineHint => '用引擎里的语音模型识别';

  @override
  String get voiceFallbackStarted => '已改用语音模型，请再说一次';

  @override
  String get voiceChooseSystem => '请在系统设置中选择语音识别服务';

  @override
  String get voiceConfigureEngine => '请先在语音设置里下载语音模型';

  @override
  String get voiceConfigureEither => '系统识别用不了，可以在语音设置里下载语音模型';

  @override
  String get voiceErrorNetworkTimeout => '语音识别连接超时，请检查网络';

  @override
  String get voiceErrorNetwork => '语音识别网络连接失败';

  @override
  String get voiceErrorAudio => '语音录音失败，请检查麦克风';

  @override
  String get voiceErrorServer => '系统识别服务出错，请稍后再试';

  @override
  String get voiceErrorClient => '无法启动系统识别，请检查语音服务';

  @override
  String get voiceErrorSpeechTimeout => '没有听到声音，请再说一次';

  @override
  String get voiceErrorNoMatch => '没有听清，再说一次';

  @override
  String get voiceErrorBusy => '系统识别正忙，请稍后再试';

  @override
  String get voiceErrorPermission => '需要麦克风权限才能语音输入';

  @override
  String get voiceErrorTooManyRequests => '语音识别请求太频繁，请稍后再试';

  @override
  String get voiceErrorDisconnected => '系统识别服务已断开';

  @override
  String get voiceErrorLanguageUnsupported => '系统识别不支持这种语言';

  @override
  String get voiceErrorLanguageUnavailable => '请先在语音服务中下载这种语言';

  @override
  String get voiceErrorSupportCheck => '语音服务不支持检查识别能力';

  @override
  String get voiceErrorDownloadEvents => '语音服务不支持查询模型下载进度';

  @override
  String voiceErrorUnknown(int code) {
    return '语音服务返回错误 $code，请更换识别服务';
  }

  @override
  String get voiceSettingsFailed => '没能读取语音设置，请重试';

  @override
  String get voiceModeSection => '识别方式';

  @override
  String get voiceModelSection => '语音模型';

  @override
  String get voiceModelFooter => '下载后在手机上识别中文、英文、粤语、日语和韩语，录音不出手机。';

  @override
  String get voiceModelWaiting => '引擎启动后可以下载';

  @override
  String get voiceModelUnsupported => '当前引擎不支持语音模型';

  @override
  String get voiceModelAbsent => '未下载';

  @override
  String get voiceModelDownloading => '下载中';

  @override
  String get voiceModelPreparing => '正在校验和加载';

  @override
  String get voiceModelReady => '已就绪';

  @override
  String get voiceModelFailed => '下载失败';

  @override
  String voiceModelBytes(String done, String total) {
    return '$done / $total';
  }

  @override
  String voiceModelReadyNote(String size) {
    return '已占用 $size，可以离线使用';
  }

  @override
  String voiceModelAbsentNote(String size) {
    return '下载约 $size';
  }

  @override
  String get voiceModelWaitingNote => '下载会在引擎启动后开始';

  @override
  String get voiceModelFailNetwork => '网络连接失败';

  @override
  String get voiceModelFailTimeout => '下载长时间没有进展';

  @override
  String get voiceModelFailCertificate => '安全连接失败，请检查手机时间';

  @override
  String get voiceModelFailServer => '下载源暂时不可用';

  @override
  String get voiceModelFailIntegrity => '文件校验没有通过';

  @override
  String voiceModelFailStorage(String size) {
    return '存储空间不足，还需要约 $size';
  }

  @override
  String get voiceModelFailEngine => '引擎没有响应';

  @override
  String get voiceModelFailUnknown => '下载没有完成';

  @override
  String get voiceModelDownload => '下载';

  @override
  String get voiceModelResume => '继续下载';

  @override
  String get voiceModelRedownload => '重新下载';

  @override
  String get voiceModelMeteredTitle => '用移动数据下载？';

  @override
  String voiceModelMeteredBody(String size) {
    return '语音模型约 $size，会使用移动数据流量。';
  }

  @override
  String get voiceModelDeleteTitle => '删除语音模型？';

  @override
  String get voiceModelDeleteBody => '删除后语音输入改用系统识别，需要时可以重新下载。';

  @override
  String get voiceModelDeleteFailed => '没能删除语音模型，请重试';

  @override
  String get voiceModelDeleteStopping => '下载还在停止，请稍后再删';

  @override
  String voiceModelStartedToast(String size) {
    return '语音模型开始下载 · 约 $size';
  }

  @override
  String voiceModelResumedToast(String size) {
    return '继续下载语音模型 · 还剩约 $size';
  }

  @override
  String get voiceModelReadyToast => '语音输入已就绪';

  @override
  String voiceModelFailedToast(String reason) {
    return '语音模型下载失败：$reason';
  }

  @override
  String voiceModelNoticeDownloading(int percent) {
    return '正在下载语音模型 $percent%';
  }

  @override
  String get voiceModelNoticePreparing => '正在校验语音模型';

  @override
  String get voiceModelNoticeFailed => '语音模型下载失败，打开 App 重试';

  @override
  String get voiceScribeReadFailed => '没能读取语音设置，请重试。';

  @override
  String get voiceScribeSavedReadFailed => '已保存，刷新后可查看最新设置。';

  @override
  String get voiceScribeSaveUnconfirmed => '没能确认保存，请刷新或重试。';

  @override
  String get voiceScribeTitle => '语音设置';

  @override
  String get voiceScribePolishPrompt => '润色提示词';

  @override
  String get voiceScribeLanguage => '识别语言';

  @override
  String get voiceScribeRefresh => '刷新';

  @override
  String get voiceScribeHostChanged => '连接已变化，请重新打开。';

  @override
  String get voiceScribeUnsupported => '当前连接暂不支持语音设置。';

  @override
  String get voiceScribePluginDefault => '默认';

  @override
  String get voiceScribeBuiltInPrompt => '内置提示词';

  @override
  String get voiceScribeProviders => '识别服务';

  @override
  String get voiceScribeKeySet => '已设置密钥';

  @override
  String get voiceScribeNoKey => '未设置密钥';

  @override
  String get voiceScribeHotwords => '热词';

  @override
  String voiceScribeHotwordRules(int count) {
    return '$count 条规则';
  }

  @override
  String get wallpaperTitle => '壁纸';

  @override
  String get wallpaperDefault => '默认';

  @override
  String get wallpaperCustom => '自定义';

  @override
  String get wallpaperFrame => '调整位置';

  @override
  String get wallpaperBlur => '模糊';

  @override
  String get wallpaperLighten => '提亮';

  @override
  String get wallpaperDim => '压暗';

  @override
  String get wallpaperReplace => '更换图片';

  @override
  String get wallpaperPreview => '预览';

  @override
  String get wallpaperFooter => '用于首页、对话和抽屉。提亮在浅色模式、压暗在深色模式下各自生效，文字始终清晰。PNG、JPEG、WebP，15 MB 以内';

  @override
  String get wallpaperChanged => '壁纸已更换';

  @override
  String get wallpaperTooLarge => '图片超过 15 MB';

  @override
  String get wallpaperUnsupported => '支持 PNG、JPEG 和 WebP';

  @override
  String get wallpaperUnreadable => '无法读取这张图片';

  @override
  String get wallpaperUnavailable => '无法打开相册';

  @override
  String get wallpaperBroken => '无法读取';

  @override
  String get wallpaperEditorHint => '拖动、双指缩放';

  @override
  String get wallpaperEditorReset => '复原';

  @override
  String get wallpaperSampleTitle => '周末去海边';

  @override
  String get wallpaperSampleStatus => '刚刚';

  @override
  String get wallpaperSampleQuestion => '这周六适合去海边吗？';

  @override
  String get wallpaperSampleAnswer => '适合。周六午后晴，风力 2 级，浪高不到半米，是这周最好的一天。';

  @override
  String get wallpaperSampleNote => '傍晚降温明显，带一件薄外套。';

  @override
  String get wallpaperSampleTool => '查了 3 个天气来源';

  @override
  String get searchKwWallpaper => '背景,背景图,聊天背景,自定义背景,换背景,模糊,壁纸图片';

  @override
  String get webTitle => 'DSH 网页版';

  @override
  String get webSshAppOnly => '经 SSH 隧道的地址只能在 App 内打开';

  @override
  String get webRelayUnavailable => '经 DSH Remote 中转时打不开网页版，请在那台电脑上打开';

  @override
  String get webSshHost => 'SSH 主机';

  @override
  String get webLocalAppOnly => '本机地址带启动令牌，只能在 App 内打开';

  @override
  String get webEngineStatus => '引擎状态';

  @override
  String get webEngineStarting => '正在启动引擎';

  @override
  String get webEngineStartFailed => '引擎没能启动';

  @override
  String get webEngineNotRunning => '引擎没有运行';

  @override
  String get webEngineProblem => '引擎遇到了问题';

  @override
  String get webStartingSoon => '稍等片刻，网页版马上就好';

  @override
  String get webStartToOpen => '网页版由本机引擎提供，启动后就能打开';

  @override
  String get webRestart => '重新启动';

  @override
  String get webStartEngine => '启动引擎';

  @override
  String get webSwitchToWeb => '切换到网页界面';

  @override
  String get webNativeFeatures => '原生功能';

  @override
  String get webSwitchToNative => '切回原生界面';

  @override
  String get webAppSettings => 'App 设置';

  @override
  String get webSwitchHost => '切换主机';

  @override
  String get webAttachmentTooLarge => '附件太大，没能带进网页版';

  @override
  String get webTextCopied => '文字已复制，粘贴到输入框即可';

  @override
  String get webAttachmentFailed => '附件没能带进网页版';

  @override
  String get webHostUnavailable => '这台主机打不开网页版';

  @override
  String get webChatGone => '这个对话已不在了';

  @override
  String get webPageClosed => '网页已关闭';

  @override
  String get webChatsWorkspaces => '对话与工作区';

  @override
  String get webRefresh => '刷新';

  @override
  String get webOpenInBrowser => '在浏览器打开';

  @override
  String get webBrowserUnavailable => '不能在浏览器打开';

  @override
  String get webReopen => '重新打开';

  @override
  String get webPageNotOpened => '页面没有打开';

  @override
  String get webCheckConnection => '检查网络或引擎状态后再试';

  @override
  String get webTargetSessionMissing => '网页版里没找到这个对话，已停在首页';

  @override
  String get webTargetNotLoaded => '网页版没有加载完成';

  @override
  String get webTargetSettingsMissing => '没找到这页设置，可能需要先登录或开启对应插件';

  @override
  String get webTargetPluginMissing => '没找到这个插件，可能当前配置里没有它';

  @override
  String get webTargetSidebarFailed => '没能打开侧边栏，先在网页版里打开这个对话再试';

  @override
  String get webTargetCordisMissing => '没找到 Cordis 面板，插件可能已经移除';

  @override
  String get webTargetNewChatFailed => '没能新建对话，已停在网页版首页';

  @override
  String get webTargetPageFailed => '没能直接打开这一页，已停在网页版首页';

  @override
  String webConnectHostFirst(String name) {
    return '还没连上「$name」，连上后再打开网页版';
  }
}
