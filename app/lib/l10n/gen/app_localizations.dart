import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('pt'), Locale('zh')];

  /// No description provided for @a11yRestoreTitle.
  ///
  /// In zh, this message translates to:
  /// **'自动恢复无障碍'**
  String get a11yRestoreTitle;

  /// No description provided for @searchKwA11yRestore.
  ///
  /// In zh, this message translates to:
  /// **'无障碍,恢复,重连,自动恢复,掉线,授权,ADB,Shizuku'**
  String get searchKwA11yRestore;

  /// No description provided for @a11yRestoreNeedsGrant.
  ///
  /// In zh, this message translates to:
  /// **'需要授权'**
  String get a11yRestoreNeedsGrant;

  /// No description provided for @a11yRestoreNotice.
  ///
  /// In zh, this message translates to:
  /// **'开启后，在系统设置里关掉无障碍会被自动打开；要关闭手机操控，请在 DSH Go 里关。'**
  String get a11yRestoreNotice;

  /// No description provided for @a11yRestoreForceStop.
  ///
  /// In zh, this message translates to:
  /// **'被强制停止后，重新打开 DSH Go 才能恢复。'**
  String get a11yRestoreForceStop;

  /// No description provided for @a11yRestoreGrant.
  ///
  /// In zh, this message translates to:
  /// **'授权并开启'**
  String get a11yRestoreGrant;

  /// No description provided for @a11yRestoreSetup.
  ///
  /// In zh, this message translates to:
  /// **'配置 Shizuku 或无线调试'**
  String get a11yRestoreSetup;

  /// No description provided for @a11yRestoreWaiting.
  ///
  /// In zh, this message translates to:
  /// **'请在 Shizuku 中允许授权'**
  String get a11yRestoreWaiting;

  /// No description provided for @a11yRestoreComputer.
  ///
  /// In zh, this message translates to:
  /// **'也可以连接电脑，执行一次：'**
  String get a11yRestoreComputer;

  /// No description provided for @a11yRestoreCopy.
  ///
  /// In zh, this message translates to:
  /// **'复制授权命令'**
  String get a11yRestoreCopy;

  /// No description provided for @a11yRestoreCopied.
  ///
  /// In zh, this message translates to:
  /// **'授权命令已复制'**
  String get a11yRestoreCopied;

  /// No description provided for @accessPickTitle.
  ///
  /// In zh, this message translates to:
  /// **'想让 DSH Go 帮你做哪些事'**
  String get accessPickTitle;

  /// No description provided for @accessPickMessage.
  ///
  /// In zh, this message translates to:
  /// **'选好后逐项开启'**
  String get accessPickMessage;

  /// No description provided for @accessPickConfirm.
  ///
  /// In zh, this message translates to:
  /// **'开启所选'**
  String get accessPickConfirm;

  /// No description provided for @accessSkip.
  ///
  /// In zh, this message translates to:
  /// **'跳过'**
  String get accessSkip;

  /// No description provided for @accessFeatureFiles.
  ///
  /// In zh, this message translates to:
  /// **'读写手机里的文件'**
  String get accessFeatureFiles;

  /// No description provided for @accessFeatureFilesNeeds.
  ///
  /// In zh, this message translates to:
  /// **'需要文件访问权限'**
  String get accessFeatureFilesNeeds;

  /// No description provided for @accessFeaturePet.
  ///
  /// In zh, this message translates to:
  /// **'桌宠与悬浮窗'**
  String get accessFeaturePet;

  /// No description provided for @accessFeaturePetNeeds.
  ///
  /// In zh, this message translates to:
  /// **'需要悬浮窗权限'**
  String get accessFeaturePetNeeds;

  /// No description provided for @accessFeaturePhone.
  ///
  /// In zh, this message translates to:
  /// **'手机操控'**
  String get accessFeaturePhone;

  /// No description provided for @accessFeaturePhoneNeeds.
  ///
  /// In zh, this message translates to:
  /// **'需要无障碍和通知权限'**
  String get accessFeaturePhoneNeeds;

  /// No description provided for @accessFeatureBackground.
  ///
  /// In zh, this message translates to:
  /// **'后台持续运行'**
  String get accessFeatureBackground;

  /// No description provided for @accessFeatureBackgroundNeeds.
  ///
  /// In zh, this message translates to:
  /// **'任务跑完通知你，需要通知和后台权限'**
  String get accessFeatureBackgroundNeeds;

  /// No description provided for @accessFeatureVoice.
  ///
  /// In zh, this message translates to:
  /// **'语音输入'**
  String get accessFeatureVoice;

  /// No description provided for @accessFeatureVoiceNeeds.
  ///
  /// In zh, this message translates to:
  /// **'需要麦克风权限'**
  String get accessFeatureVoiceNeeds;

  /// No description provided for @accessVoiceModel.
  ///
  /// In zh, this message translates to:
  /// **'离线识别，需下载约 {size} MB 语音模型'**
  String accessVoiceModel(int size);

  /// No description provided for @accessVoiceMetered.
  ///
  /// In zh, this message translates to:
  /// **'当前是移动数据，下载会消耗流量'**
  String get accessVoiceMetered;

  /// No description provided for @accessFilesRiskBody.
  ///
  /// In zh, this message translates to:
  /// **'AI 能读取和修改相册、下载、文档等手机文件。'**
  String get accessFilesRiskBody;

  /// No description provided for @accessStepCount.
  ///
  /// In zh, this message translates to:
  /// **'{index} / {total}'**
  String accessStepCount(int index, int total);

  /// No description provided for @accessTurnOn.
  ///
  /// In zh, this message translates to:
  /// **'去开启'**
  String get accessTurnOn;

  /// No description provided for @accessOpenSettings.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get accessOpenSettings;

  /// No description provided for @accessItsSet.
  ///
  /// In zh, this message translates to:
  /// **'设好了'**
  String get accessItsSet;

  /// No description provided for @accessOpenAgain.
  ///
  /// In zh, this message translates to:
  /// **'再去一次'**
  String get accessOpenAgain;

  /// No description provided for @accessIsOn.
  ///
  /// In zh, this message translates to:
  /// **'已开启'**
  String get accessIsOn;

  /// No description provided for @accessNotOnYet.
  ///
  /// In zh, this message translates to:
  /// **'还没开启'**
  String get accessNotOnYet;

  /// No description provided for @accessDidYouSet.
  ///
  /// In zh, this message translates to:
  /// **'在那一页打开了吗？'**
  String get accessDidYouSet;

  /// No description provided for @accessWhere.
  ///
  /// In zh, this message translates to:
  /// **'位置：{path}'**
  String accessWhere(String path);

  /// No description provided for @accessOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开系统设置'**
  String get accessOpenFailed;

  /// No description provided for @accessMicTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许使用麦克风'**
  String get accessMicTitle;

  /// No description provided for @accessMicWhy.
  ///
  /// In zh, this message translates to:
  /// **'语音输入要用到'**
  String get accessMicWhy;

  /// No description provided for @accessStorageTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许访问文件'**
  String get accessStorageTitle;

  /// No description provided for @accessStorageWhy.
  ///
  /// In zh, this message translates to:
  /// **'让 AI 读写相册、下载和文档'**
  String get accessStorageWhy;

  /// No description provided for @accessNotifyTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许通知'**
  String get accessNotifyTitle;

  /// No description provided for @accessNotifyWhy.
  ///
  /// In zh, this message translates to:
  /// **'任务跑完、需要确认时提醒你'**
  String get accessNotifyWhy;

  /// No description provided for @accessBatteryTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许在后台运行'**
  String get accessBatteryTitle;

  /// No description provided for @accessBatteryWhy.
  ///
  /// In zh, this message translates to:
  /// **'切到别的 App 时任务照常跑'**
  String get accessBatteryWhy;

  /// No description provided for @accessVendorBackgroundWhy.
  ///
  /// In zh, this message translates to:
  /// **'锁屏或切走后，不被系统断网、清理'**
  String get accessVendorBackgroundWhy;

  /// No description provided for @accessAutostartTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许自启动'**
  String get accessAutostartTitle;

  /// No description provided for @accessAutostartWhy.
  ///
  /// In zh, this message translates to:
  /// **'被系统清理后能自己恢复'**
  String get accessAutostartWhy;

  /// No description provided for @accessVivoAutostartPath.
  ///
  /// In zh, this message translates to:
  /// **'权限管理 › 自启动 › {app}'**
  String accessVivoAutostartPath(String app);

  /// No description provided for @accessXiaomiAutostartPath.
  ///
  /// In zh, this message translates to:
  /// **'应用管理 › {app} › 自启动'**
  String accessXiaomiAutostartPath(String app);

  /// No description provided for @accessA11yTitle.
  ///
  /// In zh, this message translates to:
  /// **'打开无障碍'**
  String get accessA11yTitle;

  /// No description provided for @accessA11yWhy.
  ///
  /// In zh, this message translates to:
  /// **'手机操控靠它看屏幕、点按'**
  String get accessA11yWhy;

  /// No description provided for @accessPopupTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许后台弹出界面'**
  String get accessPopupTitle;

  /// No description provided for @accessPopupWhy.
  ///
  /// In zh, this message translates to:
  /// **'手机操控做完能回到 DSH Go'**
  String get accessPopupWhy;

  /// No description provided for @accessVivoPopupPath.
  ///
  /// In zh, this message translates to:
  /// **'权限管理 › {app} › 后台弹出界面'**
  String accessVivoPopupPath(String app);

  /// No description provided for @accessXiaomiPopupPath.
  ///
  /// In zh, this message translates to:
  /// **'应用管理 › {app} › 其他权限 › 后台弹出界面'**
  String accessXiaomiPopupPath(String app);

  /// No description provided for @accessOverlayTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许显示在其他应用上层'**
  String get accessOverlayTitle;

  /// No description provided for @accessOverlayWhy.
  ///
  /// In zh, this message translates to:
  /// **'宠物才能出现在别的 App 上'**
  String get accessOverlayWhy;

  /// No description provided for @accessOverlayGreyed.
  ///
  /// In zh, this message translates to:
  /// **'开关是灰的？'**
  String get accessOverlayGreyed;

  /// No description provided for @accessRestrictedTitle.
  ///
  /// In zh, this message translates to:
  /// **'先允许受限制的设置'**
  String get accessRestrictedTitle;

  /// No description provided for @accessRestrictedTap.
  ///
  /// In zh, this message translates to:
  /// **'在无障碍里点一下「DSH 手机操控」，出现「受限制的设置」时点确定'**
  String get accessRestrictedTap;

  /// No description provided for @accessRestrictedMenu.
  ///
  /// In zh, this message translates to:
  /// **'在应用信息里点右上角的三个点，选「允许受限制的设置」'**
  String get accessRestrictedMenu;

  /// No description provided for @accessRestrictedAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'在应用信息的「高级设置」里打开「允许受限制的设置」'**
  String get accessRestrictedAdvanced;

  /// No description provided for @accessRestrictedBack.
  ///
  /// In zh, this message translates to:
  /// **'回到无障碍，打开「DSH 手机操控」'**
  String get accessRestrictedBack;

  /// No description provided for @accessRestrictedHelp.
  ///
  /// In zh, this message translates to:
  /// **'看图示'**
  String get accessRestrictedHelp;

  /// No description provided for @accessOpenA11y.
  ///
  /// In zh, this message translates to:
  /// **'去无障碍'**
  String get accessOpenA11y;

  /// No description provided for @accessOpenAppInfo.
  ///
  /// In zh, this message translates to:
  /// **'去应用信息'**
  String get accessOpenAppInfo;

  /// No description provided for @accessStateOn.
  ///
  /// In zh, this message translates to:
  /// **'已开启'**
  String get accessStateOn;

  /// No description provided for @accessStateOff.
  ///
  /// In zh, this message translates to:
  /// **'未开启'**
  String get accessStateOff;

  /// No description provided for @accessStateVisited.
  ///
  /// In zh, this message translates to:
  /// **'已去设置'**
  String get accessStateVisited;

  /// No description provided for @accessStateUnknown.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get accessStateUnknown;

  /// No description provided for @accessSummaryAllSet.
  ///
  /// In zh, this message translates to:
  /// **'都开好了'**
  String get accessSummaryAllSet;

  /// No description provided for @accessSummaryLeft.
  ///
  /// In zh, this message translates to:
  /// **'还有 {count} 项没开'**
  String accessSummaryLeft(int count);

  /// No description provided for @accessSummaryMessage.
  ///
  /// In zh, this message translates to:
  /// **'随时可在「设置 › 通用 › 系统权限」补开'**
  String get accessSummaryMessage;

  /// No description provided for @accessFinishFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能完成设置'**
  String get accessFinishFailed;

  /// No description provided for @accessVoiceDownload.
  ///
  /// In zh, this message translates to:
  /// **'语音模型（约 {size} MB）会在引擎就绪后开始下载，进度在「设置 › 通用 › 语音输入」里查看'**
  String accessVoiceDownload(int size);

  /// No description provided for @accessPageTitle.
  ///
  /// In zh, this message translates to:
  /// **'系统权限'**
  String get accessPageTitle;

  /// No description provided for @accessPageSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'各项功能用到的系统权限'**
  String get accessPageSubtitle;

  /// No description provided for @activityThinkingUntangle.
  ///
  /// In zh, this message translates to:
  /// **'嗯…让我捋捋'**
  String get activityThinkingUntangle;

  /// No description provided for @activityThinkingWorkThrough.
  ///
  /// In zh, this message translates to:
  /// **'盘一下盘一下'**
  String get activityThinkingWorkThrough;

  /// No description provided for @activityThinkingGears.
  ///
  /// In zh, this message translates to:
  /// **'大脑转起来了'**
  String get activityThinkingGears;

  /// No description provided for @activityThinkingSecond.
  ///
  /// In zh, this message translates to:
  /// **'给我一秒'**
  String get activityThinkingSecond;

  /// No description provided for @activityThinkingSmoking.
  ///
  /// In zh, this message translates to:
  /// **'脑子在冒烟'**
  String get activityThinkingSmoking;

  /// No description provided for @activityThinkingOnIt.
  ///
  /// In zh, this message translates to:
  /// **'想呢想呢'**
  String get activityThinkingOnIt;

  /// No description provided for @activityThinkingNoRush.
  ///
  /// In zh, this message translates to:
  /// **'别催别催'**
  String get activityThinkingNoRush;

  /// No description provided for @activityThinkingPonder.
  ///
  /// In zh, this message translates to:
  /// **'让我琢磨下'**
  String get activityThinkingPonder;

  /// No description provided for @activityThinkingLogic.
  ///
  /// In zh, this message translates to:
  /// **'正在盘逻辑'**
  String get activityThinkingLogic;

  /// No description provided for @activityThinkingBrain.
  ///
  /// In zh, this message translates to:
  /// **'小脑瓜动一下'**
  String get activityThinkingBrain;

  /// No description provided for @activityThinkingSort.
  ///
  /// In zh, this message translates to:
  /// **'让我理理'**
  String get activityThinkingSort;

  /// No description provided for @activityThinkingMemory.
  ///
  /// In zh, this message translates to:
  /// **'翻翻脑子'**
  String get activityThinkingMemory;

  /// No description provided for @activityThinkingStorm.
  ///
  /// In zh, this message translates to:
  /// **'脑内风暴中'**
  String get activityThinkingStorm;

  /// No description provided for @activityThinkingSavor.
  ///
  /// In zh, this message translates to:
  /// **'嗯…让我品品'**
  String get activityThinkingSavor;

  /// No description provided for @activityThinkingMoment.
  ///
  /// In zh, this message translates to:
  /// **'稍等，在想'**
  String get activityThinkingMoment;

  /// No description provided for @activityThinkingHeadScratch.
  ///
  /// In zh, this message translates to:
  /// **'挠头…'**
  String get activityThinkingHeadScratch;

  /// No description provided for @activityThinkingPlayOut.
  ///
  /// In zh, this message translates to:
  /// **'让子弹飞一会'**
  String get activityThinkingPlayOut;

  /// No description provided for @activityThinkingLoading.
  ///
  /// In zh, this message translates to:
  /// **'思路加载中'**
  String get activityThinkingLoading;

  /// No description provided for @activityThinkingMulling.
  ///
  /// In zh, this message translates to:
  /// **'琢磨中'**
  String get activityThinkingMulling;

  /// No description provided for @activityThinkingBreakDown.
  ///
  /// In zh, this message translates to:
  /// **'嗯…让我拆一下'**
  String get activityThinkingBreakDown;

  /// No description provided for @activityThinkingTrain.
  ///
  /// In zh, this message translates to:
  /// **'脑内跑火车'**
  String get activityThinkingTrain;

  /// No description provided for @activityThinkingSomething.
  ///
  /// In zh, this message translates to:
  /// **'嗯…有点东西'**
  String get activityThinkingSomething;

  /// No description provided for @activityThinkingJog.
  ///
  /// In zh, this message translates to:
  /// **'小跑一下思路'**
  String get activityThinkingJog;

  /// No description provided for @activityThinkingPicture.
  ///
  /// In zh, this message translates to:
  /// **'等下，有画面了'**
  String get activityThinkingPicture;

  /// No description provided for @activityThinkingBubbles.
  ///
  /// In zh, this message translates to:
  /// **'思考泡泡'**
  String get activityThinkingBubbles;

  /// No description provided for @activityThinkingWaves.
  ///
  /// In zh, this message translates to:
  /// **'脑电波传输中'**
  String get activityThinkingWaves;

  /// No description provided for @activityThinkingCoffee.
  ///
  /// In zh, this message translates to:
  /// **'脑子在煮咖啡'**
  String get activityThinkingCoffee;

  /// No description provided for @activityThinkingDraft.
  ///
  /// In zh, this message translates to:
  /// **'我打个腹稿'**
  String get activityThinkingDraft;

  /// No description provided for @activityThinkingComing.
  ///
  /// In zh, this message translates to:
  /// **'嗯，来了来了'**
  String get activityThinkingComing;

  /// No description provided for @activityThinkingBubbling.
  ///
  /// In zh, this message translates to:
  /// **'脑子冒泡泡'**
  String get activityThinkingBubbling;

  /// No description provided for @activityThinkingTackle.
  ///
  /// In zh, this message translates to:
  /// **'嗯…盘它'**
  String get activityThinkingTackle;

  /// No description provided for @activityThinkingSpark.
  ///
  /// In zh, this message translates to:
  /// **'闪个思路'**
  String get activityThinkingSpark;

  /// No description provided for @activityThinkingLogicFirst.
  ///
  /// In zh, this message translates to:
  /// **'先捋一下逻辑'**
  String get activityThinkingLogicFirst;

  /// No description provided for @activityThinkingLocate.
  ///
  /// In zh, this message translates to:
  /// **'定位一下'**
  String get activityThinkingLocate;

  /// No description provided for @activityThinkingInvestigate.
  ///
  /// In zh, this message translates to:
  /// **'排查一下'**
  String get activityThinkingInvestigate;

  /// No description provided for @activityThinkingGif.
  ///
  /// In zh, this message translates to:
  /// **'思考.gif'**
  String get activityThinkingGif;

  /// No description provided for @activityThinkingLook.
  ///
  /// In zh, this message translates to:
  /// **'让我康康'**
  String get activityThinkingLook;

  /// No description provided for @activityThinkingInteresting.
  ///
  /// In zh, this message translates to:
  /// **'嗯…有点意思'**
  String get activityThinkingInteresting;

  /// No description provided for @activityThinkingHands.
  ///
  /// In zh, this message translates to:
  /// **'搓搓手想想'**
  String get activityThinkingHands;

  /// No description provided for @activityThinkingFiveMinutes.
  ///
  /// In zh, this message translates to:
  /// **'5 分钟，大工程'**
  String get activityThinkingFiveMinutes;

  /// No description provided for @activityThinkingSerious.
  ///
  /// In zh, this message translates to:
  /// **'这把我得认真'**
  String get activityThinkingSerious;

  /// No description provided for @activityThinkingTricky.
  ///
  /// In zh, this message translates to:
  /// **'确实有点绕'**
  String get activityThinkingTricky;

  /// No description provided for @activityThinkingAscend.
  ///
  /// In zh, this message translates to:
  /// **'我在修仙'**
  String get activityThinkingAscend;

  /// No description provided for @activityThinkingAlmostPromise.
  ///
  /// In zh, this message translates to:
  /// **'快好了，真的'**
  String get activityThinkingAlmostPromise;

  /// No description provided for @activityThinkingLongWay.
  ///
  /// In zh, this message translates to:
  /// **'盘了一大圈'**
  String get activityThinkingLongWay;

  /// No description provided for @activityThinkingWrapping.
  ///
  /// In zh, this message translates to:
  /// **'在收尾了'**
  String get activityThinkingWrapping;

  /// No description provided for @activityThinkingSong.
  ///
  /// In zh, this message translates to:
  /// **'给我一首歌的时间'**
  String get activityThinkingSong;

  /// No description provided for @activityThinkingBigMove.
  ///
  /// In zh, this message translates to:
  /// **'憋大招中'**
  String get activityThinkingBigMove;

  /// No description provided for @activityThinkingSimple.
  ///
  /// In zh, this message translates to:
  /// **'这个需求很简单（不是）'**
  String get activityThinkingSimple;

  /// No description provided for @activityThinkingOneMinute.
  ///
  /// In zh, this message translates to:
  /// **'1 分钟，还在想'**
  String get activityThinkingOneMinute;

  /// No description provided for @activityThinkingChallenge.
  ///
  /// In zh, this message translates to:
  /// **'这题有点东西'**
  String get activityThinkingChallenge;

  /// No description provided for @activityThinkingDig.
  ///
  /// In zh, this message translates to:
  /// **'让我再钻研下'**
  String get activityThinkingDig;

  /// No description provided for @activityThinkingNotSimple.
  ///
  /// In zh, this message translates to:
  /// **'问题不简单'**
  String get activityThinkingNotSimple;

  /// No description provided for @activityThinkingDeep.
  ///
  /// In zh, this message translates to:
  /// **'盘得有点深'**
  String get activityThinkingDeep;

  /// No description provided for @activityThinkingBurning.
  ///
  /// In zh, this message translates to:
  /// **'脑细胞在燃烧'**
  String get activityThinkingBurning;

  /// No description provided for @activityThinkingNearlyClear.
  ///
  /// In zh, this message translates to:
  /// **'快盘清了'**
  String get activityThinkingNearlyClear;

  /// No description provided for @activityThinkingTwisty.
  ///
  /// In zh, this message translates to:
  /// **'这个有点绕…'**
  String get activityThinkingTwisty;

  /// No description provided for @activityThinkingWorkout.
  ///
  /// In zh, this message translates to:
  /// **'烧脑中…'**
  String get activityThinkingWorkout;

  /// No description provided for @activityThinkingStay.
  ///
  /// In zh, this message translates to:
  /// **'别走，快了'**
  String get activityThinkingStay;

  /// No description provided for @activityThinkingCloser.
  ///
  /// In zh, this message translates to:
  /// **'嗯，让我细想想'**
  String get activityThinkingCloser;

  /// No description provided for @activityThinkingThirtySeconds.
  ///
  /// In zh, this message translates to:
  /// **'30 秒了，还在盘'**
  String get activityThinkingThirtySeconds;

  /// No description provided for @activityThinkingSoon.
  ///
  /// In zh, this message translates to:
  /// **'别急，快出结果了'**
  String get activityThinkingSoon;

  /// No description provided for @activityThinkingAnotherPass.
  ///
  /// In zh, this message translates to:
  /// **'让我再捋一捋'**
  String get activityThinkingAnotherPass;

  /// No description provided for @activityThinkingTrack.
  ///
  /// In zh, this message translates to:
  /// **'思路没断'**
  String get activityThinkingTrack;

  /// No description provided for @activityThinkingLead.
  ///
  /// In zh, this message translates to:
  /// **'有眉目了'**
  String get activityThinkingLead;

  /// No description provided for @activityThinkingCircles.
  ///
  /// In zh, this message translates to:
  /// **'转圈圈…'**
  String get activityThinkingCircles;

  /// No description provided for @activityThinkingAnyMoment.
  ///
  /// In zh, this message translates to:
  /// **'马上马上'**
  String get activityThinkingAnyMoment;

  /// No description provided for @activityThinkingStillLocate.
  ///
  /// In zh, this message translates to:
  /// **'还在定位'**
  String get activityThinkingStillLocate;

  /// No description provided for @activityWaitingCall.
  ///
  /// In zh, this message translates to:
  /// **'呼叫模型…'**
  String get activityWaitingCall;

  /// No description provided for @activityWaitingOnWay.
  ///
  /// In zh, this message translates to:
  /// **'模型在路上了'**
  String get activityWaitingOnWay;

  /// No description provided for @activityWaitingSpeak.
  ///
  /// In zh, this message translates to:
  /// **'等它开口…'**
  String get activityWaitingSpeak;

  /// No description provided for @activityWaitingWords.
  ///
  /// In zh, this message translates to:
  /// **'它在组织语言'**
  String get activityWaitingWords;

  /// No description provided for @activityWaitingAwake.
  ///
  /// In zh, this message translates to:
  /// **'模型醒了么'**
  String get activityWaitingAwake;

  /// No description provided for @activityWaitingStretch.
  ///
  /// In zh, this message translates to:
  /// **'等它伸懒腰'**
  String get activityWaitingStretch;

  /// No description provided for @activityWaitingYawn.
  ///
  /// In zh, this message translates to:
  /// **'它打了个哈欠'**
  String get activityWaitingYawn;

  /// No description provided for @activityWaitingComing.
  ///
  /// In zh, this message translates to:
  /// **'模型：来了来了'**
  String get activityWaitingComing;

  /// No description provided for @activityWaitingText.
  ///
  /// In zh, this message translates to:
  /// **'等它出字'**
  String get activityWaitingText;

  /// No description provided for @activityWaitingQueue.
  ///
  /// In zh, this message translates to:
  /// **'还在排队'**
  String get activityWaitingQueue;

  /// No description provided for @activityWaitingBrew.
  ///
  /// In zh, this message translates to:
  /// **'它在酝酿'**
  String get activityWaitingBrew;

  /// No description provided for @activityWaitingWater.
  ///
  /// In zh, this message translates to:
  /// **'模型在喝水'**
  String get activityWaitingWater;

  /// No description provided for @activityWaitingWarmup.
  ///
  /// In zh, this message translates to:
  /// **'等它热身'**
  String get activityWaitingWarmup;

  /// No description provided for @activityWaitingMeditate.
  ///
  /// In zh, this message translates to:
  /// **'模型在冥想'**
  String get activityWaitingMeditate;

  /// No description provided for @activityWaitingBlink.
  ///
  /// In zh, this message translates to:
  /// **'等它眨个眼'**
  String get activityWaitingBlink;

  /// No description provided for @activityWaitingMoment.
  ///
  /// In zh, this message translates to:
  /// **'它说稍等'**
  String get activityWaitingMoment;

  /// No description provided for @activityWritingWords.
  ///
  /// In zh, this message translates to:
  /// **'组织语言中'**
  String get activityWritingWords;

  /// No description provided for @activityWritingTyping.
  ///
  /// In zh, this message translates to:
  /// **'码字中'**
  String get activityWritingTyping;

  /// No description provided for @activityWritingInspired.
  ///
  /// In zh, this message translates to:
  /// **'下笔如有神'**
  String get activityWritingInspired;

  /// No description provided for @activityWritingOnIt.
  ///
  /// In zh, this message translates to:
  /// **'在写了在写了'**
  String get activityWritingOnIt;

  /// No description provided for @activityWritingCareful.
  ///
  /// In zh, this message translates to:
  /// **'字斟句酌'**
  String get activityWritingCareful;

  /// No description provided for @activityWritingFlow.
  ///
  /// In zh, this message translates to:
  /// **'一气呵成'**
  String get activityWritingFlow;

  /// No description provided for @activityWritingPlain.
  ///
  /// In zh, this message translates to:
  /// **'整理成人话'**
  String get activityWritingPlain;

  /// No description provided for @activityWritingIdeas.
  ///
  /// In zh, this message translates to:
  /// **'把想法写下来'**
  String get activityWritingIdeas;

  /// No description provided for @activityWritingKeys.
  ///
  /// In zh, this message translates to:
  /// **'敲字中'**
  String get activityWritingKeys;

  /// No description provided for @activityWritingAlmost.
  ///
  /// In zh, this message translates to:
  /// **'马上写完'**
  String get activityWritingAlmost;

  /// No description provided for @activityWritingTell.
  ///
  /// In zh, this message translates to:
  /// **'娓娓道来'**
  String get activityWritingTell;

  /// No description provided for @activityWritingFast.
  ///
  /// In zh, this message translates to:
  /// **'奋笔疾书'**
  String get activityWritingFast;

  /// No description provided for @activityWritingBreeze.
  ///
  /// In zh, this message translates to:
  /// **'笔下生风'**
  String get activityWritingBreeze;

  /// No description provided for @activityWritingFormat.
  ///
  /// In zh, this message translates to:
  /// **'排个版'**
  String get activityWritingFormat;

  /// No description provided for @activityNightAscend.
  ///
  /// In zh, this message translates to:
  /// **'修仙中…'**
  String get activityNightAscend;

  /// No description provided for @activityNightHello.
  ///
  /// In zh, this message translates to:
  /// **'深夜冒泡'**
  String get activityNightHello;

  /// No description provided for @activityNightOwl.
  ///
  /// In zh, this message translates to:
  /// **'你也是夜猫子呀'**
  String get activityNightOwl;

  /// No description provided for @activityNightMoon.
  ///
  /// In zh, this message translates to:
  /// **'月亮不睡我不睡'**
  String get activityNightMoon;

  /// No description provided for @activityNightSlow.
  ///
  /// In zh, this message translates to:
  /// **'夜里脑子慢，谅解'**
  String get activityNightSlow;

  /// No description provided for @activityNightChampion.
  ///
  /// In zh, this message translates to:
  /// **'熬夜冠军上线'**
  String get activityNightChampion;

  /// No description provided for @activityNightSleepy.
  ///
  /// In zh, this message translates to:
  /// **'困了，但能行'**
  String get activityNightSleepy;

  /// No description provided for @activityNightMidnight.
  ///
  /// In zh, this message translates to:
  /// **'过了零点照样肝'**
  String get activityNightMidnight;

  /// No description provided for @activityNightOpen.
  ///
  /// In zh, this message translates to:
  /// **'深夜档营业'**
  String get activityNightOpen;

  /// No description provided for @activityNightStars.
  ///
  /// In zh, this message translates to:
  /// **'星星都睡了'**
  String get activityNightStars;

  /// No description provided for @activityNightDawn.
  ///
  /// In zh, this message translates to:
  /// **'凌晨还在盘'**
  String get activityNightDawn;

  /// No description provided for @activityWeekendChill.
  ///
  /// In zh, this message translates to:
  /// **'周末摸鱼中'**
  String get activityWeekendChill;

  /// No description provided for @activityWeekendHere.
  ///
  /// In zh, this message translates to:
  /// **'周末也在！'**
  String get activityWeekendHere;

  /// No description provided for @activityWeekendCompany.
  ///
  /// In zh, this message translates to:
  /// **'放假也陪你'**
  String get activityWeekendCompany;

  /// No description provided for @activityWeekendOnline.
  ///
  /// In zh, this message translates to:
  /// **'周末不关机'**
  String get activityWeekendOnline;

  /// No description provided for @activityWeekendSneak.
  ///
  /// In zh, this message translates to:
  /// **'周末偷着盘'**
  String get activityWeekendSneak;

  /// No description provided for @activityWeekendWorking.
  ///
  /// In zh, this message translates to:
  /// **'周末也在卷？'**
  String get activityWeekendWorking;

  /// No description provided for @activityWeekendMode.
  ///
  /// In zh, this message translates to:
  /// **'周末模式 ON'**
  String get activityWeekendMode;

  /// No description provided for @activityWeekendBugs.
  ///
  /// In zh, this message translates to:
  /// **'周末在修 bug'**
  String get activityWeekendBugs;

  /// No description provided for @activityWeekendSkin.
  ///
  /// In zh, this message translates to:
  /// **'周末限定皮肤'**
  String get activityWeekendSkin;

  /// No description provided for @activityNewYearCheers.
  ///
  /// In zh, this message translates to:
  /// **'新年快乐！'**
  String get activityNewYearCheers;

  /// No description provided for @activityNewYearDay.
  ///
  /// In zh, this message translates to:
  /// **'元旦快乐'**
  String get activityNewYearDay;

  /// No description provided for @activityNewYearBugs.
  ///
  /// In zh, this message translates to:
  /// **'新的一年，新的 bug'**
  String get activityNewYearBugs;

  /// No description provided for @activityNewYearFirstLine.
  ///
  /// In zh, this message translates to:
  /// **'新年第一行代码'**
  String get activityNewYearFirstLine;

  /// No description provided for @activityNewYearWork.
  ///
  /// In zh, this message translates to:
  /// **'开工大吉'**
  String get activityNewYearWork;

  /// No description provided for @activityValentineCode.
  ///
  /// In zh, this message translates to:
  /// **'情人节也在敲代码'**
  String get activityValentineCode;

  /// No description provided for @activityValentineLove.
  ///
  /// In zh, this message translates to:
  /// **'代码才是真爱'**
  String get activityValentineLove;

  /// No description provided for @activityValentineDate.
  ///
  /// In zh, this message translates to:
  /// **'今天不约会？'**
  String get activityValentineDate;

  /// No description provided for @activityValentineKeyboard.
  ///
  /// In zh, this message translates to:
  /// **'键盘就是玫瑰'**
  String get activityValentineKeyboard;

  /// No description provided for @activityPiDay.
  ///
  /// In zh, this message translates to:
  /// **'π 节快乐'**
  String get activityPiDay;

  /// No description provided for @activityPiCircle.
  ///
  /// In zh, this message translates to:
  /// **'今天的圆格外圆'**
  String get activityPiCircle;

  /// No description provided for @activityAprilFools.
  ///
  /// In zh, this message translates to:
  /// **'愚人节快乐'**
  String get activityAprilFools;

  /// No description provided for @activityAprilBug.
  ///
  /// In zh, this message translates to:
  /// **'这个 bug 是假的吧'**
  String get activityAprilBug;

  /// No description provided for @activityAprilErrors.
  ///
  /// In zh, this message translates to:
  /// **'小心假报错'**
  String get activityAprilErrors;

  /// No description provided for @activityAprilKidding.
  ///
  /// In zh, this message translates to:
  /// **'骗你的，没报错'**
  String get activityAprilKidding;

  /// No description provided for @activityLaborWorking.
  ///
  /// In zh, this message translates to:
  /// **'劳动节还在卷'**
  String get activityLaborWorking;

  /// No description provided for @activityLaborPride.
  ///
  /// In zh, this message translates to:
  /// **'劳动最光荣'**
  String get activityLaborPride;

  /// No description provided for @activityLaborSpirit.
  ///
  /// In zh, this message translates to:
  /// **'打工人打工魂'**
  String get activityLaborSpirit;

  /// No description provided for @activityChildrenDay.
  ///
  /// In zh, this message translates to:
  /// **'儿童节快乐'**
  String get activityChildrenDay;

  /// No description provided for @activityChildrenHeart.
  ///
  /// In zh, this message translates to:
  /// **'谁还不是个宝宝'**
  String get activityChildrenHeart;

  /// No description provided for @activityChildrenCode.
  ///
  /// In zh, this message translates to:
  /// **'今天代码要写得可爱'**
  String get activityChildrenCode;

  /// No description provided for @activityProgrammerCheers.
  ///
  /// In zh, this message translates to:
  /// **'1024 程序员节快乐'**
  String get activityProgrammerCheers;

  /// No description provided for @activityProgrammerDay.
  ///
  /// In zh, this message translates to:
  /// **'今天是程序员节'**
  String get activityProgrammerDay;

  /// No description provided for @activityProgrammer1024.
  ///
  /// In zh, this message translates to:
  /// **'1024，节日快乐'**
  String get activityProgrammer1024;

  /// No description provided for @activityProgrammerCode.
  ///
  /// In zh, this message translates to:
  /// **'程序员节也在写代码'**
  String get activityProgrammerCode;

  /// No description provided for @activityHalloween.
  ///
  /// In zh, this message translates to:
  /// **'万圣节快乐'**
  String get activityHalloween;

  /// No description provided for @activityHalloweenTreat.
  ///
  /// In zh, this message translates to:
  /// **'不给糖就捣蛋'**
  String get activityHalloweenTreat;

  /// No description provided for @activityHalloweenCode.
  ///
  /// In zh, this message translates to:
  /// **'代码也会吓人'**
  String get activityHalloweenCode;

  /// No description provided for @activityChristmasEve.
  ///
  /// In zh, this message translates to:
  /// **'平安夜快乐'**
  String get activityChristmasEve;

  /// No description provided for @activityChristmasEveThinking.
  ///
  /// In zh, this message translates to:
  /// **'平安夜也在盘'**
  String get activityChristmasEveThinking;

  /// No description provided for @activityChristmasEveGift.
  ///
  /// In zh, this message translates to:
  /// **'今晚写代码有礼物'**
  String get activityChristmasEveGift;

  /// No description provided for @activityChristmas.
  ///
  /// In zh, this message translates to:
  /// **'圣诞快乐'**
  String get activityChristmas;

  /// No description provided for @activityChristmasCompany.
  ///
  /// In zh, this message translates to:
  /// **'圣诞也陪你'**
  String get activityChristmasCompany;

  /// No description provided for @activityChristmasEgg.
  ///
  /// In zh, this message translates to:
  /// **'圣诞限定彩蛋'**
  String get activityChristmasEgg;

  /// No description provided for @activityChristmasReindeer.
  ///
  /// In zh, this message translates to:
  /// **'麋鹿送代码来了'**
  String get activityChristmasReindeer;

  /// No description provided for @activityYearEndEve.
  ///
  /// In zh, this message translates to:
  /// **'跨年夜'**
  String get activityYearEndEve;

  /// No description provided for @activityYearEndLast.
  ///
  /// In zh, this message translates to:
  /// **'今年最后一盘'**
  String get activityYearEndLast;

  /// No description provided for @activityYearEndReady.
  ///
  /// In zh, this message translates to:
  /// **'准备跨年'**
  String get activityYearEndReady;

  /// No description provided for @activityYearEndSeeYou.
  ///
  /// In zh, this message translates to:
  /// **'明年见！'**
  String get activityYearEndSeeYou;

  /// No description provided for @activityZodiacRat.
  ///
  /// In zh, this message translates to:
  /// **'鼠'**
  String get activityZodiacRat;

  /// No description provided for @activityZodiacOx.
  ///
  /// In zh, this message translates to:
  /// **'牛'**
  String get activityZodiacOx;

  /// No description provided for @activityZodiacTiger.
  ///
  /// In zh, this message translates to:
  /// **'虎'**
  String get activityZodiacTiger;

  /// No description provided for @activityZodiacRabbit.
  ///
  /// In zh, this message translates to:
  /// **'兔'**
  String get activityZodiacRabbit;

  /// No description provided for @activityZodiacDragon.
  ///
  /// In zh, this message translates to:
  /// **'龙'**
  String get activityZodiacDragon;

  /// No description provided for @activityZodiacSnake.
  ///
  /// In zh, this message translates to:
  /// **'蛇'**
  String get activityZodiacSnake;

  /// No description provided for @activityZodiacHorse.
  ///
  /// In zh, this message translates to:
  /// **'马'**
  String get activityZodiacHorse;

  /// No description provided for @activityZodiacGoat.
  ///
  /// In zh, this message translates to:
  /// **'羊'**
  String get activityZodiacGoat;

  /// No description provided for @activityZodiacMonkey.
  ///
  /// In zh, this message translates to:
  /// **'猴'**
  String get activityZodiacMonkey;

  /// No description provided for @activityZodiacRooster.
  ///
  /// In zh, this message translates to:
  /// **'鸡'**
  String get activityZodiacRooster;

  /// No description provided for @activityZodiacDog.
  ///
  /// In zh, this message translates to:
  /// **'狗'**
  String get activityZodiacDog;

  /// No description provided for @activityZodiacPig.
  ///
  /// In zh, this message translates to:
  /// **'猪'**
  String get activityZodiacPig;

  /// No description provided for @activityLunarCheers.
  ///
  /// In zh, this message translates to:
  /// **'春节快乐！'**
  String get activityLunarCheers;

  /// No description provided for @activityLunarCode.
  ///
  /// In zh, this message translates to:
  /// **'过年还在写代码'**
  String get activityLunarCode;

  /// No description provided for @activityLunarEnvelope.
  ///
  /// In zh, this message translates to:
  /// **'红包拿来'**
  String get activityLunarEnvelope;

  /// No description provided for @activityLunarSpring.
  ///
  /// In zh, this message translates to:
  /// **'新春快乐'**
  String get activityLunarSpring;

  /// No description provided for @activityLunarGreeting.
  ///
  /// In zh, this message translates to:
  /// **'过年好'**
  String get activityLunarGreeting;

  /// No description provided for @activityLunarCodeGreeting.
  ///
  /// In zh, this message translates to:
  /// **'代码也拜个年'**
  String get activityLunarCodeGreeting;

  /// No description provided for @activityRareSsr.
  ///
  /// In zh, this message translates to:
  /// **'SSR！稀有彩蛋'**
  String get activityRareSsr;

  /// No description provided for @activityRareUr.
  ///
  /// In zh, this message translates to:
  /// **'UR 掉落'**
  String get activityRareUr;

  /// No description provided for @activityRareLegend.
  ///
  /// In zh, this message translates to:
  /// **'金色传说！'**
  String get activityRareLegend;

  /// No description provided for @activityRareOrange.
  ///
  /// In zh, this message translates to:
  /// **'出橙了'**
  String get activityRareOrange;

  /// No description provided for @activityRareEgg.
  ///
  /// In zh, this message translates to:
  /// **'彩蛋砸脸'**
  String get activityRareEgg;

  /// No description provided for @activityRareChosen.
  ///
  /// In zh, this message translates to:
  /// **'天选时刻'**
  String get activityRareChosen;

  /// No description provided for @activityRareHidden.
  ///
  /// In zh, this message translates to:
  /// **'你发现了隐藏款'**
  String get activityRareHidden;

  /// No description provided for @activityRareChat.
  ///
  /// In zh, this message translates to:
  /// **'触发隐藏对话'**
  String get activityRareChat;

  /// No description provided for @activityRareMax.
  ///
  /// In zh, this message translates to:
  /// **'稀有度 MAX'**
  String get activityRareMax;

  /// No description provided for @activityRareLucky.
  ///
  /// In zh, this message translates to:
  /// **'欧皇降临'**
  String get activityRareLucky;

  /// No description provided for @activityRareCritical.
  ///
  /// In zh, this message translates to:
  /// **'暴击了'**
  String get activityRareCritical;

  /// No description provided for @activityRareNextLevel.
  ///
  /// In zh, this message translates to:
  /// **'这波在大气层'**
  String get activityRareNextLevel;

  /// No description provided for @activityFailCrash.
  ///
  /// In zh, this message translates to:
  /// **'翻车了'**
  String get activityFailCrash;

  /// No description provided for @activityFailOops.
  ///
  /// In zh, this message translates to:
  /// **'哎呀'**
  String get activityFailOops;

  /// No description provided for @activityFailRun.
  ///
  /// In zh, this message translates to:
  /// **'没跑通'**
  String get activityFailRun;

  /// No description provided for @activityFailTrip.
  ///
  /// In zh, this message translates to:
  /// **'摔了一跤'**
  String get activityFailTrip;

  /// No description provided for @activityFailWrong.
  ///
  /// In zh, this message translates to:
  /// **'这不对'**
  String get activityFailWrong;

  /// No description provided for @activityFailHiccup.
  ///
  /// In zh, this message translates to:
  /// **'出岔子了'**
  String get activityFailHiccup;

  /// No description provided for @activityFailBroken.
  ///
  /// In zh, this message translates to:
  /// **'不灵了'**
  String get activityFailBroken;

  /// No description provided for @activityFailLocal.
  ///
  /// In zh, this message translates to:
  /// **'我本地能跑啊'**
  String get activityFailLocal;

  /// No description provided for @activityFailYesterday.
  ///
  /// In zh, this message translates to:
  /// **'昨天还能跑'**
  String get activityFailYesterday;

  /// No description provided for @activityFailTough.
  ///
  /// In zh, this message translates to:
  /// **'难绷'**
  String get activityFailTough;

  /// No description provided for @activityFailCrack.
  ///
  /// In zh, this message translates to:
  /// **'裂开'**
  String get activityFailCrack;

  /// No description provided for @activityFailPressure.
  ///
  /// In zh, this message translates to:
  /// **'血压上来了'**
  String get activityFailPressure;

  /// No description provided for @activityFailCareless.
  ///
  /// In zh, this message translates to:
  /// **'这波大意了'**
  String get activityFailCareless;

  /// No description provided for @activityFailSlip.
  ///
  /// In zh, this message translates to:
  /// **'手滑'**
  String get activityFailSlip;

  /// No description provided for @activityFailTryAgain.
  ///
  /// In zh, this message translates to:
  /// **'换个姿势再来'**
  String get activityFailTryAgain;

  /// No description provided for @activityFailChance.
  ///
  /// In zh, this message translates to:
  /// **'再给我一次机会'**
  String get activityFailChance;

  /// No description provided for @activityTestGreen.
  ///
  /// In zh, this message translates to:
  /// **'测试全绿'**
  String get activityTestGreen;

  /// No description provided for @activityTestAllGreen.
  ///
  /// In zh, this message translates to:
  /// **'全绿，舒服'**
  String get activityTestAllGreen;

  /// No description provided for @activityTestFirstTry.
  ///
  /// In zh, this message translates to:
  /// **'一次过！'**
  String get activityTestFirstTry;

  /// No description provided for @activityTestNoErrors.
  ///
  /// In zh, this message translates to:
  /// **'没报错'**
  String get activityTestNoErrors;

  /// No description provided for @activityTestPassed.
  ///
  /// In zh, this message translates to:
  /// **'过了过了'**
  String get activityTestPassed;

  /// No description provided for @activityTestSolid.
  ///
  /// In zh, this message translates to:
  /// **'稳了'**
  String get activityTestSolid;

  /// No description provided for @activityTestRed.
  ///
  /// In zh, this message translates to:
  /// **'红了，看看哪挂了'**
  String get activityTestRed;

  /// No description provided for @activityTestInvestigate.
  ///
  /// In zh, this message translates to:
  /// **'测试挂了，排查一下'**
  String get activityTestInvestigate;

  /// No description provided for @activityTestStubborn.
  ///
  /// In zh, this message translates to:
  /// **'有个用例不服'**
  String get activityTestStubborn;

  /// No description provided for @activityTestFix.
  ///
  /// In zh, this message translates to:
  /// **'红灯，再改改'**
  String get activityTestFix;

  /// No description provided for @activityGitCommitSave.
  ///
  /// In zh, this message translates to:
  /// **'提交了，存个档'**
  String get activityGitCommitSave;

  /// No description provided for @activityGitSaved.
  ///
  /// In zh, this message translates to:
  /// **'存档成功'**
  String get activityGitSaved;

  /// No description provided for @activityGitCommitRelief.
  ///
  /// In zh, this message translates to:
  /// **'commit 一下，安心'**
  String get activityGitCommitRelief;

  /// No description provided for @activityGitPushed.
  ///
  /// In zh, this message translates to:
  /// **'推上去了'**
  String get activityGitPushed;

  /// No description provided for @activityGitPushDone.
  ///
  /// In zh, this message translates to:
  /// **'push 完成，起飞'**
  String get activityGitPushDone;

  /// No description provided for @activityGitCodeOut.
  ///
  /// In zh, this message translates to:
  /// **'代码出门了'**
  String get activityGitCodeOut;

  /// No description provided for @activityInstallDone.
  ///
  /// In zh, this message translates to:
  /// **'依赖装好了'**
  String get activityInstallDone;

  /// No description provided for @activityInstallInternet.
  ///
  /// In zh, this message translates to:
  /// **'下载了半个互联网'**
  String get activityInstallInternet;

  /// No description provided for @activityInstallPackages.
  ///
  /// In zh, this message translates to:
  /// **'包都到齐了'**
  String get activityInstallPackages;

  /// No description provided for @activityMilestoneFive.
  ///
  /// In zh, this message translates to:
  /// **'工具 x5，手感来了'**
  String get activityMilestoneFive;

  /// No description provided for @activityMilestoneTen.
  ///
  /// In zh, this message translates to:
  /// **'工具连击 x10'**
  String get activityMilestoneTen;

  /// No description provided for @activityMilestoneTwenty.
  ///
  /// In zh, this message translates to:
  /// **'工具 x20，停不下来'**
  String get activityMilestoneTwenty;

  /// No description provided for @activityMilestoneFifty.
  ///
  /// In zh, this message translates to:
  /// **'工具 x50，劳模本模'**
  String get activityMilestoneFifty;

  /// No description provided for @activityRetryWait.
  ///
  /// In zh, this message translates to:
  /// **'稍等，重试中'**
  String get activityRetryWait;

  /// No description provided for @activityRetryBackoff.
  ///
  /// In zh, this message translates to:
  /// **'刚被拒了，退避一下'**
  String get activityRetryBackoff;

  /// No description provided for @activityRetryKnock.
  ///
  /// In zh, this message translates to:
  /// **'再敲一次门'**
  String get activityRetryKnock;

  /// No description provided for @activityRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'被限流了，缓缓再试'**
  String get activityRateLimited;

  /// No description provided for @activityRate429.
  ///
  /// In zh, this message translates to:
  /// **'429 了，歇口气再来'**
  String get activityRate429;

  /// No description provided for @activityRateQueue.
  ///
  /// In zh, this message translates to:
  /// **'排队的人有点多'**
  String get activityRateQueue;

  /// No description provided for @activityCompactContext.
  ///
  /// In zh, this message translates to:
  /// **'收拾一下上下文…'**
  String get activityCompactContext;

  /// No description provided for @activityCompactBag.
  ///
  /// In zh, this message translates to:
  /// **'整理背包中…'**
  String get activityCompactBag;

  /// No description provided for @activityCompactSpace.
  ///
  /// In zh, this message translates to:
  /// **'腾地方中'**
  String get activityCompactSpace;

  /// No description provided for @activityCompactMemory.
  ///
  /// In zh, this message translates to:
  /// **'给记忆瘦个身'**
  String get activityCompactMemory;

  /// No description provided for @activityCompactChats.
  ///
  /// In zh, this message translates to:
  /// **'打包旧对话'**
  String get activityCompactChats;

  /// No description provided for @activityReminderWater.
  ///
  /// In zh, this message translates to:
  /// **'半小时了，喝口水？'**
  String get activityReminderWater;

  /// No description provided for @activityReminderTenMinutes.
  ///
  /// In zh, this message translates to:
  /// **'10 分钟了，这活不小'**
  String get activityReminderTenMinutes;

  /// No description provided for @activityDiffTitle.
  ///
  /// In zh, this message translates to:
  /// **'本轮改动'**
  String get activityDiffTitle;

  /// No description provided for @activityDiffCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制补丁'**
  String get activityDiffCopied;

  /// No description provided for @activityDiffNoWrap.
  ///
  /// In zh, this message translates to:
  /// **'不换行'**
  String get activityDiffNoWrap;

  /// No description provided for @activityDiffWrap.
  ///
  /// In zh, this message translates to:
  /// **'自动换行'**
  String get activityDiffWrap;

  /// No description provided for @activityDiffCopy.
  ///
  /// In zh, this message translates to:
  /// **'复制补丁'**
  String get activityDiffCopy;

  /// No description provided for @activityDiffEmpty.
  ///
  /// In zh, this message translates to:
  /// **'空文件，没有可显示的改动'**
  String get activityDiffEmpty;

  /// No description provided for @activityDiffNewFile.
  ///
  /// In zh, this message translates to:
  /// **'新建文件'**
  String get activityDiffNewFile;

  /// No description provided for @activityDiffUnknownLines.
  ///
  /// In zh, this message translates to:
  /// **'行号未知'**
  String get activityDiffUnknownLines;

  /// No description provided for @activityDiffCopyPath.
  ///
  /// In zh, this message translates to:
  /// **'复制路径'**
  String get activityDiffCopyPath;

  /// No description provided for @activityThinking.
  ///
  /// In zh, this message translates to:
  /// **'思考'**
  String get activityThinking;

  /// No description provided for @activityReplyInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'回复（已中断）'**
  String get activityReplyInterrupted;

  /// No description provided for @activityWaitingApproval.
  ///
  /// In zh, this message translates to:
  /// **'等待确认'**
  String get activityWaitingApproval;

  /// No description provided for @activityWaitingAnswer.
  ///
  /// In zh, this message translates to:
  /// **'等待回答'**
  String get activityWaitingAnswer;

  /// No description provided for @activityWriting.
  ///
  /// In zh, this message translates to:
  /// **'写回复中'**
  String get activityWriting;

  /// No description provided for @activityThinkingNow.
  ///
  /// In zh, this message translates to:
  /// **'思考中'**
  String get activityThinkingNow;

  /// No description provided for @activityRetrying.
  ///
  /// In zh, this message translates to:
  /// **'重试中'**
  String get activityRetrying;

  /// No description provided for @activityCompacting.
  ///
  /// In zh, this message translates to:
  /// **'压缩上下文'**
  String get activityCompacting;

  /// No description provided for @activityVerbRun.
  ///
  /// In zh, this message translates to:
  /// **'跑'**
  String get activityVerbRun;

  /// No description provided for @activityVerbWrite.
  ///
  /// In zh, this message translates to:
  /// **'写'**
  String get activityVerbWrite;

  /// No description provided for @activityVerbEdit.
  ///
  /// In zh, this message translates to:
  /// **'改'**
  String get activityVerbEdit;

  /// No description provided for @activityVerbImage.
  ///
  /// In zh, this message translates to:
  /// **'看图'**
  String get activityVerbImage;

  /// No description provided for @activityVerbRead.
  ///
  /// In zh, this message translates to:
  /// **'读'**
  String get activityVerbRead;

  /// No description provided for @activityVerbFind.
  ///
  /// In zh, this message translates to:
  /// **'找'**
  String get activityVerbFind;

  /// No description provided for @activityVerbSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜'**
  String get activityVerbSearch;

  /// No description provided for @activityVerbWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜网页'**
  String get activityVerbWebSearch;

  /// No description provided for @activityVerbWebView.
  ///
  /// In zh, this message translates to:
  /// **'看网页'**
  String get activityVerbWebView;

  /// No description provided for @activityVerbSubagent.
  ///
  /// In zh, this message translates to:
  /// **'派子代理'**
  String get activityVerbSubagent;

  /// No description provided for @activityVerbTodo.
  ///
  /// In zh, this message translates to:
  /// **'更新待办'**
  String get activityVerbTodo;

  /// No description provided for @activitySecretHide.
  ///
  /// In zh, this message translates to:
  /// **'隐藏密钥'**
  String get activitySecretHide;

  /// No description provided for @activitySecretShow.
  ///
  /// In zh, this message translates to:
  /// **'显示密钥'**
  String get activitySecretShow;

  /// No description provided for @activitySlashNoMatch.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的指令，按普通消息发送'**
  String get activitySlashNoMatch;

  /// No description provided for @activitySlashCommands.
  ///
  /// In zh, this message translates to:
  /// **'指令'**
  String get activitySlashCommands;

  /// No description provided for @activitySlashEnterArgs.
  ///
  /// In zh, this message translates to:
  /// **'输入参数后发送'**
  String get activitySlashEnterArgs;

  /// No description provided for @activityStepTitle.
  ///
  /// In zh, this message translates to:
  /// **'步骤详情'**
  String get activityStepTitle;

  /// No description provided for @activityStepMissing.
  ///
  /// In zh, this message translates to:
  /// **'这一步不在已加载的记录里'**
  String get activityStepMissing;

  /// No description provided for @activityStepQuestion.
  ///
  /// In zh, this message translates to:
  /// **'提问'**
  String get activityStepQuestion;

  /// No description provided for @activityStepSuccess.
  ///
  /// In zh, this message translates to:
  /// **'成功'**
  String get activityStepSuccess;

  /// No description provided for @activityStepNeedsPermission.
  ///
  /// In zh, this message translates to:
  /// **'需要授权'**
  String get activityStepNeedsPermission;

  /// No description provided for @activityTools.
  ///
  /// In zh, this message translates to:
  /// **'工具'**
  String get activityTools;

  /// No description provided for @activityStepDispatched.
  ///
  /// In zh, this message translates to:
  /// **'发出'**
  String get activityStepDispatched;

  /// No description provided for @activityStepExecution.
  ///
  /// In zh, this message translates to:
  /// **'执行'**
  String get activityStepExecution;

  /// No description provided for @activityStepLocation.
  ///
  /// In zh, this message translates to:
  /// **'所在'**
  String get activityStepLocation;

  /// No description provided for @activityStepArguments.
  ///
  /// In zh, this message translates to:
  /// **'参数'**
  String get activityStepArguments;

  /// No description provided for @activityStepChanges.
  ///
  /// In zh, this message translates to:
  /// **'改动'**
  String get activityStepChanges;

  /// No description provided for @activityStepFullScreen.
  ///
  /// In zh, this message translates to:
  /// **'全屏查看'**
  String get activityStepFullScreen;

  /// No description provided for @activityStepReadContent.
  ///
  /// In zh, this message translates to:
  /// **'读到的内容'**
  String get activityStepReadContent;

  /// No description provided for @activityStepWrittenContent.
  ///
  /// In zh, this message translates to:
  /// **'写入的内容'**
  String get activityStepWrittenContent;

  /// No description provided for @activityStepError.
  ///
  /// In zh, this message translates to:
  /// **'错误'**
  String get activityStepError;

  /// No description provided for @activityOutput.
  ///
  /// In zh, this message translates to:
  /// **'输出'**
  String get activityOutput;

  /// No description provided for @activityStepResult.
  ///
  /// In zh, this message translates to:
  /// **'结果'**
  String get activityStepResult;

  /// No description provided for @activityStepDeclined.
  ///
  /// In zh, this message translates to:
  /// **'你拒绝了这次调用'**
  String get activityStepDeclined;

  /// No description provided for @activityStepNoOutput.
  ///
  /// In zh, this message translates to:
  /// **'没有输出'**
  String get activityStepNoOutput;

  /// No description provided for @activityStepStart.
  ///
  /// In zh, this message translates to:
  /// **'开始'**
  String get activityStepStart;

  /// No description provided for @activityDuration.
  ///
  /// In zh, this message translates to:
  /// **'用时'**
  String get activityDuration;

  /// No description provided for @activityFirstToken.
  ///
  /// In zh, this message translates to:
  /// **'首字'**
  String get activityFirstToken;

  /// No description provided for @activityStepGeneration.
  ///
  /// In zh, this message translates to:
  /// **'生成'**
  String get activityStepGeneration;

  /// No description provided for @activityStepSpeed.
  ///
  /// In zh, this message translates to:
  /// **'速度'**
  String get activityStepSpeed;

  /// No description provided for @activityModel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get activityModel;

  /// No description provided for @activityStepTiming.
  ///
  /// In zh, this message translates to:
  /// **'计时'**
  String get activityStepTiming;

  /// No description provided for @activityUsage.
  ///
  /// In zh, this message translates to:
  /// **'用量'**
  String get activityUsage;

  /// No description provided for @activityInput.
  ///
  /// In zh, this message translates to:
  /// **'输入'**
  String get activityInput;

  /// No description provided for @activityStepCacheHit.
  ///
  /// In zh, this message translates to:
  /// **'  命中缓存'**
  String get activityStepCacheHit;

  /// No description provided for @activityStepCacheMiss.
  ///
  /// In zh, this message translates to:
  /// **'  未命中'**
  String get activityStepCacheMiss;

  /// No description provided for @activityStepCacheWrite.
  ///
  /// In zh, this message translates to:
  /// **'  写入缓存'**
  String get activityStepCacheWrite;

  /// No description provided for @activityStepReasoning.
  ///
  /// In zh, this message translates to:
  /// **'  推理'**
  String get activityStepReasoning;

  /// No description provided for @activityStepAnswer.
  ///
  /// In zh, this message translates to:
  /// **'  回答'**
  String get activityStepAnswer;

  /// No description provided for @activityStepThinking.
  ///
  /// In zh, this message translates to:
  /// **'思考过程'**
  String get activityStepThinking;

  /// No description provided for @activityStepExplanation.
  ///
  /// In zh, this message translates to:
  /// **'说明'**
  String get activityStepExplanation;

  /// No description provided for @activityStepToolCalls.
  ///
  /// In zh, this message translates to:
  /// **'本步调用的工具'**
  String get activityStepToolCalls;

  /// No description provided for @activityStepProcessing.
  ///
  /// In zh, this message translates to:
  /// **'模型正在处理'**
  String get activityStepProcessing;

  /// No description provided for @activityApprovalAllowed.
  ///
  /// In zh, this message translates to:
  /// **'允许了'**
  String get activityApprovalAllowed;

  /// No description provided for @activityApprovalUnanswered.
  ///
  /// In zh, this message translates to:
  /// **'无人确认'**
  String get activityApprovalUnanswered;

  /// No description provided for @activityApprovalAnswered.
  ///
  /// In zh, this message translates to:
  /// **'已答复'**
  String get activityApprovalAnswered;

  /// No description provided for @activityToolRead.
  ///
  /// In zh, this message translates to:
  /// **'读取'**
  String get activityToolRead;

  /// No description provided for @activityToolWrite.
  ///
  /// In zh, this message translates to:
  /// **'写入'**
  String get activityToolWrite;

  /// No description provided for @activityToolCall.
  ///
  /// In zh, this message translates to:
  /// **'调用工具'**
  String get activityToolCall;

  /// No description provided for @activityTraceTitle.
  ///
  /// In zh, this message translates to:
  /// **'本轮轨迹'**
  String get activityTraceTitle;

  /// No description provided for @activityTraceNotLoaded.
  ///
  /// In zh, this message translates to:
  /// **'本轮记录尚未加载'**
  String get activityTraceNotLoaded;

  /// No description provided for @activityTraceOutputLimit.
  ///
  /// In zh, this message translates to:
  /// **'输出达到上限'**
  String get activityTraceOutputLimit;

  /// No description provided for @activityTraceEngineRestarted.
  ///
  /// In zh, this message translates to:
  /// **'引擎重启，已中断'**
  String get activityTraceEngineRestarted;

  /// No description provided for @activityTraceBlocked.
  ///
  /// In zh, this message translates to:
  /// **'已被拦截'**
  String get activityTraceBlocked;

  /// No description provided for @activityTraceHeading.
  ///
  /// In zh, this message translates to:
  /// **'本轮轨迹  '**
  String get activityTraceHeading;

  /// No description provided for @activityTraceWaiting.
  ///
  /// In zh, this message translates to:
  /// **'等你'**
  String get activityTraceWaiting;

  /// No description provided for @activityTraceNoSteps.
  ///
  /// In zh, this message translates to:
  /// **'本轮没有可计时的步骤'**
  String get activityTraceNoSteps;

  /// No description provided for @activityUsageInputIncludesCache.
  ///
  /// In zh, this message translates to:
  /// **'输入含缓存命中'**
  String get activityUsageInputIncludesCache;

  /// No description provided for @activityCacheHit.
  ///
  /// In zh, this message translates to:
  /// **'缓存命中'**
  String get activityCacheHit;

  /// No description provided for @activitySummaryTodo.
  ///
  /// In zh, this message translates to:
  /// **'更新了待办'**
  String get activitySummaryTodo;

  /// No description provided for @activityUsageBalance.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 余额'**
  String get activityUsageBalance;

  /// No description provided for @activityUsageContext.
  ///
  /// In zh, this message translates to:
  /// **'上下文'**
  String get activityUsageContext;

  /// No description provided for @activityUsageChat.
  ///
  /// In zh, this message translates to:
  /// **'本对话'**
  String get activityUsageChat;

  /// No description provided for @activityUsageAfterMessage.
  ///
  /// In zh, this message translates to:
  /// **'发送消息后显示'**
  String get activityUsageAfterMessage;

  /// No description provided for @activityUsageContextFull.
  ///
  /// In zh, this message translates to:
  /// **'上下文将满，发送 /compact 可压缩'**
  String get activityUsageContextFull;

  /// No description provided for @activitySpanZero.
  ///
  /// In zh, this message translates to:
  /// **'0 秒'**
  String get activitySpanZero;

  /// No description provided for @activitySpanTiny.
  ///
  /// In zh, this message translates to:
  /// **'<0.1 秒'**
  String get activitySpanTiny;

  /// No description provided for @activityTokensTenThousands.
  ///
  /// In zh, this message translates to:
  /// **'{value} 万'**
  String activityTokensTenThousands(String value);

  /// No description provided for @activityTokensHundredMillions.
  ///
  /// In zh, this message translates to:
  /// **'{value} 亿'**
  String activityTokensHundredMillions(String value);

  /// No description provided for @activityUsageContextSemantics.
  ///
  /// In zh, this message translates to:
  /// **'上下文已用 {percent}，查看用量'**
  String activityUsageContextSemantics(String percent);

  /// No description provided for @activityUsageSystemTokens.
  ///
  /// In zh, this message translates to:
  /// **'系统 {tokens}'**
  String activityUsageSystemTokens(String tokens);

  /// No description provided for @activityUsageToolTokens.
  ///
  /// In zh, this message translates to:
  /// **'工具 {tokens}'**
  String activityUsageToolTokens(String tokens);

  /// No description provided for @activityUsageMessageTokens.
  ///
  /// In zh, this message translates to:
  /// **'消息 {tokens}'**
  String activityUsageMessageTokens(String tokens);

  /// No description provided for @activityUsageTurns.
  ///
  /// In zh, this message translates to:
  /// **'共 {count} 轮'**
  String activityUsageTurns(int count);

  /// No description provided for @activityUsageCacheWriteTokens.
  ///
  /// In zh, this message translates to:
  /// **'写入缓存 {tokens}'**
  String activityUsageCacheWriteTokens(String tokens);

  /// No description provided for @activitySummaryCommands.
  ///
  /// In zh, this message translates to:
  /// **'执行 {count} 条命令'**
  String activitySummaryCommands(int count);

  /// No description provided for @activitySummaryEditedFiles.
  ///
  /// In zh, this message translates to:
  /// **'改了 {count} 个文件'**
  String activitySummaryEditedFiles(int count);

  /// No description provided for @activitySummaryReadFiles.
  ///
  /// In zh, this message translates to:
  /// **'读了 {count} 个文件'**
  String activitySummaryReadFiles(int count);

  /// No description provided for @activitySummarySearches.
  ///
  /// In zh, this message translates to:
  /// **'搜索 {count} 次'**
  String activitySummarySearches(int count);

  /// No description provided for @activitySummaryWeb.
  ///
  /// In zh, this message translates to:
  /// **'联网 {count} 次'**
  String activitySummaryWeb(int count);

  /// No description provided for @activitySummarySubagents.
  ///
  /// In zh, this message translates to:
  /// **'调用子代理 {count} 次'**
  String activitySummarySubagents(int count);

  /// No description provided for @activitySummaryOther.
  ///
  /// In zh, this message translates to:
  /// **'其他工具 {count} 次'**
  String activitySummaryOther(int count);

  /// No description provided for @activitySummaryTotal.
  ///
  /// In zh, this message translates to:
  /// **'使用了 {count} 个工具'**
  String activitySummaryTotal(int count);

  /// No description provided for @activityDiffBlockMarker.
  ///
  /// In zh, this message translates to:
  /// **'@@ 第 {index}/{total} 处修改 @@'**
  String activityDiffBlockMarker(int index, int total);

  /// No description provided for @activityDiffEditMarker.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 次修改（共 {total} 次）'**
  String activityDiffEditMarker(int index, int total);

  /// No description provided for @activityTraceSpanSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{title} {detail}，用时 {duration}'**
  String activityTraceSpanSemantics(String title, String detail, String duration);

  /// No description provided for @activityTraceGroupSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{label}，用时 {duration}'**
  String activityTraceGroupSemantics(String label, String duration);

  /// No description provided for @activityTraceEstimatedCost.
  ///
  /// In zh, this message translates to:
  /// **'{cost}（按官方单价估算）'**
  String activityTraceEstimatedCost(String cost);

  /// No description provided for @activityTraceReasoningTokens.
  ///
  /// In zh, this message translates to:
  /// **'其中推理 {tokens}'**
  String activityTraceReasoningTokens(String tokens);

  /// No description provided for @activityStepPosition.
  ///
  /// In zh, this message translates to:
  /// **'第 {turn} 轮 · 第 {step} 步'**
  String activityStepPosition(int turn, Object step);

  /// No description provided for @activityStepTokenSpeed.
  ///
  /// In zh, this message translates to:
  /// **'{speed} tokens/秒'**
  String activityStepTokenSpeed(String speed);

  /// No description provided for @activityStepRetryCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 次'**
  String activityStepRetryCount(int count);

  /// No description provided for @activityStepTruncated.
  ///
  /// In zh, this message translates to:
  /// **'{text}\n…（仅显示前 {count}k 字，复制可得全文）'**
  String activityStepTruncated(String text, int count);

  /// No description provided for @activityStepLiveElapsed.
  ///
  /// In zh, this message translates to:
  /// **'{elapsed} · 进行中{suffix}'**
  String activityStepLiveElapsed(String elapsed, String suffix);

  /// No description provided for @activityStepCopySection.
  ///
  /// In zh, this message translates to:
  /// **'复制{title}'**
  String activityStepCopySection(String title);

  /// No description provided for @activityStepCopiedSection.
  ///
  /// In zh, this message translates to:
  /// **'已复制{title}'**
  String activityStepCopiedSection(String title);

  /// No description provided for @activitySlashDescriptionArgs.
  ///
  /// In zh, this message translates to:
  /// **'{description} · 输入参数后发送'**
  String activitySlashDescriptionArgs(String description);

  /// No description provided for @activitySpanSecondsText.
  ///
  /// In zh, this message translates to:
  /// **'{seconds} 秒'**
  String activitySpanSecondsText(String seconds);

  /// No description provided for @activitySpanSeconds.
  ///
  /// In zh, this message translates to:
  /// **'{seconds} 秒'**
  String activitySpanSeconds(int seconds);

  /// No description provided for @activitySpanMinutesSeconds.
  ///
  /// In zh, this message translates to:
  /// **'{minutes} 分 {seconds} 秒'**
  String activitySpanMinutesSeconds(int minutes, String seconds);

  /// No description provided for @activitySpanHoursMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 小时 {minutes} 分'**
  String activitySpanHoursMinutes(int hours, String minutes);

  /// No description provided for @activityCostUnderCent.
  ///
  /// In zh, this message translates to:
  /// **'不到 {symbol}0.01'**
  String activityCostUnderCent(String symbol);

  /// No description provided for @activityCostApprox.
  ///
  /// In zh, this message translates to:
  /// **'约 {symbol}{amount}'**
  String activityCostApprox(String symbol, String amount);

  /// No description provided for @activitySpanRetries.
  ///
  /// In zh, this message translates to:
  /// **'重试 {count} 次'**
  String activitySpanRetries(int count);

  /// No description provided for @activitySpanToolCalls.
  ///
  /// In zh, this message translates to:
  /// **'决定调用 {count} 个工具'**
  String activitySpanToolCalls(int count);

  /// No description provided for @activityRunningItems.
  ///
  /// In zh, this message translates to:
  /// **'等 {count} 项'**
  String activityRunningItems(int count);

  /// No description provided for @activityRetryAttempt.
  ///
  /// In zh, this message translates to:
  /// **'第 {count} 次'**
  String activityRetryAttempt(int count);

  /// No description provided for @activityDiffFileCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个文件'**
  String activityDiffFileCount(int count);

  /// No description provided for @activityDiffFileSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{path}，新增 {added} 行，删除 {removed} 行'**
  String activityDiffFileSemantics(String path, int added, int removed);

  /// No description provided for @activityDiffEditNumber.
  ///
  /// In zh, this message translates to:
  /// **'第 {edit} 次修改'**
  String activityDiffEditNumber(int edit);

  /// No description provided for @activityDiffHunkNumber.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 处'**
  String activityDiffHunkNumber(int index);

  /// No description provided for @activityDiffFromLine.
  ///
  /// In zh, this message translates to:
  /// **'第 {line} 行起'**
  String activityDiffFromLine(int line);

  /// No description provided for @activityDiffEditCount.
  ///
  /// In zh, this message translates to:
  /// **'修改 {count} 次'**
  String activityDiffEditCount(int count);

  /// No description provided for @activityLunarZodiac.
  ///
  /// In zh, this message translates to:
  /// **'{animal}年大吉'**
  String activityLunarZodiac(String animal);

  /// No description provided for @activityReminderHours.
  ///
  /// In zh, this message translates to:
  /// **'已经连续干了 {hours} 小时，歇会儿？'**
  String activityReminderHours(int hours);

  /// No description provided for @activityStepModelRequest.
  ///
  /// In zh, this message translates to:
  /// **'一次模型请求'**
  String get activityStepModelRequest;

  /// No description provided for @activityStepModelRequestDetail.
  ///
  /// In zh, this message translates to:
  /// **'一次模型请求 · {detail}'**
  String activityStepModelRequestDetail(String detail);

  /// No description provided for @activityUsageEstimatedCost.
  ///
  /// In zh, this message translates to:
  /// **'约 {symbol}{amount}'**
  String activityUsageEstimatedCost(String symbol, String amount);

  /// No description provided for @activitySlashCommandSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{label}，/{name}'**
  String activitySlashCommandSemantics(String label, String name);

  /// No description provided for @activityToolListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get activityToolListSeparator;

  /// No description provided for @botsFolderGone.
  ///
  /// In zh, this message translates to:
  /// **'这个文件夹已经不在了'**
  String get botsFolderGone;

  /// No description provided for @botsFolderReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取这个文件夹'**
  String get botsFolderReadFailed;

  /// No description provided for @botsFolderOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开这个文件夹'**
  String get botsFolderOpenFailed;

  /// No description provided for @botsFolderCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个文件夹'**
  String botsFolderCount(int count);

  /// No description provided for @botsWorkingFolder.
  ///
  /// In zh, this message translates to:
  /// **'工作目录'**
  String get botsWorkingFolder;

  /// No description provided for @botsFolderTeamDefault.
  ///
  /// In zh, this message translates to:
  /// **'团队工作区'**
  String get botsFolderTeamDefault;

  /// No description provided for @botsFolderRoomDefault.
  ///
  /// In zh, this message translates to:
  /// **'每位 Bot 各自的目录'**
  String get botsFolderRoomDefault;

  /// No description provided for @botsFolderHint.
  ///
  /// In zh, this message translates to:
  /// **'目录位于已连接的主机。'**
  String get botsFolderHint;

  /// No description provided for @botsFolderCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前目录'**
  String get botsFolderCurrent;

  /// No description provided for @botsFolderUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'连接或目录已变化，请重新打开。'**
  String get botsFolderUnavailable;

  /// No description provided for @botsFolderNoChoices.
  ///
  /// In zh, this message translates to:
  /// **'主机上暂无其他目录。'**
  String get botsFolderNoChoices;

  /// No description provided for @botsFolderConfirm.
  ///
  /// In zh, this message translates to:
  /// **'使用此工作目录？'**
  String get botsFolderConfirm;

  /// No description provided for @botsFolderRefused.
  ///
  /// In zh, this message translates to:
  /// **'主机拒绝了此目录：它可能已不存在、无法访问或受保护。请另选目录或重试。'**
  String get botsFolderRefused;

  /// No description provided for @botsChildCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个下级'**
  String botsChildCount(int count);

  /// No description provided for @botsCurrentChat.
  ///
  /// In zh, this message translates to:
  /// **'当前对话'**
  String get botsCurrentChat;

  /// No description provided for @botsSubagentCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个子代理'**
  String botsSubagentCount(int count);

  /// No description provided for @botsRunningCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个运行中'**
  String botsRunningCount(int count);

  /// No description provided for @botsFailedCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个出错'**
  String botsFailedCount(int count);

  /// No description provided for @botsNestedCount.
  ///
  /// In zh, this message translates to:
  /// **'含 {count} 个下级'**
  String botsNestedCount(int count);

  /// No description provided for @botsBackToParent.
  ///
  /// In zh, this message translates to:
  /// **'返回「{title}」'**
  String botsBackToParent(String title);

  /// No description provided for @botsTeamMemberCount.
  ///
  /// In zh, this message translates to:
  /// **'智能体团队，{count} 位成员'**
  String botsTeamMemberCount(int count);

  /// No description provided for @botsAgentTeam.
  ///
  /// In zh, this message translates to:
  /// **'智能体团队'**
  String get botsAgentTeam;

  /// No description provided for @botsSubagentRunningCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个子代理，{running} 个运行中'**
  String botsSubagentRunningCount(int count, int running);

  /// No description provided for @botsSubagents.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get botsSubagents;

  /// No description provided for @botsNoSubagents.
  ///
  /// In zh, this message translates to:
  /// **'没有派出子代理'**
  String get botsNoSubagents;

  /// No description provided for @botsOpenChatFirst.
  ///
  /// In zh, this message translates to:
  /// **'先打开一个对话'**
  String get botsOpenChatFirst;

  /// No description provided for @botsTeamReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读到团队'**
  String get botsTeamReadFailed;

  /// No description provided for @botsNoTeamOnHost.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有智能体团队'**
  String get botsNoTeamOnHost;

  /// No description provided for @botsTeamNotEnabled.
  ///
  /// In zh, this message translates to:
  /// **'智能体团队未开启'**
  String get botsTeamNotEnabled;

  /// No description provided for @botsTeamDescription.
  ///
  /// In zh, this message translates to:
  /// **'多个智能体分工协作，共用一块任务板'**
  String get botsTeamDescription;

  /// No description provided for @botsTeamEnabling.
  ///
  /// In zh, this message translates to:
  /// **'正在开启…'**
  String get botsTeamEnabling;

  /// No description provided for @botsTeamEnable.
  ///
  /// In zh, this message translates to:
  /// **'开启团队'**
  String get botsTeamEnable;

  /// No description provided for @botsMembersWorking.
  ///
  /// In zh, this message translates to:
  /// **'{count} 位成员在工作'**
  String botsMembersWorking(int count);

  /// No description provided for @botsTeamStandby.
  ///
  /// In zh, this message translates to:
  /// **'都在待命'**
  String get botsTeamStandby;

  /// No description provided for @botsMembers.
  ///
  /// In zh, this message translates to:
  /// **'成员'**
  String get botsMembers;

  /// No description provided for @botsTasks.
  ///
  /// In zh, this message translates to:
  /// **'任务'**
  String get botsTasks;

  /// No description provided for @botsTeamRecordUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'团队记录有一条读不出来'**
  String get botsTeamRecordUnreadable;

  /// No description provided for @botsMessages.
  ///
  /// In zh, this message translates to:
  /// **'消息'**
  String get botsMessages;

  /// No description provided for @botsOwner.
  ///
  /// In zh, this message translates to:
  /// **'负责人'**
  String get botsOwner;

  /// No description provided for @botsTeamCreateHint.
  ///
  /// In zh, this message translates to:
  /// **'在对话里请 AI 组建团队'**
  String get botsTeamCreateHint;

  /// No description provided for @botsCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前'**
  String get botsCurrent;

  /// No description provided for @botsNoTasks.
  ///
  /// In zh, this message translates to:
  /// **'还没有任务'**
  String get botsNoTasks;

  /// No description provided for @botsTodo.
  ///
  /// In zh, this message translates to:
  /// **'待办'**
  String get botsTodo;

  /// No description provided for @botsUnassigned.
  ///
  /// In zh, this message translates to:
  /// **'未分配'**
  String get botsUnassigned;

  /// No description provided for @botsTaskWaitingFor.
  ///
  /// In zh, this message translates to:
  /// **'等 {dependencies}'**
  String botsTaskWaitingFor(String dependencies);

  /// No description provided for @botsWriteOverlap.
  ///
  /// In zh, this message translates to:
  /// **'写入范围重叠'**
  String get botsWriteOverlap;

  /// No description provided for @botsWaitingDependencies.
  ///
  /// In zh, this message translates to:
  /// **'等依赖'**
  String get botsWaitingDependencies;

  /// No description provided for @botsReadyToStart.
  ///
  /// In zh, this message translates to:
  /// **'可开始'**
  String get botsReadyToStart;

  /// No description provided for @botsTaskId.
  ///
  /// In zh, this message translates to:
  /// **'编号'**
  String get botsTaskId;

  /// No description provided for @botsDependencies.
  ///
  /// In zh, this message translates to:
  /// **'依赖'**
  String get botsDependencies;

  /// No description provided for @botsWriteScopes.
  ///
  /// In zh, this message translates to:
  /// **'写入范围'**
  String get botsWriteScopes;

  /// No description provided for @botsMessagesReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读到消息'**
  String get botsMessagesReadFailed;

  /// No description provided for @botsNoMemberMessages.
  ///
  /// In zh, this message translates to:
  /// **'成员之间还没有消息'**
  String get botsNoMemberMessages;

  /// No description provided for @botsMessagesIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'部分成员的消息没能读到 · 重试'**
  String get botsMessagesIncomplete;

  /// No description provided for @botsDateTime.
  ///
  /// In zh, this message translates to:
  /// **'{date} {time}'**
  String botsDateTime(String date, String time);

  /// No description provided for @botsViewDetails.
  ///
  /// In zh, this message translates to:
  /// **'查看详情'**
  String get botsViewDetails;

  /// No description provided for @botsAdmin.
  ///
  /// In zh, this message translates to:
  /// **'管理员'**
  String get botsAdmin;

  /// No description provided for @botsFullTextChanged.
  ///
  /// In zh, this message translates to:
  /// **'对话已变化'**
  String get botsFullTextChanged;

  /// No description provided for @botsFullTextReopen.
  ///
  /// In zh, this message translates to:
  /// **'请重新打开这条消息'**
  String get botsFullTextReopen;

  /// No description provided for @botsFullTextReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取全文'**
  String get botsFullTextReadFailed;

  /// No description provided for @botsShowAll.
  ///
  /// In zh, this message translates to:
  /// **'显示全部'**
  String get botsShowAll;

  /// No description provided for @botsImagePlaceholder.
  ///
  /// In zh, this message translates to:
  /// **'［图片］'**
  String get botsImagePlaceholder;

  /// No description provided for @botsSending.
  ///
  /// In zh, this message translates to:
  /// **'发送中'**
  String get botsSending;

  /// No description provided for @botsWriteOwn.
  ///
  /// In zh, this message translates to:
  /// **'自己写'**
  String get botsWriteOwn;

  /// No description provided for @botsSubmit.
  ///
  /// In zh, this message translates to:
  /// **'提交'**
  String get botsSubmit;

  /// No description provided for @botsChooseModelFor.
  ///
  /// In zh, this message translates to:
  /// **'给 {name} 选一个模型'**
  String botsChooseModelFor(String name);

  /// No description provided for @botsModelGreeting.
  ///
  /// In zh, this message translates to:
  /// **'选好后它就会打招呼'**
  String get botsModelGreeting;

  /// No description provided for @botsChooseModel.
  ///
  /// In zh, this message translates to:
  /// **'选择模型'**
  String get botsChooseModel;

  /// No description provided for @botsSkipAnswer.
  ///
  /// In zh, this message translates to:
  /// **'不回答'**
  String get botsSkipAnswer;

  /// No description provided for @botsBotGone.
  ///
  /// In zh, this message translates to:
  /// **'这个 Bot 已不在'**
  String get botsBotGone;

  /// No description provided for @botsWaitingModel.
  ///
  /// In zh, this message translates to:
  /// **'等你选模型'**
  String get botsWaitingModel;

  /// No description provided for @botsThinking.
  ///
  /// In zh, this message translates to:
  /// **'正在思考'**
  String get botsThinking;

  /// No description provided for @botsMainBot.
  ///
  /// In zh, this message translates to:
  /// **'主 Bot'**
  String get botsMainBot;

  /// No description provided for @botsIdle.
  ///
  /// In zh, this message translates to:
  /// **'空闲'**
  String get botsIdle;

  /// No description provided for @botsAnsweredQuestion.
  ///
  /// In zh, this message translates to:
  /// **'你回答了它的问题'**
  String get botsAnsweredQuestion;

  /// No description provided for @botsEarlierMessages.
  ///
  /// In zh, this message translates to:
  /// **'更早的部分'**
  String get botsEarlierMessages;

  /// No description provided for @botsComposerHint.
  ///
  /// In zh, this message translates to:
  /// **'给 {name} 发消息…'**
  String botsComposerHint(String name);

  /// No description provided for @botsDeleteNamed.
  ///
  /// In zh, this message translates to:
  /// **'删除「{name}」？'**
  String botsDeleteNamed(String name);

  /// No description provided for @botsDeleteBotBody.
  ///
  /// In zh, this message translates to:
  /// **'它的对话还在，记忆会移到归档里。'**
  String get botsDeleteBotBody;

  /// No description provided for @botsTokensToday.
  ///
  /// In zh, this message translates to:
  /// **'24 小时 tokens'**
  String get botsTokensToday;

  /// No description provided for @botsMemoryUnit.
  ///
  /// In zh, this message translates to:
  /// **'条记忆'**
  String get botsMemoryUnit;

  /// No description provided for @botsRoomUnit.
  ///
  /// In zh, this message translates to:
  /// **'个群聊'**
  String get botsRoomUnit;

  /// No description provided for @botsProfile.
  ///
  /// In zh, this message translates to:
  /// **'资料'**
  String get botsProfile;

  /// No description provided for @botsModel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get botsModel;

  /// No description provided for @botsBotName.
  ///
  /// In zh, this message translates to:
  /// **'名字'**
  String get botsBotName;

  /// No description provided for @botsRole.
  ///
  /// In zh, this message translates to:
  /// **'角色'**
  String get botsRole;

  /// No description provided for @botsWriterExample.
  ///
  /// In zh, this message translates to:
  /// **'比如：写手'**
  String get botsWriterExample;

  /// No description provided for @botsInstructions.
  ///
  /// In zh, this message translates to:
  /// **'说明'**
  String get botsInstructions;

  /// No description provided for @botsInstructionsHint.
  ///
  /// In zh, this message translates to:
  /// **'它该怎么做事'**
  String get botsInstructionsHint;

  /// No description provided for @botsColor.
  ///
  /// In zh, this message translates to:
  /// **'颜色'**
  String get botsColor;

  /// No description provided for @botsUsage.
  ///
  /// In zh, this message translates to:
  /// **'用量'**
  String get botsUsage;

  /// No description provided for @botsUsageScanning.
  ///
  /// In zh, this message translates to:
  /// **'正在统计历史对话，数据稍后补全。'**
  String get botsUsageScanning;

  /// No description provided for @botsUsageRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get botsUsageRefresh;

  /// No description provided for @botsToday.
  ///
  /// In zh, this message translates to:
  /// **'近 24 小时'**
  String get botsToday;

  /// No description provided for @botsLastWeek.
  ///
  /// In zh, this message translates to:
  /// **'近 7 天'**
  String get botsLastWeek;

  /// No description provided for @botsLastMonth.
  ///
  /// In zh, this message translates to:
  /// **'近 30 天'**
  String get botsLastMonth;

  /// No description provided for @botsMonthCalls.
  ///
  /// In zh, this message translates to:
  /// **'近 30 天 · {count} 次调用'**
  String botsMonthCalls(int count);

  /// No description provided for @botsFullRecord.
  ///
  /// In zh, this message translates to:
  /// **'完整记录'**
  String get botsFullRecord;

  /// No description provided for @botsEveryToolCall.
  ///
  /// In zh, this message translates to:
  /// **'每一步工具调用'**
  String get botsEveryToolCall;

  /// No description provided for @botsUnsetMain.
  ///
  /// In zh, this message translates to:
  /// **'取消主 Bot'**
  String get botsUnsetMain;

  /// No description provided for @botsSetMain.
  ///
  /// In zh, this message translates to:
  /// **'设为主 Bot'**
  String get botsSetMain;

  /// No description provided for @botsDeleteBot.
  ///
  /// In zh, this message translates to:
  /// **'删除 Bot'**
  String get botsDeleteBot;

  /// No description provided for @botsEffortOff.
  ///
  /// In zh, this message translates to:
  /// **'不思考'**
  String get botsEffortOff;

  /// No description provided for @botsEffortMinimal.
  ///
  /// In zh, this message translates to:
  /// **'极少'**
  String get botsEffortMinimal;

  /// No description provided for @botsEffortLow.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get botsEffortLow;

  /// No description provided for @botsEffortMedium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get botsEffortMedium;

  /// No description provided for @botsEffortHigh.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get botsEffortHigh;

  /// No description provided for @botsEffortMax.
  ///
  /// In zh, this message translates to:
  /// **'最高'**
  String get botsEffortMax;

  /// No description provided for @botsNamedRecord.
  ///
  /// In zh, this message translates to:
  /// **'{name} · 完整记录'**
  String botsNamedRecord(String name);

  /// No description provided for @botsOrganizingNotes.
  ///
  /// In zh, this message translates to:
  /// **'正在整理笔记'**
  String get botsOrganizingNotes;

  /// No description provided for @botsToolRun.
  ///
  /// In zh, this message translates to:
  /// **'运行命令'**
  String get botsToolRun;

  /// No description provided for @botsToolRead.
  ///
  /// In zh, this message translates to:
  /// **'查看文件'**
  String get botsToolRead;

  /// No description provided for @botsToolEdit.
  ///
  /// In zh, this message translates to:
  /// **'修改文件'**
  String get botsToolEdit;

  /// No description provided for @botsToolSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get botsToolSearch;

  /// No description provided for @botsToolBrowse.
  ///
  /// In zh, this message translates to:
  /// **'看网页'**
  String get botsToolBrowse;

  /// No description provided for @botsToolMessage.
  ///
  /// In zh, this message translates to:
  /// **'联系其他 Bot'**
  String get botsToolMessage;

  /// No description provided for @botsToolGroup.
  ///
  /// In zh, this message translates to:
  /// **'在群里沟通'**
  String get botsToolGroup;

  /// No description provided for @botsToolMemory.
  ///
  /// In zh, this message translates to:
  /// **'整理记忆'**
  String get botsToolMemory;

  /// No description provided for @botsToolRecall.
  ///
  /// In zh, this message translates to:
  /// **'翻看记录'**
  String get botsToolRecall;

  /// No description provided for @botsToolTeam.
  ///
  /// In zh, this message translates to:
  /// **'安排团队'**
  String get botsToolTeam;

  /// No description provided for @botsToolAsk.
  ///
  /// In zh, this message translates to:
  /// **'准备问你'**
  String get botsToolAsk;

  /// No description provided for @botsToolWork.
  ///
  /// In zh, this message translates to:
  /// **'干活'**
  String get botsToolWork;

  /// No description provided for @botsJustNow.
  ///
  /// In zh, this message translates to:
  /// **'刚刚'**
  String get botsJustNow;

  /// No description provided for @botsCountHundredMillion.
  ///
  /// In zh, this message translates to:
  /// **'{value} 亿'**
  String botsCountHundredMillion(String value);

  /// No description provided for @botsCountTenThousand.
  ///
  /// In zh, this message translates to:
  /// **'{value} 万'**
  String botsCountTenThousand(String value);

  /// No description provided for @botsModelNotSelected.
  ///
  /// In zh, this message translates to:
  /// **'未选择'**
  String get botsModelNotSelected;

  /// No description provided for @botsYourPreview.
  ///
  /// In zh, this message translates to:
  /// **'你：{preview}'**
  String botsYourPreview(String preview);

  /// No description provided for @botsEventWorking.
  ///
  /// In zh, this message translates to:
  /// **'{name} 开始干活'**
  String botsEventWorking(String name);

  /// No description provided for @botsEventApproval.
  ///
  /// In zh, this message translates to:
  /// **'{name} 在等你批准'**
  String botsEventApproval(String name);

  /// No description provided for @botsEventDone.
  ///
  /// In zh, this message translates to:
  /// **'{name} 完成了工作'**
  String botsEventDone(String name);

  /// No description provided for @botsEventStopped.
  ///
  /// In zh, this message translates to:
  /// **'你停下了 {name} 的工作'**
  String botsEventStopped(String name);

  /// No description provided for @botsEventFailed.
  ///
  /// In zh, this message translates to:
  /// **'{name} 没能回答'**
  String botsEventFailed(String name);

  /// No description provided for @botsEventMissed.
  ///
  /// In zh, this message translates to:
  /// **'{name} 没有及时回应'**
  String botsEventMissed(String name);

  /// No description provided for @botsEventLookup.
  ///
  /// In zh, this message translates to:
  /// **'{name} 翻看了自己的聊天'**
  String botsEventLookup(String name);

  /// No description provided for @botsEventLookupQuery.
  ///
  /// In zh, this message translates to:
  /// **'{name} 在自己的聊天里找「{query}」'**
  String botsEventLookupQuery(String name, String query);

  /// No description provided for @botsEventResumed.
  ///
  /// In zh, this message translates to:
  /// **'{name} 重启后接着干'**
  String botsEventResumed(String name);

  /// No description provided for @botsEventCut.
  ///
  /// In zh, this message translates to:
  /// **'{name} 又被重启打断，停下了'**
  String botsEventCut(String name);

  /// No description provided for @botsAutomation.
  ///
  /// In zh, this message translates to:
  /// **'定时任务'**
  String get botsAutomation;

  /// No description provided for @botsAutomationText.
  ///
  /// In zh, this message translates to:
  /// **'定时任务：{text}'**
  String botsAutomationText(String text);

  /// No description provided for @botsOtherBot.
  ///
  /// In zh, this message translates to:
  /// **'其他 Bot'**
  String get botsOtherBot;

  /// No description provided for @botsMessageFrom.
  ///
  /// In zh, this message translates to:
  /// **'来自 {name} 的消息'**
  String botsMessageFrom(String name);

  /// No description provided for @botsEventReplied.
  ///
  /// In zh, this message translates to:
  /// **'{name} 回复了'**
  String botsEventReplied(String name);

  /// No description provided for @botsGroupReplied.
  ///
  /// In zh, this message translates to:
  /// **'群里有了回复'**
  String get botsGroupReplied;

  /// No description provided for @botsNamedGroupReplied.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」里有了回复'**
  String botsNamedGroupReplied(String name);

  /// No description provided for @botsEventCalledStop.
  ///
  /// In zh, this message translates to:
  /// **'{name} 叫停了工作'**
  String botsEventCalledStop(String name);

  /// No description provided for @botsChooseMember.
  ///
  /// In zh, this message translates to:
  /// **'选择成员'**
  String get botsChooseMember;

  /// No description provided for @botsMentionMember.
  ///
  /// In zh, this message translates to:
  /// **'提到成员'**
  String get botsMentionMember;

  /// No description provided for @botsRelayUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'经中转连接时用不了 Bot'**
  String get botsRelayUnavailable;

  /// No description provided for @botsUseSsh.
  ///
  /// In zh, this message translates to:
  /// **'用 SSH 连接这台电脑即可使用'**
  String get botsUseSsh;

  /// No description provided for @botsTeamLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取 Bot 团队'**
  String get botsTeamLoadFailed;

  /// No description provided for @botsBotCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个 Bot'**
  String botsBotCount(int count);

  /// No description provided for @botsRoomCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个群聊'**
  String botsRoomCount(int count);

  /// No description provided for @botsNewBot.
  ///
  /// In zh, this message translates to:
  /// **'新建 Bot'**
  String get botsNewBot;

  /// No description provided for @botsGroupChat.
  ///
  /// In zh, this message translates to:
  /// **'群聊'**
  String get botsGroupChat;

  /// No description provided for @botsNewGroup.
  ///
  /// In zh, this message translates to:
  /// **'新建群聊'**
  String get botsNewGroup;

  /// No description provided for @botsDuplicateCreated.
  ///
  /// In zh, this message translates to:
  /// **'已复制，稍后会出现在列表中。'**
  String get botsDuplicateCreated;

  /// No description provided for @botsDuplicate.
  ///
  /// In zh, this message translates to:
  /// **'复制 Bot'**
  String get botsDuplicate;

  /// No description provided for @botsDuplicateHint.
  ///
  /// In zh, this message translates to:
  /// **'沿用设置，对话与记忆从头开始'**
  String get botsDuplicateHint;

  /// No description provided for @botsDuplicateNamed.
  ///
  /// In zh, this message translates to:
  /// **'复制 {name}？'**
  String botsDuplicateNamed(String name);

  /// No description provided for @botsDuplicateBody.
  ///
  /// In zh, this message translates to:
  /// **'新 Bot 沿用职责、指令和模型设置，对话与个人记忆从头开始，名称由主机分配。模型可用时，它会先发送一句问候。'**
  String get botsDuplicateBody;

  /// No description provided for @botsChooseModelStart.
  ///
  /// In zh, this message translates to:
  /// **'选一个模型开始'**
  String get botsChooseModelStart;

  /// No description provided for @botsNoChats.
  ///
  /// In zh, this message translates to:
  /// **'还没有对话'**
  String get botsNoChats;

  /// No description provided for @botsUnreadCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条未读'**
  String botsUnreadCount(int count);

  /// No description provided for @botsMainTag.
  ///
  /// In zh, this message translates to:
  /// **'主'**
  String get botsMainTag;

  /// No description provided for @botsMemberNeedsApproval.
  ///
  /// In zh, this message translates to:
  /// **'有成员等你批准'**
  String get botsMemberNeedsApproval;

  /// No description provided for @botsNamedWorking.
  ///
  /// In zh, this message translates to:
  /// **'{name} 正在干活'**
  String botsNamedWorking(String name);

  /// No description provided for @botsNamesWorking.
  ///
  /// In zh, this message translates to:
  /// **'{names} 正在干活'**
  String botsNamesWorking(String names);

  /// No description provided for @botsMemberCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 位成员'**
  String botsMemberCount(int count);

  /// No description provided for @botsUpdateRequired.
  ///
  /// In zh, this message translates to:
  /// **'DS Bot 需要更新'**
  String get botsUpdateRequired;

  /// No description provided for @botsInstall.
  ///
  /// In zh, this message translates to:
  /// **'安装 DS Bot'**
  String get botsInstall;

  /// No description provided for @botsUpdateForPhone.
  ///
  /// In zh, this message translates to:
  /// **'新版才能在手机上用'**
  String get botsUpdateForPhone;

  /// No description provided for @botsInstallDescription.
  ///
  /// In zh, this message translates to:
  /// **'一组长期在线的 Bot，各有记忆和分工'**
  String get botsInstallDescription;

  /// No description provided for @botsInstallOnHost.
  ///
  /// In zh, this message translates to:
  /// **'在{host}上装好后就能用'**
  String botsInstallOnHost(String host);

  /// No description provided for @botsRunsOnHost.
  ///
  /// In zh, this message translates to:
  /// **'在{host}上运行'**
  String botsRunsOnHost(String host);

  /// No description provided for @botsInstalling.
  ///
  /// In zh, this message translates to:
  /// **'正在安装'**
  String get botsInstalling;

  /// No description provided for @botsMemory.
  ///
  /// In zh, this message translates to:
  /// **'记忆'**
  String get botsMemory;

  /// No description provided for @botsEditMemory.
  ///
  /// In zh, this message translates to:
  /// **'编辑记忆'**
  String get botsEditMemory;

  /// No description provided for @botsAddMemory.
  ///
  /// In zh, this message translates to:
  /// **'添加记忆'**
  String get botsAddMemory;

  /// No description provided for @botsMemoryReplyExample.
  ///
  /// In zh, this message translates to:
  /// **'比如：回复尽量简短'**
  String get botsMemoryReplyExample;

  /// No description provided for @botsMemoryDraftExample.
  ///
  /// In zh, this message translates to:
  /// **'比如：周五前交初稿'**
  String get botsMemoryDraftExample;

  /// No description provided for @botsMemoryCount.
  ///
  /// In zh, this message translates to:
  /// **'记忆 · {count}'**
  String botsMemoryCount(int count);

  /// No description provided for @botsMemoryReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取记忆'**
  String get botsMemoryReadFailed;

  /// No description provided for @botsSummary.
  ///
  /// In zh, this message translates to:
  /// **'概要'**
  String get botsSummary;

  /// No description provided for @botsNoMemory.
  ///
  /// In zh, this message translates to:
  /// **'还没有记忆'**
  String get botsNoMemory;

  /// No description provided for @botsTeam.
  ///
  /// In zh, this message translates to:
  /// **'团队'**
  String get botsTeam;

  /// No description provided for @botsSelf.
  ///
  /// In zh, this message translates to:
  /// **'自己'**
  String get botsSelf;

  /// No description provided for @botsWrittenByYou.
  ///
  /// In zh, this message translates to:
  /// **'你写的'**
  String get botsWrittenByYou;

  /// No description provided for @botsNameRequired.
  ///
  /// In zh, this message translates to:
  /// **'起个名字'**
  String get botsNameRequired;

  /// No description provided for @botsRoleHint.
  ///
  /// In zh, this message translates to:
  /// **'一句话说它是做什么的'**
  String get botsRoleHint;

  /// No description provided for @botsNewInstructionsHint.
  ///
  /// In zh, this message translates to:
  /// **'它该怎么做事，有什么要注意的'**
  String get botsNewInstructionsHint;

  /// No description provided for @botsAppearance.
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get botsAppearance;

  /// No description provided for @botsCreating.
  ///
  /// In zh, this message translates to:
  /// **'正在创建'**
  String get botsCreating;

  /// No description provided for @botsGroupNameOptional.
  ///
  /// In zh, this message translates to:
  /// **'群名（可不填）'**
  String get botsGroupNameOptional;

  /// No description provided for @botsMembersSelected.
  ///
  /// In zh, this message translates to:
  /// **'成员 · 已选 {count}'**
  String botsMembersSelected(int count);

  /// No description provided for @botsPickTwoBots.
  ///
  /// In zh, this message translates to:
  /// **'至少选两个 Bot'**
  String get botsPickTwoBots;

  /// No description provided for @botsFullText.
  ///
  /// In zh, this message translates to:
  /// **'全文'**
  String get botsFullText;

  /// No description provided for @botsTextPartial.
  ///
  /// In zh, this message translates to:
  /// **'仅显示前 {count} 个字符'**
  String botsTextPartial(String count);

  /// No description provided for @botsTextCompletenessUnknown.
  ///
  /// In zh, this message translates to:
  /// **'无法确认是否为完整内容'**
  String get botsTextCompletenessUnknown;

  /// No description provided for @botsRoomGone.
  ///
  /// In zh, this message translates to:
  /// **'这个群聊已不在'**
  String get botsRoomGone;

  /// No description provided for @botsNamedSpeaking.
  ///
  /// In zh, this message translates to:
  /// **'{name} 正在发言'**
  String botsNamedSpeaking(String name);

  /// No description provided for @botsNamedActivity.
  ///
  /// In zh, this message translates to:
  /// **'{name} {activity}'**
  String botsNamedActivity(String name, String activity);

  /// No description provided for @botsWorking.
  ///
  /// In zh, this message translates to:
  /// **'正在干活'**
  String get botsWorking;

  /// No description provided for @botsDiscussing.
  ///
  /// In zh, this message translates to:
  /// **'正在讨论'**
  String get botsDiscussing;

  /// No description provided for @botsTyping.
  ///
  /// In zh, this message translates to:
  /// **'正在输入'**
  String get botsTyping;

  /// No description provided for @botsGroupComposerHint.
  ///
  /// In zh, this message translates to:
  /// **'给大家发消息…'**
  String get botsGroupComposerHint;

  /// No description provided for @botsDecline.
  ///
  /// In zh, this message translates to:
  /// **'拒绝'**
  String get botsDecline;

  /// No description provided for @botsAllowOnce.
  ///
  /// In zh, this message translates to:
  /// **'允许本次'**
  String get botsAllowOnce;

  /// No description provided for @botsPrivateChat.
  ///
  /// In zh, this message translates to:
  /// **'私聊'**
  String get botsPrivateChat;

  /// No description provided for @botsSetAdmin.
  ///
  /// In zh, this message translates to:
  /// **'设为管理员'**
  String get botsSetAdmin;

  /// No description provided for @botsRemoveMember.
  ///
  /// In zh, this message translates to:
  /// **'移出群聊'**
  String get botsRemoveMember;

  /// No description provided for @botsDeleteRoomBody.
  ///
  /// In zh, this message translates to:
  /// **'群里的记录还在，群记忆会移到归档里。'**
  String get botsDeleteRoomBody;

  /// No description provided for @botsNamedAdmin.
  ///
  /// In zh, this message translates to:
  /// **'管理员 {name}'**
  String botsNamedAdmin(String name);

  /// No description provided for @botsRoomWorkingCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 位在干活'**
  String botsRoomWorkingCount(int count);

  /// No description provided for @botsMembersCountTitle.
  ///
  /// In zh, this message translates to:
  /// **'成员 · {count}'**
  String botsMembersCountTitle(int count);

  /// No description provided for @botsStopMember.
  ///
  /// In zh, this message translates to:
  /// **'停下'**
  String get botsStopMember;

  /// No description provided for @botsAddMember.
  ///
  /// In zh, this message translates to:
  /// **'添加成员'**
  String get botsAddMember;

  /// No description provided for @botsWhoAnswers.
  ///
  /// In zh, this message translates to:
  /// **'谁先回答'**
  String get botsWhoAnswers;

  /// No description provided for @botsAdminFirst.
  ///
  /// In zh, this message translates to:
  /// **'管理员先答'**
  String get botsAdminFirst;

  /// No description provided for @botsEveryoneInTurn.
  ///
  /// In zh, this message translates to:
  /// **'全员轮流'**
  String get botsEveryoneInTurn;

  /// No description provided for @botsGroupName.
  ///
  /// In zh, this message translates to:
  /// **'群名'**
  String get botsGroupName;

  /// No description provided for @botsGroupNotice.
  ///
  /// In zh, this message translates to:
  /// **'群公告'**
  String get botsGroupNotice;

  /// No description provided for @botsGroupNoticeHint.
  ///
  /// In zh, this message translates to:
  /// **'每个成员发言前都会看到'**
  String get botsGroupNoticeHint;

  /// No description provided for @botsDeleteGroup.
  ///
  /// In zh, this message translates to:
  /// **'删除群聊'**
  String get botsDeleteGroup;

  /// No description provided for @botsDiscardTitle.
  ///
  /// In zh, this message translates to:
  /// **'放弃修改？'**
  String get botsDiscardTitle;

  /// No description provided for @botsKeepEditing.
  ///
  /// In zh, this message translates to:
  /// **'继续编辑'**
  String get botsKeepEditing;

  /// No description provided for @botsDiscard.
  ///
  /// In zh, this message translates to:
  /// **'放弃'**
  String get botsDiscard;

  /// No description provided for @botsProgress.
  ///
  /// In zh, this message translates to:
  /// **'进度'**
  String get botsProgress;

  /// No description provided for @botsGlyphRun.
  ///
  /// In zh, this message translates to:
  /// **'运行'**
  String get botsGlyphRun;

  /// No description provided for @botsGlyphJobOutput.
  ///
  /// In zh, this message translates to:
  /// **'查看后台任务'**
  String get botsGlyphJobOutput;

  /// No description provided for @botsGlyphJobs.
  ///
  /// In zh, this message translates to:
  /// **'后台任务'**
  String get botsGlyphJobs;

  /// No description provided for @botsGlyphStopJob.
  ///
  /// In zh, this message translates to:
  /// **'停止后台任务'**
  String get botsGlyphStopJob;

  /// No description provided for @botsGlyphRead.
  ///
  /// In zh, this message translates to:
  /// **'读取'**
  String get botsGlyphRead;

  /// No description provided for @botsGlyphImage.
  ///
  /// In zh, this message translates to:
  /// **'查看图片'**
  String get botsGlyphImage;

  /// No description provided for @botsGlyphDeliver.
  ///
  /// In zh, this message translates to:
  /// **'交付文件'**
  String get botsGlyphDeliver;

  /// No description provided for @botsGlyphWrite.
  ///
  /// In zh, this message translates to:
  /// **'写入'**
  String get botsGlyphWrite;

  /// No description provided for @botsGlyphSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get botsGlyphSearch;

  /// No description provided for @botsGlyphFindFiles.
  ///
  /// In zh, this message translates to:
  /// **'查找文件'**
  String get botsGlyphFindFiles;

  /// No description provided for @botsGlyphOpenWeb.
  ///
  /// In zh, this message translates to:
  /// **'打开网页'**
  String get botsGlyphOpenWeb;

  /// No description provided for @botsGlyphMessageAgent.
  ///
  /// In zh, this message translates to:
  /// **'发消息给子代理'**
  String get botsGlyphMessageAgent;

  /// No description provided for @botsGlyphInterruptAgent.
  ///
  /// In zh, this message translates to:
  /// **'打断子代理'**
  String get botsGlyphInterruptAgent;

  /// No description provided for @botsGlyphListModels.
  ///
  /// In zh, this message translates to:
  /// **'列出子代理模型'**
  String get botsGlyphListModels;

  /// No description provided for @botsGlyphWorkflow.
  ///
  /// In zh, this message translates to:
  /// **'工作流'**
  String get botsGlyphWorkflow;

  /// No description provided for @botsGlyphLoop.
  ///
  /// In zh, this message translates to:
  /// **'循环任务'**
  String get botsGlyphLoop;

  /// No description provided for @botsGlyphSkill.
  ///
  /// In zh, this message translates to:
  /// **'使用技能'**
  String get botsGlyphSkill;

  /// No description provided for @botsGlyphTodo.
  ///
  /// In zh, this message translates to:
  /// **'更新待办'**
  String get botsGlyphTodo;

  /// No description provided for @botsGlyphSetGoal.
  ///
  /// In zh, this message translates to:
  /// **'设定目标'**
  String get botsGlyphSetGoal;

  /// No description provided for @botsGlyphViewGoal.
  ///
  /// In zh, this message translates to:
  /// **'查看目标'**
  String get botsGlyphViewGoal;

  /// No description provided for @botsGlyphUpdateGoal.
  ///
  /// In zh, this message translates to:
  /// **'更新目标'**
  String get botsGlyphUpdateGoal;

  /// No description provided for @botsGlyphAsk.
  ///
  /// In zh, this message translates to:
  /// **'提问'**
  String get botsGlyphAsk;

  /// No description provided for @botsCommunityEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂时没有内容'**
  String get botsCommunityEmpty;

  /// No description provided for @botsCommunityGroups.
  ///
  /// In zh, this message translates to:
  /// **'交流群'**
  String get botsCommunityGroups;

  /// No description provided for @botsCommunity.
  ///
  /// In zh, this message translates to:
  /// **'社区'**
  String get botsCommunity;

  /// No description provided for @botsForum.
  ///
  /// In zh, this message translates to:
  /// **'论坛'**
  String get botsForum;

  /// No description provided for @botsForumSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'提问、分享、找同好'**
  String get botsForumSubtitle;

  /// No description provided for @botsProjectHome.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 项目主页'**
  String get botsProjectHome;

  /// No description provided for @botsOpenSource.
  ///
  /// In zh, this message translates to:
  /// **'开源项目'**
  String get botsOpenSource;

  /// No description provided for @botsPluginCatalogFailed.
  ///
  /// In zh, this message translates to:
  /// **'插件目录没打开'**
  String get botsPluginCatalogFailed;

  /// No description provided for @botsTapRetry.
  ///
  /// In zh, this message translates to:
  /// **'点一下重试'**
  String get botsTapRetry;

  /// No description provided for @botsFeaturedPlugins.
  ///
  /// In zh, this message translates to:
  /// **'精选插件'**
  String get botsFeaturedPlugins;

  /// No description provided for @botsPluginSource.
  ///
  /// In zh, this message translates to:
  /// **'插件信息来自 dshfind'**
  String get botsPluginSource;

  /// No description provided for @botsPromptIdeas.
  ///
  /// In zh, this message translates to:
  /// **'玩法'**
  String get botsPromptIdeas;

  /// No description provided for @botsUpdates.
  ///
  /// In zh, this message translates to:
  /// **'更新动态'**
  String get botsUpdates;

  /// No description provided for @botsLink.
  ///
  /// In zh, this message translates to:
  /// **'链接'**
  String get botsLink;

  /// No description provided for @botsLinkOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开 {host}'**
  String botsLinkOpenFailed(String host);

  /// No description provided for @botsYearMonth.
  ///
  /// In zh, this message translates to:
  /// **'{year}年{month}月'**
  String botsYearMonth(int year, String month);

  /// No description provided for @botsCopyGroupNumber.
  ///
  /// In zh, this message translates to:
  /// **'复制群号'**
  String get botsCopyGroupNumber;

  /// No description provided for @botsQrCodeLabel.
  ///
  /// In zh, this message translates to:
  /// **'{title}二维码'**
  String botsQrCodeLabel(String title);

  /// No description provided for @botsFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get botsFiles;

  /// No description provided for @botsEmptyCell.
  ///
  /// In zh, this message translates to:
  /// **'（空）'**
  String get botsEmptyCell;

  /// No description provided for @botsYesterdayTime.
  ///
  /// In zh, this message translates to:
  /// **'昨天 {time}'**
  String botsYesterdayTime(String time);

  /// No description provided for @botsOutsideWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'不在工作区里'**
  String get botsOutsideWorkspace;

  /// No description provided for @botsNotFolder.
  ///
  /// In zh, this message translates to:
  /// **'这不是文件夹'**
  String get botsNotFolder;

  /// No description provided for @botsChatNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个对话'**
  String get botsChatNotFound;

  /// No description provided for @botsBrowseUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这个连接不支持浏览文件'**
  String get botsBrowseUnsupported;

  /// No description provided for @botsWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'工作区'**
  String get botsWorkspace;

  /// No description provided for @botsSearchFiles.
  ///
  /// In zh, this message translates to:
  /// **'搜索文件'**
  String get botsSearchFiles;

  /// No description provided for @botsGoUp.
  ///
  /// In zh, this message translates to:
  /// **'回到上一级'**
  String get botsGoUp;

  /// No description provided for @botsEmptyFolder.
  ///
  /// In zh, this message translates to:
  /// **'空文件夹'**
  String get botsEmptyFolder;

  /// No description provided for @botsFileCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个文件'**
  String botsFileCount(int count);

  /// No description provided for @botsTruncatedItems.
  ///
  /// In zh, this message translates to:
  /// **'只列出了前 {count} 项'**
  String botsTruncatedItems(int count);

  /// No description provided for @botsMoreActions.
  ///
  /// In zh, this message translates to:
  /// **'更多操作'**
  String get botsMoreActions;

  /// No description provided for @botsSearchFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能搜索'**
  String get botsSearchFailed;

  /// No description provided for @botsNoResults.
  ///
  /// In zh, this message translates to:
  /// **'没有找到'**
  String get botsNoResults;

  /// No description provided for @botsCopyPath.
  ///
  /// In zh, this message translates to:
  /// **'复制路径'**
  String get botsCopyPath;

  /// No description provided for @botsPetOutsideApp.
  ///
  /// In zh, this message translates to:
  /// **'App 外显示'**
  String get botsPetOutsideApp;

  /// No description provided for @botsPetNotAuthorized.
  ///
  /// In zh, this message translates to:
  /// **'未授权'**
  String get botsPetNotAuthorized;

  /// No description provided for @botsPetDisplayWhen.
  ///
  /// In zh, this message translates to:
  /// **'显示时机'**
  String get botsPetDisplayWhen;

  /// No description provided for @botsPetWhenActive.
  ///
  /// In zh, this message translates to:
  /// **'有事时显示'**
  String get botsPetWhenActive;

  /// No description provided for @botsPetAlways.
  ///
  /// In zh, this message translates to:
  /// **'一直显示'**
  String get botsPetAlways;

  /// No description provided for @botsPetSwitchDisabled.
  ///
  /// In zh, this message translates to:
  /// **'开关点不动'**
  String get botsPetSwitchDisabled;

  /// No description provided for @botsPetRestrictedSettings.
  ///
  /// In zh, this message translates to:
  /// **'允许受限制的设置'**
  String get botsPetRestrictedSettings;

  /// No description provided for @botsPetHiddenToday.
  ///
  /// In zh, this message translates to:
  /// **'今天不再显示'**
  String get botsPetHiddenToday;

  /// No description provided for @botsPetRestore.
  ///
  /// In zh, this message translates to:
  /// **'恢复'**
  String get botsPetRestore;

  /// No description provided for @botsPetChange.
  ///
  /// In zh, this message translates to:
  /// **'换宠物'**
  String get botsPetChange;

  /// No description provided for @botsPetHideHour.
  ///
  /// In zh, this message translates to:
  /// **'藏起来 1 小时'**
  String get botsPetHideHour;

  /// No description provided for @botsPetSettings.
  ///
  /// In zh, this message translates to:
  /// **'宠物设置'**
  String get botsPetSettings;

  /// No description provided for @botsPetDeepy.
  ///
  /// In zh, this message translates to:
  /// **'Deepy 小鲸鱼'**
  String get botsPetDeepy;

  /// No description provided for @botsPetWhaleGirl.
  ///
  /// In zh, this message translates to:
  /// **'鲸娘'**
  String get botsPetWhaleGirl;

  /// No description provided for @botsPetNone.
  ///
  /// In zh, this message translates to:
  /// **'不显示'**
  String get botsPetNone;

  /// No description provided for @botsPets.
  ///
  /// In zh, this message translates to:
  /// **'宠物'**
  String get botsPets;

  /// No description provided for @botsPetSource.
  ///
  /// In zh, this message translates to:
  /// **'来自 DSH-TUI'**
  String get botsPetSource;

  /// No description provided for @botsPetSize.
  ///
  /// In zh, this message translates to:
  /// **'大小'**
  String get botsPetSize;

  /// No description provided for @botsPetQuiet.
  ///
  /// In zh, this message translates to:
  /// **'安静模式'**
  String get botsPetQuiet;

  /// No description provided for @botsPetQuietSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'只做动作，不冒气泡'**
  String get botsPetQuietSubtitle;

  /// No description provided for @botsPetShowNow.
  ///
  /// In zh, this message translates to:
  /// **'立即显示'**
  String get botsPetShowNow;

  /// No description provided for @botsPetHiddenUntil.
  ///
  /// In zh, this message translates to:
  /// **'藏到 {time}'**
  String botsPetHiddenUntil(String time);

  /// No description provided for @botsKeyEsc.
  ///
  /// In zh, this message translates to:
  /// **'发送 Esc'**
  String get botsKeyEsc;

  /// No description provided for @botsKeyTab.
  ///
  /// In zh, this message translates to:
  /// **'发送 Tab'**
  String get botsKeyTab;

  /// No description provided for @botsKeyLeft.
  ///
  /// In zh, this message translates to:
  /// **'左'**
  String get botsKeyLeft;

  /// No description provided for @botsKeyUp.
  ///
  /// In zh, this message translates to:
  /// **'上'**
  String get botsKeyUp;

  /// No description provided for @botsKeyDown.
  ///
  /// In zh, this message translates to:
  /// **'下'**
  String get botsKeyDown;

  /// No description provided for @botsKeyRight.
  ///
  /// In zh, this message translates to:
  /// **'右'**
  String get botsKeyRight;

  /// No description provided for @botsKeyPipe.
  ///
  /// In zh, this message translates to:
  /// **'竖线'**
  String get botsKeyPipe;

  /// No description provided for @botsKeyTilde.
  ///
  /// In zh, this message translates to:
  /// **'波浪号'**
  String get botsKeyTilde;

  /// No description provided for @botsKeySlash.
  ///
  /// In zh, this message translates to:
  /// **'斜杠'**
  String get botsKeySlash;

  /// No description provided for @botsKeyDash.
  ///
  /// In zh, this message translates to:
  /// **'短横线'**
  String get botsKeyDash;

  /// No description provided for @botsTerminal.
  ///
  /// In zh, this message translates to:
  /// **'终端'**
  String get botsTerminal;

  /// No description provided for @botsTerminalRename.
  ///
  /// In zh, this message translates to:
  /// **'重命名终端'**
  String get botsTerminalRename;

  /// No description provided for @botsTerminalName.
  ///
  /// In zh, this message translates to:
  /// **'终端名称'**
  String get botsTerminalName;

  /// No description provided for @botsTerminalRenameFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能重命名'**
  String get botsTerminalRenameFailed;

  /// No description provided for @botsTerminalCloseNamed.
  ///
  /// In zh, this message translates to:
  /// **'关闭「{title}」？'**
  String botsTerminalCloseNamed(String title);

  /// No description provided for @botsTerminalCloseBody.
  ///
  /// In zh, this message translates to:
  /// **'里面的进程会结束'**
  String get botsTerminalCloseBody;

  /// No description provided for @botsTerminalUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这个连接用不了终端'**
  String get botsTerminalUnsupported;

  /// No description provided for @botsTerminalSupportedHosts.
  ///
  /// In zh, this message translates to:
  /// **'在本机或 SSH 主机上可用'**
  String get botsTerminalSupportedHosts;

  /// No description provided for @botsTerminalOpening.
  ///
  /// In zh, this message translates to:
  /// **'正在打开终端…'**
  String get botsTerminalOpening;

  /// No description provided for @botsTerminalNone.
  ///
  /// In zh, this message translates to:
  /// **'没有打开的终端'**
  String get botsTerminalNone;

  /// No description provided for @botsTerminalNew.
  ///
  /// In zh, this message translates to:
  /// **'新建终端'**
  String get botsTerminalNew;

  /// No description provided for @botsTerminalClose.
  ///
  /// In zh, this message translates to:
  /// **'关闭终端'**
  String get botsTerminalClose;

  /// No description provided for @botsTerminalChooseShell.
  ///
  /// In zh, this message translates to:
  /// **'选择 Shell'**
  String get botsTerminalChooseShell;

  /// No description provided for @botsTerminalShellFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取 Shell'**
  String get botsTerminalShellFailed;

  /// No description provided for @botsTerminalReading.
  ///
  /// In zh, this message translates to:
  /// **'正在读取…'**
  String get botsTerminalReading;

  /// No description provided for @botsTerminalDefaultShell.
  ///
  /// In zh, this message translates to:
  /// **'默认 Shell'**
  String get botsTerminalDefaultShell;

  /// No description provided for @botsTerminalOtherDevice.
  ///
  /// In zh, this message translates to:
  /// **'其他设备正在输入'**
  String get botsTerminalOtherDevice;

  /// No description provided for @botsTerminalTakeOver.
  ///
  /// In zh, this message translates to:
  /// **'接管'**
  String get botsTerminalTakeOver;

  /// No description provided for @botsTerminalStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在启动…'**
  String get botsTerminalStarting;

  /// No description provided for @botsTerminalConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接…'**
  String get botsTerminalConnecting;

  /// No description provided for @botsTerminalDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'连接已断开'**
  String get botsTerminalDisconnected;

  /// No description provided for @botsTerminalReconnect.
  ///
  /// In zh, this message translates to:
  /// **'重新连接'**
  String get botsTerminalReconnect;

  /// No description provided for @botsTerminalEnded.
  ///
  /// In zh, this message translates to:
  /// **'已结束'**
  String get botsTerminalEnded;

  /// No description provided for @botsTerminalExitCode.
  ///
  /// In zh, this message translates to:
  /// **'已结束 · 退出码 {code}'**
  String botsTerminalExitCode(int code);

  /// No description provided for @botsTerminalGone.
  ///
  /// In zh, this message translates to:
  /// **'这个终端已不在了'**
  String get botsTerminalGone;

  /// No description provided for @botsTerminalLimit.
  ///
  /// In zh, this message translates to:
  /// **'先关掉不用的终端'**
  String get botsTerminalLimit;

  /// No description provided for @botsToolWorkingRun.
  ///
  /// In zh, this message translates to:
  /// **'正在运行命令'**
  String get botsToolWorkingRun;

  /// No description provided for @botsToolApprovalRun.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想运行命令'**
  String botsToolApprovalRun(String name);

  /// No description provided for @botsToolWorkingRead.
  ///
  /// In zh, this message translates to:
  /// **'正在查看文件'**
  String get botsToolWorkingRead;

  /// No description provided for @botsToolApprovalRead.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想查看文件'**
  String botsToolApprovalRead(String name);

  /// No description provided for @botsToolWorkingEdit.
  ///
  /// In zh, this message translates to:
  /// **'正在修改文件'**
  String get botsToolWorkingEdit;

  /// No description provided for @botsToolApprovalEdit.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想修改文件'**
  String botsToolApprovalEdit(String name);

  /// No description provided for @botsToolWorkingSearch.
  ///
  /// In zh, this message translates to:
  /// **'正在联网搜索'**
  String get botsToolWorkingSearch;

  /// No description provided for @botsToolApprovalSearch.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想联网搜索'**
  String botsToolApprovalSearch(String name);

  /// No description provided for @botsToolWorkingBrowse.
  ///
  /// In zh, this message translates to:
  /// **'正在看网页'**
  String get botsToolWorkingBrowse;

  /// No description provided for @botsToolApprovalBrowse.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想看网页'**
  String botsToolApprovalBrowse(String name);

  /// No description provided for @botsToolWorkingMessage.
  ///
  /// In zh, this message translates to:
  /// **'正在联系其他 Bot'**
  String get botsToolWorkingMessage;

  /// No description provided for @botsToolApprovalMessage.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想联系其他 Bot'**
  String botsToolApprovalMessage(String name);

  /// No description provided for @botsToolWorkingGroup.
  ///
  /// In zh, this message translates to:
  /// **'正在在群里沟通'**
  String get botsToolWorkingGroup;

  /// No description provided for @botsToolApprovalGroup.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想在群里沟通'**
  String botsToolApprovalGroup(String name);

  /// No description provided for @botsToolWorkingMemory.
  ///
  /// In zh, this message translates to:
  /// **'正在整理记忆'**
  String get botsToolWorkingMemory;

  /// No description provided for @botsToolApprovalMemory.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想整理记忆'**
  String botsToolApprovalMemory(String name);

  /// No description provided for @botsToolWorkingRecall.
  ///
  /// In zh, this message translates to:
  /// **'正在翻看记录'**
  String get botsToolWorkingRecall;

  /// No description provided for @botsToolApprovalRecall.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想翻看记录'**
  String botsToolApprovalRecall(String name);

  /// No description provided for @botsToolWorkingTeam.
  ///
  /// In zh, this message translates to:
  /// **'正在安排团队'**
  String get botsToolWorkingTeam;

  /// No description provided for @botsToolApprovalTeam.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想安排团队'**
  String botsToolApprovalTeam(String name);

  /// No description provided for @botsToolWorkingAsk.
  ///
  /// In zh, this message translates to:
  /// **'正在准备问你'**
  String get botsToolWorkingAsk;

  /// No description provided for @botsToolApprovalAsk.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想准备问你'**
  String botsToolApprovalAsk(String name);

  /// No description provided for @botsToolWorkingWork.
  ///
  /// In zh, this message translates to:
  /// **'正在干活'**
  String get botsToolWorkingWork;

  /// No description provided for @botsToolApprovalWork.
  ///
  /// In zh, this message translates to:
  /// **'{name} 想干活'**
  String botsToolApprovalWork(String name);

  /// No description provided for @botsEveryone.
  ///
  /// In zh, this message translates to:
  /// **'所有人'**
  String get botsEveryone;

  /// No description provided for @botsActivelyRunning.
  ///
  /// In zh, this message translates to:
  /// **'正在运行'**
  String get botsActivelyRunning;

  /// No description provided for @botsListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'，'**
  String get botsListSeparator;

  /// No description provided for @botsNameSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get botsNameSeparator;

  /// No description provided for @botsGlyphSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get botsGlyphSubagent;

  /// No description provided for @botsGlyphWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get botsGlyphWebSearch;

  /// No description provided for @botsSenderPreview.
  ///
  /// In zh, this message translates to:
  /// **'{name}：{preview}'**
  String botsSenderPreview(String name, String preview);

  /// No description provided for @botsAgentSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{title}，{state}'**
  String botsAgentSemantics(String title, String state);

  /// No description provided for @botsViewMetric.
  ///
  /// In zh, this message translates to:
  /// **'{label}：{value}'**
  String botsViewMetric(Object label, Object value);

  /// No description provided for @botsEffortXhigh.
  ///
  /// In zh, this message translates to:
  /// **'超高'**
  String get botsEffortXhigh;

  /// No description provided for @botsRelayLimit.
  ///
  /// In zh, this message translates to:
  /// **'Bot 互叫上限'**
  String get botsRelayLimit;

  /// No description provided for @botsRelayLimitHint.
  ///
  /// In zh, this message translates to:
  /// **'从你最近一次发言起，Bot 之间互叫达到此次数后暂停。填写 1–200 的整数，留空使用默认值。'**
  String get botsRelayLimitHint;

  /// No description provided for @botsRelayLimitDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认：{count}'**
  String botsRelayLimitDefault(int count);

  /// No description provided for @botsRelayLimitInvalid.
  ///
  /// In zh, this message translates to:
  /// **'请填写 1–200 的整数'**
  String get botsRelayLimitInvalid;

  /// No description provided for @botsRelayLimitRestore.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认'**
  String get botsRelayLimitRestore;

  /// No description provided for @botsRelayLimitConnectionChanged.
  ///
  /// In zh, this message translates to:
  /// **'连接已变化，请关闭后重新打开。'**
  String get botsRelayLimitConnectionChanged;

  /// No description provided for @botsMobileUnsupportedTitle.
  ///
  /// In zh, this message translates to:
  /// **'DS Bot 暂不支持手机端'**
  String get botsMobileUnsupportedTitle;

  /// No description provided for @botsMobileApiRequired.
  ///
  /// In zh, this message translates to:
  /// **'可先在网页版中使用'**
  String get botsMobileApiRequired;

  /// No description provided for @botsMobileApiMissing.
  ///
  /// In zh, this message translates to:
  /// **'手机端暂不支持，可先在网页版中使用'**
  String get botsMobileApiMissing;

  /// No description provided for @botsCreationConnectionChanged.
  ///
  /// In zh, this message translates to:
  /// **'连接已变化，请重新打开创建页面后再操作。'**
  String get botsCreationConnectionChanged;

  /// No description provided for @brandXiaomi.
  ///
  /// In zh, this message translates to:
  /// **'小米 / Redmi'**
  String get brandXiaomi;

  /// No description provided for @brandHuawei.
  ///
  /// In zh, this message translates to:
  /// **'华为'**
  String get brandHuawei;

  /// No description provided for @brandHonor.
  ///
  /// In zh, this message translates to:
  /// **'荣耀'**
  String get brandHonor;

  /// No description provided for @brandOppo.
  ///
  /// In zh, this message translates to:
  /// **'OPPO / 一加 / realme'**
  String get brandOppo;

  /// No description provided for @brandSamsung.
  ///
  /// In zh, this message translates to:
  /// **'三星'**
  String get brandSamsung;

  /// No description provided for @brandVivoOs.
  ///
  /// In zh, this message translates to:
  /// **'vivo / iQOO（OriginOS）'**
  String get brandVivoOs;

  /// No description provided for @brandXiaomiOs.
  ///
  /// In zh, this message translates to:
  /// **'小米 / Redmi（HyperOS、MIUI）'**
  String get brandXiaomiOs;

  /// No description provided for @brandHuaweiOs.
  ///
  /// In zh, this message translates to:
  /// **'华为 / 荣耀（HarmonyOS、MagicOS）'**
  String get brandHuaweiOs;

  /// No description provided for @brandOppoOs.
  ///
  /// In zh, this message translates to:
  /// **'OPPO / 一加 / realme（ColorOS）'**
  String get brandOppoOs;

  /// No description provided for @brandSamsungOs.
  ///
  /// In zh, this message translates to:
  /// **'三星（One UI）'**
  String get brandSamsungOs;

  /// No description provided for @brandZhihu.
  ///
  /// In zh, this message translates to:
  /// **'知乎'**
  String get brandZhihu;

  /// No description provided for @catalogCurrentChat.
  ///
  /// In zh, this message translates to:
  /// **'当前对话'**
  String get catalogCurrentChat;

  /// No description provided for @catalogChatDetails.
  ///
  /// In zh, this message translates to:
  /// **'对话详情'**
  String get catalogChatDetails;

  /// No description provided for @catalogChatDetailsSummary.
  ///
  /// In zh, this message translates to:
  /// **'轨迹、改动与进度'**
  String get catalogChatDetailsSummary;

  /// No description provided for @catalogArtifacts.
  ///
  /// In zh, this message translates to:
  /// **'产出的文件'**
  String get catalogArtifacts;

  /// No description provided for @catalogArtifactsSummary.
  ///
  /// In zh, this message translates to:
  /// **'预览、分享、保存'**
  String get catalogArtifactsSummary;

  /// No description provided for @catalogFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get catalogFiles;

  /// No description provided for @catalogFilesSummary.
  ///
  /// In zh, this message translates to:
  /// **'浏览与预览'**
  String get catalogFilesSummary;

  /// No description provided for @catalogTerminal.
  ///
  /// In zh, this message translates to:
  /// **'终端'**
  String get catalogTerminal;

  /// No description provided for @catalogTerminalSummary.
  ///
  /// In zh, this message translates to:
  /// **'工作区里的终端'**
  String get catalogTerminalSummary;

  /// No description provided for @catalogExport.
  ///
  /// In zh, this message translates to:
  /// **'导出对话日志'**
  String get catalogExport;

  /// No description provided for @catalogExportSummary.
  ///
  /// In zh, this message translates to:
  /// **'打包成 ZIP'**
  String get catalogExportSummary;

  /// No description provided for @catalogJobs.
  ///
  /// In zh, this message translates to:
  /// **'后台任务'**
  String get catalogJobs;

  /// No description provided for @catalogJobsSummary.
  ///
  /// In zh, this message translates to:
  /// **'查看输出、停止'**
  String get catalogJobsSummary;

  /// No description provided for @catalogPlanGoal.
  ///
  /// In zh, this message translates to:
  /// **'计划与目标'**
  String get catalogPlanGoal;

  /// No description provided for @catalogPlanGoalSummary.
  ///
  /// In zh, this message translates to:
  /// **'目标、计划与待办'**
  String get catalogPlanGoalSummary;

  /// No description provided for @catalogSkills.
  ///
  /// In zh, this message translates to:
  /// **'技能'**
  String get catalogSkills;

  /// No description provided for @catalogSkillsSummary.
  ///
  /// In zh, this message translates to:
  /// **'在对话里用技能'**
  String get catalogSkillsSummary;

  /// No description provided for @catalogSubagents.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get catalogSubagents;

  /// No description provided for @catalogSubagentsSummary.
  ///
  /// In zh, this message translates to:
  /// **'谱系与状态，点开接着聊'**
  String get catalogSubagentsSummary;

  /// No description provided for @catalogReference.
  ///
  /// In zh, this message translates to:
  /// **'引用文件和对话'**
  String get catalogReference;

  /// No description provided for @catalogReferenceSummary.
  ///
  /// In zh, this message translates to:
  /// **'在输入框用 @ 引用'**
  String get catalogReferenceSummary;

  /// No description provided for @catalogAutomationSection.
  ///
  /// In zh, this message translates to:
  /// **'自动化'**
  String get catalogAutomationSection;

  /// No description provided for @catalogSchedules.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务'**
  String get catalogSchedules;

  /// No description provided for @catalogSchedulesSummary.
  ///
  /// In zh, this message translates to:
  /// **'定时与周期任务'**
  String get catalogSchedulesSummary;

  /// No description provided for @catalogAgentModelsSection.
  ///
  /// In zh, this message translates to:
  /// **'Agent 与模型'**
  String get catalogAgentModelsSection;

  /// No description provided for @catalogPermission.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get catalogPermission;

  /// No description provided for @catalogPermissionSummary.
  ///
  /// In zh, this message translates to:
  /// **'执行前是否确认'**
  String get catalogPermissionSummary;

  /// No description provided for @catalogAgentPresets.
  ///
  /// In zh, this message translates to:
  /// **'Agent 预设'**
  String get catalogAgentPresets;

  /// No description provided for @catalogAgentPresetsSummary.
  ///
  /// In zh, this message translates to:
  /// **'新对话的工作方式'**
  String get catalogAgentPresetsSummary;

  /// No description provided for @catalogModels.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get catalogModels;

  /// No description provided for @catalogModelsSummary.
  ///
  /// In zh, this message translates to:
  /// **'订阅与自定义渠道'**
  String get catalogModelsSummary;

  /// No description provided for @catalogSubagentSettings.
  ///
  /// In zh, this message translates to:
  /// **'子代理设置'**
  String get catalogSubagentSettings;

  /// No description provided for @catalogSubagentSettingsSummary.
  ///
  /// In zh, this message translates to:
  /// **'层数、并行与模型'**
  String get catalogSubagentSettingsSummary;

  /// No description provided for @catalogAgentLoop.
  ///
  /// In zh, this message translates to:
  /// **'Agent 循环'**
  String get catalogAgentLoop;

  /// No description provided for @catalogAgentLoopSummary.
  ///
  /// In zh, this message translates to:
  /// **'工具并行上限'**
  String get catalogAgentLoopSummary;

  /// No description provided for @catalogShellSettings.
  ///
  /// In zh, this message translates to:
  /// **'命令执行'**
  String get catalogShellSettings;

  /// No description provided for @catalogShellSettingsSummary.
  ///
  /// In zh, this message translates to:
  /// **'超时与输出上限'**
  String get catalogShellSettingsSummary;

  /// No description provided for @catalogWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get catalogWebSearch;

  /// No description provided for @catalogWebSearchSummary.
  ///
  /// In zh, this message translates to:
  /// **'搜索服务与预算'**
  String get catalogWebSearchSummary;

  /// No description provided for @catalogPlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get catalogPlugins;

  /// No description provided for @catalogPluginsSummary.
  ///
  /// In zh, this message translates to:
  /// **'已安装与插件市场'**
  String get catalogPluginsSummary;

  /// No description provided for @catalogPluginInventory.
  ///
  /// In zh, this message translates to:
  /// **'插件清单'**
  String get catalogPluginInventory;

  /// No description provided for @catalogPluginInventorySummary.
  ///
  /// In zh, this message translates to:
  /// **'已加载的全部插件'**
  String get catalogPluginInventorySummary;

  /// No description provided for @catalogCordisSummary.
  ///
  /// In zh, this message translates to:
  /// **'插件创建的动态面板'**
  String get catalogCordisSummary;

  /// No description provided for @catalogAgentTeam.
  ///
  /// In zh, this message translates to:
  /// **'智能体团队'**
  String get catalogAgentTeam;

  /// No description provided for @catalogAgentTeamSummary.
  ///
  /// In zh, this message translates to:
  /// **'成员、任务板与消息'**
  String get catalogAgentTeamSummary;

  /// No description provided for @catalogCotTranslation.
  ///
  /// In zh, this message translates to:
  /// **'思考过程翻译'**
  String get catalogCotTranslation;

  /// No description provided for @catalogCotTranslationSummary.
  ///
  /// In zh, this message translates to:
  /// **'展开思考后点「翻译」'**
  String get catalogCotTranslationSummary;

  /// No description provided for @catalogVoiceInput.
  ///
  /// In zh, this message translates to:
  /// **'语音输入'**
  String get catalogVoiceInput;

  /// No description provided for @catalogVoiceInputSummary.
  ///
  /// In zh, this message translates to:
  /// **'输入框里的麦克风'**
  String get catalogVoiceInputSummary;

  /// No description provided for @catalogCommunitySharingSection.
  ///
  /// In zh, this message translates to:
  /// **'社区与分享'**
  String get catalogCommunitySharingSection;

  /// No description provided for @catalogForum.
  ///
  /// In zh, this message translates to:
  /// **'论坛'**
  String get catalogForum;

  /// No description provided for @catalogForumSummary.
  ///
  /// In zh, this message translates to:
  /// **'提问、分享、找同好'**
  String get catalogForumSummary;

  /// No description provided for @catalogCommunity.
  ///
  /// In zh, this message translates to:
  /// **'社区'**
  String get catalogCommunity;

  /// No description provided for @catalogCommunitySummary.
  ///
  /// In zh, this message translates to:
  /// **'精选与交流群'**
  String get catalogCommunitySummary;

  /// No description provided for @catalogBotSummary.
  ///
  /// In zh, this message translates to:
  /// **'Bot 团队与群聊'**
  String get catalogBotSummary;

  /// No description provided for @catalogShareProfile.
  ///
  /// In zh, this message translates to:
  /// **'分享配置'**
  String get catalogShareProfile;

  /// No description provided for @catalogShareProfileSummary.
  ///
  /// In zh, this message translates to:
  /// **'插件、设置与技能'**
  String get catalogShareProfileSummary;

  /// No description provided for @catalogHostsSettingsSection.
  ///
  /// In zh, this message translates to:
  /// **'主机与设置'**
  String get catalogHostsSettingsSection;

  /// No description provided for @catalogSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索对话'**
  String get catalogSearch;

  /// No description provided for @catalogSearchSummary.
  ///
  /// In zh, this message translates to:
  /// **'按标题和正文查找'**
  String get catalogSearchSummary;

  /// No description provided for @catalogNotifications.
  ///
  /// In zh, this message translates to:
  /// **'通知'**
  String get catalogNotifications;

  /// No description provided for @catalogNotificationsSummary.
  ///
  /// In zh, this message translates to:
  /// **'完成与待确认提醒'**
  String get catalogNotificationsSummary;

  /// No description provided for @catalogWorkspaces.
  ///
  /// In zh, this message translates to:
  /// **'工作区'**
  String get catalogWorkspaces;

  /// No description provided for @catalogWorkspacesSummary.
  ///
  /// In zh, this message translates to:
  /// **'添加与切换目录'**
  String get catalogWorkspacesSummary;

  /// No description provided for @catalogGeneral.
  ///
  /// In zh, this message translates to:
  /// **'通用设置'**
  String get catalogGeneral;

  /// No description provided for @catalogGeneralSummary.
  ///
  /// In zh, this message translates to:
  /// **'显示、发送与日志上传'**
  String get catalogGeneralSummary;

  /// No description provided for @catalogAccount.
  ///
  /// In zh, this message translates to:
  /// **'账号与余额'**
  String get catalogAccount;

  /// No description provided for @catalogAccountSummary.
  ///
  /// In zh, this message translates to:
  /// **'登录、余额与充值'**
  String get catalogAccountSummary;

  /// No description provided for @catalogRemoteSummary.
  ///
  /// In zh, this message translates to:
  /// **'连接电脑或服务器'**
  String get catalogRemoteSummary;

  /// No description provided for @catalogPhoneControl.
  ///
  /// In zh, this message translates to:
  /// **'手机操控'**
  String get catalogPhoneControl;

  /// No description provided for @catalogPhoneControlSummary.
  ///
  /// In zh, this message translates to:
  /// **'看屏幕、帮你点按'**
  String get catalogPhoneControlSummary;

  /// No description provided for @catalogEngine.
  ///
  /// In zh, this message translates to:
  /// **'本机引擎'**
  String get catalogEngine;

  /// No description provided for @catalogEngineSummary.
  ///
  /// In zh, this message translates to:
  /// **'本机引擎状态与日志'**
  String get catalogEngineSummary;

  /// No description provided for @catalogDiagnostics.
  ///
  /// In zh, this message translates to:
  /// **'诊断'**
  String get catalogDiagnostics;

  /// No description provided for @catalogDiagnosticsSummary.
  ///
  /// In zh, this message translates to:
  /// **'导出诊断包'**
  String get catalogDiagnosticsSummary;

  /// No description provided for @catalogWebSummary.
  ///
  /// In zh, this message translates to:
  /// **'DSH 官方界面'**
  String get catalogWebSummary;

  /// No description provided for @catalogPluginPanel.
  ///
  /// In zh, this message translates to:
  /// **'插件面板'**
  String get catalogPluginPanel;

  /// No description provided for @catalogHostPluginMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有这个插件'**
  String get catalogHostPluginMissing;

  /// No description provided for @catalogAllFeatures.
  ///
  /// In zh, this message translates to:
  /// **'全部功能'**
  String get catalogAllFeatures;

  /// No description provided for @catalogAllFeaturesSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'网页版的功能，也都在这里'**
  String get catalogAllFeaturesSubtitle;

  /// No description provided for @catalogOpenChatFirst.
  ///
  /// In zh, this message translates to:
  /// **'先打开一个对话'**
  String get catalogOpenChatFirst;

  /// No description provided for @catalogNoOpenChat.
  ///
  /// In zh, this message translates to:
  /// **'还没打开对话'**
  String get catalogNoOpenChat;

  /// No description provided for @catalogOpenChat.
  ///
  /// In zh, this message translates to:
  /// **'当前打开的对话'**
  String get catalogOpenChat;

  /// No description provided for @catalogOpenOrCreateChat.
  ///
  /// In zh, this message translates to:
  /// **'先在聊天里打开或新建一个'**
  String get catalogOpenOrCreateChat;

  /// No description provided for @catalogCordisHostClient.
  ///
  /// In zh, this message translates to:
  /// **'后台和界面'**
  String get catalogCordisHostClient;

  /// No description provided for @catalogCordisHostOnly.
  ///
  /// In zh, this message translates to:
  /// **'仅后台'**
  String get catalogCordisHostOnly;

  /// No description provided for @catalogCordisClientOnly.
  ///
  /// In zh, this message translates to:
  /// **'仅界面'**
  String get catalogCordisClientOnly;

  /// No description provided for @catalogCordisPluginGone.
  ///
  /// In zh, this message translates to:
  /// **'插件已经不在了'**
  String get catalogCordisPluginGone;

  /// No description provided for @catalogCordisStopFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能停止'**
  String get catalogCordisStopFailed;

  /// No description provided for @catalogCordisRemoveOne.
  ///
  /// In zh, this message translates to:
  /// **'会停止它并删除。'**
  String get catalogCordisRemoveOne;

  /// No description provided for @catalogCordisRemove.
  ///
  /// In zh, this message translates to:
  /// **'移除'**
  String get catalogCordisRemove;

  /// No description provided for @catalogCordisRemoved.
  ///
  /// In zh, this message translates to:
  /// **'已移除'**
  String get catalogCordisRemoved;

  /// No description provided for @catalogCordisRemoveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能移除'**
  String get catalogCordisRemoveFailed;

  /// No description provided for @catalogCordisChat.
  ///
  /// In zh, this message translates to:
  /// **'所属对话'**
  String get catalogCordisChat;

  /// No description provided for @catalogCordisMakeup.
  ///
  /// In zh, this message translates to:
  /// **'组成'**
  String get catalogCordisMakeup;

  /// No description provided for @catalogCordisStopping.
  ///
  /// In zh, this message translates to:
  /// **'正在停止…'**
  String get catalogCordisStopping;

  /// No description provided for @catalogCordisRemoving.
  ///
  /// In zh, this message translates to:
  /// **'正在移除…'**
  String get catalogCordisRemoving;

  /// No description provided for @catalogSeatGone.
  ///
  /// In zh, this message translates to:
  /// **'插件已不可用'**
  String get catalogSeatGone;

  /// No description provided for @catalogCordisRemoveTitle.
  ///
  /// In zh, this message translates to:
  /// **'移除「{name}」？'**
  String catalogCordisRemoveTitle(String name);

  /// No description provided for @catalogCordisRemoveVersions.
  ///
  /// In zh, this message translates to:
  /// **'会停止它，并删除全部 {versions} 个版本。'**
  String catalogCordisRemoveVersions(int versions);

  /// No description provided for @catalogCordisVersionCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String catalogCordisVersionCount(int count);

  /// No description provided for @catalogToolsSection.
  ///
  /// In zh, this message translates to:
  /// **'工具'**
  String get catalogToolsSection;

  /// No description provided for @catalogAllSettings.
  ///
  /// In zh, this message translates to:
  /// **'全部设置'**
  String get catalogAllSettings;

  /// No description provided for @chatBackgroundTaskNotice.
  ///
  /// In zh, this message translates to:
  /// **'后台任务通知'**
  String get chatBackgroundTaskNotice;

  /// No description provided for @chatBackgroundTaskMessage.
  ///
  /// In zh, this message translates to:
  /// **'后台任务消息'**
  String get chatBackgroundTaskMessage;

  /// No description provided for @chatDeclineQuestion.
  ///
  /// In zh, this message translates to:
  /// **'不回答'**
  String get chatDeclineQuestion;

  /// No description provided for @chatChats.
  ///
  /// In zh, this message translates to:
  /// **'对话列表'**
  String get chatChats;

  /// No description provided for @chatViewChatDetails.
  ///
  /// In zh, this message translates to:
  /// **'查看对话详情'**
  String get chatViewChatDetails;

  /// No description provided for @chatUnsent.
  ///
  /// In zh, this message translates to:
  /// **'未发送'**
  String get chatUnsent;

  /// No description provided for @chatSteerNextStep.
  ///
  /// In zh, this message translates to:
  /// **'插话 · 下一步生效'**
  String get chatSteerNextStep;

  /// No description provided for @chatQueuedAfterTurn.
  ///
  /// In zh, this message translates to:
  /// **'排队中 · 本轮结束后发送'**
  String get chatQueuedAfterTurn;

  /// No description provided for @chatSteering.
  ///
  /// In zh, this message translates to:
  /// **'插话中'**
  String get chatSteering;

  /// No description provided for @chatQueued.
  ///
  /// In zh, this message translates to:
  /// **'排队中'**
  String get chatQueued;

  /// No description provided for @chatStoppingTurn.
  ///
  /// In zh, this message translates to:
  /// **'正在停止本轮'**
  String get chatStoppingTurn;

  /// No description provided for @chatSending.
  ///
  /// In zh, this message translates to:
  /// **'发送中'**
  String get chatSending;

  /// No description provided for @chatSendNow.
  ///
  /// In zh, this message translates to:
  /// **'立即发送'**
  String get chatSendNow;

  /// No description provided for @chatSwitchToSteer.
  ///
  /// In zh, this message translates to:
  /// **'改为插话'**
  String get chatSwitchToSteer;

  /// No description provided for @chatWithdraw.
  ///
  /// In zh, this message translates to:
  /// **'撤回'**
  String get chatWithdraw;

  /// No description provided for @chatContinuedInNewChat.
  ///
  /// In zh, this message translates to:
  /// **'已在新对话中继续'**
  String get chatContinuedInNewChat;

  /// No description provided for @chatReadOriginalImageFailed.
  ///
  /// In zh, this message translates to:
  /// **'读取原图失败，请重试'**
  String get chatReadOriginalImageFailed;

  /// No description provided for @chatRegenerateFailed.
  ///
  /// In zh, this message translates to:
  /// **'重新回答失败'**
  String get chatRegenerateFailed;

  /// No description provided for @chatRegeneratedInNewChat.
  ///
  /// In zh, this message translates to:
  /// **'已在新对话中重新回答'**
  String get chatRegeneratedInNewChat;

  /// No description provided for @chatOpenedInNewChatReattach.
  ///
  /// In zh, this message translates to:
  /// **'已在新对话中打开，附件需重新添加'**
  String get chatOpenedInNewChatReattach;

  /// No description provided for @chatOpenedInNewChat.
  ///
  /// In zh, this message translates to:
  /// **'已在新对话中打开'**
  String get chatOpenedInNewChat;

  /// No description provided for @chatForkQueuedLeft.
  ///
  /// In zh, this message translates to:
  /// **'{message}（{left} 条排队消息未能带走）'**
  String chatForkQueuedLeft(String message, int left);

  /// No description provided for @chatReturnToOriginal.
  ///
  /// In zh, this message translates to:
  /// **'返回原对话'**
  String get chatReturnToOriginal;

  /// No description provided for @chatWaitingCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项待确认'**
  String chatWaitingCount(int count);

  /// No description provided for @chatWaitingBackToBottom.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项待确认，回到底部'**
  String chatWaitingBackToBottom(int count);

  /// No description provided for @chatBackToBottom.
  ///
  /// In zh, this message translates to:
  /// **'回到底部'**
  String get chatBackToBottom;

  /// No description provided for @chatCreateFailed.
  ///
  /// In zh, this message translates to:
  /// **'新建对话失败'**
  String get chatCreateFailed;

  /// No description provided for @chatSendMode.
  ///
  /// In zh, this message translates to:
  /// **'发送方式'**
  String get chatSendMode;

  /// No description provided for @chatSteer.
  ///
  /// In zh, this message translates to:
  /// **'插话'**
  String get chatSteer;

  /// No description provided for @chatSteerHint.
  ///
  /// In zh, this message translates to:
  /// **'不打断，AI 下一步会看到'**
  String get chatSteerHint;

  /// No description provided for @chatInterruptAndSend.
  ///
  /// In zh, this message translates to:
  /// **'中断并发送'**
  String get chatInterruptAndSend;

  /// No description provided for @chatInterruptHint.
  ///
  /// In zh, this message translates to:
  /// **'停下当前任务，先处理这条'**
  String get chatInterruptHint;

  /// No description provided for @chatQueue.
  ///
  /// In zh, this message translates to:
  /// **'排队'**
  String get chatQueue;

  /// No description provided for @chatQueueHint.
  ///
  /// In zh, this message translates to:
  /// **'本轮结束后发送'**
  String get chatQueueHint;

  /// No description provided for @chatWithdrawnEditable.
  ///
  /// In zh, this message translates to:
  /// **'已撤回，可修改后再发'**
  String get chatWithdrawnEditable;

  /// No description provided for @chatWithdrawn.
  ///
  /// In zh, this message translates to:
  /// **'已撤回'**
  String get chatWithdrawn;

  /// No description provided for @chatAttachmentLimit.
  ///
  /// In zh, this message translates to:
  /// **'每条消息最多 {count} 个附件'**
  String chatAttachmentLimit(int count);

  /// No description provided for @chatAttachmentPermission.
  ///
  /// In zh, this message translates to:
  /// **'没有权限，可在系统设置中开启'**
  String get chatAttachmentPermission;

  /// No description provided for @chatOpenAttachmentFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开附件'**
  String get chatOpenAttachmentFailed;

  /// No description provided for @chatReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'读取失败'**
  String get chatReadFailed;

  /// No description provided for @chatReadImageFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取图片'**
  String get chatReadImageFailed;

  /// No description provided for @chatOpenChatFirst.
  ///
  /// In zh, this message translates to:
  /// **'先打开一个对话'**
  String get chatOpenChatFirst;

  /// No description provided for @chatTurnCompleted.
  ///
  /// In zh, this message translates to:
  /// **'这一轮已完成'**
  String get chatTurnCompleted;

  /// No description provided for @chatTurnError.
  ///
  /// In zh, this message translates to:
  /// **'这一轮出错了'**
  String get chatTurnError;

  /// No description provided for @chatAnswerHint.
  ///
  /// In zh, this message translates to:
  /// **'输入回答…'**
  String get chatAnswerHint;

  /// No description provided for @chatStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在启动'**
  String get chatStarting;

  /// No description provided for @chatConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接'**
  String get chatConnecting;

  /// No description provided for @chatDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'连接已断开'**
  String get chatDisconnected;

  /// No description provided for @chatReconnecting.
  ///
  /// In zh, this message translates to:
  /// **'重新连接中'**
  String get chatReconnecting;

  /// No description provided for @chatGenerating.
  ///
  /// In zh, this message translates to:
  /// **'生成中'**
  String get chatGenerating;

  /// No description provided for @chatGoToSettings.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get chatGoToSettings;

  /// No description provided for @chatListeningEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在聆听…'**
  String get chatListeningEllipsis;

  /// No description provided for @chatTranscribingEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在转写…'**
  String get chatTranscribingEllipsis;

  /// No description provided for @chatConnectToSend.
  ///
  /// In zh, this message translates to:
  /// **'连接引擎后即可发送'**
  String get chatConnectToSend;

  /// No description provided for @chatGeneratingSteerHint.
  ///
  /// In zh, this message translates to:
  /// **'生成中 · 可直接插话'**
  String get chatGeneratingSteerHint;

  /// No description provided for @chatComposerHint.
  ///
  /// In zh, this message translates to:
  /// **'给 DSH 发消息…'**
  String get chatComposerHint;

  /// No description provided for @chatStopGenerating.
  ///
  /// In zh, this message translates to:
  /// **'停止生成'**
  String get chatStopGenerating;

  /// No description provided for @chatVoiceInput.
  ///
  /// In zh, this message translates to:
  /// **'语音输入'**
  String get chatVoiceInput;

  /// No description provided for @chatStopVoiceInput.
  ///
  /// In zh, this message translates to:
  /// **'停止语音输入'**
  String get chatStopVoiceInput;

  /// No description provided for @chatGoal.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get chatGoal;

  /// No description provided for @chatGoalActions.
  ///
  /// In zh, this message translates to:
  /// **'目标操作'**
  String get chatGoalActions;

  /// No description provided for @chatGoalBlocked.
  ///
  /// In zh, this message translates to:
  /// **'受阻'**
  String get chatGoalBlocked;

  /// No description provided for @chatGoalRoundLimit.
  ///
  /// In zh, this message translates to:
  /// **'第 {rounds} / {max} 轮'**
  String chatGoalRoundLimit(int rounds, int max);

  /// No description provided for @chatGoalRound.
  ///
  /// In zh, this message translates to:
  /// **'第 {rounds} 轮'**
  String chatGoalRound(int rounds);

  /// No description provided for @chatEditGoal.
  ///
  /// In zh, this message translates to:
  /// **'编辑目标'**
  String get chatEditGoal;

  /// No description provided for @chatPauseGoal.
  ///
  /// In zh, this message translates to:
  /// **'暂停'**
  String get chatPauseGoal;

  /// No description provided for @chatPauseGoalHint.
  ///
  /// In zh, this message translates to:
  /// **'先不自动推进'**
  String get chatPauseGoalHint;

  /// No description provided for @chatResumeGoal.
  ///
  /// In zh, this message translates to:
  /// **'恢复'**
  String get chatResumeGoal;

  /// No description provided for @chatResumeGoalHint.
  ///
  /// In zh, this message translates to:
  /// **'继续自动推进'**
  String get chatResumeGoalHint;

  /// No description provided for @chatClearGoal.
  ///
  /// In zh, this message translates to:
  /// **'清除目标'**
  String get chatClearGoal;

  /// No description provided for @chatGoalHint.
  ///
  /// In zh, this message translates to:
  /// **'要完成什么'**
  String get chatGoalHint;

  /// No description provided for @chatClearGoalTitle.
  ///
  /// In zh, this message translates to:
  /// **'清除目标？'**
  String get chatClearGoalTitle;

  /// No description provided for @chatTodoCurrent.
  ///
  /// In zh, this message translates to:
  /// **'正在：{content}'**
  String chatTodoCurrent(String content);

  /// No description provided for @chatTodoNext.
  ///
  /// In zh, this message translates to:
  /// **'下一步：{content}'**
  String chatTodoNext(String content);

  /// No description provided for @chatTodoAllDone.
  ///
  /// In zh, this message translates to:
  /// **'全部完成'**
  String get chatTodoAllDone;

  /// No description provided for @chatTodoSemantics.
  ///
  /// In zh, this message translates to:
  /// **'待办 {count}，{label}'**
  String chatTodoSemantics(String count, String label);

  /// No description provided for @chatCollapseTodos.
  ///
  /// In zh, this message translates to:
  /// **'收起清单'**
  String get chatCollapseTodos;

  /// No description provided for @chatExpandTodos.
  ///
  /// In zh, this message translates to:
  /// **'展开清单'**
  String get chatExpandTodos;

  /// No description provided for @chatTodoNotStarted.
  ///
  /// In zh, this message translates to:
  /// **'未开始'**
  String get chatTodoNotStarted;

  /// No description provided for @chatFile.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get chatFile;

  /// No description provided for @chatFolder.
  ///
  /// In zh, this message translates to:
  /// **'文件夹'**
  String get chatFolder;

  /// No description provided for @chatChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get chatChat;

  /// No description provided for @chatSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get chatSubagent;

  /// No description provided for @chatRecent.
  ///
  /// In zh, this message translates to:
  /// **'最近'**
  String get chatRecent;

  /// No description provided for @chatMentionSearching.
  ///
  /// In zh, this message translates to:
  /// **'正在查找…'**
  String get chatMentionSearching;

  /// No description provided for @chatMentionNoFiles.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的文件'**
  String get chatMentionNoFiles;

  /// No description provided for @chatMentionNoMatches.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的文件或对话'**
  String get chatMentionNoMatches;

  /// No description provided for @chatQuote.
  ///
  /// In zh, this message translates to:
  /// **'引用'**
  String get chatQuote;

  /// No description provided for @chatOpenFolder.
  ///
  /// In zh, this message translates to:
  /// **'打开文件夹'**
  String get chatOpenFolder;

  /// No description provided for @chatJustNow.
  ///
  /// In zh, this message translates to:
  /// **'刚刚'**
  String get chatJustNow;

  /// No description provided for @chatMentionAgeMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{count}分钟'**
  String chatMentionAgeMinutes(int count);

  /// No description provided for @chatMentionAgeHours.
  ///
  /// In zh, this message translates to:
  /// **'{count}小时'**
  String chatMentionAgeHours(int count);

  /// No description provided for @chatMentionAgeDays.
  ///
  /// In zh, this message translates to:
  /// **'{count}天'**
  String chatMentionAgeDays(int count);

  /// No description provided for @chatMentionAgeMonths.
  ///
  /// In zh, this message translates to:
  /// **'{count}个月'**
  String chatMentionAgeMonths(int count);

  /// No description provided for @chatMentionAgeYears.
  ///
  /// In zh, this message translates to:
  /// **'{count}年'**
  String chatMentionAgeYears(int count);

  /// No description provided for @chatMermaidChart.
  ///
  /// In zh, this message translates to:
  /// **'Mermaid 图表'**
  String get chatMermaidChart;

  /// No description provided for @chatPreview.
  ///
  /// In zh, this message translates to:
  /// **'预览'**
  String get chatPreview;

  /// No description provided for @chatUnwrapLines.
  ///
  /// In zh, this message translates to:
  /// **'不换行'**
  String get chatUnwrapLines;

  /// No description provided for @chatWrapLines.
  ///
  /// In zh, this message translates to:
  /// **'自动换行'**
  String get chatWrapLines;

  /// No description provided for @chatAlertNote.
  ///
  /// In zh, this message translates to:
  /// **'注意'**
  String get chatAlertNote;

  /// No description provided for @chatAlertTip.
  ///
  /// In zh, this message translates to:
  /// **'提示'**
  String get chatAlertTip;

  /// No description provided for @chatAlertImportant.
  ///
  /// In zh, this message translates to:
  /// **'重要'**
  String get chatAlertImportant;

  /// No description provided for @chatAlertWarning.
  ///
  /// In zh, this message translates to:
  /// **'警告'**
  String get chatAlertWarning;

  /// No description provided for @chatAlertCaution.
  ///
  /// In zh, this message translates to:
  /// **'小心'**
  String get chatAlertCaution;

  /// No description provided for @chatImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get chatImage;

  /// No description provided for @chatImageNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到图片'**
  String get chatImageNotFound;

  /// No description provided for @chatImageOffline.
  ///
  /// In zh, this message translates to:
  /// **'未连接 DSH'**
  String get chatImageOffline;

  /// No description provided for @chatImageTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'图片过大'**
  String get chatImageTooLarge;

  /// No description provided for @chatImageReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法读取文件'**
  String get chatImageReadFailed;

  /// No description provided for @chatImageDisplayFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法显示'**
  String get chatImageDisplayFailed;

  /// No description provided for @chatImageTapToView.
  ///
  /// In zh, this message translates to:
  /// **'轻点查看'**
  String get chatImageTapToView;

  /// No description provided for @chatImageTapToRetry.
  ///
  /// In zh, this message translates to:
  /// **'轻点重试'**
  String get chatImageTapToRetry;

  /// No description provided for @chatImageUnsupportedAddress.
  ///
  /// In zh, this message translates to:
  /// **'不支持的地址'**
  String get chatImageUnsupportedAddress;

  /// No description provided for @chatMermaidNeedsNetwork.
  ///
  /// In zh, this message translates to:
  /// **'需要联网'**
  String get chatMermaidNeedsNetwork;

  /// No description provided for @chatMermaidSyntaxError.
  ///
  /// In zh, this message translates to:
  /// **'图表语法有误'**
  String get chatMermaidSyntaxError;

  /// No description provided for @chatChartPreview.
  ///
  /// In zh, this message translates to:
  /// **'图表预览'**
  String get chatChartPreview;

  /// No description provided for @chatCopyCode.
  ///
  /// In zh, this message translates to:
  /// **'复制代码'**
  String get chatCopyCode;

  /// No description provided for @chatChartClosed.
  ///
  /// In zh, this message translates to:
  /// **'图表已关闭'**
  String get chatChartClosed;

  /// No description provided for @chatVoiceMicrophoneFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开麦克风'**
  String get chatVoiceMicrophoneFailed;

  /// No description provided for @chatVoicePermissionOff.
  ///
  /// In zh, this message translates to:
  /// **'麦克风权限已关闭'**
  String get chatVoicePermissionOff;

  /// No description provided for @chatVoicePermissionNeeded.
  ///
  /// In zh, this message translates to:
  /// **'需要麦克风权限才能语音输入'**
  String get chatVoicePermissionNeeded;

  /// No description provided for @chatVoiceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这台手机没有可用的语音识别'**
  String get chatVoiceUnavailable;

  /// No description provided for @chatVoiceNotHeard.
  ///
  /// In zh, this message translates to:
  /// **'没有听清，再说一次'**
  String get chatVoiceNotHeard;

  /// No description provided for @chatVoiceTranscriptionFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能转写这段语音'**
  String get chatVoiceTranscriptionFailed;

  /// No description provided for @chatVoiceNetworkFailed.
  ///
  /// In zh, this message translates to:
  /// **'网络不太好，没能识别'**
  String get chatVoiceNetworkFailed;

  /// No description provided for @chatVoiceLanguageUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'暂不支持这种语言'**
  String get chatVoiceLanguageUnsupported;

  /// No description provided for @chatVoiceMicrophoneBusy.
  ///
  /// In zh, this message translates to:
  /// **'麦克风正被占用'**
  String get chatVoiceMicrophoneBusy;

  /// No description provided for @chatVoiceBusy.
  ///
  /// In zh, this message translates to:
  /// **'语音识别正忙，稍后再试'**
  String get chatVoiceBusy;

  /// No description provided for @chatVoiceRecognitionFailed.
  ///
  /// In zh, this message translates to:
  /// **'语音识别出错了'**
  String get chatVoiceRecognitionFailed;

  /// No description provided for @chatListening.
  ///
  /// In zh, this message translates to:
  /// **'正在聆听'**
  String get chatListening;

  /// No description provided for @chatTranscribing.
  ///
  /// In zh, this message translates to:
  /// **'正在转写'**
  String get chatTranscribing;

  /// No description provided for @chatCancelVoiceInput.
  ///
  /// In zh, this message translates to:
  /// **'取消语音输入'**
  String get chatCancelVoiceInput;

  /// No description provided for @chatViewTurnTrace.
  ///
  /// In zh, this message translates to:
  /// **'查看本轮轨迹'**
  String get chatViewTurnTrace;

  /// No description provided for @chatTokensPerSecond.
  ///
  /// In zh, this message translates to:
  /// **'约 {count} tokens/秒'**
  String chatTokensPerSecond(int count);

  /// No description provided for @chatNoTokensStreaming.
  ///
  /// In zh, this message translates to:
  /// **'没有在出字'**
  String get chatNoTokensStreaming;

  /// No description provided for @chatCurrentStep.
  ///
  /// In zh, this message translates to:
  /// **'这一步 {step}'**
  String chatCurrentStep(String step);

  /// No description provided for @chatTodoProgress.
  ///
  /// In zh, this message translates to:
  /// **'待办进度 {done}/{total}'**
  String chatTodoProgress(int done, int total);

  /// No description provided for @chatProgress.
  ///
  /// In zh, this message translates to:
  /// **'进度 {done}/{total}'**
  String chatProgress(int done, int total);

  /// No description provided for @chatApproveCommand.
  ///
  /// In zh, this message translates to:
  /// **'允许运行这条命令？'**
  String get chatApproveCommand;

  /// No description provided for @chatApproveWrite.
  ///
  /// In zh, this message translates to:
  /// **'允许写入这个文件？'**
  String get chatApproveWrite;

  /// No description provided for @chatApproveEdit.
  ///
  /// In zh, this message translates to:
  /// **'允许修改这个文件？'**
  String get chatApproveEdit;

  /// No description provided for @chatApproveWebpage.
  ///
  /// In zh, this message translates to:
  /// **'允许打开这个网页？'**
  String get chatApproveWebpage;

  /// No description provided for @chatApproveSearch.
  ///
  /// In zh, this message translates to:
  /// **'允许联网搜索？'**
  String get chatApproveSearch;

  /// No description provided for @chatApproveTool.
  ///
  /// In zh, this message translates to:
  /// **'允许使用「{name}」？'**
  String chatApproveTool(String name);

  /// No description provided for @chatDecline.
  ///
  /// In zh, this message translates to:
  /// **'拒绝'**
  String get chatDecline;

  /// No description provided for @chatAllowOnce.
  ///
  /// In zh, this message translates to:
  /// **'允许本次'**
  String get chatAllowOnce;

  /// No description provided for @chatAllowForChat.
  ///
  /// In zh, this message translates to:
  /// **'本对话都允许'**
  String get chatAllowForChat;

  /// No description provided for @chatSaveToDownloads.
  ///
  /// In zh, this message translates to:
  /// **'存到「下载」'**
  String get chatSaveToDownloads;

  /// No description provided for @chatCopyPath.
  ///
  /// In zh, this message translates to:
  /// **'复制路径'**
  String get chatCopyPath;

  /// No description provided for @chatOpenInDefaultApp.
  ///
  /// In zh, this message translates to:
  /// **'用默认应用打开'**
  String get chatOpenInDefaultApp;

  /// No description provided for @chatDownloadsFolderHint.
  ///
  /// In zh, this message translates to:
  /// **'下载/DSH-Go 文件夹'**
  String get chatDownloadsFolderHint;

  /// No description provided for @chatSavedToDownloadsPath.
  ///
  /// In zh, this message translates to:
  /// **'已存到 下载/{path}'**
  String chatSavedToDownloadsPath(String path);

  /// No description provided for @chatSavedToPath.
  ///
  /// In zh, this message translates to:
  /// **'已存到 {path}'**
  String chatSavedToPath(String path);

  /// No description provided for @chatDeliveredFiles.
  ///
  /// In zh, this message translates to:
  /// **'交付了 {count} 个文件'**
  String chatDeliveredFiles(int count);

  /// No description provided for @chatGeneratedFiles.
  ///
  /// In zh, this message translates to:
  /// **'生成了 {count} 个文件'**
  String chatGeneratedFiles(int count);

  /// No description provided for @chatAllFiles.
  ///
  /// In zh, this message translates to:
  /// **'全部 {count} 个文件'**
  String chatAllFiles(int count);

  /// No description provided for @chatCollapseFileList.
  ///
  /// In zh, this message translates to:
  /// **'收起文件列表'**
  String get chatCollapseFileList;

  /// No description provided for @chatExpandAllFiles.
  ///
  /// In zh, this message translates to:
  /// **'展开全部 {count} 个文件'**
  String chatExpandAllFiles(int count);

  /// No description provided for @chatDownloading.
  ///
  /// In zh, this message translates to:
  /// **'正在下载…'**
  String get chatDownloading;

  /// No description provided for @chatDownloadingPercent.
  ///
  /// In zh, this message translates to:
  /// **'正在下载… {percent}%'**
  String chatDownloadingPercent(int percent);

  /// No description provided for @chatOpening.
  ///
  /// In zh, this message translates to:
  /// **'正在打开…'**
  String get chatOpening;

  /// No description provided for @chatSavingToDownloads.
  ///
  /// In zh, this message translates to:
  /// **'正在存到「下载」…'**
  String get chatSavingToDownloads;

  /// No description provided for @chatOpenInPhoneApp.
  ///
  /// In zh, this message translates to:
  /// **'用手机上的应用打开'**
  String get chatOpenInPhoneApp;

  /// No description provided for @chatMoreActions.
  ///
  /// In zh, this message translates to:
  /// **'更多操作'**
  String get chatMoreActions;

  /// No description provided for @chatAlreadyInDownloads.
  ///
  /// In zh, this message translates to:
  /// **'已在手机的「下载」里'**
  String get chatAlreadyInDownloads;

  /// No description provided for @chatArtifactCopyPathOnly.
  ///
  /// In zh, this message translates to:
  /// **'当前连接无法读取文件，只能复制路径'**
  String get chatArtifactCopyPathOnly;

  /// No description provided for @chatReplying.
  ///
  /// In zh, this message translates to:
  /// **'正在回复'**
  String get chatReplying;

  /// No description provided for @chatInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'已中断'**
  String get chatInterrupted;

  /// No description provided for @chatGallery.
  ///
  /// In zh, this message translates to:
  /// **'相册'**
  String get chatGallery;

  /// No description provided for @chatTakePhoto.
  ///
  /// In zh, this message translates to:
  /// **'拍照'**
  String get chatTakePhoto;

  /// No description provided for @chatAddAttachment.
  ///
  /// In zh, this message translates to:
  /// **'添加图片或文件'**
  String get chatAddAttachment;

  /// No description provided for @chatRemoveAttachment.
  ///
  /// In zh, this message translates to:
  /// **'移除「{name}」'**
  String chatRemoveAttachment(String name);

  /// No description provided for @chatAutoApproveCommands.
  ///
  /// In zh, this message translates to:
  /// **'自动允许命令'**
  String get chatAutoApproveCommands;

  /// No description provided for @chatAutoApproving.
  ///
  /// In zh, this message translates to:
  /// **'自动允许中'**
  String get chatAutoApproving;

  /// No description provided for @chatViewMoreChanges.
  ///
  /// In zh, this message translates to:
  /// **'查看改动，还有 {count} 个文件'**
  String chatViewMoreChanges(int count);

  /// No description provided for @chatViewChanges.
  ///
  /// In zh, this message translates to:
  /// **'查看改动'**
  String get chatViewChanges;

  /// No description provided for @chatChangedFiles.
  ///
  /// In zh, this message translates to:
  /// **'改动了 {count} 个文件'**
  String chatChangedFiles(int count);

  /// No description provided for @chatMoreFiles.
  ///
  /// In zh, this message translates to:
  /// **'还有 {count} 个文件'**
  String chatMoreFiles(int count);

  /// No description provided for @chatFileChangeSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{path}，新增 {added} 行，删除 {removed} 行'**
  String chatFileChangeSemantics(String path, int added, int removed);

  /// No description provided for @chatNewFileSuffix.
  ///
  /// In zh, this message translates to:
  /// **'  新建'**
  String get chatNewFileSuffix;

  /// No description provided for @chatPathCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制路径'**
  String get chatPathCopied;

  /// No description provided for @chatCommandCompacted.
  ///
  /// In zh, this message translates to:
  /// **'已压缩 {count} 条历史记录（约 {tokens} tokens）'**
  String chatCommandCompacted(int count, String tokens);

  /// No description provided for @chatCommandPermissionChanged.
  ///
  /// In zh, this message translates to:
  /// **'已切换为{name}'**
  String chatCommandPermissionChanged(String name);

  /// No description provided for @chatCommandCurrentPermission.
  ///
  /// In zh, this message translates to:
  /// **'当前权限：{name}'**
  String chatCommandCurrentPermission(String name);

  /// No description provided for @chatCommandUnknownPermission.
  ///
  /// In zh, this message translates to:
  /// **'没有这个权限预设'**
  String get chatCommandUnknownPermission;

  /// No description provided for @chatCommandFeedbackRequired.
  ///
  /// In zh, this message translates to:
  /// **'写上反馈内容再发送'**
  String get chatCommandFeedbackRequired;

  /// No description provided for @chatCommandFeedbackSubmitted.
  ///
  /// In zh, this message translates to:
  /// **'反馈已提交'**
  String get chatCommandFeedbackSubmitted;

  /// No description provided for @chatCommandNothingToCompact.
  ///
  /// In zh, this message translates to:
  /// **'还没有可压缩的内容'**
  String get chatCommandNothingToCompact;

  /// No description provided for @chatCommandCompactionCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消压缩'**
  String get chatCommandCompactionCancelled;

  /// No description provided for @chatCommandCompactionBusy.
  ///
  /// In zh, this message translates to:
  /// **'正在忙，稍后再压缩'**
  String get chatCommandCompactionBusy;

  /// No description provided for @chatCommandCompactedSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'已压缩，但没能保存'**
  String get chatCommandCompactedSaveFailed;

  /// No description provided for @chatCommandCompactUsage.
  ///
  /// In zh, this message translates to:
  /// **'/compact 不带参数'**
  String get chatCommandCompactUsage;

  /// No description provided for @chatCommandHistoryChanged.
  ///
  /// In zh, this message translates to:
  /// **'对话有变化，请再试一次'**
  String get chatCommandHistoryChanged;

  /// No description provided for @chatCommandCompactionFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能完成压缩，请再试一次'**
  String get chatCommandCompactionFailed;

  /// No description provided for @chatCommandCompactionIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'压缩未完成，请查看对话'**
  String get chatCommandCompactionIncomplete;

  /// No description provided for @chatCommandPlanEnabled.
  ///
  /// In zh, this message translates to:
  /// **'已进入计划模式'**
  String get chatCommandPlanEnabled;

  /// No description provided for @chatCommandPlanEnabling.
  ///
  /// In zh, this message translates to:
  /// **'下一步起进入计划模式'**
  String get chatCommandPlanEnabling;

  /// No description provided for @chatCommandPlanDisabled.
  ///
  /// In zh, this message translates to:
  /// **'已退出计划模式'**
  String get chatCommandPlanDisabled;

  /// No description provided for @chatCommandPlanDisabling.
  ///
  /// In zh, this message translates to:
  /// **'下一步起退出计划模式'**
  String get chatCommandPlanDisabling;

  /// No description provided for @chatCommandPlanCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消进入计划模式'**
  String get chatCommandPlanCancelled;

  /// No description provided for @chatCommandPlanInactive.
  ///
  /// In zh, this message translates to:
  /// **'当前未开启计划模式'**
  String get chatCommandPlanInactive;

  /// No description provided for @chatCommandPlanNoAttachments.
  ///
  /// In zh, this message translates to:
  /// **'退出计划模式时不能附带文件'**
  String get chatCommandPlanNoAttachments;

  /// No description provided for @chatCommandNoGoal.
  ///
  /// In zh, this message translates to:
  /// **'还没有目标'**
  String get chatCommandNoGoal;

  /// No description provided for @chatCommandGoalRequired.
  ///
  /// In zh, this message translates to:
  /// **'写上新的目标再发送'**
  String get chatCommandGoalRequired;

  /// No description provided for @chatCommandGoalAttachments.
  ///
  /// In zh, this message translates to:
  /// **'附件需要和目标一起发送'**
  String get chatCommandGoalAttachments;

  /// No description provided for @chatCommandGoalCleared.
  ///
  /// In zh, this message translates to:
  /// **'已清除目标'**
  String get chatCommandGoalCleared;

  /// No description provided for @chatCommandGoalInvalid.
  ///
  /// In zh, this message translates to:
  /// **'当前无法执行，请查看目标'**
  String get chatCommandGoalInvalid;

  /// No description provided for @chatCommandGoalExists.
  ///
  /// In zh, this message translates to:
  /// **'已有目标，请编辑或清除后再设置'**
  String get chatCommandGoalExists;

  /// No description provided for @chatCommandGoalCreated.
  ///
  /// In zh, this message translates to:
  /// **'已设置目标'**
  String get chatCommandGoalCreated;

  /// No description provided for @chatCommandGoalUpdated.
  ///
  /// In zh, this message translates to:
  /// **'已更新目标'**
  String get chatCommandGoalUpdated;

  /// No description provided for @chatCommandGoalPaused.
  ///
  /// In zh, this message translates to:
  /// **'已暂停目标'**
  String get chatCommandGoalPaused;

  /// No description provided for @chatCommandGoalResumed.
  ///
  /// In zh, this message translates to:
  /// **'已继续目标'**
  String get chatCommandGoalResumed;

  /// No description provided for @chatCommandCurrentGoal.
  ///
  /// In zh, this message translates to:
  /// **'当前目标'**
  String get chatCommandCurrentGoal;

  /// No description provided for @chatCommandGoalBlocked.
  ///
  /// In zh, this message translates to:
  /// **'等待处理'**
  String get chatCommandGoalBlocked;

  /// No description provided for @chatCommandGoalSummary.
  ///
  /// In zh, this message translates to:
  /// **'{title}\n{objective}\n{status} · 第 {rounds}/{max} 轮'**
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max);

  /// No description provided for @chatCommandFailed.
  ///
  /// In zh, this message translates to:
  /// **'执行失败'**
  String get chatCommandFailed;

  /// No description provided for @chatImageStorageDenied.
  ///
  /// In zh, this message translates to:
  /// **'没有存储权限，未能保存'**
  String get chatImageStorageDenied;

  /// No description provided for @chatImageCannotSave.
  ///
  /// In zh, this message translates to:
  /// **'这张图片无法保存'**
  String get chatImageCannotSave;

  /// No description provided for @chatImageDownloadFailed.
  ///
  /// In zh, this message translates to:
  /// **'图片下载失败，请重试'**
  String get chatImageDownloadFailed;

  /// No description provided for @chatImageSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'保存失败，请重试'**
  String get chatImageSaveFailed;

  /// No description provided for @chatImageSavedToPhotos.
  ///
  /// In zh, this message translates to:
  /// **'已保存到相册'**
  String get chatImageSavedToPhotos;

  /// No description provided for @chatShareFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法打开分享'**
  String get chatShareFailed;

  /// No description provided for @chatSubmit.
  ///
  /// In zh, this message translates to:
  /// **'提交'**
  String get chatSubmit;

  /// No description provided for @chatSelectText.
  ///
  /// In zh, this message translates to:
  /// **'选择文字'**
  String get chatSelectText;

  /// No description provided for @chatRegenerate.
  ///
  /// In zh, this message translates to:
  /// **'重新回答'**
  String get chatRegenerate;

  /// No description provided for @chatBranchFromHere.
  ///
  /// In zh, this message translates to:
  /// **'从这里分叉'**
  String get chatBranchFromHere;

  /// No description provided for @chatEditAndResend.
  ///
  /// In zh, this message translates to:
  /// **'编辑后重发'**
  String get chatEditAndResend;

  /// No description provided for @chatRegenerateHint.
  ///
  /// In zh, this message translates to:
  /// **'在新对话中重新生成，原对话不变'**
  String get chatRegenerateHint;

  /// No description provided for @chatBranchHint.
  ///
  /// In zh, this message translates to:
  /// **'在新对话中继续，原对话不变'**
  String get chatBranchHint;

  /// No description provided for @chatEditResendHint.
  ///
  /// In zh, this message translates to:
  /// **'在新对话中改写，原对话不变'**
  String get chatEditResendHint;

  /// No description provided for @chatSaveToPhotos.
  ///
  /// In zh, this message translates to:
  /// **'保存到相册'**
  String get chatSaveToPhotos;

  /// No description provided for @chatCopyAll.
  ///
  /// In zh, this message translates to:
  /// **'全部复制'**
  String get chatCopyAll;

  /// No description provided for @chatRequestRetrying.
  ///
  /// In zh, this message translates to:
  /// **'请求失败，正在重试'**
  String get chatRequestRetrying;

  /// No description provided for @chatRequestRetryAttempt.
  ///
  /// In zh, this message translates to:
  /// **'请求失败，正在重试（第 {count} 次）'**
  String chatRequestRetryAttempt(int count);

  /// No description provided for @chatRequestRetryLimit.
  ///
  /// In zh, this message translates to:
  /// **'请求失败，正在重试（{count}/{max}）'**
  String chatRequestRetryLimit(int count, int max);

  /// No description provided for @chatSubscriptionExpired.
  ///
  /// In zh, this message translates to:
  /// **'{name} 登录已失效'**
  String chatSubscriptionExpired(String name);

  /// No description provided for @chatProviderKeyMissing.
  ///
  /// In zh, this message translates to:
  /// **'这个模型渠道还没有密钥'**
  String get chatProviderKeyMissing;

  /// No description provided for @chatDeepSeekKeyMissing.
  ///
  /// In zh, this message translates to:
  /// **'还没有 DeepSeek API Key'**
  String get chatDeepSeekKeyMissing;

  /// No description provided for @chatOutputLimitReached.
  ///
  /// In zh, this message translates to:
  /// **'已达单次输出上限'**
  String get chatOutputLimitReached;

  /// No description provided for @chatTurnBlocked.
  ///
  /// In zh, this message translates to:
  /// **'本轮已被拦截'**
  String get chatTurnBlocked;

  /// No description provided for @chatTurnEngineRestarted.
  ///
  /// In zh, this message translates to:
  /// **'引擎重启过，本轮已中断'**
  String get chatTurnEngineRestarted;

  /// No description provided for @chatSignInAgain.
  ///
  /// In zh, this message translates to:
  /// **'重新登录'**
  String get chatSignInAgain;

  /// No description provided for @chatQuestionsTitle.
  ///
  /// In zh, this message translates to:
  /// **'有 {count} 个问题想问你'**
  String chatQuestionsTitle(int count);

  /// No description provided for @chatOneQuestion.
  ///
  /// In zh, this message translates to:
  /// **'有个问题想问你'**
  String get chatOneQuestion;

  /// No description provided for @chatMultipleChoices.
  ///
  /// In zh, this message translates to:
  /// **'可多选'**
  String get chatMultipleChoices;

  /// No description provided for @chatCustomAnswer.
  ///
  /// In zh, this message translates to:
  /// **'其他回答'**
  String get chatCustomAnswer;

  /// No description provided for @chatCustomAnswerHint.
  ///
  /// In zh, this message translates to:
  /// **'输入你的回答'**
  String get chatCustomAnswerHint;

  /// No description provided for @chatQuoteSemantics.
  ///
  /// In zh, this message translates to:
  /// **'引用：{text}'**
  String chatQuoteSemantics(String text);

  /// No description provided for @chatRemoveQuote.
  ///
  /// In zh, this message translates to:
  /// **'移除引用'**
  String get chatRemoveQuote;

  /// No description provided for @chatReadOnlySubagent.
  ///
  /// In zh, this message translates to:
  /// **'一次性子代理，只能查看'**
  String get chatReadOnlySubagent;

  /// No description provided for @chatThinkingActive.
  ///
  /// In zh, this message translates to:
  /// **'思考中'**
  String get chatThinkingActive;

  /// No description provided for @chatThinking.
  ///
  /// In zh, this message translates to:
  /// **'思考'**
  String get chatThinking;

  /// No description provided for @chatTranslate.
  ///
  /// In zh, this message translates to:
  /// **'翻译'**
  String get chatTranslate;

  /// No description provided for @chatTranslationUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'翻译暂不可用'**
  String get chatTranslationUnavailable;

  /// No description provided for @chatViewOriginal.
  ///
  /// In zh, this message translates to:
  /// **'查看原文'**
  String get chatViewOriginal;

  /// No description provided for @chatViewTranslation.
  ///
  /// In zh, this message translates to:
  /// **'查看译文'**
  String get chatViewTranslation;

  /// No description provided for @chatTranslating.
  ///
  /// In zh, this message translates to:
  /// **'正在翻译'**
  String get chatTranslating;

  /// No description provided for @chatToolFailures.
  ///
  /// In zh, this message translates to:
  /// **'{label},{count} 个失败'**
  String chatToolFailures(String label, int count);

  /// No description provided for @chatToolNeedsApproval.
  ///
  /// In zh, this message translates to:
  /// **'需要授权后才能执行'**
  String get chatToolNeedsApproval;

  /// No description provided for @chatCommand.
  ///
  /// In zh, this message translates to:
  /// **'命令'**
  String get chatCommand;

  /// No description provided for @chatToolLineRange.
  ///
  /// In zh, this message translates to:
  /// **' · 第 {first}⁠–⁠{last} 行'**
  String chatToolLineRange(int first, int last);

  /// No description provided for @chatParameters.
  ///
  /// In zh, this message translates to:
  /// **'参数'**
  String get chatParameters;

  /// No description provided for @chatOutput.
  ///
  /// In zh, this message translates to:
  /// **'输出'**
  String get chatOutput;

  /// No description provided for @chatResult.
  ///
  /// In zh, this message translates to:
  /// **'结果'**
  String get chatResult;

  /// No description provided for @chatError.
  ///
  /// In zh, this message translates to:
  /// **'错误'**
  String get chatError;

  /// No description provided for @chatChanges.
  ///
  /// In zh, this message translates to:
  /// **'改动'**
  String get chatChanges;

  /// No description provided for @chatContent.
  ///
  /// In zh, this message translates to:
  /// **'内容'**
  String get chatContent;

  /// No description provided for @chatNoOutput.
  ///
  /// In zh, this message translates to:
  /// **'没有输出'**
  String get chatNoOutput;

  /// No description provided for @chatToolDeclined.
  ///
  /// In zh, this message translates to:
  /// **'已拒绝这次调用'**
  String get chatToolDeclined;

  /// No description provided for @chatToolRunning.
  ///
  /// In zh, this message translates to:
  /// **'正在执行…'**
  String get chatToolRunning;

  /// No description provided for @chatNoDetails.
  ///
  /// In zh, this message translates to:
  /// **'暂无详情'**
  String get chatNoDetails;

  /// No description provided for @chatErrApiKey.
  ///
  /// In zh, this message translates to:
  /// **'API Key 无效或已过期'**
  String get chatErrApiKey;

  /// No description provided for @chatErrBalance.
  ///
  /// In zh, this message translates to:
  /// **'余额不足'**
  String get chatErrBalance;

  /// No description provided for @chatErrAccountQuota.
  ///
  /// In zh, this message translates to:
  /// **'账号额度已用完'**
  String get chatErrAccountQuota;

  /// No description provided for @chatErrRateLimit.
  ///
  /// In zh, this message translates to:
  /// **'请求太频繁，稍后再试'**
  String get chatErrRateLimit;

  /// No description provided for @chatErrContextLength.
  ///
  /// In zh, this message translates to:
  /// **'对话太长，发送 /compact 压缩后再试'**
  String get chatErrContextLength;

  /// No description provided for @chatErrModelUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'模型服务暂时不可用'**
  String get chatErrModelUnavailable;

  /// No description provided for @chatErrModelTimeout.
  ///
  /// In zh, this message translates to:
  /// **'模型响应超时'**
  String get chatErrModelTimeout;

  /// No description provided for @chatErrModelConnection.
  ///
  /// In zh, this message translates to:
  /// **'没能连上模型服务'**
  String get chatErrModelConnection;

  /// No description provided for @chatErrModelEmpty.
  ///
  /// In zh, this message translates to:
  /// **'模型没有返回内容'**
  String get chatErrModelEmpty;

  /// No description provided for @chatErrEngineOutdated.
  ///
  /// In zh, this message translates to:
  /// **'这个模型需要新版引擎'**
  String get chatErrEngineOutdated;

  /// No description provided for @chatErrModelUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前模型不可用'**
  String get chatErrModelUnsupported;

  /// No description provided for @chatSwitchModel.
  ///
  /// In zh, this message translates to:
  /// **'换模型'**
  String get chatSwitchModel;

  /// No description provided for @chatErrTurn.
  ///
  /// In zh, this message translates to:
  /// **'本轮出错了'**
  String get chatErrTurn;

  /// No description provided for @chatTurnSteps.
  ///
  /// In zh, this message translates to:
  /// **'{count} 步'**
  String chatTurnSteps(int count);

  /// No description provided for @chatTurnFootnoteSemantics.
  ///
  /// In zh, this message translates to:
  /// **'本轮 {summary}，查看本轮轨迹'**
  String chatTurnFootnoteSemantics(String summary);

  /// No description provided for @chatTurnToolCalls.
  ///
  /// In zh, this message translates to:
  /// **'{count} 次工具调用'**
  String chatTurnToolCalls(int count);

  /// No description provided for @chatTurnMessages.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条消息'**
  String chatTurnMessages(int count);

  /// No description provided for @chatTurnThoughts.
  ///
  /// In zh, this message translates to:
  /// **'{count} 段思考'**
  String chatTurnThoughts(int count);

  /// No description provided for @chatMe.
  ///
  /// In zh, this message translates to:
  /// **'我'**
  String get chatMe;

  /// No description provided for @chatGoalSemantics.
  ///
  /// In zh, this message translates to:
  /// **'目标，{objective}'**
  String chatGoalSemantics(String objective);

  /// No description provided for @chatGoalStateSemantics.
  ///
  /// In zh, this message translates to:
  /// **'目标，{objective}，{state}'**
  String chatGoalStateSemantics(String objective, String state);

  /// No description provided for @chatTodoItemSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{content}，{state}'**
  String chatTodoItemSemantics(String content, String state);

  /// No description provided for @chatMentionSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{kind}：{label}'**
  String chatMentionSemantics(String kind, String label);

  /// No description provided for @chatArtifactSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{name}，{description}'**
  String chatArtifactSemantics(String name, String description);

  /// No description provided for @commonCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消'**
  String get commonCancel;

  /// No description provided for @commonRetry.
  ///
  /// In zh, this message translates to:
  /// **'重试'**
  String get commonRetry;

  /// No description provided for @commonClose.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get commonClose;

  /// No description provided for @commonCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制'**
  String get commonCopied;

  /// No description provided for @commonSave.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get commonSave;

  /// No description provided for @commonSettings.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get commonSettings;

  /// No description provided for @commonBack.
  ///
  /// In zh, this message translates to:
  /// **'返回'**
  String get commonBack;

  /// No description provided for @commonCopy.
  ///
  /// In zh, this message translates to:
  /// **'复制'**
  String get commonCopy;

  /// No description provided for @commonDone.
  ///
  /// In zh, this message translates to:
  /// **'完成'**
  String get commonDone;

  /// No description provided for @commonDelete.
  ///
  /// In zh, this message translates to:
  /// **'删除'**
  String get commonDelete;

  /// No description provided for @commonInstall.
  ///
  /// In zh, this message translates to:
  /// **'安装'**
  String get commonInstall;

  /// No description provided for @commonShare.
  ///
  /// In zh, this message translates to:
  /// **'分享'**
  String get commonShare;

  /// No description provided for @commonAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加'**
  String get commonAdd;

  /// No description provided for @commonEdit.
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get commonEdit;

  /// No description provided for @commonClear.
  ///
  /// In zh, this message translates to:
  /// **'清除'**
  String get commonClear;

  /// No description provided for @commonCollapse.
  ///
  /// In zh, this message translates to:
  /// **'收起'**
  String get commonCollapse;

  /// No description provided for @commonEnable.
  ///
  /// In zh, this message translates to:
  /// **'启用'**
  String get commonEnable;

  /// No description provided for @commonOpen.
  ///
  /// In zh, this message translates to:
  /// **'打开'**
  String get commonOpen;

  /// No description provided for @commonDetails.
  ///
  /// In zh, this message translates to:
  /// **'详情'**
  String get commonDetails;

  /// No description provided for @commonMore.
  ///
  /// In zh, this message translates to:
  /// **'更多'**
  String get commonMore;

  /// No description provided for @commonCreate.
  ///
  /// In zh, this message translates to:
  /// **'创建'**
  String get commonCreate;

  /// No description provided for @commonSend.
  ///
  /// In zh, this message translates to:
  /// **'发送'**
  String get commonSend;

  /// No description provided for @commonStop.
  ///
  /// In zh, this message translates to:
  /// **'停止'**
  String get commonStop;

  /// No description provided for @commonPaste.
  ///
  /// In zh, this message translates to:
  /// **'粘贴'**
  String get commonPaste;

  /// No description provided for @commonHide.
  ///
  /// In zh, this message translates to:
  /// **'隐藏'**
  String get commonHide;

  /// No description provided for @commonLater.
  ///
  /// In zh, this message translates to:
  /// **'稍后'**
  String get commonLater;

  /// No description provided for @commonConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认'**
  String get commonConfirm;

  /// No description provided for @commonRename.
  ///
  /// In zh, this message translates to:
  /// **'重命名'**
  String get commonRename;

  /// No description provided for @commonContinue.
  ///
  /// In zh, this message translates to:
  /// **'继续'**
  String get commonContinue;

  /// No description provided for @commonNotSet.
  ///
  /// In zh, this message translates to:
  /// **'未设置'**
  String get commonNotSet;

  /// No description provided for @commonDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认'**
  String get commonDefault;

  /// No description provided for @commonSaved.
  ///
  /// In zh, this message translates to:
  /// **'已保存'**
  String get commonSaved;

  /// No description provided for @commonSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能保存'**
  String get commonSaveFailed;

  /// No description provided for @commonSaveFailedRetry.
  ///
  /// In zh, this message translates to:
  /// **'没能保存，请重试'**
  String get commonSaveFailedRetry;

  /// No description provided for @commonFailedTryAgain.
  ///
  /// In zh, this message translates to:
  /// **'没能完成，再试一次'**
  String get commonFailedTryAgain;

  /// No description provided for @commonEngineUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上引擎'**
  String get commonEngineUnreachable;

  /// No description provided for @commonStorageFull.
  ///
  /// In zh, this message translates to:
  /// **'存储空间不足'**
  String get commonStorageFull;

  /// No description provided for @commonConnectionFailed.
  ///
  /// In zh, this message translates to:
  /// **'连接失败'**
  String get commonConnectionFailed;

  /// No description provided for @commonCopyLink.
  ///
  /// In zh, this message translates to:
  /// **'复制链接'**
  String get commonCopyLink;

  /// No description provided for @commonOpenWith.
  ///
  /// In zh, this message translates to:
  /// **'用其他应用打开'**
  String get commonOpenWith;

  /// No description provided for @commonOpenInWeb.
  ///
  /// In zh, this message translates to:
  /// **'在网页版打开'**
  String get commonOpenInWeb;

  /// No description provided for @commonUntitledChat.
  ///
  /// In zh, this message translates to:
  /// **'未命名对话'**
  String get commonUntitledChat;

  /// No description provided for @commonNewChat.
  ///
  /// In zh, this message translates to:
  /// **'新对话'**
  String get commonNewChat;

  /// No description provided for @commonYesterday.
  ///
  /// In zh, this message translates to:
  /// **'昨天'**
  String get commonYesterday;

  /// No description provided for @commonSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'已登录'**
  String get commonSignedIn;

  /// No description provided for @commonSignIn.
  ///
  /// In zh, this message translates to:
  /// **'登录'**
  String get commonSignIn;

  /// No description provided for @commonSignOut.
  ///
  /// In zh, this message translates to:
  /// **'退出登录'**
  String get commonSignOut;

  /// No description provided for @commonThisPhone.
  ///
  /// In zh, this message translates to:
  /// **'本机'**
  String get commonThisPhone;

  /// No description provided for @commonRemoteHost.
  ///
  /// In zh, this message translates to:
  /// **'远程主机'**
  String get commonRemoteHost;

  /// No description provided for @commonWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页版'**
  String get commonWeb;

  /// No description provided for @commonFollowSystem.
  ///
  /// In zh, this message translates to:
  /// **'跟随系统'**
  String get commonFollowSystem;

  /// No description provided for @commonLight.
  ///
  /// In zh, this message translates to:
  /// **'浅色'**
  String get commonLight;

  /// No description provided for @commonDark.
  ///
  /// In zh, this message translates to:
  /// **'深色'**
  String get commonDark;

  /// No description provided for @commonInProgress.
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get commonInProgress;

  /// No description provided for @commonCompleted.
  ///
  /// In zh, this message translates to:
  /// **'已完成'**
  String get commonCompleted;

  /// No description provided for @commonStopped.
  ///
  /// In zh, this message translates to:
  /// **'已停止'**
  String get commonStopped;

  /// No description provided for @commonCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get commonCancelled;

  /// No description provided for @commonRunning.
  ///
  /// In zh, this message translates to:
  /// **'运行中'**
  String get commonRunning;

  /// No description provided for @commonPaused.
  ///
  /// In zh, this message translates to:
  /// **'已暂停'**
  String get commonPaused;

  /// No description provided for @commonDeclined.
  ///
  /// In zh, this message translates to:
  /// **'已拒绝'**
  String get commonDeclined;

  /// No description provided for @commonFailed.
  ///
  /// In zh, this message translates to:
  /// **'失败'**
  String get commonFailed;

  /// No description provided for @commonStopping.
  ///
  /// In zh, this message translates to:
  /// **'正在停止'**
  String get commonStopping;

  /// No description provided for @commonWaitingApproval.
  ///
  /// In zh, this message translates to:
  /// **'等你确认'**
  String get commonWaitingApproval;

  /// No description provided for @commonWaitingAnswer.
  ///
  /// In zh, this message translates to:
  /// **'等你回答'**
  String get commonWaitingAnswer;

  /// No description provided for @commonNotConnected.
  ///
  /// In zh, this message translates to:
  /// **'未连接'**
  String get commonNotConnected;

  /// No description provided for @commonInstalled.
  ///
  /// In zh, this message translates to:
  /// **'已安装'**
  String get commonInstalled;

  /// No description provided for @commonName.
  ///
  /// In zh, this message translates to:
  /// **'名称'**
  String get commonName;

  /// No description provided for @commonStatus.
  ///
  /// In zh, this message translates to:
  /// **'状态'**
  String get commonStatus;

  /// No description provided for @commonVersion.
  ///
  /// In zh, this message translates to:
  /// **'版本'**
  String get commonVersion;

  /// No description provided for @commonOther.
  ///
  /// In zh, this message translates to:
  /// **'其他'**
  String get commonOther;

  /// No description provided for @commonPin.
  ///
  /// In zh, this message translates to:
  /// **'置顶'**
  String get commonPin;

  /// No description provided for @commonReply.
  ///
  /// In zh, this message translates to:
  /// **'回复'**
  String get commonReply;

  /// No description provided for @commonUpdate.
  ///
  /// In zh, this message translates to:
  /// **'更新'**
  String get commonUpdate;

  /// No description provided for @commonViewLogs.
  ///
  /// In zh, this message translates to:
  /// **'查看日志'**
  String get commonViewLogs;

  /// No description provided for @commonItemCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项'**
  String commonItemCount(int count);

  /// Short date (month 1–12).
  ///
  /// In zh, this message translates to:
  /// **'{month}月{day}日'**
  String commonMonthDay(String month, int day);

  /// No description provided for @engineAccountSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'已登录 DeepSeek 账号'**
  String get engineAccountSignedIn;

  /// No description provided for @engineAccountSignOutTitle.
  ///
  /// In zh, this message translates to:
  /// **'退出 DeepSeek 账号？'**
  String get engineAccountSignOutTitle;

  /// No description provided for @engineAccountSignOutBusy.
  ///
  /// In zh, this message translates to:
  /// **'有任务正在使用账号模型，退出会立即中断它们。对话和文件都会保留。'**
  String get engineAccountSignOutBusy;

  /// No description provided for @engineAccountSignOutBody.
  ///
  /// In zh, this message translates to:
  /// **'账号模型将不可用。对话、文件和 API Key 都会保留，随时可以重新登录。'**
  String get engineAccountSignOutBody;

  /// No description provided for @engineAccountSignOutUnknown.
  ///
  /// In zh, this message translates to:
  /// **'无法确认是否有任务在使用账号模型；如果有，退出会中断它们。'**
  String get engineAccountSignOutUnknown;

  /// No description provided for @engineAccountSignOutFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能退出，稍后再试'**
  String get engineAccountSignOutFailed;

  /// No description provided for @engineAccountTitle.
  ///
  /// In zh, this message translates to:
  /// **'账号'**
  String get engineAccountTitle;

  /// No description provided for @engineAccountRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get engineAccountRefresh;

  /// No description provided for @engineAccountDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 账号'**
  String get engineAccountDeepSeek;

  /// No description provided for @engineAccountProfileUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'资料暂时读不到'**
  String get engineAccountProfileUnavailable;

  /// No description provided for @engineAccountBalance.
  ///
  /// In zh, this message translates to:
  /// **'余额'**
  String get engineAccountBalance;

  /// No description provided for @engineAccountBalanceHint.
  ///
  /// In zh, this message translates to:
  /// **'账号模型的费用从余额中扣除'**
  String get engineAccountBalanceHint;

  /// No description provided for @engineAccountBalanceEngineOff.
  ///
  /// In zh, this message translates to:
  /// **'引擎未运行，启动后显示余额'**
  String get engineAccountBalanceEngineOff;

  /// No description provided for @engineAccountTopUp.
  ///
  /// In zh, this message translates to:
  /// **'去充值'**
  String get engineAccountTopUp;

  /// No description provided for @engineAccountUsageDetails.
  ///
  /// In zh, this message translates to:
  /// **'用量明细'**
  String get engineAccountUsageDetails;

  /// No description provided for @engineAccountToppedUpBalance.
  ///
  /// In zh, this message translates to:
  /// **'充值余额'**
  String get engineAccountToppedUpBalance;

  /// No description provided for @engineAccountGrantedBalance.
  ///
  /// In zh, this message translates to:
  /// **'赠送余额'**
  String get engineAccountGrantedBalance;

  /// No description provided for @engineAccountBalanceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'余额暂时读不到'**
  String get engineAccountBalanceUnavailable;

  /// No description provided for @engineAccountNoKeyNeeded.
  ///
  /// In zh, this message translates to:
  /// **'登录后无需 API Key'**
  String get engineAccountNoKeyNeeded;

  /// No description provided for @engineAccountUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持账号登录'**
  String get engineAccountUnsupported;

  /// No description provided for @engineAccountSignInDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'用 DeepSeek 账号登录'**
  String get engineAccountSignInDeepSeek;

  /// No description provided for @engineAccountAutoStart.
  ///
  /// In zh, this message translates to:
  /// **'引擎未运行，登录时会自动启动'**
  String get engineAccountAutoStart;

  /// No description provided for @engineAccountReplaceKey.
  ///
  /// In zh, this message translates to:
  /// **'更换 Key'**
  String get engineAccountReplaceKey;

  /// No description provided for @engineAccountClearKeyTitle.
  ///
  /// In zh, this message translates to:
  /// **'清除 API Key？'**
  String get engineAccountClearKeyTitle;

  /// No description provided for @engineAccountClearKeyBody.
  ///
  /// In zh, this message translates to:
  /// **'删除 App 里保存的 Key。本机引擎运行时，引擎里的 Key 也会一并删除。'**
  String get engineAccountClearKeyBody;

  /// No description provided for @engineAccountBrowserFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器'**
  String get engineAccountBrowserFailed;

  /// No description provided for @engineAccountSignInSuccess.
  ///
  /// In zh, this message translates to:
  /// **'登录成功'**
  String get engineAccountSignInSuccess;

  /// No description provided for @engineAccountAlmostReady.
  ///
  /// In zh, this message translates to:
  /// **'马上就好'**
  String get engineAccountAlmostReady;

  /// No description provided for @engineAccountStartingEngine.
  ///
  /// In zh, this message translates to:
  /// **'正在启动引擎'**
  String get engineAccountStartingEngine;

  /// No description provided for @engineAccountOpenSignInNext.
  ///
  /// In zh, this message translates to:
  /// **'随后打开登录页'**
  String get engineAccountOpenSignInNext;

  /// No description provided for @engineAccountPreparingSignIn.
  ///
  /// In zh, this message translates to:
  /// **'正在准备登录'**
  String get engineAccountPreparingSignIn;

  /// No description provided for @engineAccountOpenDeepSeekNext.
  ///
  /// In zh, this message translates to:
  /// **'马上打开 DeepSeek 登录页'**
  String get engineAccountOpenDeepSeekNext;

  /// No description provided for @engineAccountFinishInBrowser.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器中完成登录'**
  String get engineAccountFinishInBrowser;

  /// No description provided for @engineAccountReturnToDsh.
  ///
  /// In zh, this message translates to:
  /// **'登录完成后回到 DSH Go'**
  String get engineAccountReturnToDsh;

  /// No description provided for @engineAccountFinishingSignIn.
  ///
  /// In zh, this message translates to:
  /// **'正在完成登录'**
  String get engineAccountFinishingSignIn;

  /// No description provided for @engineAccountSavingSignIn.
  ///
  /// In zh, this message translates to:
  /// **'正在保存登录信息'**
  String get engineAccountSavingSignIn;

  /// No description provided for @engineAccountAwaitingResult.
  ///
  /// In zh, this message translates to:
  /// **'还没收到登录结果'**
  String get engineAccountAwaitingResult;

  /// No description provided for @engineAccountCopySignInLink.
  ///
  /// In zh, this message translates to:
  /// **'复制登录链接'**
  String get engineAccountCopySignInLink;

  /// No description provided for @engineAccountReopenSignIn.
  ///
  /// In zh, this message translates to:
  /// **'重新打开登录页'**
  String get engineAccountReopenSignIn;

  /// No description provided for @engineAccountCancelSignIn.
  ///
  /// In zh, this message translates to:
  /// **'取消登录'**
  String get engineAccountCancelSignIn;

  /// No description provided for @engineAccountSignInLinkCopied.
  ///
  /// In zh, this message translates to:
  /// **'登录链接已复制'**
  String get engineAccountSignInLinkCopied;

  /// No description provided for @engineAccountSigningIn.
  ///
  /// In zh, this message translates to:
  /// **'登录中'**
  String get engineAccountSigningIn;

  /// No description provided for @engineAccountSignedOut.
  ///
  /// In zh, this message translates to:
  /// **'未登录'**
  String get engineAccountSignedOut;

  /// No description provided for @engineAccountUsageFact.
  ///
  /// In zh, this message translates to:
  /// **'用量从账号余额中扣除'**
  String get engineAccountUsageFact;

  /// No description provided for @engineAccountBrowserFact.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器中登录，密码不经过 DSH'**
  String get engineAccountBrowserFact;

  /// No description provided for @engineAccountCredentialsFact.
  ///
  /// In zh, this message translates to:
  /// **'登录凭据只保存在本机'**
  String get engineAccountCredentialsFact;

  /// No description provided for @engineSubagentTitle.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get engineSubagentTitle;

  /// No description provided for @engineAgentLoopTitle.
  ///
  /// In zh, this message translates to:
  /// **'Agent 循环'**
  String get engineAgentLoopTitle;

  /// No description provided for @engineShellTitle.
  ///
  /// In zh, this message translates to:
  /// **'命令执行'**
  String get engineShellTitle;

  /// No description provided for @engineSearchTitle.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get engineSearchTitle;

  /// No description provided for @engineSearchNewApiBadge.
  ///
  /// In zh, this message translates to:
  /// **'新版 API'**
  String get engineSearchNewApiBadge;

  /// No description provided for @engineGeneralTitle.
  ///
  /// In zh, this message translates to:
  /// **'通用设置'**
  String get engineGeneralTitle;

  /// No description provided for @engineSettingsTitle.
  ///
  /// In zh, this message translates to:
  /// **'引擎参数'**
  String get engineSettingsTitle;

  /// No description provided for @engineSettingsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取设置'**
  String get engineSettingsReadFailed;

  /// No description provided for @engineSettingsRun.
  ///
  /// In zh, this message translates to:
  /// **'运行'**
  String get engineSettingsRun;

  /// No description provided for @engineSettingsPlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get engineSettingsPlugins;

  /// No description provided for @engineSettingsPluginInventory.
  ///
  /// In zh, this message translates to:
  /// **'插件清单'**
  String get engineSettingsPluginInventory;

  /// No description provided for @engineSettingsPluginStopped.
  ///
  /// In zh, this message translates to:
  /// **'插件没有在运行'**
  String get engineSettingsPluginStopped;

  /// No description provided for @engineSettingsEnablePlugin.
  ///
  /// In zh, this message translates to:
  /// **'启用后再来设置'**
  String get engineSettingsEnablePlugin;

  /// No description provided for @engineSettingsNoEditableFields.
  ///
  /// In zh, this message translates to:
  /// **'没有可以在这里改的设置'**
  String get engineSettingsNoEditableFields;

  /// No description provided for @engineFieldRestoreDefault.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认'**
  String get engineFieldRestoreDefault;

  /// No description provided for @engineFieldDecrease.
  ///
  /// In zh, this message translates to:
  /// **'减少'**
  String get engineFieldDecrease;

  /// No description provided for @engineFieldIncrease.
  ///
  /// In zh, this message translates to:
  /// **'增加'**
  String get engineFieldIncrease;

  /// No description provided for @engineFieldRemove.
  ///
  /// In zh, this message translates to:
  /// **'移除'**
  String get engineFieldRemove;

  /// No description provided for @engineFieldShow.
  ///
  /// In zh, this message translates to:
  /// **'显示'**
  String get engineFieldShow;

  /// No description provided for @engineFieldFromEnvironment.
  ///
  /// In zh, this message translates to:
  /// **'由启动环境提供'**
  String get engineFieldFromEnvironment;

  /// No description provided for @engineFieldItem.
  ///
  /// In zh, this message translates to:
  /// **'项'**
  String get engineFieldItem;

  /// No description provided for @engineFieldAlreadyAdded.
  ///
  /// In zh, this message translates to:
  /// **'已经添加过'**
  String get engineFieldAlreadyAdded;

  /// No description provided for @engineFieldEnterName.
  ///
  /// In zh, this message translates to:
  /// **'填写名称'**
  String get engineFieldEnterName;

  /// No description provided for @engineFieldEnterNumber.
  ///
  /// In zh, this message translates to:
  /// **'填写数值'**
  String get engineFieldEnterNumber;

  /// No description provided for @engineFieldValue.
  ///
  /// In zh, this message translates to:
  /// **'值'**
  String get engineFieldValue;

  /// No description provided for @engineFieldNew.
  ///
  /// In zh, this message translates to:
  /// **'新建'**
  String get engineFieldNew;

  /// No description provided for @engineFieldRequired.
  ///
  /// In zh, this message translates to:
  /// **'必填'**
  String get engineFieldRequired;

  /// No description provided for @engineGeneralMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有通用设置'**
  String get engineGeneralMissing;

  /// No description provided for @engineSettingsVersionRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH 0.2.1 或更新版本'**
  String get engineSettingsVersionRequired;

  /// No description provided for @engineGeneralWebDisplay.
  ///
  /// In zh, this message translates to:
  /// **'网页版显示'**
  String get engineGeneralWebDisplay;

  /// No description provided for @engineGeneralWebSending.
  ///
  /// In zh, this message translates to:
  /// **'网页版发送'**
  String get engineGeneralWebSending;

  /// No description provided for @engineGeneralData.
  ///
  /// In zh, this message translates to:
  /// **'数据'**
  String get engineGeneralData;

  /// No description provided for @engineSubagentModelsTitle.
  ///
  /// In zh, this message translates to:
  /// **'子代理模型'**
  String get engineSubagentModelsTitle;

  /// No description provided for @engineChatLogTitle.
  ///
  /// In zh, this message translates to:
  /// **'对话日志'**
  String get engineChatLogTitle;

  /// No description provided for @engineThinkingTranslationTitle.
  ///
  /// In zh, this message translates to:
  /// **'思考过程翻译'**
  String get engineThinkingTranslationTitle;

  /// No description provided for @enginePluginIndexesTitle.
  ///
  /// In zh, this message translates to:
  /// **'插件市场索引'**
  String get enginePluginIndexesTitle;

  /// No description provided for @enginePermissionTitle.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get enginePermissionTitle;

  /// No description provided for @engineAgentPresetsTitle.
  ///
  /// In zh, this message translates to:
  /// **'Agent 预设'**
  String get engineAgentPresetsTitle;

  /// No description provided for @engineDefaultModelTitle.
  ///
  /// In zh, this message translates to:
  /// **'默认模型'**
  String get engineDefaultModelTitle;

  /// No description provided for @engineWebAppearanceTitle.
  ///
  /// In zh, this message translates to:
  /// **'网页版外观'**
  String get engineWebAppearanceTitle;

  /// No description provided for @engineLanguageTitle.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get engineLanguageTitle;

  /// No description provided for @engineFieldCommandTimeout.
  ///
  /// In zh, this message translates to:
  /// **'命令超时'**
  String get engineFieldCommandTimeout;

  /// No description provided for @engineFieldMaxOutput.
  ///
  /// In zh, this message translates to:
  /// **'输出上限'**
  String get engineFieldMaxOutput;

  /// No description provided for @engineFieldMaxTimeout.
  ///
  /// In zh, this message translates to:
  /// **'最长可申请超时'**
  String get engineFieldMaxTimeout;

  /// No description provided for @engineFieldMaxSpill.
  ///
  /// In zh, this message translates to:
  /// **'转存文件上限'**
  String get engineFieldMaxSpill;

  /// No description provided for @engineFieldGracePeriod.
  ///
  /// In zh, this message translates to:
  /// **'终止宽限时间'**
  String get engineFieldGracePeriod;

  /// No description provided for @engineFieldDefaultCwd.
  ///
  /// In zh, this message translates to:
  /// **'默认工作目录'**
  String get engineFieldDefaultCwd;

  /// No description provided for @engineFieldFollowChat.
  ///
  /// In zh, this message translates to:
  /// **'跟随对话'**
  String get engineFieldFollowChat;

  /// No description provided for @engineSubagentMaxDepth.
  ///
  /// In zh, this message translates to:
  /// **'最大递归深度'**
  String get engineSubagentMaxDepth;

  /// No description provided for @engineFieldLayersUnit.
  ///
  /// In zh, this message translates to:
  /// **'层'**
  String get engineFieldLayersUnit;

  /// No description provided for @engineSubagentMaxActive.
  ///
  /// In zh, this message translates to:
  /// **'同时运行上限'**
  String get engineSubagentMaxActive;

  /// No description provided for @engineFieldCountUnit.
  ///
  /// In zh, this message translates to:
  /// **'个'**
  String get engineFieldCountUnit;

  /// No description provided for @engineSubagentAllowModelChoice.
  ///
  /// In zh, this message translates to:
  /// **'允许 AI 给子代理选模型'**
  String get engineSubagentAllowModelChoice;

  /// No description provided for @engineSubagentAllowedModels.
  ///
  /// In zh, this message translates to:
  /// **'可选模型'**
  String get engineSubagentAllowedModels;

  /// No description provided for @engineAgentMaxParallelCalls.
  ///
  /// In zh, this message translates to:
  /// **'每步并行工具调用上限'**
  String get engineAgentMaxParallelCalls;

  /// No description provided for @engineFieldSearchProvider.
  ///
  /// In zh, this message translates to:
  /// **'搜索服务'**
  String get engineFieldSearchProvider;

  /// No description provided for @engineFieldFetchProvider.
  ///
  /// In zh, this message translates to:
  /// **'网页抓取服务'**
  String get engineFieldFetchProvider;

  /// No description provided for @engineFieldBaseUrl.
  ///
  /// In zh, this message translates to:
  /// **'服务地址'**
  String get engineFieldBaseUrl;

  /// No description provided for @engineSearchMaxUses.
  ///
  /// In zh, this message translates to:
  /// **'每次请求最多搜索'**
  String get engineSearchMaxUses;

  /// No description provided for @engineFieldTimesUnit.
  ///
  /// In zh, this message translates to:
  /// **'次'**
  String get engineFieldTimesUnit;

  /// No description provided for @engineSearchHelperModel.
  ///
  /// In zh, this message translates to:
  /// **'辅助模型'**
  String get engineSearchHelperModel;

  /// No description provided for @engineFieldApiVersion.
  ///
  /// In zh, this message translates to:
  /// **'API 版本'**
  String get engineFieldApiVersion;

  /// No description provided for @engineFieldMaxTokens.
  ///
  /// In zh, this message translates to:
  /// **'最大输出长度'**
  String get engineFieldMaxTokens;

  /// No description provided for @engineSearchResultsPerSearch.
  ///
  /// In zh, this message translates to:
  /// **'每次搜索结果数'**
  String get engineSearchResultsPerSearch;

  /// No description provided for @engineFieldResultsUnit.
  ///
  /// In zh, this message translates to:
  /// **'条'**
  String get engineFieldResultsUnit;

  /// No description provided for @engineSearchSendOriginalQuestion.
  ///
  /// In zh, this message translates to:
  /// **'搜索时附带用户原问题'**
  String get engineSearchSendOriginalQuestion;

  /// No description provided for @engineChatLogUpload.
  ///
  /// In zh, this message translates to:
  /// **'向 DeepSeek 上传对话日志'**
  String get engineChatLogUpload;

  /// No description provided for @engineTranslationProvider.
  ///
  /// In zh, this message translates to:
  /// **'翻译服务'**
  String get engineTranslationProvider;

  /// No description provided for @engineTranslationAccountPaid.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 账号（付费）'**
  String get engineTranslationAccountPaid;

  /// No description provided for @engineTranslationApiPaid.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek API（付费）'**
  String get engineTranslationApiPaid;

  /// No description provided for @engineTranslationTargetLanguage.
  ///
  /// In zh, this message translates to:
  /// **'目标语言'**
  String get engineTranslationTargetLanguage;

  /// No description provided for @engineTranslationFollowLanguage.
  ///
  /// In zh, this message translates to:
  /// **'跟随界面语言'**
  String get engineTranslationFollowLanguage;

  /// No description provided for @engineTranslationLanguageHint.
  ///
  /// In zh, this message translates to:
  /// **'填 auto 或语言代码，如 zh、en、ja'**
  String get engineTranslationLanguageHint;

  /// No description provided for @enginePluginIndexSources.
  ///
  /// In zh, this message translates to:
  /// **'索引源'**
  String get enginePluginIndexSources;

  /// No description provided for @enginePluginIndexUrl.
  ///
  /// In zh, this message translates to:
  /// **'索引地址'**
  String get enginePluginIndexUrl;

  /// No description provided for @engineFieldHttpUrlHint.
  ///
  /// In zh, this message translates to:
  /// **'以 http:// 或 https:// 开头的地址'**
  String get engineFieldHttpUrlHint;

  /// No description provided for @enginePermissionNewChat.
  ///
  /// In zh, this message translates to:
  /// **'新对话默认权限'**
  String get enginePermissionNewChat;

  /// No description provided for @engineAgentDefaultPreset.
  ///
  /// In zh, this message translates to:
  /// **'默认 Agent 预设'**
  String get engineAgentDefaultPreset;

  /// No description provided for @engineProviderTitle.
  ///
  /// In zh, this message translates to:
  /// **'渠道'**
  String get engineProviderTitle;

  /// No description provided for @engineModelTitle.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get engineModelTitle;

  /// No description provided for @engineFieldReasoningEffort.
  ///
  /// In zh, this message translates to:
  /// **'思考深度'**
  String get engineFieldReasoningEffort;

  /// No description provided for @engineGeneralShowCodingView.
  ///
  /// In zh, this message translates to:
  /// **'显示代码工作视图'**
  String get engineGeneralShowCodingView;

  /// No description provided for @engineGeneralWorkDetails.
  ///
  /// In zh, this message translates to:
  /// **'工作步骤展示'**
  String get engineGeneralWorkDetails;

  /// No description provided for @engineFieldCompact.
  ///
  /// In zh, this message translates to:
  /// **'简洁'**
  String get engineFieldCompact;

  /// No description provided for @engineFieldStandard.
  ///
  /// In zh, this message translates to:
  /// **'标准'**
  String get engineFieldStandard;

  /// No description provided for @engineFieldDetailed.
  ///
  /// In zh, this message translates to:
  /// **'详细'**
  String get engineFieldDetailed;

  /// No description provided for @engineFieldVerbose.
  ///
  /// In zh, this message translates to:
  /// **'完全展开'**
  String get engineFieldVerbose;

  /// No description provided for @engineGeneralCollapseTiming.
  ///
  /// In zh, this message translates to:
  /// **'工作步骤收起时机'**
  String get engineGeneralCollapseTiming;

  /// No description provided for @engineGeneralOnCompletion.
  ///
  /// In zh, this message translates to:
  /// **'回答结束后'**
  String get engineGeneralOnCompletion;

  /// No description provided for @engineGeneralOnNewMessage.
  ///
  /// In zh, this message translates to:
  /// **'有新消息时'**
  String get engineGeneralOnNewMessage;

  /// No description provided for @engineGeneralPerformanceUsage.
  ///
  /// In zh, this message translates to:
  /// **'性能与用量'**
  String get engineGeneralPerformanceUsage;

  /// No description provided for @engineGeneralLinkOpening.
  ///
  /// In zh, this message translates to:
  /// **'链接打开方式'**
  String get engineGeneralLinkOpening;

  /// No description provided for @engineGeneralAppSidebar.
  ///
  /// In zh, this message translates to:
  /// **'应用内侧栏'**
  String get engineGeneralAppSidebar;

  /// No description provided for @engineGeneralDefaultBrowser.
  ///
  /// In zh, this message translates to:
  /// **'默认浏览器'**
  String get engineGeneralDefaultBrowser;

  /// No description provided for @engineGeneralBusySend.
  ///
  /// In zh, this message translates to:
  /// **'AI 工作时发送'**
  String get engineGeneralBusySend;

  /// No description provided for @engineGeneralQueueSend.
  ///
  /// In zh, this message translates to:
  /// **'排队发送'**
  String get engineGeneralQueueSend;

  /// No description provided for @engineGeneralSteerSend.
  ///
  /// In zh, this message translates to:
  /// **'插话发送'**
  String get engineGeneralSteerSend;

  /// No description provided for @engineFieldTheme.
  ///
  /// In zh, this message translates to:
  /// **'主题'**
  String get engineFieldTheme;

  /// No description provided for @engineFieldFontSize.
  ///
  /// In zh, this message translates to:
  /// **'字号'**
  String get engineFieldFontSize;

  /// No description provided for @engineFieldCodeFontSize.
  ///
  /// In zh, this message translates to:
  /// **'代码字号'**
  String get engineFieldCodeFontSize;

  /// No description provided for @engineFieldTerminalFontSize.
  ///
  /// In zh, this message translates to:
  /// **'终端字号'**
  String get engineFieldTerminalFontSize;

  /// No description provided for @engineFieldTextFont.
  ///
  /// In zh, this message translates to:
  /// **'正文字体'**
  String get engineFieldTextFont;

  /// No description provided for @engineFieldCodeFont.
  ///
  /// In zh, this message translates to:
  /// **'代码字体'**
  String get engineFieldCodeFont;

  /// No description provided for @engineFieldTerminalFont.
  ///
  /// In zh, this message translates to:
  /// **'终端字体'**
  String get engineFieldTerminalFont;

  /// No description provided for @engineFieldInterfaceLanguage.
  ///
  /// In zh, this message translates to:
  /// **'界面语言'**
  String get engineFieldInterfaceLanguage;

  /// No description provided for @engineFieldSecondsUnit.
  ///
  /// In zh, this message translates to:
  /// **'秒'**
  String get engineFieldSecondsUnit;

  /// No description provided for @engineFieldBytesUnit.
  ///
  /// In zh, this message translates to:
  /// **'字节'**
  String get engineFieldBytesUnit;

  /// No description provided for @engineFieldGreaterThanZero.
  ///
  /// In zh, this message translates to:
  /// **'大于 0'**
  String get engineFieldGreaterThanZero;

  /// No description provided for @engineFieldEnterNumeric.
  ///
  /// In zh, this message translates to:
  /// **'请填数字'**
  String get engineFieldEnterNumeric;

  /// No description provided for @engineFieldEnterInteger.
  ///
  /// In zh, this message translates to:
  /// **'请填整数'**
  String get engineFieldEnterInteger;

  /// No description provided for @engineFieldInvalidFormat.
  ///
  /// In zh, this message translates to:
  /// **'格式不对'**
  String get engineFieldInvalidFormat;

  /// No description provided for @engineFieldAddress.
  ///
  /// In zh, this message translates to:
  /// **'地址'**
  String get engineFieldAddress;

  /// No description provided for @engineFieldToken.
  ///
  /// In zh, this message translates to:
  /// **'令牌'**
  String get engineFieldToken;

  /// No description provided for @engineFieldService.
  ///
  /// In zh, this message translates to:
  /// **'服务'**
  String get engineFieldService;

  /// No description provided for @engineFieldTimeout.
  ///
  /// In zh, this message translates to:
  /// **'超时'**
  String get engineFieldTimeout;

  /// No description provided for @engineFieldQuantity.
  ///
  /// In zh, this message translates to:
  /// **'数量'**
  String get engineFieldQuantity;

  /// No description provided for @engineFieldMaxUses.
  ///
  /// In zh, this message translates to:
  /// **'最多次数'**
  String get engineFieldMaxUses;

  /// No description provided for @engineFieldMaxRetries.
  ///
  /// In zh, this message translates to:
  /// **'最多重试次数'**
  String get engineFieldMaxRetries;

  /// No description provided for @engineFieldConcurrency.
  ///
  /// In zh, this message translates to:
  /// **'并发数'**
  String get engineFieldConcurrency;

  /// No description provided for @engineFieldInterval.
  ///
  /// In zh, this message translates to:
  /// **'间隔'**
  String get engineFieldInterval;

  /// No description provided for @engineFieldPrompt.
  ///
  /// In zh, this message translates to:
  /// **'提示词'**
  String get engineFieldPrompt;

  /// No description provided for @engineFieldSystemPrompt.
  ///
  /// In zh, this message translates to:
  /// **'系统提示词'**
  String get engineFieldSystemPrompt;

  /// No description provided for @engineFieldTemperature.
  ///
  /// In zh, this message translates to:
  /// **'温度'**
  String get engineFieldTemperature;

  /// No description provided for @engineFieldDebugMode.
  ///
  /// In zh, this message translates to:
  /// **'调试模式'**
  String get engineFieldDebugMode;

  /// No description provided for @engineFieldVerboseLogs.
  ///
  /// In zh, this message translates to:
  /// **'详细日志'**
  String get engineFieldVerboseLogs;

  /// No description provided for @engineFieldPath.
  ///
  /// In zh, this message translates to:
  /// **'路径'**
  String get engineFieldPath;

  /// No description provided for @engineFieldCwd.
  ///
  /// In zh, this message translates to:
  /// **'工作目录'**
  String get engineFieldCwd;

  /// No description provided for @engineFieldCommand.
  ///
  /// In zh, this message translates to:
  /// **'命令'**
  String get engineFieldCommand;

  /// No description provided for @engineFieldArguments.
  ///
  /// In zh, this message translates to:
  /// **'参数'**
  String get engineFieldArguments;

  /// No description provided for @engineFieldEnvironment.
  ///
  /// In zh, this message translates to:
  /// **'环境变量'**
  String get engineFieldEnvironment;

  /// No description provided for @engineFieldHeaders.
  ///
  /// In zh, this message translates to:
  /// **'请求头'**
  String get engineFieldHeaders;

  /// No description provided for @engineFieldProxy.
  ///
  /// In zh, this message translates to:
  /// **'代理'**
  String get engineFieldProxy;

  /// No description provided for @engineFieldAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get engineFieldAuto;

  /// No description provided for @engineFieldEnabled.
  ///
  /// In zh, this message translates to:
  /// **'开启'**
  String get engineFieldEnabled;

  /// No description provided for @engineFieldOn.
  ///
  /// In zh, this message translates to:
  /// **'开'**
  String get engineFieldOn;

  /// No description provided for @engineFieldOff.
  ///
  /// In zh, this message translates to:
  /// **'关'**
  String get engineFieldOff;

  /// No description provided for @engineFieldLow.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get engineFieldLow;

  /// No description provided for @engineFieldMedium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get engineFieldMedium;

  /// No description provided for @engineFieldHigh.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get engineFieldHigh;

  /// No description provided for @engineFieldMax.
  ///
  /// In zh, this message translates to:
  /// **'最高'**
  String get engineFieldMax;

  /// No description provided for @engineFieldNone.
  ///
  /// In zh, this message translates to:
  /// **'无'**
  String get engineFieldNone;

  /// No description provided for @engineFieldModified.
  ///
  /// In zh, this message translates to:
  /// **'已修改'**
  String get engineFieldModified;

  /// No description provided for @engineFieldLocked.
  ///
  /// In zh, this message translates to:
  /// **'由配置文件固定'**
  String get engineFieldLocked;

  /// No description provided for @engineFieldSharedWithModel.
  ///
  /// In zh, this message translates to:
  /// **'与模型共用'**
  String get engineFieldSharedWithModel;

  /// No description provided for @engineFieldNotConfigured.
  ///
  /// In zh, this message translates to:
  /// **'未配置'**
  String get engineFieldNotConfigured;

  /// No description provided for @engineFieldConfigured.
  ///
  /// In zh, this message translates to:
  /// **'已配置'**
  String get engineFieldConfigured;

  /// No description provided for @engineSettingsMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有这项设置'**
  String get engineSettingsMissing;

  /// No description provided for @engineSettingsPluginDisabled.
  ///
  /// In zh, this message translates to:
  /// **'相关插件未启用'**
  String get engineSettingsPluginDisabled;

  /// No description provided for @engineSettingsReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'引擎设置是只读的，这里只能查看'**
  String get engineSettingsReadOnly;

  /// No description provided for @engineSubagentSavedUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'已保存但当前不可用'**
  String get engineSubagentSavedUnavailable;

  /// No description provided for @engineSubagentKeepOneModel.
  ///
  /// In zh, this message translates to:
  /// **'至少保留一个模型'**
  String get engineSubagentKeepOneModel;

  /// No description provided for @engineSubagentLimits.
  ///
  /// In zh, this message translates to:
  /// **'运行限制'**
  String get engineSubagentLimits;

  /// No description provided for @engineSubagentModelSelection.
  ///
  /// In zh, this message translates to:
  /// **'模型选择'**
  String get engineSubagentModelSelection;

  /// No description provided for @engineSubagentPickFirstModel.
  ///
  /// In zh, this message translates to:
  /// **'选一个模型后生效'**
  String get engineSubagentPickFirstModel;

  /// No description provided for @engineSubagentReadModelsFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取模型'**
  String get engineSubagentReadModelsFailed;

  /// No description provided for @engineSubagentNoModels.
  ///
  /// In zh, this message translates to:
  /// **'还没有可选的模型'**
  String get engineSubagentNoModels;

  /// No description provided for @engineSubagentConnectModel.
  ///
  /// In zh, this message translates to:
  /// **'接入模型'**
  String get engineSubagentConnectModel;

  /// No description provided for @engineSearchDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 搜索'**
  String get engineSearchDeepSeek;

  /// No description provided for @engineSearchNewApi.
  ///
  /// In zh, this message translates to:
  /// **'新版搜索 API'**
  String get engineSearchNewApi;

  /// No description provided for @engineProviderDeleteBody.
  ///
  /// In zh, this message translates to:
  /// **'渠道和它的 API Key 会一起删除，用它的对话需要换个模型。'**
  String get engineProviderDeleteBody;

  /// No description provided for @engineProviderReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取渠道'**
  String get engineProviderReadFailed;

  /// No description provided for @engineProviderGone.
  ///
  /// In zh, this message translates to:
  /// **'这个渠道已不在'**
  String get engineProviderGone;

  /// No description provided for @engineProviderProtocol.
  ///
  /// In zh, this message translates to:
  /// **'协议'**
  String get engineProviderProtocol;

  /// No description provided for @engineProviderEnterKey.
  ///
  /// In zh, this message translates to:
  /// **'填写 API Key'**
  String get engineProviderEnterKey;

  /// No description provided for @engineProviderIssues.
  ///
  /// In zh, this message translates to:
  /// **'问题'**
  String get engineProviderIssues;

  /// No description provided for @engineProviderRejectedConfig.
  ///
  /// In zh, this message translates to:
  /// **'引擎拒绝了部分配置'**
  String get engineProviderRejectedConfig;

  /// No description provided for @engineProviderConnection.
  ///
  /// In zh, this message translates to:
  /// **'连接'**
  String get engineProviderConnection;

  /// No description provided for @engineProviderDefaultUrl.
  ///
  /// In zh, this message translates to:
  /// **'默认地址'**
  String get engineProviderDefaultUrl;

  /// No description provided for @engineProviderKeyNotRequired.
  ///
  /// In zh, this message translates to:
  /// **'不需要'**
  String get engineProviderKeyNotRequired;

  /// No description provided for @engineProviderNoModels.
  ///
  /// In zh, this message translates to:
  /// **'还没有模型'**
  String get engineProviderNoModels;

  /// No description provided for @engineProviderWebConfigured.
  ///
  /// In zh, this message translates to:
  /// **'这个渠道在网页版里配置，这里只能查看和删除'**
  String get engineProviderWebConfigured;

  /// No description provided for @engineProviderDelete.
  ///
  /// In zh, this message translates to:
  /// **'删除渠道'**
  String get engineProviderDelete;

  /// No description provided for @engineProviderConfigFile.
  ///
  /// In zh, this message translates to:
  /// **'由引擎配置文件提供，无法在这里删除'**
  String get engineProviderConfigFile;

  /// No description provided for @engineProviderTesting.
  ///
  /// In zh, this message translates to:
  /// **'正在测试'**
  String get engineProviderTesting;

  /// No description provided for @engineProviderTestConnection.
  ///
  /// In zh, this message translates to:
  /// **'测试连接'**
  String get engineProviderTestConnection;

  /// No description provided for @engineProviderKeyFirst.
  ///
  /// In zh, this message translates to:
  /// **'先填写 API Key'**
  String get engineProviderKeyFirst;

  /// No description provided for @engineProviderNoDiscoveredModels.
  ///
  /// In zh, this message translates to:
  /// **'服务没有列出模型，请手动添加'**
  String get engineProviderNoDiscoveredModels;

  /// No description provided for @engineProviderNeedModel.
  ///
  /// In zh, this message translates to:
  /// **'至少添加一个模型'**
  String get engineProviderNeedModel;

  /// No description provided for @engineProviderEdit.
  ///
  /// In zh, this message translates to:
  /// **'编辑渠道'**
  String get engineProviderEdit;

  /// No description provided for @engineProviderAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加渠道'**
  String get engineProviderAdd;

  /// No description provided for @engineProviderBasicInfo.
  ///
  /// In zh, this message translates to:
  /// **'基本信息'**
  String get engineProviderBasicInfo;

  /// No description provided for @engineProviderNameHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：我的网关'**
  String get engineProviderNameHint;

  /// No description provided for @engineProviderCompatibleProtocol.
  ///
  /// In zh, this message translates to:
  /// **'兼容协议'**
  String get engineProviderCompatibleProtocol;

  /// No description provided for @engineProviderKeepStoredKey.
  ///
  /// In zh, this message translates to:
  /// **'已保存，留空则不修改'**
  String get engineProviderKeepStoredKey;

  /// No description provided for @engineProviderSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get engineProviderSaving;

  /// No description provided for @engineProviderWaitingEngine.
  ///
  /// In zh, this message translates to:
  /// **'等待引擎连接'**
  String get engineProviderWaitingEngine;

  /// No description provided for @engineProviderFetchingModels.
  ///
  /// In zh, this message translates to:
  /// **'正在获取模型'**
  String get engineProviderFetchingModels;

  /// No description provided for @engineProviderFetchModels.
  ///
  /// In zh, this message translates to:
  /// **'获取模型'**
  String get engineProviderFetchModels;

  /// No description provided for @engineProviderAddManually.
  ///
  /// In zh, this message translates to:
  /// **'手动添加'**
  String get engineProviderAddManually;

  /// No description provided for @engineProviderManualModel.
  ///
  /// In zh, this message translates to:
  /// **'手动添加模型'**
  String get engineProviderManualModel;

  /// No description provided for @engineProviderModelId.
  ///
  /// In zh, this message translates to:
  /// **'模型 ID'**
  String get engineProviderModelId;

  /// No description provided for @engineProviderSelectModels.
  ///
  /// In zh, this message translates to:
  /// **'选择模型'**
  String get engineProviderSelectModels;

  /// No description provided for @engineProviderSearchModels.
  ///
  /// In zh, this message translates to:
  /// **'搜索模型'**
  String get engineProviderSearchModels;

  /// No description provided for @engineProviderDeselectAll.
  ///
  /// In zh, this message translates to:
  /// **'全不选'**
  String get engineProviderDeselectAll;

  /// No description provided for @engineProviderSelectAll.
  ///
  /// In zh, this message translates to:
  /// **'全选'**
  String get engineProviderSelectAll;

  /// No description provided for @engineProviderNoMatchingModels.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的模型'**
  String get engineProviderNoMatchingModels;

  /// No description provided for @engineProviderAlreadyAdded.
  ///
  /// In zh, this message translates to:
  /// **'已添加'**
  String get engineProviderAlreadyAdded;

  /// No description provided for @engineProviderReady.
  ///
  /// In zh, this message translates to:
  /// **'可用'**
  String get engineProviderReady;

  /// No description provided for @engineProviderMissingKey.
  ///
  /// In zh, this message translates to:
  /// **'缺少 API Key'**
  String get engineProviderMissingKey;

  /// No description provided for @engineProviderMisconfigured.
  ///
  /// In zh, this message translates to:
  /// **'配置有误'**
  String get engineProviderMisconfigured;

  /// No description provided for @engineProviderInactive.
  ///
  /// In zh, this message translates to:
  /// **'未启用'**
  String get engineProviderInactive;

  /// No description provided for @engineProviderConfiguredInWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页版配置'**
  String get engineProviderConfiguredInWeb;

  /// No description provided for @engineProvidersTitle.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get engineProvidersTitle;

  /// No description provided for @engineProvidersNotConnected.
  ///
  /// In zh, this message translates to:
  /// **'没有连上引擎'**
  String get engineProvidersNotConnected;

  /// No description provided for @engineProvidersStartEngine.
  ///
  /// In zh, this message translates to:
  /// **'引擎运行后可添加渠道'**
  String get engineProvidersStartEngine;

  /// No description provided for @engineProvidersUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这台主机不支持自定义渠道'**
  String get engineProvidersUnsupported;

  /// No description provided for @engineProvidersNotConfiguredHere.
  ///
  /// In zh, this message translates to:
  /// **'未在这台主机上配置'**
  String get engineProvidersNotConfiguredHere;

  /// No description provided for @engineProvidersSigningIn.
  ///
  /// In zh, this message translates to:
  /// **'正在登录…'**
  String get engineProvidersSigningIn;

  /// No description provided for @engineProvidersSignInOrKey.
  ///
  /// In zh, this message translates to:
  /// **'登录账号或填写 API Key'**
  String get engineProvidersSignInOrKey;

  /// No description provided for @engineProvidersOfficial.
  ///
  /// In zh, this message translates to:
  /// **'官方'**
  String get engineProvidersOfficial;

  /// No description provided for @engineProvidersSubscription.
  ///
  /// In zh, this message translates to:
  /// **'订阅'**
  String get engineProvidersSubscription;

  /// No description provided for @engineProvidersCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get engineProvidersCustom;

  /// No description provided for @engineProvidersCompatibleHint.
  ///
  /// In zh, this message translates to:
  /// **'OpenAI、Anthropic 兼容的服务'**
  String get engineProvidersCompatibleHint;

  /// No description provided for @engineProvidersReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'引擎设置是只读的，无法添加'**
  String get engineProvidersReadOnly;

  /// No description provided for @engineSubscriptionSignOutBody.
  ///
  /// In zh, this message translates to:
  /// **'它的模型会从模型选择里移除。'**
  String get engineSubscriptionSignOutBody;

  /// No description provided for @engineSubscriptionNoModels.
  ///
  /// In zh, this message translates to:
  /// **'暂无模型'**
  String get engineSubscriptionNoModels;

  /// No description provided for @engineSubscriptionModelsFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取模型'**
  String get engineSubscriptionModelsFailed;

  /// No description provided for @engineSubscriptionPreparing.
  ///
  /// In zh, this message translates to:
  /// **'正在准备…'**
  String get engineSubscriptionPreparing;

  /// No description provided for @engineSubscriptionCancelled.
  ///
  /// In zh, this message translates to:
  /// **'登录已取消'**
  String get engineSubscriptionCancelled;

  /// No description provided for @engineSubscriptionIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'登录没有完成'**
  String get engineSubscriptionIncomplete;

  /// No description provided for @engineSubscriptionWaitingSignIn.
  ///
  /// In zh, this message translates to:
  /// **'等待登录…'**
  String get engineSubscriptionWaitingSignIn;

  /// No description provided for @engineSubscriptionReopen.
  ///
  /// In zh, this message translates to:
  /// **'重新打开'**
  String get engineSubscriptionReopen;

  /// No description provided for @engineSubscriptionCode.
  ///
  /// In zh, this message translates to:
  /// **'验证码'**
  String get engineSubscriptionCode;

  /// No description provided for @engineSubscriptionWaitingVerification.
  ///
  /// In zh, this message translates to:
  /// **'等待验证…'**
  String get engineSubscriptionWaitingVerification;

  /// No description provided for @engineSubscriptionCopyCode.
  ///
  /// In zh, this message translates to:
  /// **'复制验证码'**
  String get engineSubscriptionCopyCode;

  /// No description provided for @engineSubscriptionOpenVerification.
  ///
  /// In zh, this message translates to:
  /// **'打开验证页'**
  String get engineSubscriptionOpenVerification;

  /// No description provided for @engineSubscriptionPasteRedirect.
  ///
  /// In zh, this message translates to:
  /// **'粘贴跳转后的链接'**
  String get engineSubscriptionPasteRedirect;

  /// No description provided for @engineSubscriptionPasteCode.
  ///
  /// In zh, this message translates to:
  /// **'粘贴授权码'**
  String get engineSubscriptionPasteCode;

  /// No description provided for @engineSubscriptionPasteHere.
  ///
  /// In zh, this message translates to:
  /// **'粘贴到这里'**
  String get engineSubscriptionPasteHere;

  /// No description provided for @engineSubscriptionConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确定'**
  String get engineSubscriptionConfirm;

  /// No description provided for @engineSubscriptionTryAgain.
  ///
  /// In zh, this message translates to:
  /// **'再试一次'**
  String get engineSubscriptionTryAgain;

  /// No description provided for @engineAccountWelcome.
  ///
  /// In zh, this message translates to:
  /// **'欢迎，{name}'**
  String engineAccountWelcome(String name);

  /// No description provided for @engineLayerCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 层'**
  String engineLayerCount(int count);

  /// No description provided for @engineFieldDefaultValue.
  ///
  /// In zh, this message translates to:
  /// **'默认 {value}'**
  String engineFieldDefaultValue(String value);

  /// No description provided for @engineFieldDefaultValueUnit.
  ///
  /// In zh, this message translates to:
  /// **'默认 {value} {unit}'**
  String engineFieldDefaultValueUnit(String value, String unit);

  /// No description provided for @engineFieldCurrentValue.
  ///
  /// In zh, this message translates to:
  /// **'当前 {value}'**
  String engineFieldCurrentValue(String value);

  /// No description provided for @engineFieldRemoveItem.
  ///
  /// In zh, this message translates to:
  /// **'移除 {name}'**
  String engineFieldRemoveItem(String name);

  /// No description provided for @engineFieldAddItem.
  ///
  /// In zh, this message translates to:
  /// **'添加{item}'**
  String engineFieldAddItem(String item);

  /// No description provided for @engineFieldItemIndex.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 项'**
  String engineFieldItemIndex(int index);

  /// No description provided for @engineFieldByteCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 字节'**
  String engineFieldByteCount(int count);

  /// No description provided for @engineFieldHours.
  ///
  /// In zh, this message translates to:
  /// **'{value} 小时'**
  String engineFieldHours(String value);

  /// No description provided for @engineFieldMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{value} 分钟'**
  String engineFieldMinutes(String value);

  /// No description provided for @engineFieldSeconds.
  ///
  /// In zh, this message translates to:
  /// **'{value} 秒'**
  String engineFieldSeconds(String value);

  /// No description provided for @engineFieldMilliseconds.
  ///
  /// In zh, this message translates to:
  /// **'{value} 毫秒'**
  String engineFieldMilliseconds(String value);

  /// No description provided for @engineFieldPositiveMax.
  ///
  /// In zh, this message translates to:
  /// **'大于 0，不超过 {max}'**
  String engineFieldPositiveMax(String max);

  /// No description provided for @engineFieldMin.
  ///
  /// In zh, this message translates to:
  /// **'不小于 {min}'**
  String engineFieldMin(String min);

  /// No description provided for @engineFieldMaxBound.
  ///
  /// In zh, this message translates to:
  /// **'不超过 {max}'**
  String engineFieldMaxBound(String max);

  /// No description provided for @engineFieldBelowMin.
  ///
  /// In zh, this message translates to:
  /// **'不能小于 {min}'**
  String engineFieldBelowMin(String min);

  /// No description provided for @engineFieldAboveMax.
  ///
  /// In zh, this message translates to:
  /// **'不能大于 {max}'**
  String engineFieldAboveMax(String max);

  /// No description provided for @engineFieldMultiple.
  ///
  /// In zh, this message translates to:
  /// **'需是 {step} 的倍数'**
  String engineFieldMultiple(String step);

  /// No description provided for @engineFieldMinCharacters.
  ///
  /// In zh, this message translates to:
  /// **'至少 {count} 个字符'**
  String engineFieldMinCharacters(int count);

  /// No description provided for @engineFieldMaxCharacters.
  ///
  /// In zh, this message translates to:
  /// **'最多 {count} 个字符'**
  String engineFieldMaxCharacters(int count);

  /// No description provided for @engineSubagentUnavailableProvider.
  ///
  /// In zh, this message translates to:
  /// **'{provider} · 当前不可用'**
  String engineSubagentUnavailableProvider(String provider);

  /// No description provided for @engineProviderDeleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除「{name}」？'**
  String engineProviderDeleteTitle(String name);

  /// No description provided for @engineProviderDeleteFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能删除：{error}'**
  String engineProviderDeleteFailed(String error);

  /// No description provided for @engineProviderModelCount.
  ///
  /// In zh, this message translates to:
  /// **'模型 · {count}'**
  String engineProviderModelCount(int count);

  /// No description provided for @engineProviderContext.
  ///
  /// In zh, this message translates to:
  /// **'上下文 {size}'**
  String engineProviderContext(String size);

  /// No description provided for @engineProviderTestPassed.
  ///
  /// In zh, this message translates to:
  /// **'连接正常 · 列出 {count} 个模型'**
  String engineProviderTestPassed(int count);

  /// No description provided for @engineProviderCompletedUrl.
  ///
  /// In zh, this message translates to:
  /// **'已补全为 {url}'**
  String engineProviderCompletedUrl(String url);

  /// No description provided for @engineProviderSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能保存：{error}'**
  String engineProviderSaveFailed(String error);

  /// No description provided for @engineProviderCandidateCount.
  ///
  /// In zh, this message translates to:
  /// **'共 {count} 个'**
  String engineProviderCandidateCount(int count);

  /// No description provided for @engineProviderAddModels.
  ///
  /// In zh, this message translates to:
  /// **'添加 {count} 个模型'**
  String engineProviderAddModels(int count);

  /// No description provided for @engineProviderModels.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个模型'**
  String engineProviderModels(int count);

  /// No description provided for @engineProvidersSummary.
  ///
  /// In zh, this message translates to:
  /// **'{total} 个渠道 · {ready} 个可用'**
  String engineProvidersSummary(int total, int ready);

  /// No description provided for @engineProvidersAccount.
  ///
  /// In zh, this message translates to:
  /// **'账号 · {name}'**
  String engineProvidersAccount(String name);

  /// No description provided for @engineProvidersSignedInAccount.
  ///
  /// In zh, this message translates to:
  /// **'已登录 · {account}'**
  String engineProvidersSignedInAccount(String account);

  /// No description provided for @engineSubscriptionSignIn.
  ///
  /// In zh, this message translates to:
  /// **'登录 {provider}'**
  String engineSubscriptionSignIn(String provider);

  /// No description provided for @engineSubscriptionSignOutTitle.
  ///
  /// In zh, this message translates to:
  /// **'退出 {provider}？'**
  String engineSubscriptionSignOutTitle(String provider);

  /// No description provided for @engineSubscriptionSignOutFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能退出：{error}'**
  String engineSubscriptionSignOutFailed(String error);

  /// No description provided for @engineSubscriptionCodeSemantics.
  ///
  /// In zh, this message translates to:
  /// **'验证码 {code}'**
  String engineSubscriptionCodeSemantics(String code);

  /// No description provided for @engineFieldItemCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String engineFieldItemCount(int count);

  /// No description provided for @engineFieldUseCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 次'**
  String engineFieldUseCount(int count);

  /// No description provided for @engineFieldResultCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条'**
  String engineFieldResultCount(int count);

  /// No description provided for @engineFieldMinCharactersDecimal.
  ///
  /// In zh, this message translates to:
  /// **'至少 {bound} 个字符'**
  String engineFieldMinCharactersDecimal(String bound);

  /// No description provided for @engineFieldMaxCharactersDecimal.
  ///
  /// In zh, this message translates to:
  /// **'最多 {bound} 个字符'**
  String engineFieldMaxCharactersDecimal(String bound);

  /// No description provided for @engineLayerValue.
  ///
  /// In zh, this message translates to:
  /// **'{value} 层'**
  String engineLayerValue(String value);

  /// No description provided for @engineFieldEnterPositiveRange.
  ///
  /// In zh, this message translates to:
  /// **'请填 大于 0，不超过 {max} 之间的数'**
  String engineFieldEnterPositiveRange(String max);

  /// No description provided for @engineFieldEnterBoundedRange.
  ///
  /// In zh, this message translates to:
  /// **'请填 {min}–{max} 之间的数'**
  String engineFieldEnterBoundedRange(String min, String max);

  /// No description provided for @engineModelTokenLimits.
  ///
  /// In zh, this message translates to:
  /// **'Token 上限'**
  String get engineModelTokenLimits;

  /// No description provided for @engineModelContextLength.
  ///
  /// In zh, this message translates to:
  /// **'上下文长度'**
  String get engineModelContextLength;

  /// No description provided for @engineModelMaxOutput.
  ///
  /// In zh, this message translates to:
  /// **'最大输出'**
  String get engineModelMaxOutput;

  /// No description provided for @engineModelDefaultSize.
  ///
  /// In zh, this message translates to:
  /// **'默认 {size}'**
  String engineModelDefaultSize(String size);

  /// No description provided for @engineModelCapabilities.
  ///
  /// In zh, this message translates to:
  /// **'能力'**
  String get engineModelCapabilities;

  /// No description provided for @engineModelInputType.
  ///
  /// In zh, this message translates to:
  /// **'输入类型'**
  String get engineModelInputType;

  /// No description provided for @engineModelInputText.
  ///
  /// In zh, this message translates to:
  /// **'文本'**
  String get engineModelInputText;

  /// No description provided for @engineModelInputTextImage.
  ///
  /// In zh, this message translates to:
  /// **'文本和图片'**
  String get engineModelInputTextImage;

  /// No description provided for @engineModelThinking.
  ///
  /// In zh, this message translates to:
  /// **'思考'**
  String get engineModelThinking;

  /// No description provided for @engineModelVision.
  ///
  /// In zh, this message translates to:
  /// **'识图'**
  String get engineModelVision;

  /// No description provided for @engineModelLevels.
  ///
  /// In zh, this message translates to:
  /// **'可选档位'**
  String get engineModelLevels;

  /// No description provided for @engineModelNeedLevel.
  ///
  /// In zh, this message translates to:
  /// **'至少选一个档位'**
  String get engineModelNeedLevel;

  /// No description provided for @engineFieldEditOnWeb.
  ///
  /// In zh, this message translates to:
  /// **'在网页版编辑此项'**
  String get engineFieldEditOnWeb;

  /// No description provided for @engineSettingsHostChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机已切换，请重新打开设置后编辑。'**
  String get engineSettingsHostChanged;

  /// No description provided for @engineSecretTargetChanged.
  ///
  /// In zh, this message translates to:
  /// **'此项已变化，请重新打开后编辑。'**
  String get engineSecretTargetChanged;

  /// No description provided for @engineSettingsGroupCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项'**
  String engineSettingsGroupCount(int count);

  /// No description provided for @featuresCordisSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'动态插件 · 引擎重启后清空'**
  String get featuresCordisSubtitle;

  /// No description provided for @featuresCordisUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这个连接看不到 Cordis'**
  String get featuresCordisUnavailable;

  /// No description provided for @featuresCordisRemoteUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'经 DSH Remote 中转时不可用'**
  String get featuresCordisRemoteUnavailable;

  /// No description provided for @featuresCordisReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取插件'**
  String get featuresCordisReadFailed;

  /// No description provided for @featuresCordisEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有动态插件'**
  String get featuresCordisEmpty;

  /// No description provided for @featuresCordisEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'插件创建后会出现在这里'**
  String get featuresCordisEmptyHint;

  /// No description provided for @featuresCurrentChat.
  ///
  /// In zh, this message translates to:
  /// **'当前对话'**
  String get featuresCurrentChat;

  /// No description provided for @featuresOtherChats.
  ///
  /// In zh, this message translates to:
  /// **'其他对话'**
  String get featuresOtherChats;

  /// No description provided for @featuresPresetDefaultSet.
  ///
  /// In zh, this message translates to:
  /// **'新对话将使用「{name}」'**
  String featuresPresetDefaultSet(String name);

  /// No description provided for @featuresPresetDefaultFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能设为默认'**
  String get featuresPresetDefaultFailed;

  /// No description provided for @featuresPresetDeleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除「{name}」？'**
  String featuresPresetDeleteTitle(String name);

  /// No description provided for @featuresPresetDeleteHint.
  ///
  /// In zh, this message translates to:
  /// **'新对话不能再选它，已开始的对话不受影响。'**
  String get featuresPresetDeleteHint;

  /// No description provided for @featuresDeleted.
  ///
  /// In zh, this message translates to:
  /// **'已删除'**
  String get featuresDeleted;

  /// No description provided for @featuresDeleteFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能删除'**
  String get featuresDeleteFailed;

  /// No description provided for @featuresPresetAlreadyDefault.
  ///
  /// In zh, this message translates to:
  /// **'已是新对话默认'**
  String get featuresPresetAlreadyDefault;

  /// No description provided for @featuresPresetSetDefault.
  ///
  /// In zh, this message translates to:
  /// **'设为新对话默认'**
  String get featuresPresetSetDefault;

  /// No description provided for @featuresPresetViewConfig.
  ///
  /// In zh, this message translates to:
  /// **'查看配置'**
  String get featuresPresetViewConfig;

  /// No description provided for @featuresPresetDuplicate.
  ///
  /// In zh, this message translates to:
  /// **'复制为新预设'**
  String get featuresPresetDuplicate;

  /// No description provided for @featuresPresetDefaultDeleteHint.
  ///
  /// In zh, this message translates to:
  /// **'先把别的预设设为新对话默认'**
  String get featuresPresetDefaultDeleteHint;

  /// No description provided for @featuresAgentPresets.
  ///
  /// In zh, this message translates to:
  /// **'Agent 预设'**
  String get featuresAgentPresets;

  /// No description provided for @featuresAgentPresetsSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'新对话的工具与工作方式'**
  String get featuresAgentPresetsSubtitle;

  /// No description provided for @featuresNew.
  ///
  /// In zh, this message translates to:
  /// **'新建'**
  String get featuresNew;

  /// No description provided for @featuresPresetsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取 Agent 预设'**
  String get featuresPresetsReadFailed;

  /// No description provided for @featuresLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载失败'**
  String get featuresLoadFailed;

  /// No description provided for @featuresNewChatDefault.
  ///
  /// In zh, this message translates to:
  /// **'新对话默认'**
  String get featuresNewChatDefault;

  /// No description provided for @featuresEmptyDocument.
  ///
  /// In zh, this message translates to:
  /// **'（空）'**
  String get featuresEmptyDocument;

  /// No description provided for @featuresReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取'**
  String get featuresReadFailed;

  /// No description provided for @featuresTodayTime.
  ///
  /// In zh, this message translates to:
  /// **'今天 {time}'**
  String featuresTodayTime(String time);

  /// No description provided for @featuresTomorrowTime.
  ///
  /// In zh, this message translates to:
  /// **'明天 {time}'**
  String featuresTomorrowTime(String time);

  /// No description provided for @featuresYesterdayTime.
  ///
  /// In zh, this message translates to:
  /// **'昨天 {time}'**
  String featuresYesterdayTime(String time);

  /// No description provided for @featuresScheduleSummaryNext.
  ///
  /// In zh, this message translates to:
  /// **'{rule} · 下次 {time}'**
  String featuresScheduleSummaryNext(String rule, String time);

  /// No description provided for @featuresEnded.
  ///
  /// In zh, this message translates to:
  /// **'已结束'**
  String get featuresEnded;

  /// No description provided for @featuresScheduleSummaryEnded.
  ///
  /// In zh, this message translates to:
  /// **'已结束 · {time} 运行过'**
  String featuresScheduleSummaryEnded(String time);

  /// No description provided for @featuresJobElapsed.
  ///
  /// In zh, this message translates to:
  /// **'已运行 {span}'**
  String featuresJobElapsed(String span);

  /// No description provided for @featuresJobDuration.
  ///
  /// In zh, this message translates to:
  /// **'用时 {span}'**
  String featuresJobDuration(String span);

  /// No description provided for @featuresPermissionReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'仅可查看'**
  String get featuresPermissionReadOnly;

  /// No description provided for @featuresPermissionWorkspaceWrite.
  ///
  /// In zh, this message translates to:
  /// **'工作区内修改'**
  String get featuresPermissionWorkspaceWrite;

  /// No description provided for @featuresPermissionFullAccess.
  ///
  /// In zh, this message translates to:
  /// **'完全权限'**
  String get featuresPermissionFullAccess;

  /// No description provided for @featuresPermissionAutoReview.
  ///
  /// In zh, this message translates to:
  /// **'自动审查'**
  String get featuresPermissionAutoReview;

  /// No description provided for @featuresPermissionCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get featuresPermissionCustom;

  /// No description provided for @featuresPermissionReadOnlyHint.
  ///
  /// In zh, this message translates to:
  /// **'只看文件，不做修改'**
  String get featuresPermissionReadOnlyHint;

  /// No description provided for @featuresPermissionWorkspaceWriteHint.
  ///
  /// In zh, this message translates to:
  /// **'可改工作区内的文件，越界先问你'**
  String get featuresPermissionWorkspaceWriteHint;

  /// No description provided for @featuresPermissionFullAccessHint.
  ///
  /// In zh, this message translates to:
  /// **'不再确认，直接执行'**
  String get featuresPermissionFullAccessHint;

  /// No description provided for @featuresPermissionAutoReviewHint.
  ///
  /// In zh, this message translates to:
  /// **'由模型逐次审查，拿不准再问你'**
  String get featuresPermissionAutoReviewHint;

  /// No description provided for @featuresPresetStandard.
  ///
  /// In zh, this message translates to:
  /// **'标准模式'**
  String get featuresPresetStandard;

  /// No description provided for @featuresPresetPtc.
  ///
  /// In zh, this message translates to:
  /// **'PTC 模式'**
  String get featuresPresetPtc;

  /// No description provided for @featuresPresetMinimal.
  ///
  /// In zh, this message translates to:
  /// **'极简模式'**
  String get featuresPresetMinimal;

  /// No description provided for @featuresPresetCreator.
  ///
  /// In zh, this message translates to:
  /// **'创造模式'**
  String get featuresPresetCreator;

  /// No description provided for @featuresPresetStandardDescription.
  ///
  /// In zh, this message translates to:
  /// **'代码、文件和资料，适合大多数任务'**
  String get featuresPresetStandardDescription;

  /// No description provided for @featuresPresetPtcDescription.
  ///
  /// In zh, this message translates to:
  /// **'批量调用工具，再筛选、统计、汇总'**
  String get featuresPresetPtcDescription;

  /// No description provided for @featuresPresetMinimalDescription.
  ///
  /// In zh, this message translates to:
  /// **'只用终端和读图，适合测试对比'**
  String get featuresPresetMinimalDescription;

  /// No description provided for @featuresPresetCreatorDescription.
  ///
  /// In zh, this message translates to:
  /// **'让 Agent 写插件，定制 DSH 本身'**
  String get featuresPresetCreatorDescription;

  /// No description provided for @featuresHostUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上「{name}」'**
  String featuresHostUnreachable(String name);

  /// No description provided for @featuresHostConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接「{name}」…'**
  String featuresHostConnecting(String name);

  /// No description provided for @featuresJobs.
  ///
  /// In zh, this message translates to:
  /// **'后台任务'**
  String get featuresJobs;

  /// No description provided for @featuresJobsSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'引擎重启后清空'**
  String get featuresJobsSubtitle;

  /// No description provided for @featuresJobsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取后台任务'**
  String get featuresJobsReadFailed;

  /// No description provided for @featuresJobsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有后台任务'**
  String get featuresJobsEmpty;

  /// No description provided for @featuresJobsEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'开发服务器这类命令会在这里'**
  String get featuresJobsEmptyHint;

  /// No description provided for @featuresJobsEndedCount.
  ///
  /// In zh, this message translates to:
  /// **'已结束 · {count}'**
  String featuresJobsEndedCount(int count);

  /// No description provided for @featuresJobStopTitle.
  ///
  /// In zh, this message translates to:
  /// **'停止这个任务？'**
  String get featuresJobStopTitle;

  /// No description provided for @featuresJobAlreadyEnded.
  ///
  /// In zh, this message translates to:
  /// **'任务已经结束了'**
  String get featuresJobAlreadyEnded;

  /// No description provided for @featuresJobStopFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能停止'**
  String get featuresJobStopFailed;

  /// No description provided for @featuresJobOutput.
  ///
  /// In zh, this message translates to:
  /// **'任务输出'**
  String get featuresJobOutput;

  /// No description provided for @featuresOutput.
  ///
  /// In zh, this message translates to:
  /// **'输出'**
  String get featuresOutput;

  /// No description provided for @featuresJobRecentLines.
  ///
  /// In zh, this message translates to:
  /// **'最近 {count} 行'**
  String featuresJobRecentLines(int count);

  /// No description provided for @featuresJobOutputSubject.
  ///
  /// In zh, this message translates to:
  /// **'DSH 任务输出'**
  String get featuresJobOutputSubject;

  /// No description provided for @featuresJobOutputReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取输出'**
  String get featuresJobOutputReadFailed;

  /// No description provided for @featuresJobOutputWaiting.
  ///
  /// In zh, this message translates to:
  /// **'等待输出…'**
  String get featuresJobOutputWaiting;

  /// No description provided for @featuresJobOutputEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有输出'**
  String get featuresJobOutputEmpty;

  /// No description provided for @featuresPermissionAutoTitle.
  ///
  /// In zh, this message translates to:
  /// **'开启自动审查？'**
  String get featuresPermissionAutoTitle;

  /// No description provided for @featuresPermissionAutoWarning.
  ///
  /// In zh, this message translates to:
  /// **'每次操作由模型判断放不放行，可能误判。'**
  String get featuresPermissionAutoWarning;

  /// No description provided for @featuresSwitchFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能切换'**
  String get featuresSwitchFailed;

  /// No description provided for @featuresPermissions.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get featuresPermissions;

  /// No description provided for @featuresPermissionsSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'执行命令、修改文件前，要不要先问你'**
  String get featuresPermissionsSubtitle;

  /// No description provided for @featuresPermissionsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取权限设置'**
  String get featuresPermissionsReadFailed;

  /// No description provided for @featuresPermissionCustomHint.
  ///
  /// In zh, this message translates to:
  /// **'当前用的是自定义权限，选预设会替换它'**
  String get featuresPermissionCustomHint;

  /// No description provided for @featuresModuleInstructions.
  ///
  /// In zh, this message translates to:
  /// **'工作区指令加载'**
  String get featuresModuleInstructions;

  /// No description provided for @featuresModuleTime.
  ///
  /// In zh, this message translates to:
  /// **'时间感知'**
  String get featuresModuleTime;

  /// No description provided for @featuresModuleBash.
  ///
  /// In zh, this message translates to:
  /// **'Bash 命令工具'**
  String get featuresModuleBash;

  /// No description provided for @featuresModulePersistentBash.
  ///
  /// In zh, this message translates to:
  /// **'持久 Bash 工具'**
  String get featuresModulePersistentBash;

  /// No description provided for @featuresModulePowerShell.
  ///
  /// In zh, this message translates to:
  /// **'PowerShell 命令工具'**
  String get featuresModulePowerShell;

  /// No description provided for @featuresModuleFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件读写工具'**
  String get featuresModuleFiles;

  /// No description provided for @featuresModuleFileSearch.
  ///
  /// In zh, this message translates to:
  /// **'文件搜索工具'**
  String get featuresModuleFileSearch;

  /// No description provided for @featuresModuleJobs.
  ///
  /// In zh, this message translates to:
  /// **'后台任务工具'**
  String get featuresModuleJobs;

  /// No description provided for @featuresModuleSchedule.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务工具'**
  String get featuresModuleSchedule;

  /// No description provided for @featuresModuleLocalSkills.
  ///
  /// In zh, this message translates to:
  /// **'本地技能加载'**
  String get featuresModuleLocalSkills;

  /// No description provided for @featuresModuleSkillTool.
  ///
  /// In zh, this message translates to:
  /// **'技能加载工具'**
  String get featuresModuleSkillTool;

  /// No description provided for @featuresModuleGoalCommand.
  ///
  /// In zh, this message translates to:
  /// **'目标管理命令'**
  String get featuresModuleGoalCommand;

  /// No description provided for @featuresModuleGoalTool.
  ///
  /// In zh, this message translates to:
  /// **'目标管理工具'**
  String get featuresModuleGoalTool;

  /// No description provided for @featuresModulePlan.
  ///
  /// In zh, this message translates to:
  /// **'计划模式'**
  String get featuresModulePlan;

  /// No description provided for @featuresModuleCompaction.
  ///
  /// In zh, this message translates to:
  /// **'上下文压缩'**
  String get featuresModuleCompaction;

  /// No description provided for @featuresModuleCompactCommand.
  ///
  /// In zh, this message translates to:
  /// **'上下文压缩命令'**
  String get featuresModuleCompactCommand;

  /// No description provided for @featuresModuleAskUser.
  ///
  /// In zh, this message translates to:
  /// **'向用户提问工具'**
  String get featuresModuleAskUser;

  /// No description provided for @featuresModuleTodo.
  ///
  /// In zh, this message translates to:
  /// **'待办清单工具'**
  String get featuresModuleTodo;

  /// No description provided for @featuresModuleWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页搜索与读取工具'**
  String get featuresModuleWeb;

  /// No description provided for @featuresModulePresent.
  ///
  /// In zh, this message translates to:
  /// **'文件交付工具'**
  String get featuresModulePresent;

  /// No description provided for @featuresModuleCordis.
  ///
  /// In zh, this message translates to:
  /// **'插件 API 查询工具'**
  String get featuresModuleCordis;

  /// No description provided for @featuresModuleSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理委派工具'**
  String get featuresModuleSubagent;

  /// No description provided for @featuresModuleSubagentControl.
  ///
  /// In zh, this message translates to:
  /// **'子代理控制工具'**
  String get featuresModuleSubagentControl;

  /// No description provided for @featuresModuleWorkflow.
  ///
  /// In zh, this message translates to:
  /// **'工作流工具'**
  String get featuresModuleWorkflow;

  /// No description provided for @featuresModulePluginManager.
  ///
  /// In zh, this message translates to:
  /// **'插件管理工具'**
  String get featuresModulePluginManager;

  /// No description provided for @featuresModulePluginMarket.
  ///
  /// In zh, this message translates to:
  /// **'插件市场工具'**
  String get featuresModulePluginMarket;

  /// No description provided for @featuresModuleToolCalls.
  ///
  /// In zh, this message translates to:
  /// **'工具调用方式'**
  String get featuresModuleToolCalls;

  /// No description provided for @featuresModuleTerminal.
  ///
  /// In zh, this message translates to:
  /// **'持久终端服务'**
  String get featuresModuleTerminal;

  /// No description provided for @featuresModulePersona.
  ///
  /// In zh, this message translates to:
  /// **'智能体角色设定'**
  String get featuresModulePersona;

  /// No description provided for @featuresGroupDelegation.
  ///
  /// In zh, this message translates to:
  /// **'子代理委派'**
  String get featuresGroupDelegation;

  /// No description provided for @featuresGroupTerminal.
  ///
  /// In zh, this message translates to:
  /// **'持久终端'**
  String get featuresGroupTerminal;

  /// No description provided for @featuresPresetIdRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写标识'**
  String get featuresPresetIdRequired;

  /// No description provided for @featuresPresetIdLength.
  ///
  /// In zh, this message translates to:
  /// **'最多 40 个字符'**
  String get featuresPresetIdLength;

  /// No description provided for @featuresPresetIdFormat.
  ///
  /// In zh, this message translates to:
  /// **'只用小写字母、数字和连字符'**
  String get featuresPresetIdFormat;

  /// No description provided for @featuresPresetIdTaken.
  ///
  /// In zh, this message translates to:
  /// **'这个标识已被使用'**
  String get featuresPresetIdTaken;

  /// No description provided for @featuresPresetCopyName.
  ///
  /// In zh, this message translates to:
  /// **'{name} 副本'**
  String featuresPresetCopyName(String name);

  /// No description provided for @featuresPresetBasedOn.
  ///
  /// In zh, this message translates to:
  /// **'基于'**
  String get featuresPresetBasedOn;

  /// No description provided for @featuresNameRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写名称'**
  String get featuresNameRequired;

  /// No description provided for @featuresCreatorOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开创造模式'**
  String get featuresCreatorOpenFailed;

  /// No description provided for @featuresPresetNameHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：代码审查'**
  String get featuresPresetNameHint;

  /// No description provided for @featuresPresetId.
  ///
  /// In zh, this message translates to:
  /// **'标识'**
  String get featuresPresetId;

  /// No description provided for @featuresPresetIdHint.
  ///
  /// In zh, this message translates to:
  /// **'小写字母、数字和连字符'**
  String get featuresPresetIdHint;

  /// No description provided for @featuresPresetDescription.
  ///
  /// In zh, this message translates to:
  /// **'说明'**
  String get featuresPresetDescription;

  /// No description provided for @featuresPresetDescriptionHint.
  ///
  /// In zh, this message translates to:
  /// **'一句话说明它适合做什么'**
  String get featuresPresetDescriptionHint;

  /// No description provided for @featuresPresetConfigReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取预设配置'**
  String get featuresPresetConfigReadFailed;

  /// No description provided for @featuresPresetCreateTitle.
  ///
  /// In zh, this message translates to:
  /// **'新建 Agent 预设'**
  String get featuresPresetCreateTitle;

  /// No description provided for @featuresPresetDuplicateTitle.
  ///
  /// In zh, this message translates to:
  /// **'复制 Agent 预设'**
  String get featuresPresetDuplicateTitle;

  /// No description provided for @featuresPresetEditTitle.
  ///
  /// In zh, this message translates to:
  /// **'编辑 Agent 预设'**
  String get featuresPresetEditTitle;

  /// No description provided for @featuresCreatorOpening.
  ///
  /// In zh, this message translates to:
  /// **'正在打开创造模式'**
  String get featuresCreatorOpening;

  /// No description provided for @featuresWaitingEngine.
  ///
  /// In zh, this message translates to:
  /// **'等待引擎连接'**
  String get featuresWaitingEngine;

  /// No description provided for @featuresCreatorUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'创造模式不可用'**
  String get featuresCreatorUnavailable;

  /// No description provided for @featuresPresetStartUpdate.
  ///
  /// In zh, this message translates to:
  /// **'开始更新'**
  String get featuresPresetStartUpdate;

  /// No description provided for @featuresPresetStartCreate.
  ///
  /// In zh, this message translates to:
  /// **'开始创建'**
  String get featuresPresetStartCreate;

  /// No description provided for @featuresPresetSystemPrompt.
  ///
  /// In zh, this message translates to:
  /// **'系统提示'**
  String get featuresPresetSystemPrompt;

  /// No description provided for @featuresPresetSystemPromptHint.
  ///
  /// In zh, this message translates to:
  /// **'你是谁、怎么工作'**
  String get featuresPresetSystemPromptHint;

  /// No description provided for @featuresPresetReplaceSystemPrompt.
  ///
  /// In zh, this message translates to:
  /// **'完整替换系统提示'**
  String get featuresPresetReplaceSystemPrompt;

  /// No description provided for @featuresPresetTools.
  ///
  /// In zh, this message translates to:
  /// **'工具'**
  String get featuresPresetTools;

  /// No description provided for @featuresSkills.
  ///
  /// In zh, this message translates to:
  /// **'技能'**
  String get featuresSkills;

  /// No description provided for @featuresPresetContextModes.
  ///
  /// In zh, this message translates to:
  /// **'上下文与模式'**
  String get featuresPresetContextModes;

  /// No description provided for @featuresCronMinute.
  ///
  /// In zh, this message translates to:
  /// **'分钟'**
  String get featuresCronMinute;

  /// No description provided for @featuresCronHour.
  ///
  /// In zh, this message translates to:
  /// **'小时'**
  String get featuresCronHour;

  /// No description provided for @featuresDate.
  ///
  /// In zh, this message translates to:
  /// **'日期'**
  String get featuresDate;

  /// No description provided for @featuresCronMonth.
  ///
  /// In zh, this message translates to:
  /// **'月份'**
  String get featuresCronMonth;

  /// No description provided for @featuresCronWeekday.
  ///
  /// In zh, this message translates to:
  /// **'星期'**
  String get featuresCronWeekday;

  /// No description provided for @featuresCronRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写 5 段 Cron 表达式'**
  String get featuresCronRequired;

  /// No description provided for @featuresCronWhitespace.
  ///
  /// In zh, this message translates to:
  /// **'首尾不能有空格'**
  String get featuresCronWhitespace;

  /// No description provided for @featuresCronFieldCount.
  ///
  /// In zh, this message translates to:
  /// **'需要 5 段，现在是 {count} 段'**
  String featuresCronFieldCount(int count);

  /// No description provided for @featuresCronInvalidField.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 段（{name}）写法不对'**
  String featuresCronInvalidField(int index, String name);

  /// No description provided for @featuresWeekdayMon.
  ///
  /// In zh, this message translates to:
  /// **'一'**
  String get featuresWeekdayMon;

  /// No description provided for @featuresWeekdayTue.
  ///
  /// In zh, this message translates to:
  /// **'二'**
  String get featuresWeekdayTue;

  /// No description provided for @featuresWeekdayWed.
  ///
  /// In zh, this message translates to:
  /// **'三'**
  String get featuresWeekdayWed;

  /// No description provided for @featuresWeekdayThu.
  ///
  /// In zh, this message translates to:
  /// **'四'**
  String get featuresWeekdayThu;

  /// No description provided for @featuresWeekdayFri.
  ///
  /// In zh, this message translates to:
  /// **'五'**
  String get featuresWeekdayFri;

  /// No description provided for @featuresWeekdaySat.
  ///
  /// In zh, this message translates to:
  /// **'六'**
  String get featuresWeekdaySat;

  /// No description provided for @featuresWeekdaySun.
  ///
  /// In zh, this message translates to:
  /// **'日'**
  String get featuresWeekdaySun;

  /// No description provided for @featuresMonthJan.
  ///
  /// In zh, this message translates to:
  /// **'一月'**
  String get featuresMonthJan;

  /// No description provided for @featuresMonthFeb.
  ///
  /// In zh, this message translates to:
  /// **'二月'**
  String get featuresMonthFeb;

  /// No description provided for @featuresMonthMar.
  ///
  /// In zh, this message translates to:
  /// **'三月'**
  String get featuresMonthMar;

  /// No description provided for @featuresMonthApr.
  ///
  /// In zh, this message translates to:
  /// **'四月'**
  String get featuresMonthApr;

  /// No description provided for @featuresMonthMay.
  ///
  /// In zh, this message translates to:
  /// **'五月'**
  String get featuresMonthMay;

  /// No description provided for @featuresMonthJun.
  ///
  /// In zh, this message translates to:
  /// **'六月'**
  String get featuresMonthJun;

  /// No description provided for @featuresMonthJul.
  ///
  /// In zh, this message translates to:
  /// **'七月'**
  String get featuresMonthJul;

  /// No description provided for @featuresMonthAug.
  ///
  /// In zh, this message translates to:
  /// **'八月'**
  String get featuresMonthAug;

  /// No description provided for @featuresMonthSep.
  ///
  /// In zh, this message translates to:
  /// **'九月'**
  String get featuresMonthSep;

  /// No description provided for @featuresMonthOct.
  ///
  /// In zh, this message translates to:
  /// **'十月'**
  String get featuresMonthOct;

  /// No description provided for @featuresMonthNov.
  ///
  /// In zh, this message translates to:
  /// **'十一月'**
  String get featuresMonthNov;

  /// No description provided for @featuresMonthDec.
  ///
  /// In zh, this message translates to:
  /// **'十二月'**
  String get featuresMonthDec;

  /// No description provided for @featuresWeekdayName.
  ///
  /// In zh, this message translates to:
  /// **'周{day}'**
  String featuresWeekdayName(String day);

  /// No description provided for @featuresCronWeekdayRange.
  ///
  /// In zh, this message translates to:
  /// **'{first}至{last}'**
  String featuresCronWeekdayRange(String first, String last);

  /// No description provided for @featuresCronEveryDay.
  ///
  /// In zh, this message translates to:
  /// **'每天{months}'**
  String featuresCronEveryDay(String months);

  /// No description provided for @featuresCronMonthDays.
  ///
  /// In zh, this message translates to:
  /// **'每月 {days} 日{months}'**
  String featuresCronMonthDays(String days, String months);

  /// No description provided for @featuresCronMonthDaysAndWeekdays.
  ///
  /// In zh, this message translates to:
  /// **'每月 {days} 日且{weekdays}{months}'**
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months);

  /// No description provided for @featuresCronMonthDaysOrWeekdays.
  ///
  /// In zh, this message translates to:
  /// **'每月 {days} 日或{weekdays}{months}'**
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months);

  /// No description provided for @featuresCronHourRange.
  ///
  /// In zh, this message translates to:
  /// **'{first} 至 {last}'**
  String featuresCronHourRange(String first, String last);

  /// No description provided for @featuresEveryMinute.
  ///
  /// In zh, this message translates to:
  /// **'每分钟'**
  String get featuresEveryMinute;

  /// No description provided for @featuresCronEveryMinutes.
  ///
  /// In zh, this message translates to:
  /// **'每 {count} 分钟'**
  String featuresCronEveryMinutes(int count);

  /// No description provided for @featuresEveryHour.
  ///
  /// In zh, this message translates to:
  /// **'每小时'**
  String get featuresEveryHour;

  /// No description provided for @featuresCronHourlyMinutes.
  ///
  /// In zh, this message translates to:
  /// **'每小时的第 {minutes} 分钟'**
  String featuresCronHourlyMinutes(String minutes);

  /// No description provided for @featuresCronHoursEveryMinute.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 点的每分钟'**
  String featuresCronHoursEveryMinute(String hours);

  /// No description provided for @featuresCronHoursEveryMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 点内每 {count} 分钟'**
  String featuresCronHoursEveryMinutes(String hours, int count);

  /// No description provided for @featuresCronEveryHours.
  ///
  /// In zh, this message translates to:
  /// **'每 {count} 小时'**
  String featuresCronEveryHours(int count);

  /// No description provided for @featuresCronHoursMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 点的第 {minutes} 分钟'**
  String featuresCronHoursMinutes(String hours, String minutes);

  /// No description provided for @featuresRepeatDaily.
  ///
  /// In zh, this message translates to:
  /// **'每天'**
  String get featuresRepeatDaily;

  /// No description provided for @featuresRepeatWeekdays.
  ///
  /// In zh, this message translates to:
  /// **'工作日'**
  String get featuresRepeatWeekdays;

  /// No description provided for @featuresRepeatWeekly.
  ///
  /// In zh, this message translates to:
  /// **'每周'**
  String get featuresRepeatWeekly;

  /// No description provided for @featuresRepeatMonthly.
  ///
  /// In zh, this message translates to:
  /// **'每月'**
  String get featuresRepeatMonthly;

  /// No description provided for @featuresRepeatInterval.
  ///
  /// In zh, this message translates to:
  /// **'间隔'**
  String get featuresRepeatInterval;

  /// No description provided for @featuresRepeatOnce.
  ///
  /// In zh, this message translates to:
  /// **'仅一次'**
  String get featuresRepeatOnce;

  /// No description provided for @featuresRepeatAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'高级'**
  String get featuresRepeatAdvanced;

  /// No description provided for @featuresIntervalSeconds.
  ///
  /// In zh, this message translates to:
  /// **'秒'**
  String get featuresIntervalSeconds;

  /// No description provided for @featuresZoneUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'时区不可用'**
  String get featuresZoneUnavailable;

  /// No description provided for @featuresChooseDay.
  ///
  /// In zh, this message translates to:
  /// **'至少选一天'**
  String get featuresChooseDay;

  /// No description provided for @featuresIntervalMinimum.
  ///
  /// In zh, this message translates to:
  /// **'间隔至少为 1'**
  String get featuresIntervalMinimum;

  /// No description provided for @featuresMinimumMinute.
  ///
  /// In zh, this message translates to:
  /// **'至少 1 分钟'**
  String get featuresMinimumMinute;

  /// No description provided for @featuresTimeDoesNotExist.
  ///
  /// In zh, this message translates to:
  /// **'这个时间在该时区不存在'**
  String get featuresTimeDoesNotExist;

  /// No description provided for @featuresChooseFutureTime.
  ///
  /// In zh, this message translates to:
  /// **'选一个以后的时间'**
  String get featuresChooseFutureTime;

  /// No description provided for @featuresCronNeverRuns.
  ///
  /// In zh, this message translates to:
  /// **'这个表达式不会运行'**
  String get featuresCronNeverRuns;

  /// No description provided for @featuresRuleDaily.
  ///
  /// In zh, this message translates to:
  /// **'每天 {time}'**
  String featuresRuleDaily(String time);

  /// No description provided for @featuresRuleWeekdays.
  ///
  /// In zh, this message translates to:
  /// **'每个工作日 {time}'**
  String featuresRuleWeekdays(String time);

  /// No description provided for @featuresRuleWeekends.
  ///
  /// In zh, this message translates to:
  /// **'每个周末 {time}'**
  String featuresRuleWeekends(String time);

  /// No description provided for @featuresRuleWeekly.
  ///
  /// In zh, this message translates to:
  /// **'每周{days} {time}'**
  String featuresRuleWeekly(String days, String time);

  /// No description provided for @featuresRuleMonthly.
  ///
  /// In zh, this message translates to:
  /// **'每月 {days} 日 {time}'**
  String featuresRuleMonthly(String days, String time);

  /// No description provided for @featuresRepeat.
  ///
  /// In zh, this message translates to:
  /// **'重复'**
  String get featuresRepeat;

  /// No description provided for @featuresChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get featuresChat;

  /// No description provided for @featuresWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'工作区'**
  String get featuresWorkspace;

  /// No description provided for @featuresInstructionRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写指令'**
  String get featuresInstructionRequired;

  /// No description provided for @featuresScheduleSaveError.
  ///
  /// In zh, this message translates to:
  /// **'没能保存：{reason}'**
  String featuresScheduleSaveError(String reason);

  /// No description provided for @featuresScheduleCreateError.
  ///
  /// In zh, this message translates to:
  /// **'没能创建：{reason}'**
  String featuresScheduleCreateError(String reason);

  /// No description provided for @featuresScheduleNameHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：每日站会提醒'**
  String get featuresScheduleNameHint;

  /// No description provided for @featuresScheduleInstruction.
  ///
  /// In zh, this message translates to:
  /// **'指令'**
  String get featuresScheduleInstruction;

  /// No description provided for @featuresScheduleInstructionHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：整理昨天的提交，发我摘要'**
  String get featuresScheduleInstructionHint;

  /// No description provided for @featuresScheduleRunTime.
  ///
  /// In zh, this message translates to:
  /// **'运行时间'**
  String get featuresScheduleRunTime;

  /// No description provided for @featuresScheduleOpenChat.
  ///
  /// In zh, this message translates to:
  /// **'去对话里看看'**
  String get featuresScheduleOpenChat;

  /// No description provided for @featuresScheduleEditTitle.
  ///
  /// In zh, this message translates to:
  /// **'编辑自动化任务'**
  String get featuresScheduleEditTitle;

  /// No description provided for @featuresScheduleCreateTitle.
  ///
  /// In zh, this message translates to:
  /// **'新建自动化任务'**
  String get featuresScheduleCreateTitle;

  /// No description provided for @featuresScheduleSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get featuresScheduleSaving;

  /// No description provided for @featuresScheduleCreating.
  ///
  /// In zh, this message translates to:
  /// **'正在对话里创建'**
  String get featuresScheduleCreating;

  /// No description provided for @featuresTime.
  ///
  /// In zh, this message translates to:
  /// **'时间'**
  String get featuresTime;

  /// No description provided for @featuresNotSelected.
  ///
  /// In zh, this message translates to:
  /// **'未选'**
  String get featuresNotSelected;

  /// No description provided for @featuresMonthDaysLabel.
  ///
  /// In zh, this message translates to:
  /// **'{days} 日'**
  String featuresMonthDaysLabel(String days);

  /// No description provided for @featuresTimeZone.
  ///
  /// In zh, this message translates to:
  /// **'时区'**
  String get featuresTimeZone;

  /// No description provided for @featuresScheduleRunLocation.
  ///
  /// In zh, this message translates to:
  /// **'在哪里运行'**
  String get featuresScheduleRunLocation;

  /// No description provided for @featuresJustCreatedChat.
  ///
  /// In zh, this message translates to:
  /// **'刚建的对话'**
  String get featuresJustCreatedChat;

  /// No description provided for @featuresModel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get featuresModel;

  /// No description provided for @featuresRequestRefused.
  ///
  /// In zh, this message translates to:
  /// **'引擎没有接受这个请求'**
  String get featuresRequestRefused;

  /// No description provided for @featuresScheduleNotFound.
  ///
  /// In zh, this message translates to:
  /// **'这个任务已经不在了'**
  String get featuresScheduleNotFound;

  /// No description provided for @featuresScheduleEndedError.
  ///
  /// In zh, this message translates to:
  /// **'任务已结束，不能再改'**
  String get featuresScheduleEndedError;

  /// No description provided for @featuresScheduleConflict.
  ///
  /// In zh, this message translates to:
  /// **'任务刚被改过，返回后再试'**
  String get featuresScheduleConflict;

  /// No description provided for @featuresScheduleInvalidPrompt.
  ///
  /// In zh, this message translates to:
  /// **'名称和指令不能为空，名称最多 120 字'**
  String get featuresScheduleInvalidPrompt;

  /// No description provided for @featuresScheduleInvalidTime.
  ///
  /// In zh, this message translates to:
  /// **'运行时间不对'**
  String get featuresScheduleInvalidTime;

  /// No description provided for @featuresScheduleIntervalTooShort.
  ///
  /// In zh, this message translates to:
  /// **'间隔至少 1 分钟'**
  String get featuresScheduleIntervalTooShort;

  /// No description provided for @featuresScheduleTimeOutOfRange.
  ///
  /// In zh, this message translates to:
  /// **'时间超出范围'**
  String get featuresScheduleTimeOutOfRange;

  /// No description provided for @featuresScheduleSubagentError.
  ///
  /// In zh, this message translates to:
  /// **'这个对话收不到自动化任务'**
  String get featuresScheduleSubagentError;

  /// No description provided for @featuresEvery.
  ///
  /// In zh, this message translates to:
  /// **'每'**
  String get featuresEvery;

  /// No description provided for @featuresCronExpression.
  ///
  /// In zh, this message translates to:
  /// **'Cron 表达式'**
  String get featuresCronExpression;

  /// No description provided for @featuresCronFieldGuide.
  ///
  /// In zh, this message translates to:
  /// **'分  时  日  月  周'**
  String get featuresCronFieldGuide;

  /// No description provided for @featuresZoneTimeSuffix.
  ///
  /// In zh, this message translates to:
  /// **'（{city}时间）'**
  String featuresZoneTimeSuffix(String city);

  /// No description provided for @featuresScheduleNextLocal.
  ///
  /// In zh, this message translates to:
  /// **'接下来（本机时间）'**
  String get featuresScheduleNextLocal;

  /// No description provided for @featuresScheduleNext.
  ///
  /// In zh, this message translates to:
  /// **'接下来'**
  String get featuresScheduleNext;

  /// No description provided for @featuresMonthDayChoice.
  ///
  /// In zh, this message translates to:
  /// **'{day} 日'**
  String featuresMonthDayChoice(int day);

  /// No description provided for @featuresZonesCommon.
  ///
  /// In zh, this message translates to:
  /// **'常用'**
  String get featuresZonesCommon;

  /// No description provided for @featuresZonesAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get featuresZonesAll;

  /// No description provided for @featuresZoneSearchHint.
  ///
  /// In zh, this message translates to:
  /// **'搜索城市、时区或 UTC 偏移'**
  String get featuresZoneSearchHint;

  /// No description provided for @featuresZonesNoMatch.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的时区'**
  String get featuresZonesNoMatch;

  /// No description provided for @featuresZoneUTC.
  ///
  /// In zh, this message translates to:
  /// **'协调世界时'**
  String get featuresZoneUTC;

  /// No description provided for @featuresZoneShanghai.
  ///
  /// In zh, this message translates to:
  /// **'上海'**
  String get featuresZoneShanghai;

  /// No description provided for @featuresZoneUrumqi.
  ///
  /// In zh, this message translates to:
  /// **'乌鲁木齐'**
  String get featuresZoneUrumqi;

  /// No description provided for @featuresZoneHongKong.
  ///
  /// In zh, this message translates to:
  /// **'香港'**
  String get featuresZoneHongKong;

  /// No description provided for @featuresZoneMacau.
  ///
  /// In zh, this message translates to:
  /// **'澳门'**
  String get featuresZoneMacau;

  /// No description provided for @featuresZoneTaipei.
  ///
  /// In zh, this message translates to:
  /// **'台北'**
  String get featuresZoneTaipei;

  /// No description provided for @featuresZoneTokyo.
  ///
  /// In zh, this message translates to:
  /// **'东京'**
  String get featuresZoneTokyo;

  /// No description provided for @featuresZoneSeoul.
  ///
  /// In zh, this message translates to:
  /// **'首尔'**
  String get featuresZoneSeoul;

  /// No description provided for @featuresZoneSingapore.
  ///
  /// In zh, this message translates to:
  /// **'新加坡'**
  String get featuresZoneSingapore;

  /// No description provided for @featuresZoneKualaLumpur.
  ///
  /// In zh, this message translates to:
  /// **'吉隆坡'**
  String get featuresZoneKualaLumpur;

  /// No description provided for @featuresZoneBangkok.
  ///
  /// In zh, this message translates to:
  /// **'曼谷'**
  String get featuresZoneBangkok;

  /// No description provided for @featuresZoneHoChiMinh.
  ///
  /// In zh, this message translates to:
  /// **'胡志明市'**
  String get featuresZoneHoChiMinh;

  /// No description provided for @featuresZoneJakarta.
  ///
  /// In zh, this message translates to:
  /// **'雅加达'**
  String get featuresZoneJakarta;

  /// No description provided for @featuresZoneManila.
  ///
  /// In zh, this message translates to:
  /// **'马尼拉'**
  String get featuresZoneManila;

  /// No description provided for @featuresZoneKolkata.
  ///
  /// In zh, this message translates to:
  /// **'加尔各答'**
  String get featuresZoneKolkata;

  /// No description provided for @featuresZoneDubai.
  ///
  /// In zh, this message translates to:
  /// **'迪拜'**
  String get featuresZoneDubai;

  /// No description provided for @featuresZoneJerusalem.
  ///
  /// In zh, this message translates to:
  /// **'耶路撒冷'**
  String get featuresZoneJerusalem;

  /// No description provided for @featuresZoneLondon.
  ///
  /// In zh, this message translates to:
  /// **'伦敦'**
  String get featuresZoneLondon;

  /// No description provided for @featuresZoneDublin.
  ///
  /// In zh, this message translates to:
  /// **'都柏林'**
  String get featuresZoneDublin;

  /// No description provided for @featuresZoneLisbon.
  ///
  /// In zh, this message translates to:
  /// **'里斯本'**
  String get featuresZoneLisbon;

  /// No description provided for @featuresZoneParis.
  ///
  /// In zh, this message translates to:
  /// **'巴黎'**
  String get featuresZoneParis;

  /// No description provided for @featuresZoneBerlin.
  ///
  /// In zh, this message translates to:
  /// **'柏林'**
  String get featuresZoneBerlin;

  /// No description provided for @featuresZoneMadrid.
  ///
  /// In zh, this message translates to:
  /// **'马德里'**
  String get featuresZoneMadrid;

  /// No description provided for @featuresZoneRome.
  ///
  /// In zh, this message translates to:
  /// **'罗马'**
  String get featuresZoneRome;

  /// No description provided for @featuresZoneAmsterdam.
  ///
  /// In zh, this message translates to:
  /// **'阿姆斯特丹'**
  String get featuresZoneAmsterdam;

  /// No description provided for @featuresZoneZurich.
  ///
  /// In zh, this message translates to:
  /// **'苏黎世'**
  String get featuresZoneZurich;

  /// No description provided for @featuresZoneStockholm.
  ///
  /// In zh, this message translates to:
  /// **'斯德哥尔摩'**
  String get featuresZoneStockholm;

  /// No description provided for @featuresZoneWarsaw.
  ///
  /// In zh, this message translates to:
  /// **'华沙'**
  String get featuresZoneWarsaw;

  /// No description provided for @featuresZoneAthens.
  ///
  /// In zh, this message translates to:
  /// **'雅典'**
  String get featuresZoneAthens;

  /// No description provided for @featuresZoneIstanbul.
  ///
  /// In zh, this message translates to:
  /// **'伊斯坦布尔'**
  String get featuresZoneIstanbul;

  /// No description provided for @featuresZoneMoscow.
  ///
  /// In zh, this message translates to:
  /// **'莫斯科'**
  String get featuresZoneMoscow;

  /// No description provided for @featuresZoneCairo.
  ///
  /// In zh, this message translates to:
  /// **'开罗'**
  String get featuresZoneCairo;

  /// No description provided for @featuresZoneJohannesburg.
  ///
  /// In zh, this message translates to:
  /// **'约翰内斯堡'**
  String get featuresZoneJohannesburg;

  /// No description provided for @featuresZoneLagos.
  ///
  /// In zh, this message translates to:
  /// **'拉各斯'**
  String get featuresZoneLagos;

  /// No description provided for @featuresZoneNewYork.
  ///
  /// In zh, this message translates to:
  /// **'纽约'**
  String get featuresZoneNewYork;

  /// No description provided for @featuresZoneToronto.
  ///
  /// In zh, this message translates to:
  /// **'多伦多'**
  String get featuresZoneToronto;

  /// No description provided for @featuresZoneChicago.
  ///
  /// In zh, this message translates to:
  /// **'芝加哥'**
  String get featuresZoneChicago;

  /// No description provided for @featuresZoneDenver.
  ///
  /// In zh, this message translates to:
  /// **'丹佛'**
  String get featuresZoneDenver;

  /// No description provided for @featuresZonePhoenix.
  ///
  /// In zh, this message translates to:
  /// **'凤凰城'**
  String get featuresZonePhoenix;

  /// No description provided for @featuresZoneLosAngeles.
  ///
  /// In zh, this message translates to:
  /// **'洛杉矶'**
  String get featuresZoneLosAngeles;

  /// No description provided for @featuresZoneVancouver.
  ///
  /// In zh, this message translates to:
  /// **'温哥华'**
  String get featuresZoneVancouver;

  /// No description provided for @featuresZoneAnchorage.
  ///
  /// In zh, this message translates to:
  /// **'安克雷奇'**
  String get featuresZoneAnchorage;

  /// No description provided for @featuresZoneMexicoCity.
  ///
  /// In zh, this message translates to:
  /// **'墨西哥城'**
  String get featuresZoneMexicoCity;

  /// No description provided for @featuresZoneBogota.
  ///
  /// In zh, this message translates to:
  /// **'波哥大'**
  String get featuresZoneBogota;

  /// No description provided for @featuresZoneLima.
  ///
  /// In zh, this message translates to:
  /// **'利马'**
  String get featuresZoneLima;

  /// No description provided for @featuresZoneSantiago.
  ///
  /// In zh, this message translates to:
  /// **'圣地亚哥'**
  String get featuresZoneSantiago;

  /// No description provided for @featuresZoneSaoPaulo.
  ///
  /// In zh, this message translates to:
  /// **'圣保罗'**
  String get featuresZoneSaoPaulo;

  /// No description provided for @featuresZoneBuenosAires.
  ///
  /// In zh, this message translates to:
  /// **'布宜诺斯艾利斯'**
  String get featuresZoneBuenosAires;

  /// No description provided for @featuresZoneHonolulu.
  ///
  /// In zh, this message translates to:
  /// **'檀香山'**
  String get featuresZoneHonolulu;

  /// No description provided for @featuresZoneAuckland.
  ///
  /// In zh, this message translates to:
  /// **'奥克兰'**
  String get featuresZoneAuckland;

  /// No description provided for @featuresZoneSydney.
  ///
  /// In zh, this message translates to:
  /// **'悉尼'**
  String get featuresZoneSydney;

  /// No description provided for @featuresZoneMelbourne.
  ///
  /// In zh, this message translates to:
  /// **'墨尔本'**
  String get featuresZoneMelbourne;

  /// No description provided for @featuresZoneBrisbane.
  ///
  /// In zh, this message translates to:
  /// **'布里斯班'**
  String get featuresZoneBrisbane;

  /// No description provided for @featuresZonePerth.
  ///
  /// In zh, this message translates to:
  /// **'珀斯'**
  String get featuresZonePerth;

  /// No description provided for @featuresScheduleCreated.
  ///
  /// In zh, this message translates to:
  /// **'已创建'**
  String get featuresScheduleCreated;

  /// No description provided for @featuresSchedulesReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取自动化任务'**
  String get featuresSchedulesReadFailed;

  /// No description provided for @featuresSchedulesEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有自动化任务'**
  String get featuresSchedulesEmpty;

  /// No description provided for @featuresSchedulesEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'到点自动发进对话，替你跑一遍'**
  String get featuresSchedulesEmptyHint;

  /// No description provided for @featuresScheduleNewTask.
  ///
  /// In zh, this message translates to:
  /// **'新建任务'**
  String get featuresScheduleNewTask;

  /// No description provided for @featuresSchedulesNoMatch.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的任务'**
  String get featuresSchedulesNoMatch;

  /// No description provided for @featuresSchedulesNoActive.
  ///
  /// In zh, this message translates to:
  /// **'没有开启中的任务'**
  String get featuresSchedulesNoActive;

  /// No description provided for @featuresSchedulesNoEnded.
  ///
  /// In zh, this message translates to:
  /// **'没有已结束的任务'**
  String get featuresSchedulesNoEnded;

  /// No description provided for @featuresSchedules.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务'**
  String get featuresSchedules;

  /// No description provided for @featuresSchedulesSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'到点自动发进原来的对话'**
  String get featuresSchedulesSubtitle;

  /// No description provided for @featuresSchedulesSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索任务'**
  String get featuresSchedulesSearch;

  /// No description provided for @featuresSchedulesAllCount.
  ///
  /// In zh, this message translates to:
  /// **'全部 {count}'**
  String featuresSchedulesAllCount(int count);

  /// No description provided for @featuresScheduleUntitled.
  ///
  /// In zh, this message translates to:
  /// **'未命名任务'**
  String get featuresScheduleUntitled;

  /// No description provided for @featuresScheduleSent.
  ///
  /// In zh, this message translates to:
  /// **'已发进对话'**
  String get featuresScheduleSent;

  /// No description provided for @featuresView.
  ///
  /// In zh, this message translates to:
  /// **'查看'**
  String get featuresView;

  /// No description provided for @featuresSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能发送'**
  String get featuresSendFailed;

  /// No description provided for @featuresScheduleDeleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除这个任务？'**
  String get featuresScheduleDeleteTitle;

  /// No description provided for @featuresScheduleDeleteHint.
  ///
  /// In zh, this message translates to:
  /// **'会停止之后的运行，并删掉它的运行记录。原来的对话不受影响。'**
  String get featuresScheduleDeleteHint;

  /// No description provided for @featuresScheduleDeleted.
  ///
  /// In zh, this message translates to:
  /// **'任务已删除'**
  String get featuresScheduleDeleted;

  /// No description provided for @featuresScheduleActive.
  ///
  /// In zh, this message translates to:
  /// **'已开启'**
  String get featuresScheduleActive;

  /// No description provided for @featuresScheduleRun.
  ///
  /// In zh, this message translates to:
  /// **'运行'**
  String get featuresScheduleRun;

  /// No description provided for @featuresScheduleNextRun.
  ///
  /// In zh, this message translates to:
  /// **'下次'**
  String get featuresScheduleNextRun;

  /// No description provided for @featuresScheduleLastRun.
  ///
  /// In zh, this message translates to:
  /// **'上次'**
  String get featuresScheduleLastRun;

  /// No description provided for @featuresScheduleRule.
  ///
  /// In zh, this message translates to:
  /// **'规则'**
  String get featuresScheduleRule;

  /// No description provided for @featuresScheduleLinkedChat.
  ///
  /// In zh, this message translates to:
  /// **'关联对话'**
  String get featuresScheduleLinkedChat;

  /// No description provided for @featuresScheduleChatDeleted.
  ///
  /// In zh, this message translates to:
  /// **'对话已删除'**
  String get featuresScheduleChatDeleted;

  /// No description provided for @featuresScheduleEdit.
  ///
  /// In zh, this message translates to:
  /// **'编辑任务'**
  String get featuresScheduleEdit;

  /// No description provided for @featuresScheduleRunNow.
  ///
  /// In zh, this message translates to:
  /// **'立即运行'**
  String get featuresScheduleRunNow;

  /// No description provided for @featuresScheduleHistory.
  ///
  /// In zh, this message translates to:
  /// **'运行记录'**
  String get featuresScheduleHistory;

  /// No description provided for @featuresScheduleNeverRun.
  ///
  /// In zh, this message translates to:
  /// **'还没有运行过'**
  String get featuresScheduleNeverRun;

  /// No description provided for @featuresScheduleHistoryUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'记录不可用'**
  String get featuresScheduleHistoryUnavailable;

  /// No description provided for @featuresScheduleHistoryReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取运行记录'**
  String get featuresScheduleHistoryReadFailed;

  /// No description provided for @featuresScheduleDelete.
  ///
  /// In zh, this message translates to:
  /// **'删除任务'**
  String get featuresScheduleDelete;

  /// No description provided for @featuresExportSavedTo.
  ///
  /// In zh, this message translates to:
  /// **'已存到 {path}'**
  String featuresExportSavedTo(String path);

  /// No description provided for @featuresExportTitle.
  ///
  /// In zh, this message translates to:
  /// **'导出对话日志'**
  String get featuresExportTitle;

  /// No description provided for @featuresExportSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'打包成一个 ZIP，用于反馈或备份'**
  String get featuresExportSubtitle;

  /// No description provided for @featuresExportUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这个连接导不了'**
  String get featuresExportUnavailable;

  /// No description provided for @featuresExportRemoteHint.
  ///
  /// In zh, this message translates to:
  /// **'经 DSH Remote 中转时拿不到日志，可以在电脑上的网页版导出'**
  String get featuresExportRemoteHint;

  /// No description provided for @featuresExportShareHint.
  ///
  /// In zh, this message translates to:
  /// **'附在问题反馈里，或发给自己'**
  String get featuresExportShareHint;

  /// No description provided for @featuresExportSaveDownloads.
  ///
  /// In zh, this message translates to:
  /// **'存到「下载」'**
  String get featuresExportSaveDownloads;

  /// No description provided for @featuresExportDownloadsHint.
  ///
  /// In zh, this message translates to:
  /// **'存进 下载/DSH-Go'**
  String get featuresExportDownloadsHint;

  /// No description provided for @featuresExportContents.
  ///
  /// In zh, this message translates to:
  /// **'含这个对话和子代理的全部记录与附件'**
  String get featuresExportContents;

  /// No description provided for @featuresSkillUseHere.
  ///
  /// In zh, this message translates to:
  /// **'在对话里用'**
  String get featuresSkillUseHere;

  /// No description provided for @featuresSkillUseNew.
  ///
  /// In zh, this message translates to:
  /// **'新对话里用'**
  String get featuresSkillUseNew;

  /// No description provided for @featuresSkillsCallHint.
  ///
  /// In zh, this message translates to:
  /// **'输入 /技能名 调用'**
  String get featuresSkillsCallHint;

  /// No description provided for @featuresSkillsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取技能'**
  String get featuresSkillsReadFailed;

  /// No description provided for @featuresSkillsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'这个对话还没有技能'**
  String get featuresSkillsEmpty;

  /// No description provided for @featuresSkillsEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'放进 .dsh/skills 的技能会出现在这里'**
  String get featuresSkillsEmptyHint;

  /// No description provided for @featuresSkillsSourceHint.
  ///
  /// In zh, this message translates to:
  /// **'来自项目和 ~/.dsh 下的 skills 目录'**
  String get featuresSkillsSourceHint;

  /// No description provided for @featuresSkillUsage.
  ///
  /// In zh, this message translates to:
  /// **'适用：{usage}'**
  String featuresSkillUsage(String usage);

  /// No description provided for @featuresSkillManual.
  ///
  /// In zh, this message translates to:
  /// **'仅手动'**
  String get featuresSkillManual;

  /// No description provided for @featuresArtifactsSemantic.
  ///
  /// In zh, this message translates to:
  /// **'产出的文件，共 {count} 个，查看全部'**
  String featuresArtifactsSemantic(int count);

  /// No description provided for @featuresArtifactsTitle.
  ///
  /// In zh, this message translates to:
  /// **'产出的文件'**
  String get featuresArtifactsTitle;

  /// No description provided for @featuresArtifactsAllCount.
  ///
  /// In zh, this message translates to:
  /// **'全部 {count} 个'**
  String featuresArtifactsAllCount(int count);

  /// No description provided for @featuresArtifactsCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String featuresArtifactsCount(int count);

  /// No description provided for @featuresArtifactsNoFiles.
  ///
  /// In zh, this message translates to:
  /// **'还没有文件'**
  String get featuresArtifactsNoFiles;

  /// No description provided for @featuresArtifactsTotal.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个文件 · 交付的和生成的'**
  String featuresArtifactsTotal(int count);

  /// No description provided for @featuresArtifactsEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有产出文件'**
  String get featuresArtifactsEmpty;

  /// No description provided for @featuresArtifactsEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'AI 交付或生成的文件会出现在这里'**
  String get featuresArtifactsEmptyHint;

  /// No description provided for @featuresListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get featuresListSeparator;

  /// No description provided for @featuresErrorReason.
  ///
  /// In zh, this message translates to:
  /// **'{title}：{reason}'**
  String featuresErrorReason(String title, String reason);

  /// No description provided for @featuresYearDate.
  ///
  /// In zh, this message translates to:
  /// **'{year}年{date}'**
  String featuresYearDate(int year, String date);

  /// No description provided for @featuresDateWeekdayTime.
  ///
  /// In zh, this message translates to:
  /// **'{date} {week} {time}'**
  String featuresDateWeekdayTime(String date, String week, String time);

  /// No description provided for @featuresDateWeekday.
  ///
  /// In zh, this message translates to:
  /// **'{date} 周{day}'**
  String featuresDateWeekday(String date, String day);

  /// No description provided for @featuresOnceDescription.
  ///
  /// In zh, this message translates to:
  /// **'{rule} · {date} {time}'**
  String featuresOnceDescription(String rule, String date, String time);

  /// No description provided for @featuresCronMonthSuffix.
  ///
  /// In zh, this message translates to:
  /// **'（{months}）'**
  String featuresCronMonthSuffix(String months);

  /// No description provided for @featuresRuleIntervalSeconds.
  ///
  /// In zh, this message translates to:
  /// **'每 {count} 秒'**
  String featuresRuleIntervalSeconds(int count);

  /// No description provided for @featuresRuleIntervalMinutes.
  ///
  /// In zh, this message translates to:
  /// **'每 {count} 分钟'**
  String featuresRuleIntervalMinutes(int count);

  /// No description provided for @featuresRuleIntervalHours.
  ///
  /// In zh, this message translates to:
  /// **'每 {count} 小时'**
  String featuresRuleIntervalHours(int count);

  /// No description provided for @featuresSchedulesActiveCount.
  ///
  /// In zh, this message translates to:
  /// **'已开启 {count}'**
  String featuresSchedulesActiveCount(int count);

  /// No description provided for @featuresSchedulesEndedCount.
  ///
  /// In zh, this message translates to:
  /// **'已结束 {count}'**
  String featuresSchedulesEndedCount(int count);

  /// No description provided for @featuresScheduleRetention.
  ///
  /// In zh, this message translates to:
  /// **'只保留最近 {days} 天、最多 {count} 条'**
  String featuresScheduleRetention(int days, int count);

  /// No description provided for @featuresScheduleRetentionUnknown.
  ///
  /// In zh, this message translates to:
  /// **'只保留最近 {days} 天、最多 — 条'**
  String featuresScheduleRetentionUnknown(int days);

  /// No description provided for @featuresArtifactsDeliveredTurn.
  ///
  /// In zh, this message translates to:
  /// **'第 {turn} 轮 · 交付'**
  String featuresArtifactsDeliveredTurn(int turn);

  /// No description provided for @featuresArtifactsGeneratedTurn.
  ///
  /// In zh, this message translates to:
  /// **'第 {turn} 轮 · 生成'**
  String featuresArtifactsGeneratedTurn(int turn);

  /// No description provided for @featuresPresetCreateRequest.
  ///
  /// In zh, this message translates to:
  /// **'新建 Agent 预设「{name}」（{id}）：在工作区写下这两个文件（内容原样），再用 plugin_manager 的 install_bundle 安装 `{directory}` 目录。只做这些。\n\n'**
  String featuresPresetCreateRequest(String name, String id, String directory);

  /// No description provided for @featuresPresetUpdateRequest.
  ///
  /// In zh, this message translates to:
  /// **'更新 Agent 预设「{name}」（{id}）：在工作区写下这两个文件（内容原样），用 plugin_manager 先移除组合包 `{replacing}`，再用 install_bundle 安装 `{directory}` 目录。只做这些。\n\n'**
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory);

  /// No description provided for @featuresZoneThisPhone.
  ///
  /// In zh, this message translates to:
  /// **'{city} · 本机'**
  String featuresZoneThisPhone(String city);

  /// No description provided for @featuresPermissionResetHint.
  ///
  /// In zh, this message translates to:
  /// **'新对话的默认权限已失效'**
  String get featuresPermissionResetHint;

  /// No description provided for @featuresPermissionResetDefault.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认'**
  String get featuresPermissionResetDefault;

  /// No description provided for @fileImageName.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get fileImageName;

  /// No description provided for @fileSharedText.
  ///
  /// In zh, this message translates to:
  /// **'分享的文字.txt'**
  String get fileSharedText;

  /// No description provided for @fileChatFallback.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get fileChatFallback;

  /// No description provided for @hubSessionDetails.
  ///
  /// In zh, this message translates to:
  /// **'对话详情'**
  String get hubSessionDetails;

  /// No description provided for @hubTerminal.
  ///
  /// In zh, this message translates to:
  /// **'终端'**
  String get hubTerminal;

  /// No description provided for @hubSessionNoTurns.
  ///
  /// In zh, this message translates to:
  /// **'还没有完整的一轮'**
  String get hubSessionNoTurns;

  /// No description provided for @hubSessionElapsed.
  ///
  /// In zh, this message translates to:
  /// **'用时'**
  String get hubSessionElapsed;

  /// No description provided for @hubSessionSteps.
  ///
  /// In zh, this message translates to:
  /// **'步骤'**
  String get hubSessionSteps;

  /// No description provided for @hubSessionChangedFiles.
  ///
  /// In zh, this message translates to:
  /// **'改动文件'**
  String get hubSessionChangedFiles;

  /// No description provided for @hubSessionTrajectoryHint.
  ///
  /// In zh, this message translates to:
  /// **'每一轮的步骤和用时会排在这里'**
  String get hubSessionTrajectoryHint;

  /// No description provided for @hubSessionLoadEarlier.
  ///
  /// In zh, this message translates to:
  /// **'加载更早的轮次'**
  String get hubSessionLoadEarlier;

  /// No description provided for @hubSessionError.
  ///
  /// In zh, this message translates to:
  /// **'出错'**
  String get hubSessionError;

  /// No description provided for @hubSessionInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'被中断'**
  String get hubSessionInterrupted;

  /// No description provided for @hubSessionOutputLimit.
  ///
  /// In zh, this message translates to:
  /// **'达到输出上限'**
  String get hubSessionOutputLimit;

  /// No description provided for @hubSessionNoChanges.
  ///
  /// In zh, this message translates to:
  /// **'还没有改过文件'**
  String get hubSessionNoChanges;

  /// No description provided for @hubSessionShellChangesHint.
  ///
  /// In zh, this message translates to:
  /// **'用 shell 命令改的文件不在这里'**
  String get hubSessionShellChangesHint;

  /// No description provided for @hubSessionChanges.
  ///
  /// In zh, this message translates to:
  /// **'对话改动'**
  String get hubSessionChanges;

  /// No description provided for @hubSessionChangesNote.
  ///
  /// In zh, this message translates to:
  /// **'只统计已加载的记录里，用写入和编辑工具做的改动'**
  String get hubSessionChangesNote;

  /// No description provided for @hubSessionNoGoal.
  ///
  /// In zh, this message translates to:
  /// **'还没有目标或待办'**
  String get hubSessionNoGoal;

  /// No description provided for @hubSessionGoalHint.
  ///
  /// In zh, this message translates to:
  /// **'复杂任务里 AI 会列出待办，进度在这里看'**
  String get hubSessionGoalHint;

  /// No description provided for @hubSessionGoal.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get hubSessionGoal;

  /// No description provided for @hubSessionPlanMode.
  ///
  /// In zh, this message translates to:
  /// **'计划模式'**
  String get hubSessionPlanMode;

  /// No description provided for @hubSessionPlanSwitching.
  ///
  /// In zh, this message translates to:
  /// **'正在切换计划模式'**
  String get hubSessionPlanSwitching;

  /// No description provided for @hubSessionPlanHint.
  ///
  /// In zh, this message translates to:
  /// **'AI 先出方案，不改文件'**
  String get hubSessionPlanHint;

  /// No description provided for @hubSessionTodos.
  ///
  /// In zh, this message translates to:
  /// **'待办'**
  String get hubSessionTodos;

  /// No description provided for @hubSessionNotStarted.
  ///
  /// In zh, this message translates to:
  /// **'未开始'**
  String get hubSessionNotStarted;

  /// No description provided for @hubSessionTurnUsage.
  ///
  /// In zh, this message translates to:
  /// **'每轮用量'**
  String get hubSessionTurnUsage;

  /// No description provided for @hubSessionNoSubagents.
  ///
  /// In zh, this message translates to:
  /// **'没有派出子代理'**
  String get hubSessionNoSubagents;

  /// No description provided for @hubSessionDelegations.
  ///
  /// In zh, this message translates to:
  /// **'派活记录'**
  String get hubSessionDelegations;

  /// No description provided for @hubTabTrajectory.
  ///
  /// In zh, this message translates to:
  /// **'轨迹'**
  String get hubTabTrajectory;

  /// No description provided for @hubTabChanges.
  ///
  /// In zh, this message translates to:
  /// **'改动'**
  String get hubTabChanges;

  /// No description provided for @hubTabFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get hubTabFiles;

  /// No description provided for @hubTabProgress.
  ///
  /// In zh, this message translates to:
  /// **'进度'**
  String get hubTabProgress;

  /// No description provided for @hubTabContext.
  ///
  /// In zh, this message translates to:
  /// **'上下文'**
  String get hubTabContext;

  /// No description provided for @hubTabSubagents.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get hubTabSubagents;

  /// No description provided for @hubPlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get hubPlugins;

  /// No description provided for @hubSettingsFullAccessTitle.
  ///
  /// In zh, this message translates to:
  /// **'开启完全权限？'**
  String get hubSettingsFullAccessTitle;

  /// No description provided for @hubSettingsFullAccessBody.
  ///
  /// In zh, this message translates to:
  /// **'AI 执行命令、改动文件前不再问你。'**
  String get hubSettingsFullAccessBody;

  /// No description provided for @hubSettingsStorageTitle.
  ///
  /// In zh, this message translates to:
  /// **'让 AI 访问手机文件？'**
  String get hubSettingsStorageTitle;

  /// No description provided for @hubSettingsStorageAllow.
  ///
  /// In zh, this message translates to:
  /// **'允许读写'**
  String get hubSettingsStorageAllow;

  /// No description provided for @hubSettingsStorageDenied.
  ///
  /// In zh, this message translates to:
  /// **'没有拿到存储权限。到系统设置里给 DSH Go 开启「所有文件访问」后再试'**
  String get hubSettingsStorageDenied;

  /// No description provided for @hubSettingsRestartRequired.
  ///
  /// In zh, this message translates to:
  /// **'重启引擎后生效'**
  String get hubSettingsRestartRequired;

  /// No description provided for @hubSettingsRestartNow.
  ///
  /// In zh, this message translates to:
  /// **'立即重启'**
  String get hubSettingsRestartNow;

  /// No description provided for @hubSettingsInterface.
  ///
  /// In zh, this message translates to:
  /// **'界面'**
  String get hubSettingsInterface;

  /// No description provided for @hubSettingsChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get hubSettingsChat;

  /// No description provided for @hubSettingsAutoCommands.
  ///
  /// In zh, this message translates to:
  /// **'自动执行命令'**
  String get hubSettingsAutoCommands;

  /// No description provided for @hubSettingsPhoneFiles.
  ///
  /// In zh, this message translates to:
  /// **'访问手机文件'**
  String get hubSettingsPhoneFiles;

  /// No description provided for @hubSettingsPhoneFilesHint.
  ///
  /// In zh, this message translates to:
  /// **'AI 可读写手机存储'**
  String get hubSettingsPhoneFilesHint;

  /// No description provided for @hubSettingsVisualReplies.
  ///
  /// In zh, this message translates to:
  /// **'可视化回复'**
  String get hubSettingsVisualReplies;

  /// No description provided for @hubSettingsVisualRepliesHint.
  ///
  /// In zh, this message translates to:
  /// **'图表、对比卡和可点的选项'**
  String get hubSettingsVisualRepliesHint;

  /// No description provided for @hubSettingsPhoneControl.
  ///
  /// In zh, this message translates to:
  /// **'手机操控'**
  String get hubSettingsPhoneControl;

  /// No description provided for @hubSettingsPhoneControlHint.
  ///
  /// In zh, this message translates to:
  /// **'看屏幕、帮你点按'**
  String get hubSettingsPhoneControlHint;

  /// No description provided for @hubSettingsPreferences.
  ///
  /// In zh, this message translates to:
  /// **'个人偏好'**
  String get hubSettingsPreferences;

  /// No description provided for @hubSettingsAppearance.
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get hubSettingsAppearance;

  /// No description provided for @hubSettingsChatTextSize.
  ///
  /// In zh, this message translates to:
  /// **'对话字号'**
  String get hubSettingsChatTextSize;

  /// No description provided for @hubSettingsCollapseSteps.
  ///
  /// In zh, this message translates to:
  /// **'完成后收起过程'**
  String get hubSettingsCollapseSteps;

  /// No description provided for @hubSettingsCollapseStepsHint.
  ///
  /// In zh, this message translates to:
  /// **'思考与工具调用收成一行'**
  String get hubSettingsCollapseStepsHint;

  /// No description provided for @hubSettingsWebPhoneLayout.
  ///
  /// In zh, this message translates to:
  /// **'网页版手机布局'**
  String get hubSettingsWebPhoneLayout;

  /// No description provided for @hubSettingsWebPhoneLayoutHint.
  ///
  /// In zh, this message translates to:
  /// **'为手机屏幕重排网页版'**
  String get hubSettingsWebPhoneLayoutHint;

  /// No description provided for @hubSettingsEngineExtensions.
  ///
  /// In zh, this message translates to:
  /// **'引擎与扩展'**
  String get hubSettingsEngineExtensions;

  /// No description provided for @hubSettingsEngine.
  ///
  /// In zh, this message translates to:
  /// **'本机引擎'**
  String get hubSettingsEngine;

  /// No description provided for @hubSettingsProviders.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get hubSettingsProviders;

  /// No description provided for @hubSettingsEngineSettings.
  ///
  /// In zh, this message translates to:
  /// **'引擎参数'**
  String get hubSettingsEngineSettings;

  /// No description provided for @hubSettingsShareConfig.
  ///
  /// In zh, this message translates to:
  /// **'分享配置'**
  String get hubSettingsShareConfig;

  /// No description provided for @hubSettingsAllFeatures.
  ///
  /// In zh, this message translates to:
  /// **'全部功能'**
  String get hubSettingsAllFeatures;

  /// No description provided for @hubSettingsAbout.
  ///
  /// In zh, this message translates to:
  /// **'关于'**
  String get hubSettingsAbout;

  /// No description provided for @hubSettingsCommunity.
  ///
  /// In zh, this message translates to:
  /// **'社区'**
  String get hubSettingsCommunity;

  /// No description provided for @hubSettingsLicenses.
  ///
  /// In zh, this message translates to:
  /// **'开源许可'**
  String get hubSettingsLicenses;

  /// No description provided for @hubSettingsAccount.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 账号'**
  String get hubSettingsAccount;

  /// No description provided for @hubSettingsSigningIn.
  ///
  /// In zh, this message translates to:
  /// **'正在登录…'**
  String get hubSettingsSigningIn;

  /// No description provided for @hubSettingsInvalidKey.
  ///
  /// In zh, this message translates to:
  /// **'Key 无效，查不到余额'**
  String get hubSettingsInvalidKey;

  /// No description provided for @hubSettingsNoApiKey.
  ///
  /// In zh, this message translates to:
  /// **'未设置 API Key'**
  String get hubSettingsNoApiKey;

  /// No description provided for @hubSettingsApiKeyHint.
  ///
  /// In zh, this message translates to:
  /// **'填写 Key 后即可对话'**
  String get hubSettingsApiKeyHint;

  /// No description provided for @hubSettingsSignInAccount.
  ///
  /// In zh, this message translates to:
  /// **'登录 DeepSeek 账号'**
  String get hubSettingsSignInAccount;

  /// No description provided for @hubSettingsOrApiKey.
  ///
  /// In zh, this message translates to:
  /// **'或填写 API Key'**
  String get hubSettingsOrApiKey;

  /// No description provided for @hubPluginShare.
  ///
  /// In zh, this message translates to:
  /// **'分享插件'**
  String get hubPluginShare;

  /// No description provided for @hubPluginDetails.
  ///
  /// In zh, this message translates to:
  /// **'插件详情'**
  String get hubPluginDetails;

  /// No description provided for @hubPluginFeatured.
  ///
  /// In zh, this message translates to:
  /// **'dshfind 推荐'**
  String get hubPluginFeatured;

  /// No description provided for @hubPluginWebOnly.
  ///
  /// In zh, this message translates to:
  /// **'仅网页版'**
  String get hubPluginWebOnly;

  /// No description provided for @hubPluginStars.
  ///
  /// In zh, this message translates to:
  /// **'星标'**
  String get hubPluginStars;

  /// No description provided for @hubPluginSource.
  ///
  /// In zh, this message translates to:
  /// **'来源'**
  String get hubPluginSource;

  /// No description provided for @hubPluginInstalledVersion.
  ///
  /// In zh, this message translates to:
  /// **'已装版本'**
  String get hubPluginInstalledVersion;

  /// No description provided for @hubPluginRequiresDsh.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH'**
  String get hubPluginRequiresDsh;

  /// No description provided for @hubPluginPackageName.
  ///
  /// In zh, this message translates to:
  /// **'包名'**
  String get hubPluginPackageName;

  /// No description provided for @hubPluginHomepage.
  ///
  /// In zh, this message translates to:
  /// **'主页'**
  String get hubPluginHomepage;

  /// No description provided for @hubPluginRepository.
  ///
  /// In zh, this message translates to:
  /// **'代码仓库'**
  String get hubPluginRepository;

  /// No description provided for @hubPluginManageTitle.
  ///
  /// In zh, this message translates to:
  /// **'管理插件'**
  String get hubPluginManageTitle;

  /// No description provided for @hubPluginManage.
  ///
  /// In zh, this message translates to:
  /// **'管理'**
  String get hubPluginManage;

  /// No description provided for @hubPluginSafeModeInstall.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不能安装'**
  String get hubPluginSafeModeInstall;

  /// No description provided for @hubPluginInstallCommand.
  ///
  /// In zh, this message translates to:
  /// **'获取安装命令'**
  String get hubPluginInstallCommand;

  /// No description provided for @hubPluginInstallComputer.
  ///
  /// In zh, this message translates to:
  /// **'在电脑上安装'**
  String get hubPluginInstallComputer;

  /// No description provided for @hubPluginInstalling.
  ///
  /// In zh, this message translates to:
  /// **'安装中…'**
  String get hubPluginInstalling;

  /// No description provided for @hubPluginAllowBuilds.
  ///
  /// In zh, this message translates to:
  /// **'允许构建脚本并重试'**
  String get hubPluginAllowBuilds;

  /// No description provided for @hubPluginRetryInstall.
  ///
  /// In zh, this message translates to:
  /// **'重试安装'**
  String get hubPluginRetryInstall;

  /// No description provided for @hubPluginOfficial.
  ///
  /// In zh, this message translates to:
  /// **'DSH 官方'**
  String get hubPluginOfficial;

  /// No description provided for @hubPluginNotLoaded.
  ///
  /// In zh, this message translates to:
  /// **'没有正常加载'**
  String get hubPluginNotLoaded;

  /// No description provided for @hubPluginComponents.
  ///
  /// In zh, this message translates to:
  /// **'组件'**
  String get hubPluginComponents;

  /// No description provided for @hubPluginSafeModeRemove.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不能卸载'**
  String get hubPluginSafeModeRemove;

  /// No description provided for @hubPluginRemoveCommand.
  ///
  /// In zh, this message translates to:
  /// **'获取卸载命令'**
  String get hubPluginRemoveCommand;

  /// No description provided for @hubPluginRemoveComputer.
  ///
  /// In zh, this message translates to:
  /// **'在电脑上卸载'**
  String get hubPluginRemoveComputer;

  /// No description provided for @hubPluginUninstall.
  ///
  /// In zh, this message translates to:
  /// **'卸载'**
  String get hubPluginUninstall;

  /// No description provided for @hubSessionTurns.
  ///
  /// In zh, this message translates to:
  /// **'共 {count} 轮'**
  String hubSessionTurns(int count);

  /// No description provided for @hubSessionTurnsRunning.
  ///
  /// In zh, this message translates to:
  /// **'共 {count} 轮 · 进行中'**
  String hubSessionTurnsRunning(int count);

  /// No description provided for @hubSessionStepCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 步'**
  String hubSessionStepCount(int count);

  /// No description provided for @hubSessionWaitTime.
  ///
  /// In zh, this message translates to:
  /// **'等你 {duration}'**
  String hubSessionWaitTime(String duration);

  /// No description provided for @hubSessionTurn.
  ///
  /// In zh, this message translates to:
  /// **'第 {turn} 轮'**
  String hubSessionTurn(int turn);

  /// No description provided for @hubSessionFileCount.
  ///
  /// In zh, this message translates to:
  /// **'改动了 {count} 个文件'**
  String hubSessionFileCount(int count);

  /// No description provided for @hubSessionEditCount.
  ///
  /// In zh, this message translates to:
  /// **'改了 {count} 次'**
  String hubSessionEditCount(int count);

  /// No description provided for @hubSessionTurnOf.
  ///
  /// In zh, this message translates to:
  /// **'第 {turn} / {total} 轮'**
  String hubSessionTurnOf(int turn, int total);

  /// No description provided for @hubSessionCacheHit.
  ///
  /// In zh, this message translates to:
  /// **'命中 {percent}'**
  String hubSessionCacheHit(String percent);

  /// No description provided for @hubSessionBlocked.
  ///
  /// In zh, this message translates to:
  /// **'受阻'**
  String get hubSessionBlocked;

  /// No description provided for @hubSessionBlockedReason.
  ///
  /// In zh, this message translates to:
  /// **'受阻：{reason}'**
  String hubSessionBlockedReason(String reason);

  /// No description provided for @hubSessionTodoSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{content},{status}'**
  String hubSessionTodoSemantics(String content, String status);

  /// No description provided for @hubSettingsStorageBody.
  ///
  /// In zh, this message translates to:
  /// **'AI 能读取和修改相册、下载、文档等手机文件，引擎会重启一次。'**
  String get hubSettingsStorageBody;

  /// No description provided for @hubSettingsBalance.
  ///
  /// In zh, this message translates to:
  /// **'余额 {amount}'**
  String hubSettingsBalance(String amount);

  /// No description provided for @hubSettingsBalanceLow.
  ///
  /// In zh, this message translates to:
  /// **'余额 {amount} · 余额不足'**
  String hubSettingsBalanceLow(String amount);

  /// No description provided for @hubSettingsAccountSemantics.
  ///
  /// In zh, this message translates to:
  /// **'账号：{title}，{subtitle}'**
  String hubSettingsAccountSemantics(String title, String subtitle);

  /// No description provided for @hubSettingsHostSemantics.
  ///
  /// In zh, this message translates to:
  /// **'远程主机：{name}，{status}'**
  String hubSettingsHostSemantics(String name, String status);

  /// No description provided for @hubSettingsApiKey.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek API Key'**
  String get hubSettingsApiKey;

  /// No description provided for @hubPluginBrowserFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器，请手动访问 {address}'**
  String hubPluginBrowserFailed(String address);

  /// No description provided for @hubPluginYearMonth.
  ///
  /// In zh, this message translates to:
  /// **'{year}年{month}月'**
  String hubPluginYearMonth(int year, String month);

  /// No description provided for @hubPluginUpdateTo.
  ///
  /// In zh, this message translates to:
  /// **'更新到 {version}'**
  String hubPluginUpdateTo(String version);

  /// No description provided for @hubPluginInstallOn.
  ///
  /// In zh, this message translates to:
  /// **'安装到{host}'**
  String hubPluginInstallOn(String host);

  /// No description provided for @hubPluginComponentCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String hubPluginComponentCount(int count);

  /// No description provided for @hubPluginComponentSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get hubPluginComponentSeparator;

  /// No description provided for @hubGroupAi.
  ///
  /// In zh, this message translates to:
  /// **'AI'**
  String get hubGroupAi;

  /// No description provided for @hubGroupCapabilities.
  ///
  /// In zh, this message translates to:
  /// **'能力'**
  String get hubGroupCapabilities;

  /// No description provided for @hubGroupGeneral.
  ///
  /// In zh, this message translates to:
  /// **'通用'**
  String get hubGroupGeneral;

  /// No description provided for @hubGroupHosts.
  ///
  /// In zh, this message translates to:
  /// **'主机'**
  String get hubGroupHosts;

  /// No description provided for @hubGroupHelp.
  ///
  /// In zh, this message translates to:
  /// **'帮助与关于'**
  String get hubGroupHelp;

  /// No description provided for @hubPersonalization.
  ///
  /// In zh, this message translates to:
  /// **'个性化'**
  String get hubPersonalization;

  /// No description provided for @hubPersonalizationAboutYou.
  ///
  /// In zh, this message translates to:
  /// **'关于你'**
  String get hubPersonalizationAboutYou;

  /// No description provided for @hubPersonalizationReplies.
  ///
  /// In zh, this message translates to:
  /// **'回答'**
  String get hubPersonalizationReplies;

  /// No description provided for @hubPersonalizationWorkStyle.
  ///
  /// In zh, this message translates to:
  /// **'工作方式'**
  String get hubPersonalizationWorkStyle;

  /// No description provided for @hubPrivacy.
  ///
  /// In zh, this message translates to:
  /// **'隐私与分享'**
  String get hubPrivacy;

  /// No description provided for @hubPrivacySharing.
  ///
  /// In zh, this message translates to:
  /// **'分享'**
  String get hubPrivacySharing;

  /// No description provided for @hubInterfaceHome.
  ///
  /// In zh, this message translates to:
  /// **'首页'**
  String get hubInterfaceHome;

  /// No description provided for @hubInterfaceWebHint.
  ///
  /// In zh, this message translates to:
  /// **'DSH 官方网页版'**
  String get hubInterfaceWebHint;

  /// No description provided for @hubInterfaceOpenWeb.
  ///
  /// In zh, this message translates to:
  /// **'打开网页版'**
  String get hubInterfaceOpenWeb;

  /// No description provided for @hubInterfacePhoneLayout.
  ///
  /// In zh, this message translates to:
  /// **'手机布局'**
  String get hubInterfacePhoneLayout;

  /// No description provided for @hubAbout.
  ///
  /// In zh, this message translates to:
  /// **'关于 DSH Go'**
  String get hubAbout;

  /// No description provided for @hubAboutNewVersion.
  ///
  /// In zh, this message translates to:
  /// **'有新版本'**
  String get hubAboutNewVersion;

  /// No description provided for @hubValueSet.
  ///
  /// In zh, this message translates to:
  /// **'已设置'**
  String get hubValueSet;

  /// No description provided for @hubValueOff.
  ///
  /// In zh, this message translates to:
  /// **'未开启'**
  String get hubValueOff;

  /// No description provided for @hubValueOneStep.
  ///
  /// In zh, this message translates to:
  /// **'还差一步'**
  String get hubValueOneStep;

  /// No description provided for @hubValueAllowed.
  ///
  /// In zh, this message translates to:
  /// **'已允许'**
  String get hubValueAllowed;

  /// No description provided for @hubValueNeedsSetup.
  ///
  /// In zh, this message translates to:
  /// **'需设置'**
  String get hubValueNeedsSetup;

  /// No description provided for @hubValueHosts.
  ///
  /// In zh, this message translates to:
  /// **'{count} 台'**
  String hubValueHosts(int count);

  /// No description provided for @hubValueNoHosts.
  ///
  /// In zh, this message translates to:
  /// **'未添加'**
  String get hubValueNoHosts;

  /// No description provided for @hubValuePlugins.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String hubValuePlugins(int count);

  /// No description provided for @hubEngineStartup.
  ///
  /// In zh, this message translates to:
  /// **'启动'**
  String get hubEngineStartup;

  /// No description provided for @hubThemeLightDark.
  ///
  /// In zh, this message translates to:
  /// **'明暗'**
  String get hubThemeLightDark;

  /// No description provided for @hubPermissionPhone.
  ///
  /// In zh, this message translates to:
  /// **'手机'**
  String get hubPermissionPhone;

  /// No description provided for @hubPermissionPhoneConfirm.
  ///
  /// In zh, this message translates to:
  /// **'手机操控确认'**
  String get hubPermissionPhoneConfirm;

  /// No description provided for @launchScreenTitle.
  ///
  /// In zh, this message translates to:
  /// **'启动画面'**
  String get launchScreenTitle;

  /// No description provided for @launchDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认'**
  String get launchDefault;

  /// No description provided for @launchCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get launchCustom;

  /// No description provided for @launchFit.
  ///
  /// In zh, this message translates to:
  /// **'适配方式'**
  String get launchFit;

  /// No description provided for @launchFitFill.
  ///
  /// In zh, this message translates to:
  /// **'填满'**
  String get launchFitFill;

  /// No description provided for @launchFitCenter.
  ///
  /// In zh, this message translates to:
  /// **'居中'**
  String get launchFitCenter;

  /// No description provided for @launchBackground.
  ///
  /// In zh, this message translates to:
  /// **'背景色'**
  String get launchBackground;

  /// No description provided for @launchBackdropAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get launchBackdropAuto;

  /// No description provided for @launchBackdropEdge.
  ///
  /// In zh, this message translates to:
  /// **'取自图片'**
  String get launchBackdropEdge;

  /// No description provided for @launchBackdropWhite.
  ///
  /// In zh, this message translates to:
  /// **'白色'**
  String get launchBackdropWhite;

  /// No description provided for @launchBackdropBlack.
  ///
  /// In zh, this message translates to:
  /// **'黑色'**
  String get launchBackdropBlack;

  /// No description provided for @launchReplace.
  ///
  /// In zh, this message translates to:
  /// **'更换图片或视频'**
  String get launchReplace;

  /// No description provided for @launchPreview.
  ///
  /// In zh, this message translates to:
  /// **'预览'**
  String get launchPreview;

  /// No description provided for @launchFooter.
  ///
  /// In zh, this message translates to:
  /// **'图片、动图 8 MB 以内，视频 30 MB 以内。冷启动时完整播放一遍，轻点可跳过'**
  String get launchFooter;

  /// No description provided for @launchChanged.
  ///
  /// In zh, this message translates to:
  /// **'启动画面已更换'**
  String get launchChanged;

  /// No description provided for @launchChangedSize.
  ///
  /// In zh, this message translates to:
  /// **'启动画面已更换 · {size}'**
  String launchChangedSize(String size);

  /// No description provided for @launchTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'图片超过 8 MB'**
  String get launchTooLarge;

  /// No description provided for @launchOverLimit.
  ///
  /// In zh, this message translates to:
  /// **'文件超过 30 MB'**
  String get launchOverLimit;

  /// No description provided for @launchUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'支持 PNG、JPEG、WebP、GIF 和 MP4'**
  String get launchUnsupported;

  /// No description provided for @launchUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'无法读取这个文件'**
  String get launchUnreadable;

  /// No description provided for @launchUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'无法打开相册'**
  String get launchUnavailable;

  /// No description provided for @launchBroken.
  ///
  /// In zh, this message translates to:
  /// **'无法读取'**
  String get launchBroken;

  /// No description provided for @iconShortcutRow.
  ///
  /// In zh, this message translates to:
  /// **'图片快捷方式'**
  String get iconShortcutRow;

  /// No description provided for @iconShortcutRowSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'用自己的图片在桌面放一个入口'**
  String get iconShortcutRowSubtitle;

  /// No description provided for @iconShortcutPick.
  ///
  /// In zh, this message translates to:
  /// **'选择图片'**
  String get iconShortcutPick;

  /// No description provided for @iconShortcutChange.
  ///
  /// In zh, this message translates to:
  /// **'换一张'**
  String get iconShortcutChange;

  /// No description provided for @iconShortcutHint.
  ///
  /// In zh, this message translates to:
  /// **'拖动或双指缩放'**
  String get iconShortcutHint;

  /// No description provided for @iconShortcutName.
  ///
  /// In zh, this message translates to:
  /// **'名称'**
  String get iconShortcutName;

  /// No description provided for @iconShortcutAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加到桌面'**
  String get iconShortcutAdd;

  /// No description provided for @iconShortcutNote.
  ///
  /// In zh, this message translates to:
  /// **'系统不允许把桌面图标换成任意图片，这里会另放一个打开 DSH Go 的快捷方式；部分桌面会在它的角上加一个小标'**
  String get iconShortcutNote;

  /// No description provided for @iconShortcutAdded.
  ///
  /// In zh, this message translates to:
  /// **'已添加到桌面'**
  String get iconShortcutAdded;

  /// No description provided for @iconShortcutConfirm.
  ///
  /// In zh, this message translates to:
  /// **'在弹出的窗口里确认'**
  String get iconShortcutConfirm;

  /// No description provided for @iconShortcutNoDialog.
  ///
  /// In zh, this message translates to:
  /// **'没有弹窗？在系统设置里允许 DSH Go 创建桌面快捷方式'**
  String get iconShortcutNoDialog;

  /// No description provided for @iconShortcutSettings.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get iconShortcutSettings;

  /// No description provided for @iconShortcutUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这个桌面不支持添加快捷方式'**
  String get iconShortcutUnsupported;

  /// No description provided for @iconShortcutFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能添加，稍后再试'**
  String get iconShortcutFailed;

  /// No description provided for @searchKwLaunchScreen.
  ///
  /// In zh, this message translates to:
  /// **'开屏,启动动画,闪屏,开机画面,欢迎画面'**
  String get searchKwLaunchScreen;

  /// No description provided for @searchKwIconShortcut.
  ///
  /// In zh, this message translates to:
  /// **'快捷方式,自定义图标,桌面图片,换图标'**
  String get searchKwIconShortcut;

  /// No description provided for @localeTitle.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get localeTitle;

  /// No description provided for @localeSystem.
  ///
  /// In zh, this message translates to:
  /// **'跟随系统'**
  String get localeSystem;

  /// No description provided for @localeZh.
  ///
  /// In zh, this message translates to:
  /// **'简体中文'**
  String get localeZh;

  /// No description provided for @localeEn.
  ///
  /// In zh, this message translates to:
  /// **'English'**
  String get localeEn;

  /// No description provided for @localePt.
  ///
  /// In zh, this message translates to:
  /// **'Português'**
  String get localePt;

  /// No description provided for @localEnvChooseTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH 在哪里运行？'**
  String get localEnvChooseTitle;

  /// No description provided for @localEnvChooseMessage.
  ///
  /// In zh, this message translates to:
  /// **'之后可以在设置里更改'**
  String get localEnvChooseMessage;

  /// No description provided for @localEnvThisPhoneDetail.
  ///
  /// In zh, this message translates to:
  /// **'存储约 {storage} MB · 内存约 {memory} MB'**
  String localEnvThisPhoneDetail(int storage, int memory);

  /// No description provided for @localEnvThisPhoneDetailShort.
  ///
  /// In zh, this message translates to:
  /// **'内存约 {memory} MB'**
  String localEnvThisPhoneDetailShort(int memory);

  /// No description provided for @localEnvLowStorage.
  ///
  /// In zh, this message translates to:
  /// **'存储空间不足，需要约 {needed} MB'**
  String localEnvLowStorage(int needed);

  /// No description provided for @localEnvRemoteDetail.
  ///
  /// In zh, this message translates to:
  /// **'连接电脑或服务器上的 DSH'**
  String get localEnvRemoteDetail;

  /// No description provided for @localEnvRecommended.
  ///
  /// In zh, this message translates to:
  /// **'推荐'**
  String get localEnvRecommended;

  /// No description provided for @localEnvInstallTitle.
  ///
  /// In zh, this message translates to:
  /// **'安装本机运行环境'**
  String get localEnvInstallTitle;

  /// No description provided for @localEnvInstallMessage.
  ///
  /// In zh, this message translates to:
  /// **'在这台手机上运行 DSH'**
  String get localEnvInstallMessage;

  /// No description provided for @localEnvFactStorage.
  ///
  /// In zh, this message translates to:
  /// **'约 {storage} MB 存储空间'**
  String localEnvFactStorage(int storage);

  /// No description provided for @localEnvFactMemory.
  ///
  /// In zh, this message translates to:
  /// **'运行时约 {memory} MB 内存'**
  String localEnvFactMemory(int memory);

  /// No description provided for @localEnvUseRemote.
  ///
  /// In zh, this message translates to:
  /// **'改用远程主机'**
  String get localEnvUseRemote;

  /// No description provided for @localEnvNotInstalled.
  ///
  /// In zh, this message translates to:
  /// **'本机未安装运行环境'**
  String get localEnvNotInstalled;

  /// No description provided for @localEnvUninstall.
  ///
  /// In zh, this message translates to:
  /// **'卸载运行环境'**
  String get localEnvUninstall;

  /// No description provided for @localEnvUninstallHint.
  ///
  /// In zh, this message translates to:
  /// **'释放存储空间'**
  String get localEnvUninstallHint;

  /// No description provided for @localEnvUninstallTitle.
  ///
  /// In zh, this message translates to:
  /// **'卸载运行环境？'**
  String get localEnvUninstallTitle;

  /// No description provided for @localEnvUninstallBody.
  ///
  /// In zh, this message translates to:
  /// **'本机的对话、工作区、插件、设置、界面配置和技能会一并删除。'**
  String get localEnvUninstallBody;

  /// No description provided for @localEnvUninstallConfirm.
  ///
  /// In zh, this message translates to:
  /// **'卸载'**
  String get localEnvUninstallConfirm;

  /// No description provided for @localEnvUninstallFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能卸载，再试一次'**
  String get localEnvUninstallFailed;

  /// No description provided for @localEnvPhoneNeedsRuntime.
  ///
  /// In zh, this message translates to:
  /// **'安装本机运行环境后可用'**
  String get localEnvPhoneNeedsRuntime;

  /// No description provided for @localEnvSignInNeedsRuntime.
  ///
  /// In zh, this message translates to:
  /// **'需要本机运行环境'**
  String get localEnvSignInNeedsRuntime;

  /// No description provided for @localEnvSignInInstallFirst.
  ///
  /// In zh, this message translates to:
  /// **'安装后即可登录'**
  String get localEnvSignInInstallFirst;

  /// No description provided for @marketSectionOfficial.
  ///
  /// In zh, this message translates to:
  /// **'官方'**
  String get marketSectionOfficial;

  /// No description provided for @marketSectionAdapted.
  ///
  /// In zh, this message translates to:
  /// **'适配 DSH Go'**
  String get marketSectionAdapted;

  /// No description provided for @marketSectionAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get marketSectionAll;

  /// No description provided for @marketSectionLoading.
  ///
  /// In zh, this message translates to:
  /// **'正在载入…'**
  String get marketSectionLoading;

  /// No description provided for @marketSectionFailed.
  ///
  /// In zh, this message translates to:
  /// **'官方目录没打开'**
  String get marketSectionFailed;

  /// No description provided for @marketSectionEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无'**
  String get marketSectionEmpty;

  /// No description provided for @marketTierOfficial.
  ///
  /// In zh, this message translates to:
  /// **'官方'**
  String get marketTierOfficial;

  /// No description provided for @marketTierAdapted.
  ///
  /// In zh, this message translates to:
  /// **'适配 DSH Go'**
  String get marketTierAdapted;

  /// No description provided for @marketRiskMedium.
  ///
  /// In zh, this message translates to:
  /// **'中风险'**
  String get marketRiskMedium;

  /// No description provided for @marketRiskHigh.
  ///
  /// In zh, this message translates to:
  /// **'高风险'**
  String get marketRiskHigh;

  /// No description provided for @marketFlagInstallScripts.
  ///
  /// In zh, this message translates to:
  /// **'安装时运行脚本'**
  String get marketFlagInstallScripts;

  /// No description provided for @marketFlagInstallScriptsBody.
  ///
  /// In zh, this message translates to:
  /// **'安装时会自动运行包里的脚本（preinstall、install 或 postinstall）'**
  String get marketFlagInstallScriptsBody;

  /// No description provided for @marketFlagNativeCode.
  ///
  /// In zh, this message translates to:
  /// **'含原生程序'**
  String get marketFlagNativeCode;

  /// No description provided for @marketFlagNativeCodeBody.
  ///
  /// In zh, this message translates to:
  /// **'包里有编译好的原生程序（.node、binding.gyp 或二进制文件），没法直接阅读'**
  String get marketFlagNativeCodeBody;

  /// No description provided for @marketFlagShell.
  ///
  /// In zh, this message translates to:
  /// **'执行命令'**
  String get marketFlagShell;

  /// No description provided for @marketFlagShellBody.
  ///
  /// In zh, this message translates to:
  /// **'代码里会调用系统命令（child_process）'**
  String get marketFlagShellBody;

  /// No description provided for @marketFlagNetwork.
  ///
  /// In zh, this message translates to:
  /// **'联网'**
  String get marketFlagNetwork;

  /// No description provided for @marketFlagNetworkBody.
  ///
  /// In zh, this message translates to:
  /// **'代码里会发起网络请求（fetch、http、WebSocket）'**
  String get marketFlagNetworkBody;

  /// No description provided for @marketFlagFilesystem.
  ///
  /// In zh, this message translates to:
  /// **'写工作区外的文件'**
  String get marketFlagFilesystem;

  /// No description provided for @marketFlagFilesystemBody.
  ///
  /// In zh, this message translates to:
  /// **'会写入工作区以外的路径'**
  String get marketFlagFilesystemBody;

  /// No description provided for @marketFlagObfuscated.
  ///
  /// In zh, this message translates to:
  /// **'代码难以审阅'**
  String get marketFlagObfuscated;

  /// No description provided for @marketFlagObfuscatedBody.
  ///
  /// In zh, this message translates to:
  /// **'有压缩或混淆过的大文件，看不出它做什么'**
  String get marketFlagObfuscatedBody;

  /// No description provided for @marketFlagNotAdapted.
  ///
  /// In zh, this message translates to:
  /// **'未适配 DSH Go'**
  String get marketFlagNotAdapted;

  /// No description provided for @marketFlagNotAdaptedBody.
  ///
  /// In zh, this message translates to:
  /// **'没有声明 DSH Go 原生协议，在 App 里没有原生界面'**
  String get marketFlagNotAdaptedBody;

  /// No description provided for @marketFlagOtherBody.
  ///
  /// In zh, this message translates to:
  /// **'自动检查报告的其他特征'**
  String get marketFlagOtherBody;

  /// No description provided for @marketChecksTitle.
  ///
  /// In zh, this message translates to:
  /// **'自动检查'**
  String get marketChecksTitle;

  /// No description provided for @marketChecksClean.
  ///
  /// In zh, this message translates to:
  /// **'没有发现风险特征'**
  String get marketChecksClean;

  /// No description provided for @marketChecksNote.
  ///
  /// In zh, this message translates to:
  /// **'自动检查发现的特征，不代表插件有恶意'**
  String get marketChecksNote;

  /// No description provided for @marketCheckedOn.
  ///
  /// In zh, this message translates to:
  /// **'检查于 {date}'**
  String marketCheckedOn(String date);

  /// No description provided for @marketScreenshot.
  ///
  /// In zh, this message translates to:
  /// **'截图 {index}'**
  String marketScreenshot(int index);

  /// No description provided for @marketRiskConfirmTitle.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」有风险特征'**
  String marketRiskConfirmTitle(String name);

  /// No description provided for @marketRiskConfirmAction.
  ///
  /// In zh, this message translates to:
  /// **'仍然安装'**
  String get marketRiskConfirmAction;

  /// No description provided for @marketPinnedVersion.
  ///
  /// In zh, this message translates to:
  /// **'锁定版本'**
  String get marketPinnedVersion;

  /// No description provided for @marketRequiresApp.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH Go'**
  String get marketRequiresApp;

  /// No description provided for @marketNeedsApp.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH Go {version} 或更高版本'**
  String marketNeedsApp(String version);

  /// No description provided for @marketUpdateAvailable.
  ///
  /// In zh, this message translates to:
  /// **'有更新'**
  String get marketUpdateAvailable;

  /// No description provided for @marketBlockedTitle.
  ///
  /// In zh, this message translates to:
  /// **'这个版本已下架'**
  String get marketBlockedTitle;

  /// No description provided for @marketBlockedMessage.
  ///
  /// In zh, this message translates to:
  /// **'已安装的 {version} 已从插件市场下架，建议卸载'**
  String marketBlockedMessage(String version);

  /// No description provided for @marketBlockedRow.
  ///
  /// In zh, this message translates to:
  /// **'此版本已下架，建议卸载'**
  String get marketBlockedRow;

  /// No description provided for @marketBlockedBadge.
  ///
  /// In zh, this message translates to:
  /// **'已下架'**
  String get marketBlockedBadge;

  /// No description provided for @marketVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在核对版本…'**
  String get marketVerifying;

  /// No description provided for @marketMismatchTitle.
  ///
  /// In zh, this message translates to:
  /// **'版本校验不一致'**
  String get marketMismatchTitle;

  /// No description provided for @marketMismatchMessage.
  ///
  /// In zh, this message translates to:
  /// **'npm 上的 {version} 和插件市场检查过的不是同一个包，已停止安装'**
  String marketMismatchMessage(String version);

  /// No description provided for @marketSubmit.
  ///
  /// In zh, this message translates to:
  /// **'提交插件'**
  String get marketSubmit;

  /// No description provided for @marketSubmitHint.
  ///
  /// In zh, this message translates to:
  /// **'在 GitHub 提交，通过自动检查即上架'**
  String get marketSubmitHint;

  /// No description provided for @marketLinkNotFound.
  ///
  /// In zh, this message translates to:
  /// **'插件市场里没有 {name}'**
  String marketLinkNotFound(String name);

  /// No description provided for @marketVerificationUnavailableTitle.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法核对版本'**
  String get marketVerificationUnavailableTitle;

  /// No description provided for @marketVerificationUnavailableBody.
  ///
  /// In zh, this message translates to:
  /// **'没能取得 npm 的版本校验信息，尚未开始安装。请检查网络后重试。'**
  String get marketVerificationUnavailableBody;

  /// No description provided for @marketCombinedCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个插件'**
  String marketCombinedCount(int count);

  /// No description provided for @mediaGenerateTile.
  ///
  /// In zh, this message translates to:
  /// **'生成'**
  String get mediaGenerateTile;

  /// No description provided for @mediaAiGenerated.
  ///
  /// In zh, this message translates to:
  /// **'AI 生成'**
  String get mediaAiGenerated;

  /// No description provided for @mediaCostEstimate.
  ///
  /// In zh, this message translates to:
  /// **'约 {amount}'**
  String mediaCostEstimate(String amount);

  /// No description provided for @mediaSavedCount.
  ///
  /// In zh, this message translates to:
  /// **'已保存 {count} 张到相册'**
  String mediaSavedCount(int count);

  /// No description provided for @mediaRegenerate.
  ///
  /// In zh, this message translates to:
  /// **'重新生成'**
  String get mediaRegenerate;

  /// No description provided for @mediaCopyPrompt.
  ///
  /// In zh, this message translates to:
  /// **'复制提示词'**
  String get mediaCopyPrompt;

  /// No description provided for @mediaFileGone.
  ///
  /// In zh, this message translates to:
  /// **'文件已不在'**
  String get mediaFileGone;

  /// No description provided for @mediaKindImage.
  ///
  /// In zh, this message translates to:
  /// **'图像'**
  String get mediaKindImage;

  /// No description provided for @mediaKindVideo.
  ///
  /// In zh, this message translates to:
  /// **'视频'**
  String get mediaKindVideo;

  /// No description provided for @mediaTitleImage.
  ///
  /// In zh, this message translates to:
  /// **'生成图像'**
  String get mediaTitleImage;

  /// No description provided for @mediaTitleVideo.
  ///
  /// In zh, this message translates to:
  /// **'生成视频'**
  String get mediaTitleVideo;

  /// No description provided for @mediaOpenElsewhere.
  ///
  /// In zh, this message translates to:
  /// **'在其他应用中打开'**
  String get mediaOpenElsewhere;

  /// No description provided for @mediaShowInFiles.
  ///
  /// In zh, this message translates to:
  /// **'在文件中显示'**
  String get mediaShowInFiles;

  /// No description provided for @mediaGenerating.
  ///
  /// In zh, this message translates to:
  /// **'生成中'**
  String get mediaGenerating;

  /// No description provided for @mediaGeneratingProgress.
  ///
  /// In zh, this message translates to:
  /// **'生成中 · {progress}'**
  String mediaGeneratingProgress(String progress);

  /// No description provided for @mediaCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消'**
  String get mediaCancelled;

  /// No description provided for @mediaNotGenerated.
  ///
  /// In zh, this message translates to:
  /// **'未生成'**
  String get mediaNotGenerated;

  /// No description provided for @mediaPartial.
  ///
  /// In zh, this message translates to:
  /// **'{done} / {total} 张'**
  String mediaPartial(int done, int total);

  /// No description provided for @mediaCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 张'**
  String mediaCount(int count);

  /// No description provided for @mediaSeconds.
  ///
  /// In zh, this message translates to:
  /// **'{seconds} 秒'**
  String mediaSeconds(int seconds);

  /// No description provided for @mediaImageOf.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 张，共 {count} 张'**
  String mediaImageOf(int index, int count);

  /// No description provided for @mediaPageOf.
  ///
  /// In zh, this message translates to:
  /// **'{index} / {count}'**
  String mediaPageOf(int index, int count);

  /// No description provided for @mediaErrorPolicyInput.
  ///
  /// In zh, this message translates to:
  /// **'描述未通过内容审核'**
  String get mediaErrorPolicyInput;

  /// No description provided for @mediaErrorPolicyOutput.
  ///
  /// In zh, this message translates to:
  /// **'生成结果未通过内容审核'**
  String get mediaErrorPolicyOutput;

  /// No description provided for @mediaErrorAuth.
  ///
  /// In zh, this message translates to:
  /// **'服务未授权'**
  String get mediaErrorAuth;

  /// No description provided for @mediaErrorBalance.
  ///
  /// In zh, this message translates to:
  /// **'余额不足'**
  String get mediaErrorBalance;

  /// No description provided for @mediaErrorQuota.
  ///
  /// In zh, this message translates to:
  /// **'今天的额度已用完'**
  String get mediaErrorQuota;

  /// No description provided for @mediaErrorUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'服务暂时不可用'**
  String get mediaErrorUnavailable;

  /// No description provided for @mediaErrorExpired.
  ///
  /// In zh, this message translates to:
  /// **'结果已过期'**
  String get mediaErrorExpired;

  /// No description provided for @mediaErrorGeneric.
  ///
  /// In zh, this message translates to:
  /// **'没能生成'**
  String get mediaErrorGeneric;

  /// No description provided for @mediaVary.
  ///
  /// In zh, this message translates to:
  /// **'变体'**
  String get mediaVary;

  /// No description provided for @mediaEdit.
  ///
  /// In zh, this message translates to:
  /// **'编辑'**
  String get mediaEdit;

  /// No description provided for @mediaRevise.
  ///
  /// In zh, this message translates to:
  /// **'修改'**
  String get mediaRevise;

  /// No description provided for @mediaUpscale.
  ///
  /// In zh, this message translates to:
  /// **'放大'**
  String get mediaUpscale;

  /// No description provided for @mediaMakeVideo.
  ///
  /// In zh, this message translates to:
  /// **'做成视频'**
  String get mediaMakeVideo;

  /// No description provided for @mediaDetailModel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get mediaDetailModel;

  /// No description provided for @mediaDetailSize.
  ///
  /// In zh, this message translates to:
  /// **'尺寸'**
  String get mediaDetailSize;

  /// No description provided for @mediaDetailCost.
  ///
  /// In zh, this message translates to:
  /// **'费用'**
  String get mediaDetailCost;

  /// No description provided for @mediaDetailProvenance.
  ///
  /// In zh, this message translates to:
  /// **'来源标识'**
  String get mediaDetailProvenance;

  /// No description provided for @mediaDetailFile.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get mediaDetailFile;

  /// No description provided for @mediaOriginalPrompt.
  ///
  /// In zh, this message translates to:
  /// **'原文：{text}'**
  String mediaOriginalPrompt(String text);

  /// No description provided for @mediaProvenanceC2pa.
  ///
  /// In zh, this message translates to:
  /// **'C2PA'**
  String get mediaProvenanceC2pa;

  /// No description provided for @mediaProvenanceImplicit.
  ///
  /// In zh, this message translates to:
  /// **'隐式'**
  String get mediaProvenanceImplicit;

  /// No description provided for @mediaProvenanceVisible.
  ///
  /// In zh, this message translates to:
  /// **'可见水印'**
  String get mediaProvenanceVisible;

  /// No description provided for @mediaModeExit.
  ///
  /// In zh, this message translates to:
  /// **'退出生成'**
  String get mediaModeExit;

  /// No description provided for @mediaModeLabel.
  ///
  /// In zh, this message translates to:
  /// **'生成参数：{summary}'**
  String mediaModeLabel(String summary);

  /// No description provided for @mediaParamModel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get mediaParamModel;

  /// No description provided for @mediaParamAspect.
  ///
  /// In zh, this message translates to:
  /// **'比例'**
  String get mediaParamAspect;

  /// No description provided for @mediaParamCount.
  ///
  /// In zh, this message translates to:
  /// **'数量'**
  String get mediaParamCount;

  /// No description provided for @mediaParamQuality.
  ///
  /// In zh, this message translates to:
  /// **'清晰度'**
  String get mediaParamQuality;

  /// No description provided for @mediaParamDuration.
  ///
  /// In zh, this message translates to:
  /// **'时长'**
  String get mediaParamDuration;

  /// No description provided for @mediaQualityAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get mediaQualityAuto;

  /// No description provided for @mediaQualityStandard.
  ///
  /// In zh, this message translates to:
  /// **'标准'**
  String get mediaQualityStandard;

  /// No description provided for @mediaQualityHigh.
  ///
  /// In zh, this message translates to:
  /// **'高清'**
  String get mediaQualityHigh;

  /// No description provided for @mediaQuality4k.
  ///
  /// In zh, this message translates to:
  /// **'4K'**
  String get mediaQuality4k;

  /// No description provided for @mediaQualityLevelLow.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get mediaQualityLevelLow;

  /// No description provided for @mediaQualityLevelMedium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get mediaQualityLevelMedium;

  /// No description provided for @mediaQualityLevelHigh.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get mediaQualityLevelHigh;

  /// No description provided for @mediaModelPick.
  ///
  /// In zh, this message translates to:
  /// **'请选择'**
  String get mediaModelPick;

  /// No description provided for @mediaPickModelFirst.
  ///
  /// In zh, this message translates to:
  /// **'先选一个模型'**
  String get mediaPickModelFirst;

  /// No description provided for @mediaPricePerImage.
  ///
  /// In zh, this message translates to:
  /// **'{price} / 张'**
  String mediaPricePerImage(String price);

  /// No description provided for @mediaPricePerSecond.
  ///
  /// In zh, this message translates to:
  /// **'{price} / 秒'**
  String mediaPricePerSecond(String price);

  /// No description provided for @mediaManageModels.
  ///
  /// In zh, this message translates to:
  /// **'管理'**
  String get mediaManageModels;

  /// No description provided for @mediaHintImage.
  ///
  /// In zh, this message translates to:
  /// **'描述你想要的画面…'**
  String get mediaHintImage;

  /// No description provided for @mediaHintVideo.
  ///
  /// In zh, this message translates to:
  /// **'描述画面和镜头…'**
  String get mediaHintVideo;

  /// No description provided for @mediaHintEdit.
  ///
  /// In zh, this message translates to:
  /// **'想怎么改…'**
  String get mediaHintEdit;

  /// No description provided for @mediaFirstFrame.
  ///
  /// In zh, this message translates to:
  /// **'首帧'**
  String get mediaFirstFrame;

  /// No description provided for @mediaLastFrame.
  ///
  /// In zh, this message translates to:
  /// **'尾帧'**
  String get mediaLastFrame;

  /// No description provided for @mediaNoLastFrame.
  ///
  /// In zh, this message translates to:
  /// **'这个模型不支持尾帧'**
  String get mediaNoLastFrame;

  /// No description provided for @mediaNoRefs.
  ///
  /// In zh, this message translates to:
  /// **'这个模型不支持参考图'**
  String get mediaNoRefs;

  /// No description provided for @mediaRefLimit.
  ///
  /// In zh, this message translates to:
  /// **'最多 {count} 张参考图'**
  String mediaRefLimit(int count);

  /// No description provided for @mediaNoDescription.
  ///
  /// In zh, this message translates to:
  /// **'先写下想要的画面'**
  String get mediaNoDescription;

  /// No description provided for @mediaDescriptionTooLong.
  ///
  /// In zh, this message translates to:
  /// **'描述太长，删短一些再生成'**
  String get mediaDescriptionTooLong;

  /// No description provided for @mediaInstallTitle.
  ///
  /// In zh, this message translates to:
  /// **'图像与视频'**
  String get mediaInstallTitle;

  /// No description provided for @mediaInstallBody.
  ///
  /// In zh, this message translates to:
  /// **'这台主机还没有图像与视频插件'**
  String get mediaInstallBody;

  /// No description provided for @mediaInstallAction.
  ///
  /// In zh, this message translates to:
  /// **'在此主机上安装'**
  String get mediaInstallAction;

  /// No description provided for @mediaUnavailableTitle.
  ///
  /// In zh, this message translates to:
  /// **'生成模式不可用'**
  String get mediaUnavailableTitle;

  /// No description provided for @mediaUnavailableBody.
  ///
  /// In zh, this message translates to:
  /// **'这台主机的图像与视频插件版本不兼容。仍可直接在对话里描述想要的画面。'**
  String get mediaUnavailableBody;

  /// No description provided for @mediaUnavailableAction.
  ///
  /// In zh, this message translates to:
  /// **'管理插件'**
  String get mediaUnavailableAction;

  /// No description provided for @mediaSettingsTitle.
  ///
  /// In zh, this message translates to:
  /// **'图像与视频'**
  String get mediaSettingsTitle;

  /// No description provided for @searchKwMediaGeneration.
  ///
  /// In zh, this message translates to:
  /// **'生图,画图,文生图,视频生成,AI 绘画,生成图片,生成视频'**
  String get searchKwMediaGeneration;

  /// No description provided for @nearbyThisChat.
  ///
  /// In zh, this message translates to:
  /// **'本对话'**
  String get nearbyThisChat;

  /// No description provided for @nearbyPermissionTitle.
  ///
  /// In zh, this message translates to:
  /// **'本对话的权限'**
  String get nearbyPermissionTitle;

  /// No description provided for @nearbyNewChatDefault.
  ///
  /// In zh, this message translates to:
  /// **'新对话默认：{name}'**
  String nearbyNewChatDefault(String name);

  /// No description provided for @nearbySetAsDefault.
  ///
  /// In zh, this message translates to:
  /// **'设为新对话默认'**
  String get nearbySetAsDefault;

  /// No description provided for @nearbyManageModels.
  ///
  /// In zh, this message translates to:
  /// **'管理模型'**
  String get nearbyManageModels;

  /// No description provided for @nearbyPermissionPill.
  ///
  /// In zh, this message translates to:
  /// **'本对话的权限：{name}'**
  String nearbyPermissionPill(String name);

  /// No description provided for @nearbyChange.
  ///
  /// In zh, this message translates to:
  /// **'更换'**
  String get nearbyChange;

  /// No description provided for @performanceTitle.
  ///
  /// In zh, this message translates to:
  /// **'性能'**
  String get performanceTitle;

  /// No description provided for @performanceAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get performanceAuto;

  /// No description provided for @performanceFull.
  ///
  /// In zh, this message translates to:
  /// **'完整'**
  String get performanceFull;

  /// No description provided for @performanceLight.
  ///
  /// In zh, this message translates to:
  /// **'轻量'**
  String get performanceLight;

  /// No description provided for @performanceAutoHint.
  ///
  /// In zh, this message translates to:
  /// **'按设备调整默认效果'**
  String get performanceAutoHint;

  /// No description provided for @performanceFullHint.
  ///
  /// In zh, this message translates to:
  /// **'保留模糊与动效'**
  String get performanceFullHint;

  /// No description provided for @performanceLightHint.
  ///
  /// In zh, this message translates to:
  /// **'减少常驻效果和资源占用'**
  String get performanceLightHint;

  /// No description provided for @performanceChoiceHint.
  ///
  /// In zh, this message translates to:
  /// **'手动选择的宠物和引擎设置优先'**
  String get performanceChoiceHint;

  /// No description provided for @performanceCooling.
  ///
  /// In zh, this message translates to:
  /// **'正在减少效果，降温后恢复'**
  String get performanceCooling;

  /// No description provided for @performanceEffects.
  ///
  /// In zh, this message translates to:
  /// **'界面效果'**
  String get performanceEffects;

  /// No description provided for @performanceBlur.
  ///
  /// In zh, this message translates to:
  /// **'玻璃模糊'**
  String get performanceBlur;

  /// No description provided for @performanceAnimations.
  ///
  /// In zh, this message translates to:
  /// **'界面动效'**
  String get performanceAnimations;

  /// No description provided for @performanceSystemMotion.
  ///
  /// In zh, this message translates to:
  /// **'同时遵循系统的移除动画设置'**
  String get performanceSystemMotion;

  /// No description provided for @performanceFollowMode.
  ///
  /// In zh, this message translates to:
  /// **'效果跟随性能模式'**
  String get performanceFollowMode;

  /// No description provided for @performanceRemoteHint.
  ///
  /// In zh, this message translates to:
  /// **'推荐连接电脑或服务器，减少本机负担'**
  String get performanceRemoteHint;

  /// No description provided for @petActionSending.
  ///
  /// In zh, this message translates to:
  /// **'正在发送…'**
  String get petActionSending;

  /// No description provided for @petActionTargetChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机已变化，重新打开「问一句」；文字已保留'**
  String get petActionTargetChanged;

  /// No description provided for @petActionSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能发出，文字已保留，请重试'**
  String get petActionSendFailed;

  /// No description provided for @petActionBusy.
  ///
  /// In zh, this message translates to:
  /// **'这个对话正在忙，请选择「新对话」'**
  String get petActionBusy;

  /// No description provided for @petActionVoiceMissing.
  ///
  /// In zh, this message translates to:
  /// **'先到 App 下载离线语音模型'**
  String get petActionVoiceMissing;

  /// No description provided for @petActionVoiceTitle.
  ///
  /// In zh, this message translates to:
  /// **'语音问一句'**
  String get petActionVoiceTitle;

  /// No description provided for @petActionVoiceReturn.
  ///
  /// In zh, this message translates to:
  /// **'返回桌宠'**
  String get petActionVoiceReturn;

  /// No description provided for @petActionVoiceStop.
  ///
  /// In zh, this message translates to:
  /// **'结束录音'**
  String get petActionVoiceStop;

  /// No description provided for @petActionVoiceStart.
  ///
  /// In zh, this message translates to:
  /// **'开始录音'**
  String get petActionVoiceStart;

  /// No description provided for @phoneDiagnosticsCollecting.
  ///
  /// In zh, this message translates to:
  /// **'正在收集…'**
  String get phoneDiagnosticsCollecting;

  /// No description provided for @phoneDiagnosticsPacking.
  ///
  /// In zh, this message translates to:
  /// **'正在打包…'**
  String get phoneDiagnosticsPacking;

  /// No description provided for @phoneDiagnosticsSharing.
  ///
  /// In zh, this message translates to:
  /// **'正在打开分享…'**
  String get phoneDiagnosticsSharing;

  /// No description provided for @phoneDiagnosticsSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在存到「下载」…'**
  String get phoneDiagnosticsSaving;

  /// No description provided for @phoneDiagnosticsShare.
  ///
  /// In zh, this message translates to:
  /// **'分享诊断包'**
  String get phoneDiagnosticsShare;

  /// No description provided for @phoneDiagnosticsShareHint.
  ///
  /// In zh, this message translates to:
  /// **'附在问题反馈里'**
  String get phoneDiagnosticsShareHint;

  /// No description provided for @phoneDiagnosticsSave.
  ///
  /// In zh, this message translates to:
  /// **'存到「下载」'**
  String get phoneDiagnosticsSave;

  /// No description provided for @phoneDiagnosticsSaveHint.
  ///
  /// In zh, this message translates to:
  /// **'存进 下载/DSH-Go'**
  String get phoneDiagnosticsSaveHint;

  /// No description provided for @phoneDiagnosticsNote.
  ///
  /// In zh, this message translates to:
  /// **'含版本、设备、日志和最近一次崩溃，不含 Key 和令牌'**
  String get phoneDiagnosticsNote;

  /// No description provided for @phoneDiagnosticsExport.
  ///
  /// In zh, this message translates to:
  /// **'导出诊断包'**
  String get phoneDiagnosticsExport;

  /// No description provided for @phoneSafeMode.
  ///
  /// In zh, this message translates to:
  /// **'安全模式'**
  String get phoneSafeMode;

  /// No description provided for @phoneEngineStartingSafeEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在以安全模式启动…'**
  String get phoneEngineStartingSafeEllipsis;

  /// No description provided for @phoneEngineStartingEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在启动…'**
  String get phoneEngineStartingEllipsis;

  /// No description provided for @phoneEngineTidyingFilesEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在整理插件文件…'**
  String get phoneEngineTidyingFilesEllipsis;

  /// No description provided for @phoneEngineStoppingEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在停止…'**
  String get phoneEngineStoppingEllipsis;

  /// No description provided for @phoneEngineStoppedNextSafe.
  ///
  /// In zh, this message translates to:
  /// **'已停止 · 下次以安全模式启动'**
  String get phoneEngineStoppedNextSafe;

  /// No description provided for @phoneEngineInstallingRuntime.
  ///
  /// In zh, this message translates to:
  /// **'正在安装运行环境…'**
  String get phoneEngineInstallingRuntime;

  /// No description provided for @phoneEngineRuntimeNotInstalled.
  ///
  /// In zh, this message translates to:
  /// **'运行环境未安装'**
  String get phoneEngineRuntimeNotInstalled;

  /// No description provided for @phoneEngineErrorSeeLogs.
  ///
  /// In zh, this message translates to:
  /// **'引擎出错了，日志里有详情'**
  String get phoneEngineErrorSeeLogs;

  /// No description provided for @phoneEngineTitle.
  ///
  /// In zh, this message translates to:
  /// **'本机引擎'**
  String get phoneEngineTitle;

  /// No description provided for @phoneEngineLocal.
  ///
  /// In zh, this message translates to:
  /// **'本机引擎'**
  String get phoneEngineLocal;

  /// No description provided for @phoneEngineLogs.
  ///
  /// In zh, this message translates to:
  /// **'日志'**
  String get phoneEngineLogs;

  /// No description provided for @phoneEngineAutoStart.
  ///
  /// In zh, this message translates to:
  /// **'打开 App 时自动启动'**
  String get phoneEngineAutoStart;

  /// No description provided for @phoneEngineKeepAlive.
  ///
  /// In zh, this message translates to:
  /// **'后台运行'**
  String get phoneEngineKeepAlive;

  /// No description provided for @phoneEngineKeepAliveHint.
  ///
  /// In zh, this message translates to:
  /// **'防止引擎被系统结束'**
  String get phoneEngineKeepAliveHint;

  /// No description provided for @phoneEngineDiagnostics.
  ///
  /// In zh, this message translates to:
  /// **'诊断'**
  String get phoneEngineDiagnostics;

  /// No description provided for @phoneEngineDiagnosticsHint.
  ///
  /// In zh, this message translates to:
  /// **'运行信息与问题反馈'**
  String get phoneEngineDiagnosticsHint;

  /// No description provided for @phoneEngineRuntime.
  ///
  /// In zh, this message translates to:
  /// **'运行环境'**
  String get phoneEngineRuntime;

  /// No description provided for @phoneEngineArchitecture.
  ///
  /// In zh, this message translates to:
  /// **'架构'**
  String get phoneEngineArchitecture;

  /// No description provided for @phoneEngineStopTitle.
  ///
  /// In zh, this message translates to:
  /// **'停止引擎？'**
  String get phoneEngineStopTitle;

  /// No description provided for @phoneEngineStopBody.
  ///
  /// In zh, this message translates to:
  /// **'进行中的对话会中断，随时可以再启动。'**
  String get phoneEngineStopBody;

  /// No description provided for @phoneEngineInstallRuntime.
  ///
  /// In zh, this message translates to:
  /// **'安装运行环境'**
  String get phoneEngineInstallRuntime;

  /// No description provided for @phoneEngineStartAgain.
  ///
  /// In zh, this message translates to:
  /// **'重新启动'**
  String get phoneEngineStartAgain;

  /// No description provided for @phoneEngineStart.
  ///
  /// In zh, this message translates to:
  /// **'启动'**
  String get phoneEngineStart;

  /// No description provided for @phoneEngineRestart.
  ///
  /// In zh, this message translates to:
  /// **'重启'**
  String get phoneEngineRestart;

  /// No description provided for @phoneEngineResetFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能重置'**
  String get phoneEngineResetFailed;

  /// No description provided for @phoneEngineReset.
  ///
  /// In zh, this message translates to:
  /// **'重置运行环境'**
  String get phoneEngineReset;

  /// No description provided for @phoneEngineResetHint.
  ///
  /// In zh, this message translates to:
  /// **'删除对话和文件后重新解压'**
  String get phoneEngineResetHint;

  /// No description provided for @phoneEngineResetTitle.
  ///
  /// In zh, this message translates to:
  /// **'重置运行环境？'**
  String get phoneEngineResetTitle;

  /// No description provided for @phoneEngineKeepUiSkills.
  ///
  /// In zh, this message translates to:
  /// **'保留界面配置和技能'**
  String get phoneEngineKeepUiSkills;

  /// No description provided for @phoneEngineKeepPluginsSettings.
  ///
  /// In zh, this message translates to:
  /// **'保留已装插件和设置'**
  String get phoneEngineKeepPluginsSettings;

  /// No description provided for @phoneEngineDeleteReset.
  ///
  /// In zh, this message translates to:
  /// **'删除并重置'**
  String get phoneEngineDeleteReset;

  /// No description provided for @phoneEngineNotInstalled.
  ///
  /// In zh, this message translates to:
  /// **'未安装'**
  String get phoneEngineNotInstalled;

  /// No description provided for @phoneEngineInstalling.
  ///
  /// In zh, this message translates to:
  /// **'正在安装'**
  String get phoneEngineInstalling;

  /// No description provided for @phoneEngineStoppedSafe.
  ///
  /// In zh, this message translates to:
  /// **'已停止 · 安全模式'**
  String get phoneEngineStoppedSafe;

  /// No description provided for @phoneEngineStartingSafe.
  ///
  /// In zh, this message translates to:
  /// **'正在以安全模式启动'**
  String get phoneEngineStartingSafe;

  /// No description provided for @phoneEngineStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在启动'**
  String get phoneEngineStarting;

  /// No description provided for @phoneEngineTidyingFiles.
  ///
  /// In zh, this message translates to:
  /// **'正在整理插件文件'**
  String get phoneEngineTidyingFiles;

  /// No description provided for @phoneEngineRunningProbation.
  ///
  /// In zh, this message translates to:
  /// **'运行中 · 试用'**
  String get phoneEngineRunningProbation;

  /// No description provided for @phoneEngineStartupFailed.
  ///
  /// In zh, this message translates to:
  /// **'启动失败'**
  String get phoneEngineStartupFailed;

  /// No description provided for @phoneEngineCrashed.
  ///
  /// In zh, this message translates to:
  /// **'已崩溃'**
  String get phoneEngineCrashed;

  /// No description provided for @phoneEngineKilled.
  ///
  /// In zh, this message translates to:
  /// **'被系统结束'**
  String get phoneEngineKilled;

  /// No description provided for @phoneEngineError.
  ///
  /// In zh, this message translates to:
  /// **'出错了'**
  String get phoneEngineError;

  /// No description provided for @phoneEngineRuntimeCorrupt.
  ///
  /// In zh, this message translates to:
  /// **'App 内的运行环境包已损坏，请重新安装 App'**
  String get phoneEngineRuntimeCorrupt;

  /// No description provided for @phoneEngineExited.
  ///
  /// In zh, this message translates to:
  /// **'引擎意外退出了'**
  String get phoneEngineExited;

  /// No description provided for @phoneEngineRuntimeMissing.
  ///
  /// In zh, this message translates to:
  /// **'运行环境还没有安装'**
  String get phoneEngineRuntimeMissing;

  /// No description provided for @phoneEngineSafeUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这个版本的运行环境不支持安全模式，请更新 App'**
  String get phoneEngineSafeUnsupported;

  /// No description provided for @phoneEngineRuntimeIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'App 内的运行环境包不完整，请重新安装 App'**
  String get phoneEngineRuntimeIncomplete;

  /// No description provided for @phoneLogEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有日志'**
  String get phoneLogEmpty;

  /// No description provided for @phoneLogShareTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH 引擎日志'**
  String get phoneLogShareTitle;

  /// No description provided for @phoneLogCopyAll.
  ///
  /// In zh, this message translates to:
  /// **'复制全部'**
  String get phoneLogCopyAll;

  /// No description provided for @phoneBackgroundAllow.
  ///
  /// In zh, this message translates to:
  /// **'去放行'**
  String get phoneBackgroundAllow;

  /// No description provided for @phoneToolScreen.
  ///
  /// In zh, this message translates to:
  /// **'看屏幕'**
  String get phoneToolScreen;

  /// No description provided for @phoneToolCollect.
  ///
  /// In zh, this message translates to:
  /// **'滚动收集'**
  String get phoneToolCollect;

  /// No description provided for @phoneToolTap.
  ///
  /// In zh, this message translates to:
  /// **'点按'**
  String get phoneToolTap;

  /// No description provided for @phoneToolType.
  ///
  /// In zh, this message translates to:
  /// **'输入'**
  String get phoneToolType;

  /// No description provided for @phoneToolScroll.
  ///
  /// In zh, this message translates to:
  /// **'滑动'**
  String get phoneToolScroll;

  /// No description provided for @phoneToolKey.
  ///
  /// In zh, this message translates to:
  /// **'按键'**
  String get phoneToolKey;

  /// No description provided for @phoneToolTapCoordinates.
  ///
  /// In zh, this message translates to:
  /// **'点坐标'**
  String get phoneToolTapCoordinates;

  /// No description provided for @phoneToolHandoff.
  ///
  /// In zh, this message translates to:
  /// **'交还给你'**
  String get phoneToolHandoff;

  /// No description provided for @phoneToolOpenApp.
  ///
  /// In zh, this message translates to:
  /// **'打开 App'**
  String get phoneToolOpenApp;

  /// No description provided for @phoneToolListApps.
  ///
  /// In zh, this message translates to:
  /// **'查看应用'**
  String get phoneToolListApps;

  /// No description provided for @phoneToolIntent.
  ///
  /// In zh, this message translates to:
  /// **'系统动作'**
  String get phoneToolIntent;

  /// No description provided for @phoneToolNotify.
  ///
  /// In zh, this message translates to:
  /// **'发通知'**
  String get phoneToolNotify;

  /// No description provided for @phoneToolClipboard.
  ///
  /// In zh, this message translates to:
  /// **'剪贴板'**
  String get phoneToolClipboard;

  /// No description provided for @phoneToolAction.
  ///
  /// In zh, this message translates to:
  /// **'操作'**
  String get phoneToolAction;

  /// No description provided for @phoneDecisionContinued.
  ///
  /// In zh, this message translates to:
  /// **'你点了继续'**
  String get phoneDecisionContinued;

  /// No description provided for @phoneDecisionDone.
  ///
  /// In zh, this message translates to:
  /// **'已执行'**
  String get phoneDecisionDone;

  /// No description provided for @phoneDecisionAllowed.
  ///
  /// In zh, this message translates to:
  /// **'你允许了'**
  String get phoneDecisionAllowed;

  /// No description provided for @phoneDecisionPauseExpired.
  ///
  /// In zh, this message translates to:
  /// **'暂停太久'**
  String get phoneDecisionPauseExpired;

  /// No description provided for @phoneDecisionBlocked.
  ///
  /// In zh, this message translates to:
  /// **'已拦下'**
  String get phoneDecisionBlocked;

  /// No description provided for @phoneDecisionTimeout.
  ///
  /// In zh, this message translates to:
  /// **'超时'**
  String get phoneDecisionTimeout;

  /// No description provided for @phoneDecisionUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'不可用'**
  String get phoneDecisionUnavailable;

  /// No description provided for @phoneDecisionScreenChanged.
  ///
  /// In zh, this message translates to:
  /// **'屏幕变了'**
  String get phoneDecisionScreenChanged;

  /// No description provided for @phoneDecisionFailed.
  ///
  /// In zh, this message translates to:
  /// **'没成功'**
  String get phoneDecisionFailed;

  /// No description provided for @phoneActionLogTitle.
  ///
  /// In zh, this message translates to:
  /// **'操作记录'**
  String get phoneActionLogTitle;

  /// No description provided for @phoneActionLogSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'只记做了什么，不记屏幕内容'**
  String get phoneActionLogSubtitle;

  /// No description provided for @phoneActionLogRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get phoneActionLogRefresh;

  /// No description provided for @phoneActionLogEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有记录'**
  String get phoneActionLogEmpty;

  /// No description provided for @phoneActionLogEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'DSH 在手机上的每一步都会记在这里'**
  String get phoneActionLogEmptyHint;

  /// No description provided for @phoneAppRuleDeny.
  ///
  /// In zh, this message translates to:
  /// **'不碰'**
  String get phoneAppRuleDeny;

  /// No description provided for @phoneAppRuleConfirm.
  ///
  /// In zh, this message translates to:
  /// **'每一步都确认'**
  String get phoneAppRuleConfirm;

  /// No description provided for @phoneAppRuleNormal.
  ///
  /// In zh, this message translates to:
  /// **'照常'**
  String get phoneAppRuleNormal;

  /// No description provided for @phoneAppRuleDenyHint.
  ///
  /// In zh, this message translates to:
  /// **'不读也不点，银行、支付类默认如此'**
  String get phoneAppRuleDenyHint;

  /// No description provided for @phoneAppRuleConfirmHint.
  ///
  /// In zh, this message translates to:
  /// **'可以读，点按和输入前先问你'**
  String get phoneAppRuleConfirmHint;

  /// No description provided for @phoneAppRuleNormalHint.
  ///
  /// In zh, this message translates to:
  /// **'只有发送这类敏感操作先问你'**
  String get phoneAppRuleNormalHint;

  /// No description provided for @phoneAppRulesTitle.
  ///
  /// In zh, this message translates to:
  /// **'应用名单'**
  String get phoneAppRulesTitle;

  /// No description provided for @phoneAppRulesSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'没列出的 App 照常处理，敏感操作仍先问你'**
  String get phoneAppRulesSubtitle;

  /// No description provided for @phoneAppRulesUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'读不到应用名单'**
  String get phoneAppRulesUnavailable;

  /// No description provided for @phoneTryLater.
  ///
  /// In zh, this message translates to:
  /// **'稍后再试'**
  String get phoneTryLater;

  /// No description provided for @phoneAppRulesChanged.
  ///
  /// In zh, this message translates to:
  /// **'照常 · 你改过的'**
  String get phoneAppRulesChanged;

  /// No description provided for @phoneAppRulesAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加 App'**
  String get phoneAppRulesAdd;

  /// No description provided for @phoneAppRulesAddHint.
  ///
  /// In zh, this message translates to:
  /// **'按包名添加'**
  String get phoneAppRulesAddHint;

  /// No description provided for @phoneSensitiveActionsNote.
  ///
  /// In zh, this message translates to:
  /// **'密码、验证码、付款和系统设置都由你来'**
  String get phoneSensitiveActionsNote;

  /// No description provided for @phoneAppRulesSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没有保存成功，稍后再试'**
  String get phoneAppRulesSaveFailed;

  /// No description provided for @phoneAppRulesAcceptRisk.
  ///
  /// In zh, this message translates to:
  /// **'我知道风险，仍然修改'**
  String get phoneAppRulesAcceptRisk;

  /// No description provided for @phoneAppRulesPackage.
  ///
  /// In zh, this message translates to:
  /// **'包名'**
  String get phoneAppRulesPackage;

  /// No description provided for @phoneAppRulesPackageHint.
  ///
  /// In zh, this message translates to:
  /// **'在「设置 → 应用 → 应用信息」里能找到'**
  String get phoneAppRulesPackageHint;

  /// No description provided for @phoneDndRequiresAndroid.
  ///
  /// In zh, this message translates to:
  /// **'需要 Android 14 及以上'**
  String get phoneDndRequiresAndroid;

  /// No description provided for @phoneDndHiddenScreen.
  ///
  /// In zh, this message translates to:
  /// **'在看不见的屏幕上操作'**
  String get phoneDndHiddenScreen;

  /// No description provided for @phoneDndShizukuReady.
  ///
  /// In zh, this message translates to:
  /// **'Shizuku · 可以用了'**
  String get phoneDndShizukuReady;

  /// No description provided for @phoneNotReadyYet.
  ///
  /// In zh, this message translates to:
  /// **'还没准备好'**
  String get phoneNotReadyYet;

  /// No description provided for @phoneDndAdbReady.
  ///
  /// In zh, this message translates to:
  /// **'自连 ADB · 可以用了'**
  String get phoneDndAdbReady;

  /// No description provided for @phoneActionFailedLater.
  ///
  /// In zh, this message translates to:
  /// **'没有成功，稍后再试'**
  String get phoneActionFailedLater;

  /// No description provided for @phoneDndDisabled.
  ///
  /// In zh, this message translates to:
  /// **'不打扰模式已关闭'**
  String get phoneDndDisabled;

  /// No description provided for @phoneDndEnabled.
  ///
  /// In zh, this message translates to:
  /// **'不打扰模式已启用'**
  String get phoneDndEnabled;

  /// No description provided for @phoneDndShizukuPermissionFailed.
  ///
  /// In zh, this message translates to:
  /// **'没有拿到授权。可以在 Shizuku 的「应用管理」里给 DSH Go 授权'**
  String get phoneDndShizukuPermissionFailed;

  /// No description provided for @phoneDndPairedConnect.
  ///
  /// In zh, this message translates to:
  /// **'配对成功，点「连接」'**
  String get phoneDndPairedConnect;

  /// No description provided for @phoneDndTitle.
  ///
  /// In zh, this message translates to:
  /// **'不打扰模式'**
  String get phoneDndTitle;

  /// No description provided for @phoneDndSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'在看不见的屏幕上操作，不耽误你用手机'**
  String get phoneDndSubtitle;

  /// No description provided for @phoneDndUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这台手机用不了：需要 Android 14 及以上。'**
  String get phoneDndUnsupported;

  /// No description provided for @phoneDndRequirements.
  ///
  /// In zh, this message translates to:
  /// **'使用条件'**
  String get phoneDndRequirements;

  /// No description provided for @phoneDndKeepUnlocked.
  ///
  /// In zh, this message translates to:
  /// **'保持亮屏、解锁。'**
  String get phoneDndKeepUnlocked;

  /// No description provided for @phoneDndReactivate.
  ///
  /// In zh, this message translates to:
  /// **'重启手机后重新激活。'**
  String get phoneDndReactivate;

  /// No description provided for @phoneDndKeepDebugging.
  ///
  /// In zh, this message translates to:
  /// **'连接 Wi-Fi，并保持开发者选项和无线调试开启。'**
  String get phoneDndKeepDebugging;

  /// No description provided for @phoneDndUsingShizuku.
  ///
  /// In zh, this message translates to:
  /// **'正在使用：Shizuku'**
  String get phoneDndUsingShizuku;

  /// No description provided for @phoneDndUsingAdb.
  ///
  /// In zh, this message translates to:
  /// **'正在使用：自连 ADB'**
  String get phoneDndUsingAdb;

  /// No description provided for @phoneReady.
  ///
  /// In zh, this message translates to:
  /// **'可以用了'**
  String get phoneReady;

  /// No description provided for @phoneDndUseShizuku.
  ///
  /// In zh, this message translates to:
  /// **'用 Shizuku'**
  String get phoneDndUseShizuku;

  /// No description provided for @phoneDndDirectAdb.
  ///
  /// In zh, this message translates to:
  /// **'自连 ADB'**
  String get phoneDndDirectAdb;

  /// No description provided for @phoneDndInstallShizuku.
  ///
  /// In zh, this message translates to:
  /// **'先装 Shizuku（免费、开源）。已经在用冰箱、黑阈这类工具的话，多半已经装了。'**
  String get phoneDndInstallShizuku;

  /// No description provided for @phoneDndOpenShizukuSite.
  ///
  /// In zh, this message translates to:
  /// **'打开 Shizuku 官网'**
  String get phoneDndOpenShizukuSite;

  /// No description provided for @phoneDndStartShizuku.
  ///
  /// In zh, this message translates to:
  /// **'打开 Shizuku，按里面「通过无线调试启动」的说明做一遍（要连 Wi‑Fi）。回到这里会自动刷新。'**
  String get phoneDndStartShizuku;

  /// No description provided for @phoneDndGrantShizukuHint.
  ///
  /// In zh, this message translates to:
  /// **'Shizuku 已在运行，还要给 DSH Go 授权。'**
  String get phoneDndGrantShizukuHint;

  /// No description provided for @phoneDndGrantShizuku.
  ///
  /// In zh, this message translates to:
  /// **'授权给 DSH Go'**
  String get phoneDndGrantShizuku;

  /// No description provided for @phoneDndShizukuAllSet.
  ///
  /// In zh, this message translates to:
  /// **'Shizuku 这边准备好了。'**
  String get phoneDndShizukuAllSet;

  /// No description provided for @phoneDndShizukuInstalled.
  ///
  /// In zh, this message translates to:
  /// **'已安装 Shizuku'**
  String get phoneDndShizukuInstalled;

  /// No description provided for @phoneDndShizukuRunning.
  ///
  /// In zh, this message translates to:
  /// **'Shizuku 正在运行'**
  String get phoneDndShizukuRunning;

  /// No description provided for @phoneDndShizukuGranted.
  ///
  /// In zh, this message translates to:
  /// **'已授权给 DSH Go'**
  String get phoneDndShizukuGranted;

  /// No description provided for @phoneDndShizukuCompatibility.
  ///
  /// In zh, this message translates to:
  /// **'这版 Android 与官方版 Shizuku 存在兼容问题。'**
  String get phoneDndShizukuCompatibility;

  /// No description provided for @phoneDndWirelessDebuggingOn.
  ///
  /// In zh, this message translates to:
  /// **'无线调试已打开'**
  String get phoneDndWirelessDebuggingOn;

  /// No description provided for @phoneDndPaired.
  ///
  /// In zh, this message translates to:
  /// **'已配对'**
  String get phoneDndPaired;

  /// No description provided for @phoneDndConnected.
  ///
  /// In zh, this message translates to:
  /// **'已连接'**
  String get phoneDndConnected;

  /// No description provided for @phoneDndPairOnce.
  ///
  /// In zh, this message translates to:
  /// **'配对一次（不用装别的 App）'**
  String get phoneDndPairOnce;

  /// No description provided for @phoneDndDeveloperOptionsStep.
  ///
  /// In zh, this message translates to:
  /// **'打开开发者选项：在「关于手机」里连点「版本号」7 次。小米在「我的设备 → 全部参数与信息」里点「OS 版本」，vivo 点「软件版本号」。'**
  String get phoneDndDeveloperOptionsStep;

  /// No description provided for @phoneDndWirelessDebuggingStep.
  ///
  /// In zh, this message translates to:
  /// **'在开发者选项里打开「无线调试」，要连着 Wi‑Fi。开发者选项一般在「系统」或「其他设置」里。'**
  String get phoneDndWirelessDebuggingStep;

  /// No description provided for @phoneDndStartPairingStep.
  ///
  /// In zh, this message translates to:
  /// **'回到这里点「开始配对」，DSH 会发一条通知。'**
  String get phoneDndStartPairingStep;

  /// No description provided for @phoneDndGetPairingCodeStep.
  ///
  /// In zh, this message translates to:
  /// **'在「无线调试」里点「使用配对码配对设备」，屏幕上会出现 6 位配对码。'**
  String get phoneDndGetPairingCodeStep;

  /// No description provided for @phoneDndEnterPairingCodeStep.
  ///
  /// In zh, this message translates to:
  /// **'下拉通知栏，把配对码填进 DSH 的通知。配对成功后点「连接」。'**
  String get phoneDndEnterPairingCodeStep;

  /// No description provided for @phoneDndStartPairing.
  ///
  /// In zh, this message translates to:
  /// **'开始配对'**
  String get phoneDndStartPairing;

  /// No description provided for @phoneDndPairingNotificationSent.
  ///
  /// In zh, this message translates to:
  /// **'通知已发出，去「无线调试」里拿配对码'**
  String get phoneDndPairingNotificationSent;

  /// No description provided for @phoneDndManualEntry.
  ///
  /// In zh, this message translates to:
  /// **'手动填写'**
  String get phoneDndManualEntry;

  /// No description provided for @phoneDndConnect.
  ///
  /// In zh, this message translates to:
  /// **'连接'**
  String get phoneDndConnect;

  /// No description provided for @phoneDndManualEntryHint.
  ///
  /// In zh, this message translates to:
  /// **'通知里没有输入框时，用「手动填写」'**
  String get phoneDndManualEntryHint;

  /// No description provided for @phoneDndXiaomiUsbHint.
  ///
  /// In zh, this message translates to:
  /// **'打开「USB 调试（安全设置）」需插入 SIM 卡并登录小米账号。'**
  String get phoneDndXiaomiUsbHint;

  /// No description provided for @phoneDndEnable.
  ///
  /// In zh, this message translates to:
  /// **'启用不打扰模式'**
  String get phoneDndEnable;

  /// No description provided for @phoneDndEnterCodeTitle.
  ///
  /// In zh, this message translates to:
  /// **'填写配对码'**
  String get phoneDndEnterCodeTitle;

  /// No description provided for @phoneDndCodeLabel.
  ///
  /// In zh, this message translates to:
  /// **'6 位配对码'**
  String get phoneDndCodeLabel;

  /// No description provided for @phoneDndPortLabel.
  ///
  /// In zh, this message translates to:
  /// **'端口（可不填）'**
  String get phoneDndPortLabel;

  /// No description provided for @phoneDndPortHint.
  ///
  /// In zh, this message translates to:
  /// **'配对码下面「IP 地址和端口」冒号后的数字'**
  String get phoneDndPortHint;

  /// No description provided for @phoneDndPair.
  ///
  /// In zh, this message translates to:
  /// **'配对'**
  String get phoneDndPair;

  /// No description provided for @phoneConfirmAsk.
  ///
  /// In zh, this message translates to:
  /// **'每次都询问'**
  String get phoneConfirmAsk;

  /// No description provided for @phoneConfirmTask.
  ///
  /// In zh, this message translates to:
  /// **'本任务免确认'**
  String get phoneConfirmTask;

  /// No description provided for @phoneConfirmAlways.
  ///
  /// In zh, this message translates to:
  /// **'始终免确认'**
  String get phoneConfirmAlways;

  /// No description provided for @phoneConfirmAskHint.
  ///
  /// In zh, this message translates to:
  /// **'进新 App、发送、删除、付款前先问你'**
  String get phoneConfirmAskHint;

  /// No description provided for @phoneConfirmTaskHint.
  ///
  /// In zh, this message translates to:
  /// **'每个任务只问一次'**
  String get phoneConfirmTaskHint;

  /// No description provided for @phoneConfirmAlwaysHint.
  ///
  /// In zh, this message translates to:
  /// **'从不询问，直接操作'**
  String get phoneConfirmAlwaysHint;

  /// No description provided for @phoneConfirmTitle.
  ///
  /// In zh, this message translates to:
  /// **'确认方式'**
  String get phoneConfirmTitle;

  /// No description provided for @phoneConfirmAlwaysTitle.
  ///
  /// In zh, this message translates to:
  /// **'始终免确认？'**
  String get phoneConfirmAlwaysTitle;

  /// No description provided for @phoneConfirmAlwaysBody.
  ///
  /// In zh, this message translates to:
  /// **'打开 App、点按、发送、删除都直接做，不再问你。'**
  String get phoneConfirmAlwaysBody;

  /// No description provided for @phoneConfirmSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没改成，稍后再试'**
  String get phoneConfirmSaveFailed;

  /// No description provided for @phoneEnableFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能开启，稍后再试'**
  String get phoneEnableFailed;

  /// No description provided for @phoneDisableFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能关闭，稍后再试'**
  String get phoneDisableFailed;

  /// No description provided for @phoneEnabled.
  ///
  /// In zh, this message translates to:
  /// **'已开启'**
  String get phoneEnabled;

  /// No description provided for @phoneDisabled.
  ///
  /// In zh, this message translates to:
  /// **'已关闭'**
  String get phoneDisabled;

  /// No description provided for @phoneOpenAccessibilityFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开系统设置，请到「设置 → 无障碍」里找到 DSH'**
  String get phoneOpenAccessibilityFailed;

  /// No description provided for @phoneOpenAppInfoFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开应用信息，请到「设置 → 应用」里找到 DSH Go'**
  String get phoneOpenAppInfoFailed;

  /// No description provided for @phoneStopFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能停止，可以点悬浮条或通知上的「停止」'**
  String get phoneStopFailed;

  /// No description provided for @phoneControlTitle.
  ///
  /// In zh, this message translates to:
  /// **'手机操控'**
  String get phoneControlTitle;

  /// No description provided for @phoneControlSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'看屏幕、帮你点按，随时可以停'**
  String get phoneControlSubtitle;

  /// No description provided for @phoneControlWorking.
  ///
  /// In zh, this message translates to:
  /// **'正在操作手机'**
  String get phoneControlWorking;

  /// No description provided for @phoneControlTaskNoConfirmHint.
  ///
  /// In zh, this message translates to:
  /// **'本任务免确认 · 悬浮条上也能暂停或停止'**
  String get phoneControlTaskNoConfirmHint;

  /// No description provided for @phoneControlFloatingBarHint.
  ///
  /// In zh, this message translates to:
  /// **'悬浮条上也能暂停或停止'**
  String get phoneControlFloatingBarHint;

  /// No description provided for @phoneControlAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'进阶'**
  String get phoneControlAdvanced;

  /// No description provided for @phoneControlKeepAliveHint.
  ///
  /// In zh, this message translates to:
  /// **'防止系统关掉无障碍'**
  String get phoneControlKeepAliveHint;

  /// No description provided for @phoneControlReadingEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在读取…'**
  String get phoneControlReadingEllipsis;

  /// No description provided for @phoneControlNotReady.
  ///
  /// In zh, this message translates to:
  /// **'未就绪'**
  String get phoneControlNotReady;

  /// No description provided for @phoneControlNotEnabled.
  ///
  /// In zh, this message translates to:
  /// **'未开启'**
  String get phoneControlNotEnabled;

  /// No description provided for @phoneControlSafeModeNotLoaded.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不加载'**
  String get phoneControlSafeModeNotLoaded;

  /// No description provided for @phoneControlLocalOnly.
  ///
  /// In zh, this message translates to:
  /// **'只在本机引擎可用'**
  String get phoneControlLocalOnly;

  /// No description provided for @phoneControlAfterEngineStarts.
  ///
  /// In zh, this message translates to:
  /// **'引擎启动后生效'**
  String get phoneControlAfterEngineStarts;

  /// No description provided for @phoneControlNeedsAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'还差一步：打开无障碍'**
  String get phoneControlNeedsAccessibility;

  /// No description provided for @phoneControlReady.
  ///
  /// In zh, this message translates to:
  /// **'可以操作手机'**
  String get phoneControlReady;

  /// No description provided for @phoneControlSetup.
  ///
  /// In zh, this message translates to:
  /// **'准备'**
  String get phoneControlSetup;

  /// No description provided for @phoneControlAccessibilityService.
  ///
  /// In zh, this message translates to:
  /// **'无障碍服务'**
  String get phoneControlAccessibilityService;

  /// No description provided for @phoneControlAccessibilityReady.
  ///
  /// In zh, this message translates to:
  /// **'能看屏幕、帮你点按了'**
  String get phoneControlAccessibilityReady;

  /// No description provided for @phoneControlAccessibilityReconnect.
  ///
  /// In zh, this message translates to:
  /// **'服务没连上，关掉再打开一次'**
  String get phoneControlAccessibilityReconnect;

  /// No description provided for @phoneControlAccessibilityHint.
  ///
  /// In zh, this message translates to:
  /// **'看屏幕和点按都靠它'**
  String get phoneControlAccessibilityHint;

  /// No description provided for @phoneControlGoSettings.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get phoneControlGoSettings;

  /// No description provided for @phoneControlGoEnable.
  ///
  /// In zh, this message translates to:
  /// **'去开启'**
  String get phoneControlGoEnable;

  /// No description provided for @phoneControlAccessibilityBlocked.
  ///
  /// In zh, this message translates to:
  /// **'无障碍开关点不动？'**
  String get phoneControlAccessibilityBlocked;

  /// No description provided for @phoneControlRestrictedAfterAttempt.
  ///
  /// In zh, this message translates to:
  /// **'看起来没开成。侧载的 App 要先「允许受限制的设置」'**
  String get phoneControlRestrictedAfterAttempt;

  /// No description provided for @phoneControlRestrictedHint.
  ///
  /// In zh, this message translates to:
  /// **'侧载安装的 App 要先「允许受限制的设置」'**
  String get phoneControlRestrictedHint;

  /// No description provided for @phoneControlNotifications.
  ///
  /// In zh, this message translates to:
  /// **'通知'**
  String get phoneControlNotifications;

  /// No description provided for @phoneControlNotificationsPairingHint.
  ///
  /// In zh, this message translates to:
  /// **'确认、停止和配对码都走通知'**
  String get phoneControlNotificationsPairingHint;

  /// No description provided for @phoneControlNotificationsHint.
  ///
  /// In zh, this message translates to:
  /// **'确认和「停止」按钮要用到'**
  String get phoneControlNotificationsHint;

  /// No description provided for @phoneControlAllowed.
  ///
  /// In zh, this message translates to:
  /// **'已允许'**
  String get phoneControlAllowed;

  /// No description provided for @phoneControlTry.
  ///
  /// In zh, this message translates to:
  /// **'试一下'**
  String get phoneControlTry;

  /// No description provided for @phoneControlReadScreen.
  ///
  /// In zh, this message translates to:
  /// **'读一下当前屏幕'**
  String get phoneControlReadScreen;

  /// No description provided for @phoneControlReadScreenHint.
  ///
  /// In zh, this message translates to:
  /// **'看看 DSH 读到了什么，不发给模型'**
  String get phoneControlReadScreenHint;

  /// No description provided for @phoneControlEnableAccessibilityFirst.
  ///
  /// In zh, this message translates to:
  /// **'先打开无障碍服务'**
  String get phoneControlEnableAccessibilityFirst;

  /// No description provided for @phoneControlLoading.
  ///
  /// In zh, this message translates to:
  /// **'读取中'**
  String get phoneControlLoading;

  /// No description provided for @phoneControlRules.
  ///
  /// In zh, this message translates to:
  /// **'规则'**
  String get phoneControlRules;

  /// No description provided for @phoneControlRecentActions.
  ///
  /// In zh, this message translates to:
  /// **'最近操作'**
  String get phoneControlRecentActions;

  /// No description provided for @phoneControlRecentActionsHint.
  ///
  /// In zh, this message translates to:
  /// **'每一步都会记下，不含屏幕内容'**
  String get phoneControlRecentActionsHint;

  /// No description provided for @phoneControlAllActions.
  ///
  /// In zh, this message translates to:
  /// **'全部记录'**
  String get phoneControlAllActions;

  /// No description provided for @phoneControlModuleNotReady.
  ///
  /// In zh, this message translates to:
  /// **'这个版本里，手机操控模块还没有就绪'**
  String get phoneControlModuleNotReady;

  /// No description provided for @phoneControlSafeModeUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不可用'**
  String get phoneControlSafeModeUnavailable;

  /// No description provided for @phoneControlSafeModeHint.
  ///
  /// In zh, this message translates to:
  /// **'安全模式不加载插件，恢复正常模式后可用'**
  String get phoneControlSafeModeHint;

  /// No description provided for @phoneControlRemoteHost.
  ///
  /// In zh, this message translates to:
  /// **'当前连的是远程主机'**
  String get phoneControlRemoteHost;

  /// No description provided for @phoneControlCapabilities.
  ///
  /// In zh, this message translates to:
  /// **'开启后能做什么'**
  String get phoneControlCapabilities;

  /// No description provided for @phoneControlIntents.
  ///
  /// In zh, this message translates to:
  /// **'定闹钟、建日程、导航、分享'**
  String get phoneControlIntents;

  /// No description provided for @phoneControlNoExtraPermissions.
  ///
  /// In zh, this message translates to:
  /// **'不用额外权限'**
  String get phoneControlNoExtraPermissions;

  /// No description provided for @phoneControlReadToTable.
  ///
  /// In zh, this message translates to:
  /// **'读屏幕，整理成表格或待办'**
  String get phoneControlReadToTable;

  /// No description provided for @phoneControlNeedsAccessibilityHint.
  ///
  /// In zh, this message translates to:
  /// **'需要打开无障碍'**
  String get phoneControlNeedsAccessibilityHint;

  /// No description provided for @phoneControlTapType.
  ///
  /// In zh, this message translates to:
  /// **'帮你点按、输入'**
  String get phoneControlTapType;

  /// No description provided for @phoneControlSensitiveHint.
  ///
  /// In zh, this message translates to:
  /// **'发送、下单前先问你，付款由你来'**
  String get phoneControlSensitiveHint;

  /// No description provided for @phoneDisclosureWhatTitle.
  ///
  /// In zh, this message translates to:
  /// **'读什么'**
  String get phoneDisclosureWhatTitle;

  /// No description provided for @phoneDisclosureWhatBody.
  ///
  /// In zh, this message translates to:
  /// **'当前屏幕上的文字。用能看图的模型时，可能附一张截图。'**
  String get phoneDisclosureWhatBody;

  /// No description provided for @phoneDisclosureWhenTitle.
  ///
  /// In zh, this message translates to:
  /// **'什么时候读'**
  String get phoneDisclosureWhenTitle;

  /// No description provided for @phoneDisclosureWhenBody.
  ///
  /// In zh, this message translates to:
  /// **'只在你发起任务，或点「读一下当前屏幕」时。平时不读。'**
  String get phoneDisclosureWhenBody;

  /// No description provided for @phoneDisclosureWhoTitle.
  ///
  /// In zh, this message translates to:
  /// **'发给谁'**
  String get phoneDisclosureWhoTitle;

  /// No description provided for @phoneDisclosureWhoBody.
  ///
  /// In zh, this message translates to:
  /// **'发给你选的 DeepSeek 模型（云端）。银行卡号、身份证号会先打码。'**
  String get phoneDisclosureWhoBody;

  /// No description provided for @phoneDisclosureNeverTitle.
  ///
  /// In zh, this message translates to:
  /// **'默认不做'**
  String get phoneDisclosureNeverTitle;

  /// No description provided for @phoneDisclosureNeverBody.
  ///
  /// In zh, this message translates to:
  /// **'不输密码和验证码，不改系统设置，遇到就交还给你。银行、支付类 App 也不碰。'**
  String get phoneDisclosureNeverBody;

  /// No description provided for @phoneDisclosureStopTitle.
  ///
  /// In zh, this message translates to:
  /// **'你随时能停'**
  String get phoneDisclosureStopTitle;

  /// No description provided for @phoneDisclosureStopBody.
  ///
  /// In zh, this message translates to:
  /// **'操作时屏幕上有悬浮条，可以暂停、停止或插话。手机要亮屏、解锁。'**
  String get phoneDisclosureStopBody;

  /// No description provided for @phoneDisclosureTitle.
  ///
  /// In zh, this message translates to:
  /// **'开启手机操控前'**
  String get phoneDisclosureTitle;

  /// No description provided for @phoneDisclosureIntro.
  ///
  /// In zh, this message translates to:
  /// **'DSH 会像你一样看屏幕、点按，帮你把事办完。开启前，先了解这几点：'**
  String get phoneDisclosureIntro;

  /// No description provided for @phoneDisclosureRestartNote.
  ///
  /// In zh, this message translates to:
  /// **'开启后引擎会重启一次，进行中的回复会中断'**
  String get phoneDisclosureRestartNote;

  /// No description provided for @phoneDisclosureNotNow.
  ///
  /// In zh, this message translates to:
  /// **'先不开'**
  String get phoneDisclosureNotNow;

  /// No description provided for @phoneDisclosureAgreeEnable.
  ///
  /// In zh, this message translates to:
  /// **'同意并开启'**
  String get phoneDisclosureAgreeEnable;

  /// No description provided for @phoneCheckUnknown.
  ///
  /// In zh, this message translates to:
  /// **'不确定'**
  String get phoneCheckUnknown;

  /// No description provided for @phoneCheckYes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get phoneCheckYes;

  /// No description provided for @phoneCheckNotYet.
  ///
  /// In zh, this message translates to:
  /// **'还没有'**
  String get phoneCheckNotYet;

  /// No description provided for @phoneRomStock.
  ///
  /// In zh, this message translates to:
  /// **'原生 / 其他'**
  String get phoneRomStock;

  /// No description provided for @phoneRestrictedAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'无障碍'**
  String get phoneRestrictedAccessibility;

  /// No description provided for @phoneRestrictedOpenAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'去开无障碍'**
  String get phoneRestrictedOpenAccessibility;

  /// No description provided for @phoneRestrictedOverlay.
  ///
  /// In zh, this message translates to:
  /// **'悬浮窗'**
  String get phoneRestrictedOverlay;

  /// No description provided for @phoneRestrictedOpenOverlay.
  ///
  /// In zh, this message translates to:
  /// **'去开悬浮窗'**
  String get phoneRestrictedOpenOverlay;

  /// No description provided for @phoneRestrictedTryAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'先去「无障碍」里点一次 DSH 的开关，看到「受限制的设置」提示后点「确定」。做过这一步，下面的选项才会出现。'**
  String get phoneRestrictedTryAccessibility;

  /// No description provided for @phoneRestrictedOpenInfoStep.
  ///
  /// In zh, this message translates to:
  /// **'回到这里，点「打开应用信息」。'**
  String get phoneRestrictedOpenInfoStep;

  /// No description provided for @phoneRestrictedBackAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'回到「无障碍」，打开 DSH。'**
  String get phoneRestrictedBackAccessibility;

  /// No description provided for @phoneRestrictedMenuStep.
  ///
  /// In zh, this message translates to:
  /// **'点右上角的三个点，选「允许受限制的设置」，按提示验证锁屏密码。'**
  String get phoneRestrictedMenuStep;

  /// No description provided for @phoneRestrictedTryOverlay.
  ///
  /// In zh, this message translates to:
  /// **'先去「悬浮窗」设置里点一次 DSH Go 的开关，看到「受限制的设置」提示后点「确定」。做过这一步，下面的选项才会出现。'**
  String get phoneRestrictedTryOverlay;

  /// No description provided for @phoneRestrictedBackOverlay.
  ///
  /// In zh, this message translates to:
  /// **'回到「悬浮窗」设置，打开 DSH Go。'**
  String get phoneRestrictedBackOverlay;

  /// No description provided for @phoneRestrictedHuaweiOverlay.
  ///
  /// In zh, this message translates to:
  /// **'华为 HarmonyOS 4 及更早的系统大多没有这一步，直接去「悬浮窗」设置打开 DSH Go。'**
  String get phoneRestrictedHuaweiOverlay;

  /// No description provided for @phoneRestrictedHuaweiAccessibility.
  ///
  /// In zh, this message translates to:
  /// **'华为 HarmonyOS 4 及更早的系统大多没有这一步，直接去「无障碍」打开 DSH。'**
  String get phoneRestrictedHuaweiAccessibility;

  /// No description provided for @phoneRestrictedVivoNote.
  ///
  /// In zh, this message translates to:
  /// **'不同 OriginOS 版本位置可能不同。右上角没有三个点时，把应用信息页往下翻到底找一找。'**
  String get phoneRestrictedVivoNote;

  /// No description provided for @phoneRestrictedAdvancedStep.
  ///
  /// In zh, this message translates to:
  /// **'在「高级设置」里找到「允许受限制的设置」，打开它。'**
  String get phoneRestrictedAdvancedStep;

  /// No description provided for @phoneRestrictedOppoNote.
  ///
  /// In zh, this message translates to:
  /// **'ColorOS 有时找不到这个选项。这时用系统自带的「文件管理」找到 DSH 的安装包，点它覆盖安装一次（不用卸载，对话和设置都在），再去开无障碍。'**
  String get phoneRestrictedOppoNote;

  /// No description provided for @phoneRestrictedHuaweiNote.
  ///
  /// In zh, this message translates to:
  /// **'如果在无障碍里看到「受限制的设置」提示，按「原生 / 其他」的步骤做。'**
  String get phoneRestrictedHuaweiNote;

  /// No description provided for @phoneRestrictedTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许受限制的设置'**
  String get phoneRestrictedTitle;

  /// No description provided for @phoneRestrictedSteps.
  ///
  /// In zh, this message translates to:
  /// **'步骤'**
  String get phoneRestrictedSteps;

  /// No description provided for @phoneRestrictedDiagram.
  ///
  /// In zh, this message translates to:
  /// **'图示'**
  String get phoneRestrictedDiagram;

  /// No description provided for @phoneRestrictedOpenInfo.
  ///
  /// In zh, this message translates to:
  /// **'打开应用信息'**
  String get phoneRestrictedOpenInfo;

  /// No description provided for @phoneRestrictedOpenOverlayFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开悬浮窗设置，请到「设置」里搜索「悬浮窗」'**
  String get phoneRestrictedOpenOverlayFailed;

  /// No description provided for @phoneRestrictedOpenAccessibilityFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开无障碍设置，请到「设置」里搜索「无障碍」'**
  String get phoneRestrictedOpenAccessibilityFailed;

  /// No description provided for @phoneRestrictedFootnote.
  ///
  /// In zh, this message translates to:
  /// **'名称因系统而异，找不到就在设置里搜「受限制」；仍打不开时重启手机再试'**
  String get phoneRestrictedFootnote;

  /// No description provided for @phoneRestrictedAppInfo.
  ///
  /// In zh, this message translates to:
  /// **'应用信息'**
  String get phoneRestrictedAppInfo;

  /// No description provided for @phoneRestrictedPermissionsManager.
  ///
  /// In zh, this message translates to:
  /// **'权限管理'**
  String get phoneRestrictedPermissionsManager;

  /// No description provided for @phoneRestrictedBatterySaver.
  ///
  /// In zh, this message translates to:
  /// **'省电策略'**
  String get phoneRestrictedBatterySaver;

  /// No description provided for @phoneRestrictedAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'高级设置'**
  String get phoneRestrictedAdvanced;

  /// No description provided for @phoneRestrictedPermissions.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get phoneRestrictedPermissions;

  /// No description provided for @phoneRestrictedBattery.
  ///
  /// In zh, this message translates to:
  /// **'电池'**
  String get phoneRestrictedBattery;

  /// No description provided for @phoneRestrictedDiagramAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'图示：应用信息页里点「高级设置」，再打开「允许受限制的设置」'**
  String get phoneRestrictedDiagramAdvanced;

  /// No description provided for @phoneRestrictedDiagramMenu.
  ///
  /// In zh, this message translates to:
  /// **'图示：应用信息页点右上角三个点，再选「允许受限制的设置」'**
  String get phoneRestrictedDiagramMenu;

  /// No description provided for @phoneRestrictedCaptionAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'① 点「高级设置」'**
  String get phoneRestrictedCaptionAdvanced;

  /// No description provided for @phoneRestrictedCaptionMenu.
  ///
  /// In zh, this message translates to:
  /// **'① 点右上角三个点'**
  String get phoneRestrictedCaptionMenu;

  /// No description provided for @phoneRestrictedCaptionToggle.
  ///
  /// In zh, this message translates to:
  /// **'② 打开这个开关'**
  String get phoneRestrictedCaptionToggle;

  /// No description provided for @phoneRestrictedCaptionOption.
  ///
  /// In zh, this message translates to:
  /// **'② 选这一项'**
  String get phoneRestrictedCaptionOption;

  /// No description provided for @phoneScreenReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读到屏幕'**
  String get phoneScreenReadFailed;

  /// No description provided for @phoneScreenUnknownReason.
  ///
  /// In zh, this message translates to:
  /// **'原因不明'**
  String get phoneScreenUnknownReason;

  /// No description provided for @phoneScreenReadFailedHint.
  ///
  /// In zh, this message translates to:
  /// **'确认无障碍已开启。密码、支付这类页面系统不让读'**
  String get phoneScreenReadFailedHint;

  /// No description provided for @phoneScreenCurrent.
  ///
  /// In zh, this message translates to:
  /// **'当前屏幕'**
  String get phoneScreenCurrent;

  /// No description provided for @phoneScreenEmpty.
  ///
  /// In zh, this message translates to:
  /// **'（屏幕上没有可读的文字）'**
  String get phoneScreenEmpty;

  /// No description provided for @phoneScreenReadNote.
  ///
  /// In zh, this message translates to:
  /// **'模型看到的就是这些文字，这次读取没有发给模型'**
  String get phoneScreenReadNote;

  /// No description provided for @phoneFailureSafeStartup.
  ///
  /// In zh, this message translates to:
  /// **'安全模式也没能启动'**
  String get phoneFailureSafeStartup;

  /// No description provided for @phoneFailureSafeStartupHint.
  ///
  /// In zh, this message translates to:
  /// **'问题多半在全局配置或运行环境'**
  String get phoneFailureSafeStartupHint;

  /// No description provided for @phoneFailureKilled.
  ///
  /// In zh, this message translates to:
  /// **'引擎被系统结束了'**
  String get phoneFailureKilled;

  /// No description provided for @phoneFailureKilledHint.
  ///
  /// In zh, this message translates to:
  /// **'多半是内存不足或系统省电'**
  String get phoneFailureKilledHint;

  /// No description provided for @phoneFailureLaunch.
  ///
  /// In zh, this message translates to:
  /// **'本机运行环境未能启动'**
  String get phoneFailureLaunch;

  /// No description provided for @phoneFailureLaunchHint.
  ///
  /// In zh, this message translates to:
  /// **'查看日志了解原因，或连接远程主机继续使用'**
  String get phoneFailureLaunchHint;

  /// No description provided for @phoneFailureNoSpaceHint.
  ///
  /// In zh, this message translates to:
  /// **'清理一些空间后重试'**
  String get phoneFailureNoSpaceHint;

  /// No description provided for @phoneFailureStartup.
  ///
  /// In zh, this message translates to:
  /// **'DSH 启动失败'**
  String get phoneFailureStartup;

  /// No description provided for @phoneFailureCrashedEarly.
  ///
  /// In zh, this message translates to:
  /// **'DSH 启动后很快崩溃了'**
  String get phoneFailureCrashedEarly;

  /// No description provided for @phoneFailureCrashedLate.
  ///
  /// In zh, this message translates to:
  /// **'DSH 运行中崩溃了'**
  String get phoneFailureCrashedLate;

  /// No description provided for @phoneFailureFatal.
  ///
  /// In zh, this message translates to:
  /// **'引擎报告了致命错误'**
  String get phoneFailureFatal;

  /// No description provided for @phoneFailureRestore.
  ///
  /// In zh, this message translates to:
  /// **'恢复配置'**
  String get phoneFailureRestore;

  /// No description provided for @phoneFailureEnterSafe.
  ///
  /// In zh, this message translates to:
  /// **'进入安全模式'**
  String get phoneFailureEnterSafe;

  /// No description provided for @phoneFailureStartNormal.
  ///
  /// In zh, this message translates to:
  /// **'正常启动'**
  String get phoneFailureStartNormal;

  /// No description provided for @phoneFailureGlobalPatch.
  ///
  /// In zh, this message translates to:
  /// **'全局补丁'**
  String get phoneFailureGlobalPatch;

  /// No description provided for @phoneFailureEnvironment.
  ///
  /// In zh, this message translates to:
  /// **'环境变量'**
  String get phoneFailureEnvironment;

  /// No description provided for @phoneSafeMoveAsideTitle.
  ///
  /// In zh, this message translates to:
  /// **'先移开这些文件？'**
  String get phoneSafeMoveAsideTitle;

  /// No description provided for @phoneSafeMoveAsideIntro.
  ///
  /// In zh, this message translates to:
  /// **'它们对所有配置都生效，安全模式也会受影响：'**
  String get phoneSafeMoveAsideIntro;

  /// No description provided for @phoneSafeMoveAsideNote.
  ///
  /// In zh, this message translates to:
  /// **'只是改名（加上 .off-时间），不会删除，修好后可以改回来。'**
  String get phoneSafeMoveAsideNote;

  /// No description provided for @phoneSafeStartDirectly.
  ///
  /// In zh, this message translates to:
  /// **'直接启动'**
  String get phoneSafeStartDirectly;

  /// No description provided for @phoneSafeMoveAsideStart.
  ///
  /// In zh, this message translates to:
  /// **'移开并启动'**
  String get phoneSafeMoveAsideStart;

  /// No description provided for @phoneSafeNoRestoreNeeded.
  ///
  /// In zh, this message translates to:
  /// **'配置和上次正常时一样，无需恢复'**
  String get phoneSafeNoRestoreNeeded;

  /// No description provided for @phoneSafeNoRestoreRecord.
  ///
  /// In zh, this message translates to:
  /// **'还没有正常运行过的配置记录'**
  String get phoneSafeNoRestoreRecord;

  /// No description provided for @phoneSafeRestoreTitle.
  ///
  /// In zh, this message translates to:
  /// **'恢复上次正常的配置？'**
  String get phoneSafeRestoreTitle;

  /// No description provided for @phoneSafeRestoreStart.
  ///
  /// In zh, this message translates to:
  /// **'恢复并启动'**
  String get phoneSafeRestoreStart;

  /// No description provided for @phoneSafeRestoredStarting.
  ///
  /// In zh, this message translates to:
  /// **'已恢复上次正常的配置，正在启动…'**
  String get phoneSafeRestoredStarting;

  /// No description provided for @phoneSafeRestoreFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能恢复'**
  String get phoneSafeRestoreFailed;

  /// No description provided for @phoneSafeRestoreIntro.
  ///
  /// In zh, this message translates to:
  /// **'DSH 会回到上次正常运行时的配置：'**
  String get phoneSafeRestoreIntro;

  /// No description provided for @phoneSafeRestoreSettings.
  ///
  /// In zh, this message translates to:
  /// **'• 设置恢复到当时的版本（现在的另存为备份）'**
  String get phoneSafeRestoreSettings;

  /// No description provided for @phoneSafeRestoreNote.
  ///
  /// In zh, this message translates to:
  /// **'不会卸载任何插件，也不需要联网。停用的插件以后可以重新打开。'**
  String get phoneSafeRestoreNote;

  /// No description provided for @phoneSafeLeaveTitle.
  ///
  /// In zh, this message translates to:
  /// **'恢复正常模式？'**
  String get phoneSafeLeaveTitle;

  /// No description provided for @phoneSafeLeaveBody.
  ///
  /// In zh, this message translates to:
  /// **'用原来的配置和插件启动。安全模式期间改的网页版设置不会保留。'**
  String get phoneSafeLeaveBody;

  /// No description provided for @phoneSafeLeave.
  ///
  /// In zh, this message translates to:
  /// **'恢复正常模式'**
  String get phoneSafeLeave;

  /// No description provided for @phoneSafeMovePatch.
  ///
  /// In zh, this message translates to:
  /// **'移开补丁'**
  String get phoneSafeMovePatch;

  /// No description provided for @phoneSafeMoveFiles.
  ///
  /// In zh, this message translates to:
  /// **'移开文件'**
  String get phoneSafeMoveFiles;

  /// No description provided for @phoneSafeFailureLog.
  ///
  /// In zh, this message translates to:
  /// **'失败前后的日志'**
  String get phoneSafeFailureLog;

  /// No description provided for @phoneSafeFailureLogEmpty.
  ///
  /// In zh, this message translates to:
  /// **'没有记录到失败时的输出'**
  String get phoneSafeFailureLogEmpty;

  /// No description provided for @phoneSafeBannerTitle.
  ///
  /// In zh, this message translates to:
  /// **'安全模式 · 插件没有加载'**
  String get phoneSafeBannerTitle;

  /// No description provided for @phoneSafeBannerProbation.
  ///
  /// In zh, this message translates to:
  /// **'正在试用正常模式'**
  String get phoneSafeBannerProbation;

  /// No description provided for @phoneSafeBannerProbationHint.
  ///
  /// In zh, this message translates to:
  /// **'2 分钟内不再出错就算恢复，否则自动回到安全模式'**
  String get phoneSafeBannerProbationHint;

  /// No description provided for @phoneSafeBannerRunningHint.
  ///
  /// In zh, this message translates to:
  /// **'对话都在，修好配置后恢复正常模式'**
  String get phoneSafeBannerRunningHint;

  /// No description provided for @phoneSafeBannerFailedHint.
  ///
  /// In zh, this message translates to:
  /// **'安全模式也没能启动，去引擎页查看'**
  String get phoneSafeBannerFailedHint;

  /// No description provided for @phoneSafeBannerStoppedHint.
  ///
  /// In zh, this message translates to:
  /// **'引擎已停止，下次启动仍是安全模式'**
  String get phoneSafeBannerStoppedHint;

  /// No description provided for @phoneSafeRepair.
  ///
  /// In zh, this message translates to:
  /// **'帮我修复'**
  String get phoneSafeRepair;

  /// No description provided for @phoneSafeReasonStartup.
  ///
  /// In zh, this message translates to:
  /// **'连续两次启动失败'**
  String get phoneSafeReasonStartup;

  /// No description provided for @phoneSafeReasonProbation.
  ///
  /// In zh, this message translates to:
  /// **'恢复正常后又崩溃了'**
  String get phoneSafeReasonProbation;

  /// No description provided for @phoneSafeReasonManual.
  ///
  /// In zh, this message translates to:
  /// **'手动开启'**
  String get phoneSafeReasonManual;

  /// No description provided for @phoneSafeNormalSettingsHint.
  ///
  /// In zh, this message translates to:
  /// **'用原有配置和插件重启'**
  String get phoneSafeNormalSettingsHint;

  /// No description provided for @phoneSafeStartSettings.
  ///
  /// In zh, this message translates to:
  /// **'以安全模式启动'**
  String get phoneSafeStartSettings;

  /// No description provided for @phoneSafeStartSettingsHint.
  ///
  /// In zh, this message translates to:
  /// **'不加载插件，排查启动问题'**
  String get phoneSafeStartSettingsHint;

  /// No description provided for @phoneSafeAutoSettings.
  ///
  /// In zh, this message translates to:
  /// **'自动进入安全模式'**
  String get phoneSafeAutoSettings;

  /// No description provided for @phoneSafeAutoSettingsHint.
  ///
  /// In zh, this message translates to:
  /// **'连续启动失败时自动启用'**
  String get phoneSafeAutoSettingsHint;

  /// No description provided for @phoneAccentMist.
  ///
  /// In zh, this message translates to:
  /// **'雾蓝'**
  String get phoneAccentMist;

  /// No description provided for @phoneAccentDaiqing.
  ///
  /// In zh, this message translates to:
  /// **'黛青'**
  String get phoneAccentDaiqing;

  /// No description provided for @phoneAccentDusk.
  ///
  /// In zh, this message translates to:
  /// **'暮紫'**
  String get phoneAccentDusk;

  /// No description provided for @phoneAccentTurquoise.
  ///
  /// In zh, this message translates to:
  /// **'松石'**
  String get phoneAccentTurquoise;

  /// No description provided for @phoneAccentAmber.
  ///
  /// In zh, this message translates to:
  /// **'琥珀'**
  String get phoneAccentAmber;

  /// No description provided for @phoneAccentGraphite.
  ///
  /// In zh, this message translates to:
  /// **'石墨'**
  String get phoneAccentGraphite;

  /// No description provided for @phoneAccentCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get phoneAccentCustom;

  /// No description provided for @phoneEngineInstallPercent.
  ///
  /// In zh, this message translates to:
  /// **'正在安装 · {percent}%'**
  String phoneEngineInstallPercent(int percent);

  /// No description provided for @phoneEngineStatusSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{prefix}引擎：{status}'**
  String phoneEngineStatusSemantics(String prefix, String status);

  /// No description provided for @phoneLogLineCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 行'**
  String phoneLogLineCount(int count);

  /// No description provided for @phoneLogCopiedLines.
  ///
  /// In zh, this message translates to:
  /// **'已复制 {count} 行'**
  String phoneLogCopiedLines(int count);

  /// No description provided for @phoneAppRuleDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认：{rule}'**
  String phoneAppRuleDefault(String rule);

  /// No description provided for @phoneAppRulesLoosenTitle.
  ///
  /// In zh, this message translates to:
  /// **'让 DSH 操作「{app}」？'**
  String phoneAppRulesLoosenTitle(String app);

  /// No description provided for @phoneAppRulesSkipStepsTitle.
  ///
  /// In zh, this message translates to:
  /// **'「{app}」不再逐步确认？'**
  String phoneAppRulesSkipStepsTitle(String app);

  /// No description provided for @phoneDndShizukuStatus.
  ///
  /// In zh, this message translates to:
  /// **'Shizuku · {reason}'**
  String phoneDndShizukuStatus(String reason);

  /// No description provided for @phoneDndAdbStatus.
  ///
  /// In zh, this message translates to:
  /// **'自连 ADB · {reason}'**
  String phoneDndAdbStatus(String reason);

  /// No description provided for @phoneDndBrowserFailed.
  ///
  /// In zh, this message translates to:
  /// **'打不开浏览器。网址：{url}'**
  String phoneDndBrowserFailed(String url);

  /// No description provided for @phoneControlWorkingApp.
  ///
  /// In zh, this message translates to:
  /// **'正在操作「{app}」'**
  String phoneControlWorkingApp(String app);

  /// No description provided for @phoneControlPolicySummary.
  ///
  /// In zh, this message translates to:
  /// **'{denied} 个不碰 · {confirmed} 个每步确认'**
  String phoneControlPolicySummary(int denied, int confirmed);

  /// No description provided for @phoneControlRemoteHint.
  ///
  /// In zh, this message translates to:
  /// **'「{host}」上的 DSH 操作不了这台手机，切回「本机」后可用'**
  String phoneControlRemoteHint(String host);

  /// No description provided for @phoneRestrictedSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'侧载的 App 要先放行这一项，{place}开关才点得动'**
  String phoneRestrictedSubtitle(String place);

  /// No description provided for @phoneRestrictedDone.
  ///
  /// In zh, this message translates to:
  /// **'{place}已开好，可以返回了'**
  String phoneRestrictedDone(String place);

  /// No description provided for @phoneFailurePlugins.
  ///
  /// In zh, this message translates to:
  /// **'可能和插件「{plugins}」有关'**
  String phoneFailurePlugins(String plugins);

  /// No description provided for @phoneFailureRequired.
  ///
  /// In zh, this message translates to:
  /// **'必需组件 {components} 没通过启动检查'**
  String phoneFailureRequired(String components);

  /// No description provided for @phoneSafeRestoreAt.
  ///
  /// In zh, this message translates to:
  /// **'DSH 会回到 {when} 正常运行时的配置：'**
  String phoneSafeRestoreAt(String when);

  /// No description provided for @phoneSafeRestoreDisable.
  ///
  /// In zh, this message translates to:
  /// **'• 停用：{plugins}'**
  String phoneSafeRestoreDisable(String plugins);

  /// No description provided for @phoneSafeRestoreChanged.
  ///
  /// In zh, this message translates to:
  /// **'  （{plugins} 之后升级过，只能先停用）'**
  String phoneSafeRestoreChanged(String plugins);

  /// No description provided for @phoneSafeRestoreEnable.
  ///
  /// In zh, this message translates to:
  /// **'• 重新启用：{plugins}'**
  String phoneSafeRestoreEnable(String plugins);

  /// No description provided for @phoneSafeTodayTime.
  ///
  /// In zh, this message translates to:
  /// **'今天 {time}'**
  String phoneSafeTodayTime(String time);

  /// No description provided for @phoneSafeReasonPlugins.
  ///
  /// In zh, this message translates to:
  /// **'连续两次启动失败，可疑插件：{plugins}'**
  String phoneSafeReasonPlugins(String plugins);

  /// No description provided for @phoneListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get phoneListSeparator;

  /// No description provided for @phonePluginQuoteSeparator.
  ///
  /// In zh, this message translates to:
  /// **'」「'**
  String get phonePluginQuoteSeparator;

  /// No description provided for @phoneEngineRunningAt.
  ///
  /// In zh, this message translates to:
  /// **'运行中 · {address}'**
  String phoneEngineRunningAt(String address);

  /// No description provided for @phoneEngineSafeAt.
  ///
  /// In zh, this message translates to:
  /// **'安全模式 · {address}'**
  String phoneEngineSafeAt(String address);

  /// No description provided for @phoneAppRulesLoosenBody.
  ///
  /// In zh, this message translates to:
  /// **'银行、支付类 App 会检测自动操作，可能限制登录甚至冻结账号；DSH 默认不输密码、不付款。'**
  String get phoneAppRulesLoosenBody;

  /// No description provided for @phoneAppRulesSkipStepsBody.
  ///
  /// In zh, this message translates to:
  /// **'微信这类 App 有风控，曾有手机助手操作后账号被强制下线。改成照常后，只有发消息这类操作还会先问你。'**
  String get phoneAppRulesSkipStepsBody;

  /// No description provided for @phoneResetDeletesChatsWorkspaces.
  ///
  /// In zh, this message translates to:
  /// **'对话和工作区'**
  String get phoneResetDeletesChatsWorkspaces;

  /// No description provided for @phoneResetBodyChatsWorkspaces.
  ///
  /// In zh, this message translates to:
  /// **'会删除对话和工作区，然后重新安装运行环境。'**
  String get phoneResetBodyChatsWorkspaces;

  /// No description provided for @phoneResetDeletesWithPlugins.
  ///
  /// In zh, this message translates to:
  /// **'对话、工作区、插件和设置'**
  String get phoneResetDeletesWithPlugins;

  /// No description provided for @phoneResetBodyWithPlugins.
  ///
  /// In zh, this message translates to:
  /// **'会删除对话、工作区、插件和设置，然后重新安装运行环境。'**
  String get phoneResetBodyWithPlugins;

  /// No description provided for @phoneResetDeletesWithUi.
  ///
  /// In zh, this message translates to:
  /// **'对话、工作区、界面配置和技能'**
  String get phoneResetDeletesWithUi;

  /// No description provided for @phoneResetBodyWithUi.
  ///
  /// In zh, this message translates to:
  /// **'会删除对话、工作区、界面配置和技能，然后重新安装运行环境。'**
  String get phoneResetBodyWithUi;

  /// No description provided for @phoneResetDeletesEverything.
  ///
  /// In zh, this message translates to:
  /// **'对话、工作区、插件、设置、界面配置和技能'**
  String get phoneResetDeletesEverything;

  /// No description provided for @phoneResetBodyEverything.
  ///
  /// In zh, this message translates to:
  /// **'会删除对话、工作区、插件、设置、界面配置和技能，然后重新安装运行环境。'**
  String get phoneResetBodyEverything;

  /// No description provided for @phoneEngineStorageDetails.
  ///
  /// In zh, this message translates to:
  /// **'存储空间不足：需要约 {needed} MB，当前可用 {free} MB'**
  String phoneEngineStorageDetails(String needed, String free);

  /// No description provided for @phoneControlEnabledRestarting.
  ///
  /// In zh, this message translates to:
  /// **'已开启，引擎正在重启'**
  String get phoneControlEnabledRestarting;

  /// No description provided for @phoneControlDisabledRestarting.
  ///
  /// In zh, this message translates to:
  /// **'已关闭，引擎正在重启'**
  String get phoneControlDisabledRestarting;

  /// No description provided for @phoneControlEnabledPending.
  ///
  /// In zh, this message translates to:
  /// **'已开启，引擎启动后生效'**
  String get phoneControlEnabledPending;

  /// No description provided for @phoneReturnAfterDone.
  ///
  /// In zh, this message translates to:
  /// **'完成后返回 DSH Go'**
  String get phoneReturnAfterDone;

  /// No description provided for @phoneReturnAfterDoneHint.
  ///
  /// In zh, this message translates to:
  /// **'收起悬浮条，回到对话看结果'**
  String get phoneReturnAfterDoneHint;

  /// No description provided for @phoneFloatingBar.
  ///
  /// In zh, this message translates to:
  /// **'悬浮条'**
  String get phoneFloatingBar;

  /// No description provided for @phoneIdleOpacity.
  ///
  /// In zh, this message translates to:
  /// **'闲置时不透明度'**
  String get phoneIdleOpacity;

  /// No description provided for @phoneAutoCollapse.
  ///
  /// In zh, this message translates to:
  /// **'闲置时自动收起'**
  String get phoneAutoCollapse;

  /// No description provided for @phoneAutoCollapseHint.
  ///
  /// In zh, this message translates to:
  /// **'收成小球，点按展开'**
  String get phoneAutoCollapseHint;

  /// No description provided for @phoneDeveloperOptions.
  ///
  /// In zh, this message translates to:
  /// **'开发者选项'**
  String get phoneDeveloperOptions;

  /// No description provided for @phoneDirectEngine.
  ///
  /// In zh, this message translates to:
  /// **'直接启动本机引擎'**
  String get phoneDirectEngine;

  /// No description provided for @phoneDirectHint.
  ///
  /// In zh, this message translates to:
  /// **'实验功能，默认关闭，下次启动生效。部分手机（例如 Android 16）会拦截直接启动，届时自动改用兼容启动，数据不受影响。'**
  String get phoneDirectHint;

  /// No description provided for @phoneDirectFailedHint.
  ///
  /// In zh, this message translates to:
  /// **'这台手机上直接启动没有成功，已改用兼容启动。停止引擎后打开可再试一次。'**
  String get phoneDirectFailedHint;

  /// No description provided for @phoneDirectCompatibleHint.
  ///
  /// In zh, this message translates to:
  /// **'这次用了兼容启动，原因见上方。已保留此选项，下次启动会再试。'**
  String get phoneDirectCompatibleHint;

  /// No description provided for @phoneDirectStopFirst.
  ///
  /// In zh, this message translates to:
  /// **'请先停止本机引擎，再切换启动方式。'**
  String get phoneDirectStopFirst;

  /// No description provided for @phoneDirectSafeHint.
  ///
  /// In zh, this message translates to:
  /// **'安全模式使用兼容启动；恢复正常模式后应用此选项。'**
  String get phoneDirectSafeHint;

  /// No description provided for @phoneDirectNeedsRuntime.
  ///
  /// In zh, this message translates to:
  /// **'此选项需要支持直接启动的运行环境。'**
  String get phoneDirectNeedsRuntime;

  /// No description provided for @phoneDirectChangeFailed.
  ///
  /// In zh, this message translates to:
  /// **'未能切换启动方式，请停止本机引擎后重试。'**
  String get phoneDirectChangeFailed;

  /// No description provided for @phoneActualLaunchMode.
  ///
  /// In zh, this message translates to:
  /// **'当前运行方式'**
  String get phoneActualLaunchMode;

  /// No description provided for @phoneLaunchNotObserved.
  ///
  /// In zh, this message translates to:
  /// **'未运行'**
  String get phoneLaunchNotObserved;

  /// No description provided for @phoneLastLaunchSelection.
  ///
  /// In zh, this message translates to:
  /// **'上次启动方式'**
  String get phoneLastLaunchSelection;

  /// No description provided for @phoneDirectRejectedReason.
  ///
  /// In zh, this message translates to:
  /// **'兼容启动原因'**
  String get phoneDirectRejectedReason;

  /// No description provided for @phoneLaunchFailureReason.
  ///
  /// In zh, this message translates to:
  /// **'上次启动失败'**
  String get phoneLaunchFailureReason;

  /// No description provided for @phoneReturnCompatible.
  ///
  /// In zh, this message translates to:
  /// **'切回兼容启动'**
  String get phoneReturnCompatible;

  /// No description provided for @phoneLaunchDirect.
  ///
  /// In zh, this message translates to:
  /// **'直接启动'**
  String get phoneLaunchDirect;

  /// No description provided for @phoneLaunchCompatible.
  ///
  /// In zh, this message translates to:
  /// **'兼容启动'**
  String get phoneLaunchCompatible;

  /// No description provided for @phoneDirectIncompatibleFiles.
  ///
  /// In zh, this message translates to:
  /// **'插件文件待整理，暂用兼容启动'**
  String get phoneDirectIncompatibleFiles;

  /// No description provided for @phoneDirectNotEnoughSpace.
  ///
  /// In zh, this message translates to:
  /// **'空间不足，暂用兼容启动'**
  String get phoneDirectNotEnoughSpace;

  /// No description provided for @phoneDirectMigrationFailed.
  ///
  /// In zh, this message translates to:
  /// **'文件整理未完成，暂用兼容启动'**
  String get phoneDirectMigrationFailed;

  /// No description provided for @phoneDirectLaunchFailed.
  ///
  /// In zh, this message translates to:
  /// **'直接启动未成功'**
  String get phoneDirectLaunchFailed;

  /// No description provided for @phoneLaunchStartFailed.
  ///
  /// In zh, this message translates to:
  /// **'未能完成启动'**
  String get phoneLaunchStartFailed;

  /// No description provided for @phoneLaunchExited.
  ///
  /// In zh, this message translates to:
  /// **'退出码 {code}'**
  String phoneLaunchExited(String code);

  /// No description provided for @phoneTaskResultReady.
  ///
  /// In zh, this message translates to:
  /// **'任务完成 · 查看结果'**
  String get phoneTaskResultReady;

  /// No description provided for @phoneTaskEndedResult.
  ///
  /// In zh, this message translates to:
  /// **'任务已结束 · 查看结果'**
  String get phoneTaskEndedResult;

  /// No description provided for @phoneBackgroundGuideTitle.
  ///
  /// In zh, this message translates to:
  /// **'后台确认与返回'**
  String get phoneBackgroundGuideTitle;

  /// No description provided for @phoneBackgroundGuideSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'让确认卡和任务结果及时出现'**
  String get phoneBackgroundGuideSubtitle;

  /// No description provided for @phoneBackgroundGuideBody.
  ///
  /// In zh, this message translates to:
  /// **'需要你确认时，会显示 DSH Go 卡片。卡片不可用时会尝试通知或回到 App。请在系统设置中允许手机操控通知和弹出提醒。'**
  String get phoneBackgroundGuideBody;

  /// No description provided for @phoneBackgroundOemHint.
  ///
  /// In zh, this message translates to:
  /// **'在 DSH Go 的系统权限页检查「后台弹出界面」（若提供）。允许后可改善自动返回；菜单名称随系统版本变化。'**
  String get phoneBackgroundOemHint;

  /// No description provided for @phoneBackgroundReturnHint.
  ///
  /// In zh, this message translates to:
  /// **'如果任务完成后没有自动返回，可点通知「任务完成 · 查看结果」。系统关闭通知或限制后台弹出时，可能需要手动打开 DSH Go。'**
  String get phoneBackgroundReturnHint;

  /// No description provided for @phoneBackgroundGotIt.
  ///
  /// In zh, this message translates to:
  /// **'知道了'**
  String get phoneBackgroundGotIt;

  /// No description provided for @phoneBackgroundOpenSettings.
  ///
  /// In zh, this message translates to:
  /// **'打开系统设置'**
  String get phoneBackgroundOpenSettings;

  /// No description provided for @phoneBackgroundNotificationBlocked.
  ///
  /// In zh, this message translates to:
  /// **'请允许手机操控通知的弹出提醒'**
  String get phoneBackgroundNotificationBlocked;

  /// No description provided for @phoneModeTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择确认方式'**
  String get phoneModeTitle;

  /// No description provided for @phoneModeMessage.
  ///
  /// In zh, this message translates to:
  /// **'随时可在设置里更改'**
  String get phoneModeMessage;

  /// No description provided for @phoneModeAsk.
  ///
  /// In zh, this message translates to:
  /// **'关键步骤先问我'**
  String get phoneModeAsk;

  /// No description provided for @phoneModeAskHint.
  ///
  /// In zh, this message translates to:
  /// **'进新 App、发送、删除、付款前先问'**
  String get phoneModeAskHint;

  /// No description provided for @phoneModeAuto.
  ///
  /// In zh, this message translates to:
  /// **'全程自动'**
  String get phoneModeAuto;

  /// No description provided for @phoneModeAutoHint.
  ///
  /// In zh, this message translates to:
  /// **'不再询问，全程免打扰'**
  String get phoneModeAutoHint;

  /// No description provided for @phoneModeAutoNoteTitle.
  ///
  /// In zh, this message translates to:
  /// **'这些仍由你来操作'**
  String get phoneModeAutoNoteTitle;

  /// No description provided for @phoneModeAutoNote.
  ///
  /// In zh, this message translates to:
  /// **'系统设置和权限页面、密码和验证码、DSH Go 自身仍由你来操作；银行、支付类 App 默认不碰，可在设置里调整。'**
  String get phoneModeAutoNote;

  /// No description provided for @phoneModeAutoUnlockNote.
  ///
  /// In zh, this message translates to:
  /// **'如需让 AI 操作系统设置、密码等，可在 设置 › 手机操控 › 解除限制 中开启。'**
  String get phoneModeAutoUnlockNote;

  /// No description provided for @phoneModeConfirmAuto.
  ///
  /// In zh, this message translates to:
  /// **'开启全程自动'**
  String get phoneModeConfirmAuto;

  /// No description provided for @phoneYoursTitle.
  ///
  /// In zh, this message translates to:
  /// **'这些由你来操作'**
  String get phoneYoursTitle;

  /// No description provided for @phoneYoursSystem.
  ///
  /// In zh, this message translates to:
  /// **'系统设置和权限页面'**
  String get phoneYoursSystem;

  /// No description provided for @phoneYoursSecrets.
  ///
  /// In zh, this message translates to:
  /// **'密码和验证码'**
  String get phoneYoursSecrets;

  /// No description provided for @phoneYoursOwnApp.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 自身'**
  String get phoneYoursOwnApp;

  /// No description provided for @phoneYoursDenyList.
  ///
  /// In zh, this message translates to:
  /// **'应用名单里「不碰」的 App，默认含银行、支付类'**
  String get phoneYoursDenyList;

  /// No description provided for @phoneUnlockTitle.
  ///
  /// In zh, this message translates to:
  /// **'解除限制'**
  String get phoneUnlockTitle;

  /// No description provided for @phoneUnlockSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'让 AI 去做默认由你来做的事'**
  String get phoneUnlockSubtitle;

  /// No description provided for @phoneUnlockSystem.
  ///
  /// In zh, this message translates to:
  /// **'系统设置'**
  String get phoneUnlockSystem;

  /// No description provided for @phoneUnlockSystemHint.
  ///
  /// In zh, this message translates to:
  /// **'含权限页、安装器、安全中心、通知栏'**
  String get phoneUnlockSystemHint;

  /// No description provided for @phoneUnlockSecrets.
  ///
  /// In zh, this message translates to:
  /// **'密码和验证码'**
  String get phoneUnlockSecrets;

  /// No description provided for @phoneUnlockSecretsHint.
  ///
  /// In zh, this message translates to:
  /// **'填写密码、验证码和支付密码'**
  String get phoneUnlockSecretsHint;

  /// No description provided for @phoneUnlockOwnApp.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 自身'**
  String get phoneUnlockOwnApp;

  /// No description provided for @phoneUnlockOwnAppHint.
  ///
  /// In zh, this message translates to:
  /// **'在 DSH Go 里点按和输入'**
  String get phoneUnlockOwnAppHint;

  /// No description provided for @phoneUnlockBusy.
  ///
  /// In zh, this message translates to:
  /// **'任务进行中，结束后才能开启'**
  String get phoneUnlockBusy;

  /// No description provided for @phoneUnlockFootnote.
  ///
  /// In zh, this message translates to:
  /// **'开启后的后果由你承担。建议只在需要时开启，用完关闭。'**
  String get phoneUnlockFootnote;

  /// No description provided for @phoneUnlockBanks.
  ///
  /// In zh, this message translates to:
  /// **'银行、支付类 App'**
  String get phoneUnlockBanks;

  /// No description provided for @phoneUnlockBanksHint.
  ///
  /// In zh, this message translates to:
  /// **'在应用名单里调整'**
  String get phoneUnlockBanksHint;

  /// No description provided for @phoneUnlockNone.
  ///
  /// In zh, this message translates to:
  /// **'均未开启'**
  String get phoneUnlockNone;

  /// No description provided for @phoneUnlockCount.
  ///
  /// In zh, this message translates to:
  /// **'{count, plural, other{已开启 {count} 项}}'**
  String phoneUnlockCount(int count);

  /// No description provided for @phoneUnlockedBadge.
  ///
  /// In zh, this message translates to:
  /// **'已解除限制'**
  String get phoneUnlockedBadge;

  /// No description provided for @phoneUnlockConfirmSystemTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许 AI 操作系统设置？'**
  String get phoneUnlockConfirmSystemTitle;

  /// No description provided for @phoneUnlockConfirmSecretsTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许 AI 填写密码和验证码？'**
  String get phoneUnlockConfirmSecretsTitle;

  /// No description provided for @phoneUnlockConfirmOwnAppTitle.
  ///
  /// In zh, this message translates to:
  /// **'允许 AI 操作 DSH Go 自身？'**
  String get phoneUnlockConfirmOwnAppTitle;

  /// No description provided for @phoneUnlockCanTitle.
  ///
  /// In zh, this message translates to:
  /// **'开启后，AI 可以'**
  String get phoneUnlockCanTitle;

  /// No description provided for @phoneUnlockRiskTitle.
  ///
  /// In zh, this message translates to:
  /// **'可能出什么事'**
  String get phoneUnlockRiskTitle;

  /// No description provided for @phoneUnlockDisclaimerTitle.
  ///
  /// In zh, this message translates to:
  /// **'免责声明'**
  String get phoneUnlockDisclaimerTitle;

  /// No description provided for @phoneUnlockSystemCan1.
  ///
  /// In zh, this message translates to:
  /// **'打开和更改系统设置，包括权限、无障碍和开发者选项'**
  String get phoneUnlockSystemCan1;

  /// No description provided for @phoneUnlockSystemCan2.
  ///
  /// In zh, this message translates to:
  /// **'在安装器里安装、更新或卸载应用'**
  String get phoneUnlockSystemCan2;

  /// No description provided for @phoneUnlockSystemCan3.
  ///
  /// In zh, this message translates to:
  /// **'在安全中心和通知栏里点按，包括通知上的按钮'**
  String get phoneUnlockSystemCan3;

  /// No description provided for @phoneUnlockSystemRisk1.
  ///
  /// In zh, this message translates to:
  /// **'网页、消息或文件里的恶意指令可能诱导 AI 关掉保护、给其他应用授权或安装应用'**
  String get phoneUnlockSystemRisk1;

  /// No description provided for @phoneUnlockSystemRisk2.
  ///
  /// In zh, this message translates to:
  /// **'改错的网络、账号或安全设置，需要你自己改回来'**
  String get phoneUnlockSystemRisk2;

  /// No description provided for @phoneUnlockSecretsCan1.
  ///
  /// In zh, this message translates to:
  /// **'在密码、验证码和支付密码框里输入'**
  String get phoneUnlockSecretsCan1;

  /// No description provided for @phoneUnlockSecretsCan2.
  ///
  /// In zh, this message translates to:
  /// **'用它在对话、短信或通知里看到的验证码完成登录或验证'**
  String get phoneUnlockSecretsCan2;

  /// No description provided for @phoneUnlockSecretsCan3.
  ///
  /// In zh, this message translates to:
  /// **'操作记录里只显示 ••••，不记下填写的内容'**
  String get phoneUnlockSecretsCan3;

  /// No description provided for @phoneUnlockSecretsRisk1.
  ///
  /// In zh, this message translates to:
  /// **'恶意指令可能诱导 AI 把验证码填到别处，让他人登录你的账号'**
  String get phoneUnlockSecretsRisk1;

  /// No description provided for @phoneUnlockSecretsRisk2.
  ///
  /// In zh, this message translates to:
  /// **'可能完成你并不想要的付款或转账'**
  String get phoneUnlockSecretsRisk2;

  /// No description provided for @phoneUnlockOwnAppCan1.
  ///
  /// In zh, this message translates to:
  /// **'在 DSH Go 里点按和输入，包括修改设置'**
  String get phoneUnlockOwnAppCan1;

  /// No description provided for @phoneUnlockOwnAppCan2.
  ///
  /// In zh, this message translates to:
  /// **'读取 DSH Go 界面上的对话和设置'**
  String get phoneUnlockOwnAppCan2;

  /// No description provided for @phoneUnlockOwnAppRisk1.
  ///
  /// In zh, this message translates to:
  /// **'恶意指令可能诱导 AI 批准它自己发起的操作，或关掉确认'**
  String get phoneUnlockOwnAppRisk1;

  /// No description provided for @phoneUnlockOwnAppRisk2.
  ///
  /// In zh, this message translates to:
  /// **'这些界面上的内容会发给模型'**
  String get phoneUnlockOwnAppRisk2;

  /// No description provided for @phoneUnlockDisclaimer1.
  ///
  /// In zh, this message translates to:
  /// **'开启后，AI 可以在无人确认的情况下执行上述操作。'**
  String get phoneUnlockDisclaimer1;

  /// No description provided for @phoneUnlockDisclaimer2.
  ///
  /// In zh, this message translates to:
  /// **'AI 可能被网页、消息或文件中的内容误导。'**
  String get phoneUnlockDisclaimer2;

  /// No description provided for @phoneUnlockDisclaimer3.
  ///
  /// In zh, this message translates to:
  /// **'由此造成的账号、资金、数据或设备损失由你自行承担，DSH Go 及其开发者不承担责任。'**
  String get phoneUnlockDisclaimer3;

  /// No description provided for @phoneUnlockDisclaimer4.
  ///
  /// In zh, this message translates to:
  /// **'建议只在需要时临时开启，用完关闭。'**
  String get phoneUnlockDisclaimer4;

  /// No description provided for @phoneUnlockDisclaimer5.
  ///
  /// In zh, this message translates to:
  /// **'不建议在存有支付或银行信息的设备上开启。'**
  String get phoneUnlockDisclaimer5;

  /// No description provided for @phoneUnlockHold.
  ///
  /// In zh, this message translates to:
  /// **'我了解风险，开启'**
  String get phoneUnlockHold;

  /// No description provided for @phoneUnlockHoldHint.
  ///
  /// In zh, this message translates to:
  /// **'按住按钮约 1.5 秒'**
  String get phoneUnlockHoldHint;

  /// No description provided for @phoneUnlockOnNotice.
  ///
  /// In zh, this message translates to:
  /// **'已开启「{name}」'**
  String phoneUnlockOnNotice(String name);

  /// No description provided for @phoneUnlockOffNotice.
  ///
  /// In zh, this message translates to:
  /// **'已关闭「{name}」'**
  String phoneUnlockOffNotice(String name);

  /// No description provided for @searchKwPhoneUnlock.
  ///
  /// In zh, this message translates to:
  /// **'解除限制,放开限制,密码,验证码,系统设置,自身,风险,免责'**
  String get searchKwPhoneUnlock;

  /// No description provided for @pluginConfigUnsaved.
  ///
  /// In zh, this message translates to:
  /// **'未保存'**
  String get pluginConfigUnsaved;

  /// No description provided for @pluginConfigSecretSet.
  ///
  /// In zh, this message translates to:
  /// **'已设置'**
  String get pluginConfigSecretSet;

  /// No description provided for @pluginConfigAdvanced.
  ///
  /// In zh, this message translates to:
  /// **'高级'**
  String get pluginConfigAdvanced;

  /// No description provided for @pluginConfigSearchHint.
  ///
  /// In zh, this message translates to:
  /// **'搜索设置'**
  String get pluginConfigSearchHint;

  /// No description provided for @pluginConfigNoMatch.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的设置'**
  String get pluginConfigNoMatch;

  /// No description provided for @pluginConfigOpenWeb.
  ///
  /// In zh, this message translates to:
  /// **'在网页版设置'**
  String get pluginConfigOpenWeb;

  /// No description provided for @pluginConfigOpenWebHint.
  ///
  /// In zh, this message translates to:
  /// **'插件自带的设置页'**
  String get pluginConfigOpenWebHint;

  /// No description provided for @pluginConfigResetAll.
  ///
  /// In zh, this message translates to:
  /// **'全部恢复默认'**
  String get pluginConfigResetAll;

  /// No description provided for @pluginConfigResetAllTitle.
  ///
  /// In zh, this message translates to:
  /// **'全部恢复默认？'**
  String get pluginConfigResetAllTitle;

  /// No description provided for @pluginConfigReset.
  ///
  /// In zh, this message translates to:
  /// **'恢复'**
  String get pluginConfigReset;

  /// No description provided for @pluginConfigChanges.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项更改'**
  String pluginConfigChanges(int count);

  /// No description provided for @pluginConfigAppliesOnReload.
  ///
  /// In zh, this message translates to:
  /// **'保存后重新载入插件'**
  String get pluginConfigAppliesOnReload;

  /// No description provided for @pluginConfigSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在保存…'**
  String get pluginConfigSaving;

  /// No description provided for @pluginConfigReloading.
  ///
  /// In zh, this message translates to:
  /// **'正在重新载入…'**
  String get pluginConfigReloading;

  /// No description provided for @pluginConfigApplied.
  ///
  /// In zh, this message translates to:
  /// **'已生效'**
  String get pluginConfigApplied;

  /// No description provided for @pluginConfigFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能生效'**
  String get pluginConfigFailed;

  /// No description provided for @pluginConfigRestored.
  ///
  /// In zh, this message translates to:
  /// **'已恢复原设置'**
  String get pluginConfigRestored;

  /// No description provided for @pluginConfigStopped.
  ///
  /// In zh, this message translates to:
  /// **'没能生效，原设置也没能恢复'**
  String get pluginConfigStopped;

  /// No description provided for @pluginConfigRestore.
  ///
  /// In zh, this message translates to:
  /// **'恢复原设置'**
  String get pluginConfigRestore;

  /// No description provided for @pluginConfigDiscard.
  ///
  /// In zh, this message translates to:
  /// **'放弃'**
  String get pluginConfigDiscard;

  /// No description provided for @pluginConfigNotStarted.
  ///
  /// In zh, this message translates to:
  /// **'插件没有启动'**
  String get pluginConfigNotStarted;

  /// No description provided for @pluginConfigNone.
  ///
  /// In zh, this message translates to:
  /// **'没有可设置的项'**
  String get pluginConfigNone;

  /// No description provided for @pluginConfigInvalidOperation.
  ///
  /// In zh, this message translates to:
  /// **'这项改动无法应用'**
  String get pluginConfigInvalidOperation;

  /// No description provided for @pluginConfigGone.
  ///
  /// In zh, this message translates to:
  /// **'插件已不在运行，已刷新'**
  String get pluginConfigGone;

  /// No description provided for @pluginConfigUnknown.
  ///
  /// In zh, this message translates to:
  /// **'连接中断，已重新读取'**
  String get pluginConfigUnknown;

  /// No description provided for @pluginConfigUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'暂不支持在这里设置'**
  String get pluginConfigUnsupported;

  /// No description provided for @pluginConfigSecretUnbound.
  ///
  /// In zh, this message translates to:
  /// **'需插件适配后设置'**
  String get pluginConfigSecretUnbound;

  /// No description provided for @pluginConfigListFailed.
  ///
  /// In zh, this message translates to:
  /// **'插件清单读取失败，稍后重试'**
  String get pluginConfigListFailed;

  /// No description provided for @pluginConfigListUpdating.
  ///
  /// In zh, this message translates to:
  /// **'插件清单正在更新，请稍后再试'**
  String get pluginConfigListUpdating;

  /// No description provided for @pluginConfigFixed.
  ///
  /// In zh, this message translates to:
  /// **'由配置文件固定'**
  String get pluginConfigFixed;

  /// No description provided for @pluginConfigFixedNote.
  ///
  /// In zh, this message translates to:
  /// **'由配置文件固定，这里只能查看'**
  String get pluginConfigFixedNote;

  /// No description provided for @pluginConfigReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'只读'**
  String get pluginConfigReadOnly;

  /// No description provided for @pluginConfigEntryTitle.
  ///
  /// In zh, this message translates to:
  /// **'{bundle} · {entry}'**
  String pluginConfigEntryTitle(String bundle, String entry);

  /// No description provided for @pluginConfigNameSpeechToText.
  ///
  /// In zh, this message translates to:
  /// **'语音识别'**
  String get pluginConfigNameSpeechToText;

  /// No description provided for @pluginConfigNameSenseVoice.
  ///
  /// In zh, this message translates to:
  /// **'SenseVoice 识别'**
  String get pluginConfigNameSenseVoice;

  /// No description provided for @pluginConfigNameSpeechApi.
  ///
  /// In zh, this message translates to:
  /// **'转写接口'**
  String get pluginConfigNameSpeechApi;

  /// No description provided for @pluginConfigNameTranslator.
  ///
  /// In zh, this message translates to:
  /// **'翻译服务'**
  String get pluginConfigNameTranslator;

  /// No description provided for @pluginConfigNameSessionIndex.
  ///
  /// In zh, this message translates to:
  /// **'会话索引'**
  String get pluginConfigNameSessionIndex;

  /// No description provided for @pluginConfigNameSessionSearchTool.
  ///
  /// In zh, this message translates to:
  /// **'会话搜索工具'**
  String get pluginConfigNameSessionSearchTool;

  /// No description provided for @pluginConfigNameTerminalService.
  ///
  /// In zh, this message translates to:
  /// **'终端服务'**
  String get pluginConfigNameTerminalService;

  /// No description provided for @pluginConfigNameTerminalBash.
  ///
  /// In zh, this message translates to:
  /// **'Bash 终端'**
  String get pluginConfigNameTerminalBash;

  /// No description provided for @pluginConfigNameTerminalPwsh.
  ///
  /// In zh, this message translates to:
  /// **'PowerShell 终端'**
  String get pluginConfigNameTerminalPwsh;

  /// No description provided for @pluginConfigNameTerminalTools.
  ///
  /// In zh, this message translates to:
  /// **'终端工具'**
  String get pluginConfigNameTerminalTools;

  /// No description provided for @pluginConfigNameWorktree.
  ///
  /// In zh, this message translates to:
  /// **'工作树管理'**
  String get pluginConfigNameWorktree;

  /// No description provided for @pluginConfigNameWorktreeTools.
  ///
  /// In zh, this message translates to:
  /// **'工作树工具'**
  String get pluginConfigNameWorktreeTools;

  /// No description provided for @pluginConfigNameRalphWorkflow.
  ///
  /// In zh, this message translates to:
  /// **'工作流引擎'**
  String get pluginConfigNameRalphWorkflow;

  /// No description provided for @pluginConfigNameRalphTools.
  ///
  /// In zh, this message translates to:
  /// **'Ralph 工具'**
  String get pluginConfigNameRalphTools;

  /// No description provided for @plugInputRequired.
  ///
  /// In zh, this message translates to:
  /// **'请填写此项'**
  String get plugInputRequired;

  /// No description provided for @plugInputInvalidValue.
  ///
  /// In zh, this message translates to:
  /// **'此处的值无效'**
  String get plugInputInvalidValue;

  /// No description provided for @plugInputNumber.
  ///
  /// In zh, this message translates to:
  /// **'请输入有效数字'**
  String get plugInputNumber;

  /// No description provided for @plugInputBounds.
  ///
  /// In zh, this message translates to:
  /// **'请输入 {min}–{max} 之间的值'**
  String plugInputBounds(String min, String max);

  /// No description provided for @plugInputLength.
  ///
  /// In zh, this message translates to:
  /// **'长度需为 {min}–{max} 个字符'**
  String plugInputLength(int min, int max);

  /// No description provided for @plugInputPattern.
  ///
  /// In zh, this message translates to:
  /// **'格式不正确'**
  String get plugInputPattern;

  /// No description provided for @plugInputDate.
  ///
  /// In zh, this message translates to:
  /// **'请选择有效日期'**
  String get plugInputDate;

  /// No description provided for @plugInputTime.
  ///
  /// In zh, this message translates to:
  /// **'请选择有效时间'**
  String get plugInputTime;

  /// No description provided for @plugInputUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'此处不支持这个组件'**
  String get plugInputUnavailable;

  /// No description provided for @plugInputNoPassword.
  ///
  /// In zh, this message translates to:
  /// **'插件不能使用密码输入框'**
  String get plugInputNoPassword;

  /// No description provided for @plugInputBadBinding.
  ///
  /// In zh, this message translates to:
  /// **'输入绑定必须是 data 下的字段路径'**
  String get plugInputBadBinding;

  /// No description provided for @plugInputDuplicateBinding.
  ///
  /// In zh, this message translates to:
  /// **'一个字段只能绑定一个输入组件'**
  String get plugInputDuplicateBinding;

  /// No description provided for @plugInputNamedPattern.
  ///
  /// In zh, this message translates to:
  /// **'只支持内置的格式校验'**
  String get plugInputNamedPattern;

  /// No description provided for @plugInputNestedForm.
  ///
  /// In zh, this message translates to:
  /// **'表单不能嵌套'**
  String get plugInputNestedForm;

  /// No description provided for @plugInputSubmitMissing.
  ///
  /// In zh, this message translates to:
  /// **'表单缺少提交动作'**
  String get plugInputSubmitMissing;

  /// No description provided for @plugInputTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'内容过多，请缩短后重试'**
  String get plugInputTooLarge;

  /// No description provided for @plugInputCheckFields.
  ///
  /// In zh, this message translates to:
  /// **'请检查标出的项目'**
  String get plugInputCheckFields;

  /// No description provided for @plugInputFailed.
  ///
  /// In zh, this message translates to:
  /// **'未保存，请重试'**
  String get plugInputFailed;

  /// No description provided for @plugInputSubmit.
  ///
  /// In zh, this message translates to:
  /// **'保存'**
  String get plugInputSubmit;

  /// No description provided for @plugInputChoose.
  ///
  /// In zh, this message translates to:
  /// **'选择'**
  String get plugInputChoose;

  /// No description provided for @plugInputPrevious.
  ///
  /// In zh, this message translates to:
  /// **'上一页'**
  String get plugInputPrevious;

  /// No description provided for @plugInputNext.
  ///
  /// In zh, this message translates to:
  /// **'下一页'**
  String get plugInputNext;

  /// No description provided for @plugInputDecrease.
  ///
  /// In zh, this message translates to:
  /// **'减少{label}'**
  String plugInputDecrease(String label);

  /// No description provided for @plugInputIncrease.
  ///
  /// In zh, this message translates to:
  /// **'增加{label}'**
  String plugInputIncrease(String label);

  /// No description provided for @plugInputRating.
  ///
  /// In zh, this message translates to:
  /// **'{label}：{value} 分，共 {max} 分'**
  String plugInputRating(String label, int value, int max);

  /// No description provided for @plugInputFormula.
  ///
  /// In zh, this message translates to:
  /// **'公式无效或超出上限'**
  String get plugInputFormula;

  /// No description provided for @plugInputDatePicker.
  ///
  /// In zh, this message translates to:
  /// **'插件日期'**
  String get plugInputDatePicker;

  /// No description provided for @plugInputTimePicker.
  ///
  /// In zh, this message translates to:
  /// **'插件时间'**
  String get plugInputTimePicker;

  /// No description provided for @plugInputChoices.
  ///
  /// In zh, this message translates to:
  /// **'插件选项'**
  String get plugInputChoices;

  /// No description provided for @plugInputGestureRequired.
  ///
  /// In zh, this message translates to:
  /// **'该效果需要用户点按'**
  String get plugInputGestureRequired;

  /// No description provided for @pluginsOperationHostChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机已切换，未执行'**
  String get pluginsOperationHostChanged;

  /// No description provided for @pluginsReloadLocal.
  ///
  /// In zh, this message translates to:
  /// **'重启内核以重载'**
  String get pluginsReloadLocal;

  /// No description provided for @pluginsReloadInterrupts.
  ///
  /// In zh, this message translates to:
  /// **'会中断正在运行的任务'**
  String get pluginsReloadInterrupts;

  /// No description provided for @pluginsReloadConfirm.
  ///
  /// In zh, this message translates to:
  /// **'重载「{name}」？'**
  String pluginsReloadConfirm(String name);

  /// No description provided for @pluginsReloadExplanation.
  ///
  /// In zh, this message translates to:
  /// **'将重启本机内核，重新加载插件。正在运行的任务会中断。'**
  String get pluginsReloadExplanation;

  /// No description provided for @pluginsReloadProceed.
  ///
  /// In zh, this message translates to:
  /// **'重启并重载'**
  String get pluginsReloadProceed;

  /// No description provided for @pluginsReloadRequested.
  ///
  /// In zh, this message translates to:
  /// **'已请求重启内核'**
  String get pluginsReloadRequested;

  /// No description provided for @pluginsReloadChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机或插件状态已变化，请重试'**
  String get pluginsReloadChanged;

  /// No description provided for @pluginsReloadFailed.
  ///
  /// In zh, this message translates to:
  /// **'未能重启内核，请查看引擎日志'**
  String get pluginsReloadFailed;

  /// No description provided for @pluginsFile.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get pluginsFile;

  /// No description provided for @pluginsChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get pluginsChat;

  /// No description provided for @pluginsImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get pluginsImage;

  /// No description provided for @pluginsNamespaceDefaultModel.
  ///
  /// In zh, this message translates to:
  /// **'默认模型'**
  String get pluginsNamespaceDefaultModel;

  /// No description provided for @pluginsNamespaceDefaultPreset.
  ///
  /// In zh, this message translates to:
  /// **'默认预设'**
  String get pluginsNamespaceDefaultPreset;

  /// No description provided for @pluginsNamespaceAgent.
  ///
  /// In zh, this message translates to:
  /// **'智能体'**
  String get pluginsNamespaceAgent;

  /// No description provided for @pluginsNamespaceSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get pluginsNamespaceSubagent;

  /// No description provided for @pluginsNamespaceSubagentModels.
  ///
  /// In zh, this message translates to:
  /// **'子代理模型'**
  String get pluginsNamespaceSubagentModels;

  /// No description provided for @pluginsNamespaceDeepSeekModel.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 模型'**
  String get pluginsNamespaceDeepSeekModel;

  /// No description provided for @pluginsNamespaceAccountModel.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 账号模型'**
  String get pluginsNamespaceAccountModel;

  /// No description provided for @pluginsNamespaceCustomModels.
  ///
  /// In zh, this message translates to:
  /// **'自定义模型服务'**
  String get pluginsNamespaceCustomModels;

  /// No description provided for @pluginsNamespaceNetwork.
  ///
  /// In zh, this message translates to:
  /// **'联网'**
  String get pluginsNamespaceNetwork;

  /// No description provided for @pluginsNamespaceWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get pluginsNamespaceWebSearch;

  /// No description provided for @pluginsNamespaceSearchApi.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索接口'**
  String get pluginsNamespaceSearchApi;

  /// No description provided for @pluginsNamespaceCommands.
  ///
  /// In zh, this message translates to:
  /// **'命令执行'**
  String get pluginsNamespaceCommands;

  /// No description provided for @pluginsNamespacePermissions.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get pluginsNamespacePermissions;

  /// No description provided for @pluginsNamespaceChatLog.
  ///
  /// In zh, this message translates to:
  /// **'对话日志'**
  String get pluginsNamespaceChatLog;

  /// No description provided for @pluginsNamespaceThinkingTranslation.
  ///
  /// In zh, this message translates to:
  /// **'思考翻译'**
  String get pluginsNamespaceThinkingTranslation;

  /// No description provided for @pluginsNamespaceTranslation.
  ///
  /// In zh, this message translates to:
  /// **'翻译'**
  String get pluginsNamespaceTranslation;

  /// No description provided for @pluginsNamespaceLanguage.
  ///
  /// In zh, this message translates to:
  /// **'语言'**
  String get pluginsNamespaceLanguage;

  /// No description provided for @pluginsNamespaceWebAppearance.
  ///
  /// In zh, this message translates to:
  /// **'网页版外观'**
  String get pluginsNamespaceWebAppearance;

  /// No description provided for @pluginsNamespaceWebChat.
  ///
  /// In zh, this message translates to:
  /// **'网页版对话'**
  String get pluginsNamespaceWebChat;

  /// No description provided for @pluginsNamespaceWebInput.
  ///
  /// In zh, this message translates to:
  /// **'网页版输入'**
  String get pluginsNamespaceWebInput;

  /// No description provided for @pluginsNamespaceWebSettings.
  ///
  /// In zh, this message translates to:
  /// **'网页版设置'**
  String get pluginsNamespaceWebSettings;

  /// No description provided for @pluginsNamespaceWebGeneral.
  ///
  /// In zh, this message translates to:
  /// **'网页版通用'**
  String get pluginsNamespaceWebGeneral;

  /// No description provided for @pluginsNamespaceAutoReview.
  ///
  /// In zh, this message translates to:
  /// **'自动审查'**
  String get pluginsNamespaceAutoReview;

  /// No description provided for @pluginsNamespaceAgentTeam.
  ///
  /// In zh, this message translates to:
  /// **'智能体团队'**
  String get pluginsNamespaceAgentTeam;

  /// No description provided for @pluginsNamespaceVoiceInput.
  ///
  /// In zh, this message translates to:
  /// **'语音输入'**
  String get pluginsNamespaceVoiceInput;

  /// No description provided for @pluginsOfficialPlugin.
  ///
  /// In zh, this message translates to:
  /// **'官方插件'**
  String get pluginsOfficialPlugin;

  /// No description provided for @pluginsLocalUnshareable.
  ///
  /// In zh, this message translates to:
  /// **'本地安装，无法分享'**
  String get pluginsLocalUnshareable;

  /// No description provided for @pluginsIncludesPresets.
  ///
  /// In zh, this message translates to:
  /// **'含预设「{names}」'**
  String pluginsIncludesPresets(String names);

  /// No description provided for @pluginsSecretsUnshareable.
  ///
  /// In zh, this message translates to:
  /// **'含有密钥，无法分享'**
  String get pluginsSecretsUnshareable;

  /// No description provided for @pluginsLineCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 行'**
  String pluginsLineCount(int count);

  /// No description provided for @pluginsEmptyValue.
  ///
  /// In zh, this message translates to:
  /// **'空'**
  String get pluginsEmptyValue;

  /// No description provided for @pluginsOnValue.
  ///
  /// In zh, this message translates to:
  /// **'开'**
  String get pluginsOnValue;

  /// No description provided for @pluginsOffValue.
  ///
  /// In zh, this message translates to:
  /// **'关'**
  String get pluginsOffValue;

  /// No description provided for @pluginsOfficialUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有这个官方插件'**
  String get pluginsOfficialUnavailable;

  /// No description provided for @pluginsEnabled.
  ///
  /// In zh, this message translates to:
  /// **'已启用'**
  String get pluginsEnabled;

  /// No description provided for @pluginsVersionMismatch.
  ///
  /// In zh, this message translates to:
  /// **'与分享时的版本不一致'**
  String get pluginsVersionMismatch;

  /// No description provided for @pluginsCurrentVersion.
  ///
  /// In zh, this message translates to:
  /// **'当前版本'**
  String get pluginsCurrentVersion;

  /// No description provided for @pluginsNewVersion.
  ///
  /// In zh, this message translates to:
  /// **'新版本'**
  String get pluginsNewVersion;

  /// No description provided for @pluginsAddedWith.
  ///
  /// In zh, this message translates to:
  /// **'随「{title}」添加'**
  String pluginsAddedWith(String title);

  /// No description provided for @pluginsApplyAfterInstall.
  ///
  /// In zh, this message translates to:
  /// **'装好插件后应用 · {detail}'**
  String pluginsApplyAfterInstall(String detail);

  /// No description provided for @pluginsSettingsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取这台主机的设置'**
  String get pluginsSettingsReadFailed;

  /// No description provided for @pluginsSettingUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有这项设置'**
  String get pluginsSettingUnavailable;

  /// No description provided for @pluginsSettingsReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'这台主机的设置是只读的'**
  String get pluginsSettingsReadOnly;

  /// No description provided for @pluginsImportLocalOnly.
  ///
  /// In zh, this message translates to:
  /// **'只能导入到本机'**
  String get pluginsImportLocalOnly;

  /// No description provided for @pluginsReplaceSkill.
  ///
  /// In zh, this message translates to:
  /// **'替换同名技能'**
  String get pluginsReplaceSkill;

  /// No description provided for @pluginsReplaceContent.
  ///
  /// In zh, this message translates to:
  /// **'替换现有内容'**
  String get pluginsReplaceContent;

  /// No description provided for @pluginsSafeModeInstallBlocked.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不能安装插件'**
  String get pluginsSafeModeInstallBlocked;

  /// No description provided for @pluginsHostInstallBlocked.
  ///
  /// In zh, this message translates to:
  /// **'这台主机不能从这里安装插件'**
  String get pluginsHostInstallBlocked;

  /// No description provided for @pluginsInstallFailed.
  ///
  /// In zh, this message translates to:
  /// **'安装失败'**
  String get pluginsInstallFailed;

  /// No description provided for @pluginsAfterRestart.
  ///
  /// In zh, this message translates to:
  /// **'重启后生效'**
  String get pluginsAfterRestart;

  /// No description provided for @pluginsSettingsChanged.
  ///
  /// In zh, this message translates to:
  /// **'设置刚被改过'**
  String get pluginsSettingsChanged;

  /// No description provided for @pluginsWriteFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能写入'**
  String get pluginsWriteFailed;

  /// No description provided for @pluginsHostUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上主机'**
  String get pluginsHostUnreachable;

  /// No description provided for @pluginsFileWriteFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能写入文件'**
  String get pluginsFileWriteFailed;

  /// No description provided for @pluginsProfileTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 配置'**
  String get pluginsProfileTitle;

  /// No description provided for @pluginsGistTokenInvalid.
  ///
  /// In zh, this message translates to:
  /// **'GitHub 令牌无效或没有 Gist 权限'**
  String get pluginsGistTokenInvalid;

  /// No description provided for @pluginsGistCreateHttpFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能创建 Gist（HTTP {status}）'**
  String pluginsGistCreateHttpFailed(int status);

  /// No description provided for @pluginsGistCreateFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能创建 Gist'**
  String get pluginsGistCreateFailed;

  /// No description provided for @pluginsGitHubUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上 GitHub'**
  String get pluginsGitHubUnreachable;

  /// No description provided for @pluginsGitHubTimeout.
  ///
  /// In zh, this message translates to:
  /// **'连接 GitHub 超时'**
  String get pluginsGitHubTimeout;

  /// No description provided for @pluginsGistNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个 Gist'**
  String get pluginsGistNotFound;

  /// No description provided for @pluginsGistNoProfile.
  ///
  /// In zh, this message translates to:
  /// **'这个 Gist 里没有可导入的配置'**
  String get pluginsGistNoProfile;

  /// No description provided for @pluginsGistReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取 Gist'**
  String get pluginsGistReadFailed;

  /// No description provided for @pluginsListReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取插件列表'**
  String get pluginsListReadFailed;

  /// No description provided for @pluginsReadingPlugins.
  ///
  /// In zh, this message translates to:
  /// **'正在读取插件…'**
  String get pluginsReadingPlugins;

  /// No description provided for @pluginsDshOfficial.
  ///
  /// In zh, this message translates to:
  /// **'DSH 官方'**
  String get pluginsDshOfficial;

  /// No description provided for @pluginsOfficialToggleOnly.
  ///
  /// In zh, this message translates to:
  /// **'官方组件只能开关，不能卸载；对这台主机上的所有对话生效'**
  String get pluginsOfficialToggleOnly;

  /// No description provided for @pluginsOfficial.
  ///
  /// In zh, this message translates to:
  /// **'官方'**
  String get pluginsOfficial;

  /// No description provided for @pluginsNoThirdParty.
  ///
  /// In zh, this message translates to:
  /// **'还没装第三方插件'**
  String get pluginsNoThirdParty;

  /// No description provided for @pluginsPluginsDescription.
  ///
  /// In zh, this message translates to:
  /// **'插件能给 DSH 加工具、记忆和模型'**
  String get pluginsPluginsDescription;

  /// No description provided for @pluginsBrowseMarket.
  ///
  /// In zh, this message translates to:
  /// **'逛逛插件市场'**
  String get pluginsBrowseMarket;

  /// No description provided for @pluginsLoading.
  ///
  /// In zh, this message translates to:
  /// **'正在加载'**
  String get pluginsLoading;

  /// No description provided for @pluginsIslandClosed.
  ///
  /// In zh, this message translates to:
  /// **'插件界面已关闭'**
  String get pluginsIslandClosed;

  /// No description provided for @pluginsReopen.
  ///
  /// In zh, this message translates to:
  /// **'重新打开'**
  String get pluginsReopen;

  /// No description provided for @pluginsOpenBrowserHost.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器打开 {host}？'**
  String pluginsOpenBrowserHost(String host);

  /// No description provided for @pluginsSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索插件'**
  String get pluginsSearch;

  /// No description provided for @pluginsMarketLoading.
  ///
  /// In zh, this message translates to:
  /// **'正在载入插件目录…'**
  String get pluginsMarketLoading;

  /// No description provided for @pluginsMarketLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'插件目录没打开'**
  String get pluginsMarketLoadFailed;

  /// No description provided for @pluginsMarketInvalid.
  ///
  /// In zh, this message translates to:
  /// **'目录格式有误'**
  String get pluginsMarketInvalid;

  /// No description provided for @pluginsAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get pluginsAll;

  /// No description provided for @pluginsMarketCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个插件 · 来自 dshfind'**
  String pluginsMarketCount(int count);

  /// No description provided for @pluginsHideWeb.
  ///
  /// In zh, this message translates to:
  /// **'隐藏网页版插件'**
  String get pluginsHideWeb;

  /// No description provided for @pluginsShowWebCount.
  ///
  /// In zh, this message translates to:
  /// **'显示 {count} 个网页版插件'**
  String pluginsShowWebCount(int count);

  /// No description provided for @pluginsNoCategoryPlugins.
  ///
  /// In zh, this message translates to:
  /// **'这个分类下没有插件'**
  String get pluginsNoCategoryPlugins;

  /// No description provided for @pluginsNoSearchResults.
  ///
  /// In zh, this message translates to:
  /// **'没有找到「{query}」'**
  String pluginsNoSearchResults(String query);

  /// No description provided for @pluginsFailureDetails.
  ///
  /// In zh, this message translates to:
  /// **'{title} · 点开查看'**
  String pluginsFailureDetails(String title);

  /// No description provided for @pluginsFeatured.
  ///
  /// In zh, this message translates to:
  /// **'推荐'**
  String get pluginsFeatured;

  /// No description provided for @pluginsInstalledRemoteRestart.
  ///
  /// In zh, this message translates to:
  /// **'已安装「{name}」，重启{host}上的 DSH 后生效'**
  String pluginsInstalledRemoteRestart(String name, String host);

  /// No description provided for @pluginsInstalledNamed.
  ///
  /// In zh, this message translates to:
  /// **'已安装「{name}」'**
  String pluginsInstalledNamed(String name);

  /// No description provided for @pluginsInstallCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消安装'**
  String get pluginsInstallCancelled;

  /// No description provided for @pluginsInstallFailureNamed.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」{reason}'**
  String pluginsInstallFailureNamed(String name, String reason);

  /// No description provided for @pluginsRestartRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要重启引擎'**
  String get pluginsRestartRequired;

  /// No description provided for @pluginsRestartExplanation.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」重启引擎后生效，进行中的回复会中断。'**
  String pluginsRestartExplanation(String name);

  /// No description provided for @pluginsRestartEngine.
  ///
  /// In zh, this message translates to:
  /// **'重启引擎'**
  String get pluginsRestartEngine;

  /// No description provided for @pluginsAllowBuildScripts.
  ///
  /// In zh, this message translates to:
  /// **'允许构建脚本？'**
  String get pluginsAllowBuildScripts;

  /// No description provided for @pluginsBuildScriptPackages.
  ///
  /// In zh, this message translates to:
  /// **'下面这些包要在安装时运行脚本：'**
  String get pluginsBuildScriptPackages;

  /// No description provided for @pluginsBuildScriptWarning.
  ///
  /// In zh, this message translates to:
  /// **'脚本会以 DSH 的权限在{host}上执行，能读写文件、联网。只在你信任这个插件时允许。'**
  String pluginsBuildScriptWarning(String host);

  /// No description provided for @pluginsThisDevice.
  ///
  /// In zh, this message translates to:
  /// **'这台设备'**
  String get pluginsThisDevice;

  /// No description provided for @pluginsAllowRetry.
  ///
  /// In zh, this message translates to:
  /// **'允许并重试'**
  String get pluginsAllowRetry;

  /// No description provided for @pluginsUpdateNamed.
  ///
  /// In zh, this message translates to:
  /// **'更新「{name}」？'**
  String pluginsUpdateNamed(String name);

  /// No description provided for @pluginsUninstallNamed.
  ///
  /// In zh, this message translates to:
  /// **'卸载「{title}」？'**
  String pluginsUninstallNamed(String title);

  /// No description provided for @pluginsUninstallExplanation.
  ///
  /// In zh, this message translates to:
  /// **'插件会从{host}上移除，它保存的数据和设置不会删除。'**
  String pluginsUninstallExplanation(String host);

  /// No description provided for @pluginsThisHost.
  ///
  /// In zh, this message translates to:
  /// **'这台主机'**
  String get pluginsThisHost;

  /// No description provided for @pluginsUninstall.
  ///
  /// In zh, this message translates to:
  /// **'卸载'**
  String get pluginsUninstall;

  /// No description provided for @pluginsUninstalledNamed.
  ///
  /// In zh, this message translates to:
  /// **'已卸载「{title}」'**
  String pluginsUninstalledNamed(String title);

  /// No description provided for @pluginsRestartNow.
  ///
  /// In zh, this message translates to:
  /// **'立即重启'**
  String get pluginsRestartNow;

  /// No description provided for @pluginsUninstallFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能卸载'**
  String get pluginsUninstallFailed;

  /// No description provided for @pluginsThatComputer.
  ///
  /// In zh, this message translates to:
  /// **'那台电脑'**
  String get pluginsThatComputer;

  /// No description provided for @pluginsCommandAfterInstall.
  ///
  /// In zh, this message translates to:
  /// **'装好后重启那台电脑上的 DSH，再回来刷新'**
  String get pluginsCommandAfterInstall;

  /// No description provided for @pluginsError.
  ///
  /// In zh, this message translates to:
  /// **'出错'**
  String get pluginsError;

  /// No description provided for @pluginsInventoryTitle.
  ///
  /// In zh, this message translates to:
  /// **'插件清单'**
  String get pluginsInventoryTitle;

  /// No description provided for @pluginsGlobalPlugins.
  ///
  /// In zh, this message translates to:
  /// **'全局插件'**
  String get pluginsGlobalPlugins;

  /// No description provided for @pluginsAgentPresets.
  ///
  /// In zh, this message translates to:
  /// **'Agent 预设'**
  String get pluginsAgentPresets;

  /// No description provided for @pluginsInventoryReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取插件清单'**
  String get pluginsInventoryReadFailed;

  /// No description provided for @pluginsComponentCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个组件'**
  String pluginsComponentCount(int count);

  /// No description provided for @pluginsEnabledCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个已启用'**
  String pluginsEnabledCount(int count);

  /// No description provided for @pluginsErrorCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个出错'**
  String pluginsErrorCount(int count);

  /// No description provided for @pluginsNoPlugins.
  ///
  /// In zh, this message translates to:
  /// **'没有插件'**
  String get pluginsNoPlugins;

  /// No description provided for @pluginsNoMatchingPlugins.
  ///
  /// In zh, this message translates to:
  /// **'没有匹配的插件'**
  String get pluginsNoMatchingPlugins;

  /// No description provided for @pluginsPresetLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'这个预设没能加载'**
  String get pluginsPresetLoadFailed;

  /// No description provided for @pluginsPresetNoPlugins.
  ///
  /// In zh, this message translates to:
  /// **'这个预设没有插件'**
  String get pluginsPresetNoPlugins;

  /// No description provided for @pluginsStandard.
  ///
  /// In zh, this message translates to:
  /// **'标准'**
  String get pluginsStandard;

  /// No description provided for @pluginsMinimal.
  ///
  /// In zh, this message translates to:
  /// **'精简'**
  String get pluginsMinimal;

  /// No description provided for @pluginsDefaultPresetName.
  ///
  /// In zh, this message translates to:
  /// **'{name}（默认）'**
  String pluginsDefaultPresetName(String name);

  /// No description provided for @pluginsSystemComponents.
  ///
  /// In zh, this message translates to:
  /// **'系统组件'**
  String get pluginsSystemComponents;

  /// No description provided for @pluginsCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String pluginsCount(int count);

  /// No description provided for @pluginsSource.
  ///
  /// In zh, this message translates to:
  /// **'来源'**
  String get pluginsSource;

  /// No description provided for @pluginsDisableCondition.
  ///
  /// In zh, this message translates to:
  /// **'禁用条件'**
  String get pluginsDisableCondition;

  /// No description provided for @pluginsProvidedByPreset.
  ///
  /// In zh, this message translates to:
  /// **'由预设提供'**
  String get pluginsProvidedByPreset;

  /// No description provided for @pluginsDetailsTitle.
  ///
  /// In zh, this message translates to:
  /// **'插件详情'**
  String get pluginsDetailsTitle;

  /// No description provided for @pluginsPackageInfoError.
  ///
  /// In zh, this message translates to:
  /// **'包信息有误：{error}'**
  String pluginsPackageInfoError(String error);

  /// No description provided for @pluginsInstalling.
  ///
  /// In zh, this message translates to:
  /// **'安装中'**
  String get pluginsInstalling;

  /// No description provided for @pluginsGet.
  ///
  /// In zh, this message translates to:
  /// **'获取'**
  String get pluginsGet;

  /// No description provided for @pluginsLoadingCannotCancel.
  ///
  /// In zh, this message translates to:
  /// **'正在加载插件，这一步不能取消'**
  String get pluginsLoadingCannotCancel;

  /// No description provided for @pluginsInstallDuration.
  ///
  /// In zh, this message translates to:
  /// **'约需一两分钟，可以先离开'**
  String get pluginsInstallDuration;

  /// No description provided for @pluginsViewInstallLogs.
  ///
  /// In zh, this message translates to:
  /// **'查看安装日志'**
  String get pluginsViewInstallLogs;

  /// No description provided for @pluginsViewDetails.
  ///
  /// In zh, this message translates to:
  /// **'查看详情'**
  String get pluginsViewDetails;

  /// No description provided for @pluginsCopyCommand.
  ///
  /// In zh, this message translates to:
  /// **'复制命令'**
  String get pluginsCopyCommand;

  /// No description provided for @pluginsCommandCopied.
  ///
  /// In zh, this message translates to:
  /// **'命令已复制'**
  String get pluginsCommandCopied;

  /// No description provided for @pluginsMissingFiles.
  ///
  /// In zh, this message translates to:
  /// **'插件文件缺失，重新安装可修复'**
  String get pluginsMissingFiles;

  /// No description provided for @pluginsNotDshPlugin.
  ///
  /// In zh, this message translates to:
  /// **'不是 DSH 插件，无法加载'**
  String get pluginsNotDshPlugin;

  /// No description provided for @pluginsIncompatible.
  ///
  /// In zh, this message translates to:
  /// **'与当前 DSH 版本不兼容，未加载'**
  String get pluginsIncompatible;

  /// No description provided for @pluginsRequiresDshVersion.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH {requiredVersion}，当前 {currentVersion}，未加载'**
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion);

  /// No description provided for @pluginsLoadFailure.
  ///
  /// In zh, this message translates to:
  /// **'加载失败：{reason}'**
  String pluginsLoadFailure(String reason);

  /// No description provided for @pluginsUnknownReason.
  ///
  /// In zh, this message translates to:
  /// **'原因未知'**
  String get pluginsUnknownReason;

  /// No description provided for @pluginsBundleProblem.
  ///
  /// In zh, this message translates to:
  /// **'有问题：{reason}'**
  String pluginsBundleProblem(String reason);

  /// No description provided for @pluginsRefreshFailure.
  ///
  /// In zh, this message translates to:
  /// **'刷新失败：{reason}'**
  String pluginsRefreshFailure(String reason);

  /// No description provided for @pluginsTitle.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get pluginsTitle;

  /// No description provided for @pluginsRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get pluginsRefresh;

  /// No description provided for @pluginsMarketTitle.
  ///
  /// In zh, this message translates to:
  /// **'插件市场'**
  String get pluginsMarketTitle;

  /// No description provided for @pluginsConnectToManage.
  ///
  /// In zh, this message translates to:
  /// **'连上引擎后管理插件'**
  String get pluginsConnectToManage;

  /// No description provided for @pluginsSafeModeOperationsBlocked.
  ///
  /// In zh, this message translates to:
  /// **'安全模式下不能安装或卸载插件'**
  String get pluginsSafeModeOperationsBlocked;

  /// No description provided for @pluginsRelayToggleOnly.
  ///
  /// In zh, this message translates to:
  /// **'{host} · 经中转只能开关，安装请在那台电脑上进行'**
  String pluginsRelayToggleOnly(String host);

  /// No description provided for @pluginsInstallThisPhone.
  ///
  /// In zh, this message translates to:
  /// **'安装到：本机'**
  String get pluginsInstallThisPhone;

  /// No description provided for @pluginsInstallHost.
  ///
  /// In zh, this message translates to:
  /// **'安装到：{host}'**
  String pluginsInstallHost(String host);

  /// No description provided for @pluginsOfflineDescription.
  ///
  /// In zh, this message translates to:
  /// **'引擎运行后显示已装插件，插件市场现在就能逛'**
  String get pluginsOfflineDescription;

  /// No description provided for @pluginsIconChanged.
  ///
  /// In zh, this message translates to:
  /// **'桌面图标已选择，回到桌面后更新'**
  String get pluginsIconChanged;

  /// No description provided for @pluginsIconChangeFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能更换，稍后再试'**
  String get pluginsIconChangeFailed;

  /// No description provided for @pluginsTheme.
  ///
  /// In zh, this message translates to:
  /// **'主题'**
  String get pluginsTheme;

  /// No description provided for @pluginsAppearance.
  ///
  /// In zh, this message translates to:
  /// **'外观'**
  String get pluginsAppearance;

  /// No description provided for @pluginsColors.
  ///
  /// In zh, this message translates to:
  /// **'配色'**
  String get pluginsColors;

  /// No description provided for @pluginsFeatureIcons.
  ///
  /// In zh, this message translates to:
  /// **'功能图标'**
  String get pluginsFeatureIcons;

  /// No description provided for @pluginsAppIcon.
  ///
  /// In zh, this message translates to:
  /// **'桌面图标'**
  String get pluginsAppIcon;

  /// No description provided for @pluginsPet.
  ///
  /// In zh, this message translates to:
  /// **'宠物'**
  String get pluginsPet;

  /// No description provided for @pluginsCustomColor.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get pluginsCustomColor;

  /// No description provided for @pluginsColorLabel.
  ///
  /// In zh, this message translates to:
  /// **'配色：{label}'**
  String pluginsColorLabel(String label);

  /// No description provided for @pluginsCoral.
  ///
  /// In zh, this message translates to:
  /// **'珊瑚'**
  String get pluginsCoral;

  /// No description provided for @pluginsRouge.
  ///
  /// In zh, this message translates to:
  /// **'胭脂'**
  String get pluginsRouge;

  /// No description provided for @pluginsOchre.
  ///
  /// In zh, this message translates to:
  /// **'赭石'**
  String get pluginsOchre;

  /// No description provided for @pluginsMoss.
  ///
  /// In zh, this message translates to:
  /// **'苔绿'**
  String get pluginsMoss;

  /// No description provided for @pluginsLake.
  ///
  /// In zh, this message translates to:
  /// **'湖蓝'**
  String get pluginsLake;

  /// No description provided for @pluginsIndigo.
  ///
  /// In zh, this message translates to:
  /// **'靛紫'**
  String get pluginsIndigo;

  /// No description provided for @pluginsHue.
  ///
  /// In zh, this message translates to:
  /// **'色相'**
  String get pluginsHue;

  /// No description provided for @pluginsWallpaper.
  ///
  /// In zh, this message translates to:
  /// **'壁纸'**
  String get pluginsWallpaper;

  /// No description provided for @pluginsFollowWallpaper.
  ///
  /// In zh, this message translates to:
  /// **'跟随壁纸'**
  String get pluginsFollowWallpaper;

  /// No description provided for @pluginsAllowHighPower.
  ///
  /// In zh, this message translates to:
  /// **'允许后台高耗电'**
  String get pluginsAllowHighPower;

  /// No description provided for @pluginsVivoBatteryPath.
  ///
  /// In zh, this message translates to:
  /// **'电池 › 后台耗电管理 › {app}'**
  String pluginsVivoBatteryPath(String app);

  /// No description provided for @pluginsXiaomiBatterySetting.
  ///
  /// In zh, this message translates to:
  /// **'省电策略：无限制'**
  String get pluginsXiaomiBatterySetting;

  /// No description provided for @pluginsXiaomiBatteryPath.
  ///
  /// In zh, this message translates to:
  /// **'应用管理 › {app} › 省电策略'**
  String pluginsXiaomiBatteryPath(String app);

  /// No description provided for @pluginsHuaweiBatterySetting.
  ///
  /// In zh, this message translates to:
  /// **'允许后台活动'**
  String get pluginsHuaweiBatterySetting;

  /// No description provided for @pluginsHuaweiBatteryPath.
  ///
  /// In zh, this message translates to:
  /// **'电池 › 应用启动管理 › {app}'**
  String pluginsHuaweiBatteryPath(String app);

  /// No description provided for @pluginsOppoBatterySetting.
  ///
  /// In zh, this message translates to:
  /// **'允许后台行为'**
  String get pluginsOppoBatterySetting;

  /// No description provided for @pluginsOppoBatteryPath.
  ///
  /// In zh, this message translates to:
  /// **'电池 › 应用耗电管理 › {app}'**
  String pluginsOppoBatteryPath(String app);

  /// No description provided for @pluginsSamsungBatterySetting.
  ///
  /// In zh, this message translates to:
  /// **'电池：不受限制'**
  String get pluginsSamsungBatterySetting;

  /// No description provided for @pluginsSamsungBatteryPath.
  ///
  /// In zh, this message translates to:
  /// **'应用程序 › {app} › 电池'**
  String pluginsSamsungBatteryPath(String app);

  /// No description provided for @pluginsVivoBatteryStep.
  ///
  /// In zh, this message translates to:
  /// **'打开「允许后台高耗电」'**
  String get pluginsVivoBatteryStep;

  /// No description provided for @pluginsXiaomiBatteryFullPath.
  ///
  /// In zh, this message translates to:
  /// **'应用设置 › 应用管理 › {app} › 省电策略 › 无限制'**
  String pluginsXiaomiBatteryFullPath(String app);

  /// No description provided for @pluginsXiaomiAutostart.
  ///
  /// In zh, this message translates to:
  /// **'同一页打开「自启动」'**
  String get pluginsXiaomiAutostart;

  /// No description provided for @pluginsHuaweiBatteryStep.
  ///
  /// In zh, this message translates to:
  /// **'关闭「自动管理」，打开「允许后台活动」'**
  String get pluginsHuaweiBatteryStep;

  /// No description provided for @pluginsOppoBatteryStep.
  ///
  /// In zh, this message translates to:
  /// **'打开「允许后台行为」'**
  String get pluginsOppoBatteryStep;

  /// No description provided for @pluginsSamsungBatteryStep.
  ///
  /// In zh, this message translates to:
  /// **'选择「不受限制」'**
  String get pluginsSamsungBatteryStep;

  /// No description provided for @pluginsBackgroundTitle.
  ///
  /// In zh, this message translates to:
  /// **'后台运行'**
  String get pluginsBackgroundTitle;

  /// No description provided for @pluginsBackgroundDescription.
  ///
  /// In zh, this message translates to:
  /// **'让对话在后台也能跑完'**
  String get pluginsBackgroundDescription;

  /// No description provided for @pluginsSystem.
  ///
  /// In zh, this message translates to:
  /// **'系统'**
  String get pluginsSystem;

  /// No description provided for @pluginsSystemBatteryOptimization.
  ///
  /// In zh, this message translates to:
  /// **'系统电池优化'**
  String get pluginsSystemBatteryOptimization;

  /// No description provided for @pluginsTurnedOff.
  ///
  /// In zh, this message translates to:
  /// **'已关闭'**
  String get pluginsTurnedOff;

  /// No description provided for @pluginsNotTurnedOff.
  ///
  /// In zh, this message translates to:
  /// **'未关闭'**
  String get pluginsNotTurnedOff;

  /// No description provided for @pluginsStayOnline.
  ///
  /// In zh, this message translates to:
  /// **'保持在线'**
  String get pluginsStayOnline;

  /// No description provided for @pluginsKeepEngineNotification.
  ///
  /// In zh, this message translates to:
  /// **'保留「引擎运行中」通知'**
  String get pluginsKeepEngineNotification;

  /// No description provided for @pluginsLockInRecents.
  ///
  /// In zh, this message translates to:
  /// **'在最近任务里锁定 {app}'**
  String pluginsLockInRecents(String app);

  /// No description provided for @pluginsPhoneBrands.
  ///
  /// In zh, this message translates to:
  /// **'各品牌'**
  String get pluginsPhoneBrands;

  /// No description provided for @pluginsOtherBrands.
  ///
  /// In zh, this message translates to:
  /// **'其他品牌'**
  String get pluginsOtherBrands;

  /// No description provided for @pluginsConnectedHost.
  ///
  /// In zh, this message translates to:
  /// **'已连接（{host}）'**
  String pluginsConnectedHost(String host);

  /// No description provided for @pluginsConnectionError.
  ///
  /// In zh, this message translates to:
  /// **'连接失败：{error}'**
  String pluginsConnectionError(String error);

  /// No description provided for @pluginsConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接'**
  String get pluginsConnecting;

  /// No description provided for @pluginsDiagnosticsCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制诊断信息'**
  String get pluginsDiagnosticsCopied;

  /// No description provided for @pluginsDiagnostics.
  ///
  /// In zh, this message translates to:
  /// **'诊断'**
  String get pluginsDiagnostics;

  /// No description provided for @pluginsDiagnosticsDescription.
  ///
  /// In zh, this message translates to:
  /// **'反馈问题时附上，不含 Key 和令牌'**
  String get pluginsDiagnosticsDescription;

  /// No description provided for @pluginsRuntime.
  ///
  /// In zh, this message translates to:
  /// **'运行环境'**
  String get pluginsRuntime;

  /// No description provided for @pluginsArchitecture.
  ///
  /// In zh, this message translates to:
  /// **'架构'**
  String get pluginsArchitecture;

  /// No description provided for @pluginsBundledVersion.
  ///
  /// In zh, this message translates to:
  /// **'内置版本'**
  String get pluginsBundledVersion;

  /// No description provided for @pluginsInstalledVersion.
  ///
  /// In zh, this message translates to:
  /// **'已安装版本'**
  String get pluginsInstalledVersion;

  /// No description provided for @pluginsErrorLabel.
  ///
  /// In zh, this message translates to:
  /// **'错误'**
  String get pluginsErrorLabel;

  /// No description provided for @pluginsConnection.
  ///
  /// In zh, this message translates to:
  /// **'连接'**
  String get pluginsConnection;

  /// No description provided for @pluginsAddress.
  ///
  /// In zh, this message translates to:
  /// **'地址'**
  String get pluginsAddress;

  /// No description provided for @pluginsClient.
  ///
  /// In zh, this message translates to:
  /// **'客户端'**
  String get pluginsClient;

  /// No description provided for @pluginsConfigured.
  ///
  /// In zh, this message translates to:
  /// **'已设置'**
  String get pluginsConfigured;

  /// No description provided for @pluginsExport.
  ///
  /// In zh, this message translates to:
  /// **'导出'**
  String get pluginsExport;

  /// No description provided for @pluginsCopyDiagnostics.
  ///
  /// In zh, this message translates to:
  /// **'复制诊断信息'**
  String get pluginsCopyDiagnostics;

  /// No description provided for @pluginsDiagnosticsContents.
  ///
  /// In zh, this message translates to:
  /// **'只含版本和连接状态'**
  String get pluginsDiagnosticsContents;

  /// No description provided for @pluginsNotificationsPartlyBlocked.
  ///
  /// In zh, this message translates to:
  /// **'部分被系统关闭'**
  String get pluginsNotificationsPartlyBlocked;

  /// No description provided for @pluginsNotificationsBlocked.
  ///
  /// In zh, this message translates to:
  /// **'系统已关闭'**
  String get pluginsNotificationsBlocked;

  /// No description provided for @pluginsTurnedOn.
  ///
  /// In zh, this message translates to:
  /// **'已开启'**
  String get pluginsTurnedOn;

  /// No description provided for @pluginsNotifications.
  ///
  /// In zh, this message translates to:
  /// **'通知'**
  String get pluginsNotifications;

  /// No description provided for @pluginsNotificationSettingsFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开系统设置。到「设置 → 应用 → DSH Go → 通知」里开启'**
  String get pluginsNotificationSettingsFailed;

  /// No description provided for @pluginsSystemNotificationsOff.
  ///
  /// In zh, this message translates to:
  /// **'系统通知已关闭'**
  String get pluginsSystemNotificationsOff;

  /// No description provided for @pluginsBackgroundNoAlerts.
  ///
  /// In zh, this message translates to:
  /// **'App 在后台时收不到任何提醒'**
  String get pluginsBackgroundNoAlerts;

  /// No description provided for @pluginsApprovalNotificationsOff.
  ///
  /// In zh, this message translates to:
  /// **'「等你确认」通知已关闭'**
  String get pluginsApprovalNotificationsOff;

  /// No description provided for @pluginsBackgroundNoApprovalAlerts.
  ///
  /// In zh, this message translates to:
  /// **'App 在后台时，等你确认不会提醒'**
  String get pluginsBackgroundNoApprovalAlerts;

  /// No description provided for @pluginsDoneNotificationsOff.
  ///
  /// In zh, this message translates to:
  /// **'「一轮结束」通知已关闭'**
  String get pluginsDoneNotificationsOff;

  /// No description provided for @pluginsBackgroundNoDoneAlerts.
  ///
  /// In zh, this message translates to:
  /// **'App 在后台时，完成或出错不会提醒'**
  String get pluginsBackgroundNoDoneAlerts;

  /// No description provided for @pluginsTurnOn.
  ///
  /// In zh, this message translates to:
  /// **'去开启'**
  String get pluginsTurnOn;

  /// No description provided for @pluginsNotificationsDescription.
  ///
  /// In zh, this message translates to:
  /// **'对话完成或需要你时提醒你'**
  String get pluginsNotificationsDescription;

  /// No description provided for @pluginsAllowNotifications.
  ///
  /// In zh, this message translates to:
  /// **'允许通知'**
  String get pluginsAllowNotifications;

  /// No description provided for @pluginsNotificationsAndBanners.
  ///
  /// In zh, this message translates to:
  /// **'系统通知与顶部横幅'**
  String get pluginsNotificationsAndBanners;

  /// No description provided for @pluginsAlerts.
  ///
  /// In zh, this message translates to:
  /// **'提醒'**
  String get pluginsAlerts;

  /// No description provided for @pluginsRemoteAlertsRequirement.
  ///
  /// In zh, this message translates to:
  /// **'远程主机的提醒需要 App 在运行、连接在线'**
  String get pluginsRemoteAlertsRequirement;

  /// No description provided for @pluginsTurnComplete.
  ///
  /// In zh, this message translates to:
  /// **'一轮完成'**
  String get pluginsTurnComplete;

  /// No description provided for @pluginsReplyPreview.
  ///
  /// In zh, this message translates to:
  /// **'附带回复的开头'**
  String get pluginsReplyPreview;

  /// No description provided for @pluginsErrorOrStopped.
  ///
  /// In zh, this message translates to:
  /// **'出错或被停下'**
  String get pluginsErrorOrStopped;

  /// No description provided for @pluginsErrorOrStoppedDescription.
  ///
  /// In zh, this message translates to:
  /// **'请求失败、引擎重启或被停止'**
  String get pluginsErrorOrStoppedDescription;

  /// No description provided for @pluginsApprovalDescription.
  ///
  /// In zh, this message translates to:
  /// **'运行命令、改文件等需要批准'**
  String get pluginsApprovalDescription;

  /// No description provided for @pluginsQuestions.
  ///
  /// In zh, this message translates to:
  /// **'向你提问'**
  String get pluginsQuestions;

  /// No description provided for @pluginsQuestionsDescription.
  ///
  /// In zh, this message translates to:
  /// **'AI 需要你回答'**
  String get pluginsQuestionsDescription;

  /// No description provided for @pluginsSystemSettings.
  ///
  /// In zh, this message translates to:
  /// **'系统设置'**
  String get pluginsSystemSettings;

  /// No description provided for @pluginsLockScreenPrivacy.
  ///
  /// In zh, this message translates to:
  /// **'锁屏不显示对话内容'**
  String get pluginsLockScreenPrivacy;

  /// No description provided for @pluginsSoundBannerLockScreen.
  ///
  /// In zh, this message translates to:
  /// **'声音、横幅与锁屏'**
  String get pluginsSoundBannerLockScreen;

  /// No description provided for @pluginsEnableFloatingNotifications.
  ///
  /// In zh, this message translates to:
  /// **'横幅不弹时，开启「悬浮通知」'**
  String get pluginsEnableFloatingNotifications;

  /// No description provided for @pluginsPersonalPreferences.
  ///
  /// In zh, this message translates to:
  /// **'个人偏好'**
  String get pluginsPersonalPreferences;

  /// No description provided for @pluginsPreferencesDescription.
  ///
  /// In zh, this message translates to:
  /// **'新对话会照这里的要求回答'**
  String get pluginsPreferencesDescription;

  /// No description provided for @pluginsPreferencesHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：用中文回答，我主要写 Flutter'**
  String get pluginsPreferencesHint;

  /// No description provided for @pluginsSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get pluginsSaving;

  /// No description provided for @pluginsShareLink.
  ///
  /// In zh, this message translates to:
  /// **'分享链接'**
  String get pluginsShareLink;

  /// No description provided for @pluginsInstallPlugin.
  ///
  /// In zh, this message translates to:
  /// **'安装插件'**
  String get pluginsInstallPlugin;

  /// No description provided for @pluginsImportProfile.
  ///
  /// In zh, this message translates to:
  /// **'导入配置'**
  String get pluginsImportProfile;

  /// No description provided for @pluginsImportTo.
  ///
  /// In zh, this message translates to:
  /// **'导入到'**
  String get pluginsImportTo;

  /// No description provided for @pluginsInstallTo.
  ///
  /// In zh, this message translates to:
  /// **'安装到'**
  String get pluginsInstallTo;

  /// No description provided for @pluginsVerification.
  ///
  /// In zh, this message translates to:
  /// **'校验'**
  String get pluginsVerification;

  /// No description provided for @pluginsSize.
  ///
  /// In zh, this message translates to:
  /// **'大小'**
  String get pluginsSize;

  /// No description provided for @pluginsVerified.
  ///
  /// In zh, this message translates to:
  /// **'校验通过'**
  String get pluginsVerified;

  /// No description provided for @pluginsVerificationMismatch.
  ///
  /// In zh, this message translates to:
  /// **'校验不一致'**
  String get pluginsVerificationMismatch;

  /// No description provided for @pluginsCannotVerify.
  ///
  /// In zh, this message translates to:
  /// **'无法校验'**
  String get pluginsCannotVerify;

  /// No description provided for @pluginsVerifying.
  ///
  /// In zh, this message translates to:
  /// **'校验中'**
  String get pluginsVerifying;

  /// No description provided for @pluginsPresets.
  ///
  /// In zh, this message translates to:
  /// **'预设'**
  String get pluginsPresets;

  /// No description provided for @pluginsSkills.
  ///
  /// In zh, this message translates to:
  /// **'技能'**
  String get pluginsSkills;

  /// No description provided for @pluginsAdded.
  ///
  /// In zh, this message translates to:
  /// **'新增'**
  String get pluginsAdded;

  /// No description provided for @pluginsModified.
  ///
  /// In zh, this message translates to:
  /// **'修改'**
  String get pluginsModified;

  /// No description provided for @pluginsNoChanges.
  ///
  /// In zh, this message translates to:
  /// **'无需改动'**
  String get pluginsNoChanges;

  /// No description provided for @pluginsUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'不可用'**
  String get pluginsUnavailable;

  /// No description provided for @pluginsHostProfileReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取这台主机的配置'**
  String get pluginsHostProfileReadFailed;

  /// No description provided for @pluginsAlreadyMatches.
  ///
  /// In zh, this message translates to:
  /// **'这台主机上已经是这样了'**
  String get pluginsAlreadyMatches;

  /// No description provided for @pluginsUnsuccessful.
  ///
  /// In zh, this message translates to:
  /// **'没成功'**
  String get pluginsUnsuccessful;

  /// No description provided for @pluginsSkipped.
  ///
  /// In zh, this message translates to:
  /// **'已跳过'**
  String get pluginsSkipped;

  /// No description provided for @pluginsView.
  ///
  /// In zh, this message translates to:
  /// **'查看'**
  String get pluginsView;

  /// No description provided for @pluginsImport.
  ///
  /// In zh, this message translates to:
  /// **'导入'**
  String get pluginsImport;

  /// No description provided for @pluginsHostPluginsReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取这台主机的插件'**
  String get pluginsHostPluginsReadFailed;

  /// No description provided for @pluginsUpdateTo.
  ///
  /// In zh, this message translates to:
  /// **'更新到 {version}'**
  String pluginsUpdateTo(String version);

  /// No description provided for @pluginsImportCount.
  ///
  /// In zh, this message translates to:
  /// **'导入 {count} 项'**
  String pluginsImportCount(int count);

  /// No description provided for @pluginsImporting.
  ///
  /// In zh, this message translates to:
  /// **'正在导入'**
  String get pluginsImporting;

  /// No description provided for @pluginsInstallingActive.
  ///
  /// In zh, this message translates to:
  /// **'正在安装'**
  String get pluginsInstallingActive;

  /// No description provided for @pluginsImportFailedCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项没成功'**
  String pluginsImportFailedCount(int count);

  /// No description provided for @pluginsCouldNotInstall.
  ///
  /// In zh, this message translates to:
  /// **'没能安装'**
  String get pluginsCouldNotInstall;

  /// No description provided for @pluginsEngineRestartToApply.
  ///
  /// In zh, this message translates to:
  /// **'重启引擎后生效'**
  String get pluginsEngineRestartToApply;

  /// No description provided for @pluginsRemoteRestartToApply.
  ///
  /// In zh, this message translates to:
  /// **'重启{host}上的 DSH 后生效'**
  String pluginsRemoteRestartToApply(String host);

  /// No description provided for @pluginsImportedCount.
  ///
  /// In zh, this message translates to:
  /// **'已导入 {count} 项'**
  String pluginsImportedCount(int count);

  /// No description provided for @pluginsLocalPluginUnshareable.
  ///
  /// In zh, this message translates to:
  /// **'这个插件是本地安装的，无法分享'**
  String get pluginsLocalPluginUnshareable;

  /// No description provided for @pluginsSharePlugin.
  ///
  /// In zh, this message translates to:
  /// **'分享插件'**
  String get pluginsSharePlugin;

  /// No description provided for @pluginsPluginCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个插件'**
  String pluginsPluginCount(int count);

  /// No description provided for @pluginsSettingsCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项设置'**
  String pluginsSettingsCount(int count);

  /// No description provided for @pluginsPresetCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个预设'**
  String pluginsPresetCount(int count);

  /// No description provided for @pluginsSkillCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个技能'**
  String pluginsSkillCount(int count);

  /// No description provided for @pluginsNothingSelected.
  ///
  /// In zh, this message translates to:
  /// **'未选择内容'**
  String get pluginsNothingSelected;

  /// No description provided for @pluginsNext.
  ///
  /// In zh, this message translates to:
  /// **'下一步'**
  String get pluginsNext;

  /// No description provided for @pluginsNothingToShare.
  ///
  /// In zh, this message translates to:
  /// **'没有可以分享的内容'**
  String get pluginsNothingToShare;

  /// No description provided for @pluginsProfileReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取配置'**
  String get pluginsProfileReadFailed;

  /// No description provided for @pluginsShareProfile.
  ///
  /// In zh, this message translates to:
  /// **'分享配置'**
  String get pluginsShareProfile;

  /// No description provided for @pluginsFileCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个文件'**
  String pluginsFileCount(int count);

  /// No description provided for @pluginsShareNeedsUpdate.
  ///
  /// In zh, this message translates to:
  /// **'需要更新 App 才能打开'**
  String get pluginsShareNeedsUpdate;

  /// No description provided for @pluginsShareUnusable.
  ///
  /// In zh, this message translates to:
  /// **'这个分享码无法使用'**
  String get pluginsShareUnusable;

  /// No description provided for @pluginsShareDamaged.
  ///
  /// In zh, this message translates to:
  /// **'这个分享码不完整或已损坏'**
  String get pluginsShareDamaged;

  /// No description provided for @pluginsShareFileReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取这个文件'**
  String get pluginsShareFileReadFailed;

  /// No description provided for @pluginsShareOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开这个分享码'**
  String get pluginsShareOpenFailed;

  /// No description provided for @pluginsPluginShareTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 插件'**
  String get pluginsPluginShareTitle;

  /// No description provided for @pluginsShareSheetOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开分享'**
  String get pluginsShareSheetOpenFailed;

  /// No description provided for @pluginsSavePermissionDenied.
  ///
  /// In zh, this message translates to:
  /// **'没有存储权限，没能保存'**
  String get pluginsSavePermissionDenied;

  /// No description provided for @pluginsQrCode.
  ///
  /// In zh, this message translates to:
  /// **'二维码'**
  String get pluginsQrCode;

  /// No description provided for @pluginsSaveAsFile.
  ///
  /// In zh, this message translates to:
  /// **'存为文件'**
  String get pluginsSaveAsFile;

  /// No description provided for @pluginsGistLinkReady.
  ///
  /// In zh, this message translates to:
  /// **'已生成 Gist 链接'**
  String get pluginsGistLinkReady;

  /// No description provided for @pluginsTooLargeShareFile.
  ///
  /// In zh, this message translates to:
  /// **'内容较多，以文件分享'**
  String get pluginsTooLargeShareFile;

  /// No description provided for @pluginsGenerateLink.
  ///
  /// In zh, this message translates to:
  /// **'生成链接'**
  String get pluginsGenerateLink;

  /// No description provided for @pluginsGitHubToken.
  ///
  /// In zh, this message translates to:
  /// **'GitHub 令牌'**
  String get pluginsGitHubToken;

  /// No description provided for @pluginsGistPermissionNeeded.
  ///
  /// In zh, this message translates to:
  /// **'需要 gist 权限'**
  String get pluginsGistPermissionNeeded;

  /// No description provided for @pluginsGenerateGistLink.
  ///
  /// In zh, this message translates to:
  /// **'用 Gist 生成链接'**
  String get pluginsGenerateGistLink;

  /// No description provided for @pluginsShareQrCode.
  ///
  /// In zh, this message translates to:
  /// **'分享码二维码'**
  String get pluginsShareQrCode;

  /// No description provided for @pluginsUpdateCurrentWarning.
  ///
  /// In zh, this message translates to:
  /// **'会先卸载当前版本，再安装 {to}。如果新版本没装上，插件会处于未安装状态，需要重新安装。'**
  String pluginsUpdateCurrentWarning(String to);

  /// No description provided for @pluginsUpdateVersionWarning.
  ///
  /// In zh, this message translates to:
  /// **'会先卸载 {from}，再安装 {to}。如果新版本没装上，插件会处于未安装状态，需要重新安装。'**
  String pluginsUpdateVersionWarning(String from, String to);

  /// No description provided for @pluginsUninstalledRestartLocal.
  ///
  /// In zh, this message translates to:
  /// **'已卸载「{title}」，重启引擎后完全移除'**
  String pluginsUninstalledRestartLocal(String title);

  /// No description provided for @pluginsUninstalledRestartRemote.
  ///
  /// In zh, this message translates to:
  /// **'已卸载「{title}」，重启{host}上的 DSH 后完全移除'**
  String pluginsUninstalledRestartRemote(String title, String host);

  /// No description provided for @pluginsEnableFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能启用'**
  String get pluginsEnableFailed;

  /// No description provided for @pluginsDisableFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能停用'**
  String get pluginsDisableFailed;

  /// No description provided for @pluginsEnabledRestartLocal.
  ///
  /// In zh, this message translates to:
  /// **'已启用，重启引擎后生效'**
  String get pluginsEnabledRestartLocal;

  /// No description provided for @pluginsEnabledRestartRemote.
  ///
  /// In zh, this message translates to:
  /// **'已启用，重启{host}上的 DSH 后生效'**
  String pluginsEnabledRestartRemote(String host);

  /// No description provided for @pluginsDisabledRestartLocal.
  ///
  /// In zh, this message translates to:
  /// **'已停用，重启引擎后生效'**
  String get pluginsDisabledRestartLocal;

  /// No description provided for @pluginsDisabledRestartRemote.
  ///
  /// In zh, this message translates to:
  /// **'已停用，重启{host}上的 DSH 后生效'**
  String pluginsDisabledRestartRemote(String host);

  /// No description provided for @pluginsRelayCommandInstruction.
  ///
  /// In zh, this message translates to:
  /// **'经 DSH Remote 中转时只能开关插件。在{host}的终端里运行：'**
  String pluginsRelayCommandInstruction(String host);

  /// No description provided for @pluginsPermissionLocalThirdParty.
  ///
  /// In zh, this message translates to:
  /// **'插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key 和已授权的手机存储，不受工作区沙箱限制。由第三方提供，DSH 官方未审核。'**
  String get pluginsPermissionLocalThirdParty;

  /// No description provided for @pluginsPermissionLocalTrusted.
  ///
  /// In zh, this message translates to:
  /// **'插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key 和已授权的手机存储，不受工作区沙箱限制。只装你信任的插件。'**
  String get pluginsPermissionLocalTrusted;

  /// No description provided for @pluginsPermissionRemoteThirdParty.
  ///
  /// In zh, this message translates to:
  /// **'插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key，不受工作区沙箱限制。由第三方提供，DSH 官方未审核。'**
  String get pluginsPermissionRemoteThirdParty;

  /// No description provided for @pluginsPermissionRemoteTrusted.
  ///
  /// In zh, this message translates to:
  /// **'插件以 DSH 的权限运行：能读写文件、执行命令、读取 API Key，不受工作区沙箱限制。只装你信任的插件。'**
  String get pluginsPermissionRemoteTrusted;

  /// No description provided for @pluginsSelectedQrCount.
  ///
  /// In zh, this message translates to:
  /// **'已选 {count} 项 · 可生成二维码'**
  String pluginsSelectedQrCount(int count);

  /// No description provided for @pluginsSelectedFileCount.
  ///
  /// In zh, this message translates to:
  /// **'已选 {count} 项 · 以文件分享'**
  String pluginsSelectedFileCount(int count);

  /// No description provided for @pluginsListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get pluginsListSeparator;

  /// No description provided for @pluginsActionFailure.
  ///
  /// In zh, this message translates to:
  /// **'{action}：{reason}'**
  String pluginsActionFailure(String action, String reason);

  /// No description provided for @pluginsInventorySemantics.
  ///
  /// In zh, this message translates to:
  /// **'{title}，{status}'**
  String pluginsInventorySemantics(String title, String status);

  /// No description provided for @pluginsSettingsChanges.
  ///
  /// In zh, this message translates to:
  /// **'{shown} 等 {count} 项'**
  String pluginsSettingsChanges(String shown, int count);

  /// No description provided for @pluginsLoadStatus.
  ///
  /// In zh, this message translates to:
  /// **'加载状态'**
  String get pluginsLoadStatus;

  /// No description provided for @pluginsLoadPartial.
  ///
  /// In zh, this message translates to:
  /// **'部分生效'**
  String get pluginsLoadPartial;

  /// No description provided for @pluginsLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载失败'**
  String get pluginsLoadFailed;

  /// No description provided for @pluginsLoadNotReady.
  ///
  /// In zh, this message translates to:
  /// **'尚未就绪'**
  String get pluginsLoadNotReady;

  /// No description provided for @pluginsLoadMetadata.
  ///
  /// In zh, this message translates to:
  /// **'元数据诊断'**
  String get pluginsLoadMetadata;

  /// No description provided for @pluginsLoadRunningCount.
  ///
  /// In zh, this message translates to:
  /// **'{running} / {total} 个组件运行中'**
  String pluginsLoadRunningCount(int running, int total);

  /// No description provided for @pluginsLoadUnreported.
  ///
  /// In zh, this message translates to:
  /// **'状态未报告'**
  String get pluginsLoadUnreported;

  /// No description provided for @pluginsLoadNoRuntimeDetail.
  ///
  /// In zh, this message translates to:
  /// **'主机未返回运行时错误详情，请查看引擎日志。'**
  String get pluginsLoadNoRuntimeDetail;

  /// No description provided for @pluginsLoadRemoteLogs.
  ///
  /// In zh, this message translates to:
  /// **'请在这台主机上查看引擎日志。'**
  String get pluginsLoadRemoteLogs;

  /// No description provided for @plugslotsSurfaceComposerActions.
  ///
  /// In zh, this message translates to:
  /// **'输入框按钮'**
  String get plugslotsSurfaceComposerActions;

  /// No description provided for @plugslotsSurfaceMessageActions.
  ///
  /// In zh, this message translates to:
  /// **'消息菜单'**
  String get plugslotsSurfaceMessageActions;

  /// No description provided for @plugslotsSurfaceComposerStrip.
  ///
  /// In zh, this message translates to:
  /// **'状态条'**
  String get plugslotsSurfaceComposerStrip;

  /// No description provided for @plugslotsSurfacePanel.
  ///
  /// In zh, this message translates to:
  /// **'面板'**
  String get plugslotsSurfacePanel;

  /// No description provided for @plugslotsNativeUi.
  ///
  /// In zh, this message translates to:
  /// **'原生界面'**
  String get plugslotsNativeUi;

  /// No description provided for @plugslotsIssueCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 项有误'**
  String plugslotsIssueCount(int count);

  /// No description provided for @plugslotsAllGood.
  ///
  /// In zh, this message translates to:
  /// **'正常'**
  String get plugslotsAllGood;

  /// No description provided for @plugslotsViewSize.
  ///
  /// In zh, this message translates to:
  /// **'视图 {size}'**
  String plugslotsViewSize(String size);

  /// No description provided for @plugslotsInvokeMs.
  ///
  /// In zh, this message translates to:
  /// **'响应 {ms} ms'**
  String plugslotsInvokeMs(int ms);

  /// No description provided for @plugslotsLastView.
  ///
  /// In zh, this message translates to:
  /// **'最近视图'**
  String get plugslotsLastView;

  /// No description provided for @plugslotsLastInvoke.
  ///
  /// In zh, this message translates to:
  /// **'最近响应'**
  String get plugslotsLastInvoke;

  /// No description provided for @plugslotsProblems.
  ///
  /// In zh, this message translates to:
  /// **'问题'**
  String get plugslotsProblems;

  /// No description provided for @plugslotsNoProblems.
  ///
  /// In zh, this message translates to:
  /// **'没有问题'**
  String get plugslotsNoProblems;

  /// No description provided for @plugslotsWantsDraft.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」要读取输入框'**
  String plugslotsWantsDraft(String plugin);

  /// No description provided for @plugslotsWantsClipboard.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」要读取剪贴板'**
  String plugslotsWantsClipboard(String plugin);

  /// No description provided for @plugslotsWantsBoth.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」要读取输入框和剪贴板'**
  String plugslotsWantsBoth(String plugin);

  /// No description provided for @plugslotsWantsWhen.
  ///
  /// In zh, this message translates to:
  /// **'只在点按它时读取'**
  String get plugslotsWantsWhen;

  /// No description provided for @plugslotsAllow.
  ///
  /// In zh, this message translates to:
  /// **'允许'**
  String get plugslotsAllow;

  /// No description provided for @plugslotsNoResponse.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」没有响应'**
  String plugslotsNoResponse(String plugin);

  /// No description provided for @plugslotsFailed.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」出错了'**
  String plugslotsFailed(String plugin);

  /// No description provided for @plugslotsNeedsChat.
  ///
  /// In zh, this message translates to:
  /// **'先打开一个对话'**
  String get plugslotsNeedsChat;

  /// No description provided for @plugslotsFromPlugin.
  ///
  /// In zh, this message translates to:
  /// **'来自「{plugin}」'**
  String plugslotsFromPlugin(String plugin);

  /// No description provided for @plugslotsPanelOffline.
  ///
  /// In zh, this message translates to:
  /// **'连不上插件'**
  String get plugslotsPanelOffline;

  /// No description provided for @plugslotsIssueTooMany.
  ///
  /// In zh, this message translates to:
  /// **'最多 {max} 个，其余不显示'**
  String plugslotsIssueTooMany(int max);

  /// No description provided for @plugslotsIssueTrimmed.
  ///
  /// In zh, this message translates to:
  /// **'超过 {max} 字，已截断'**
  String plugslotsIssueTrimmed(int max);

  /// No description provided for @plugslotsIssueNeedsApp.
  ///
  /// In zh, this message translates to:
  /// **'需要 DSH Go {version} 或更新版本'**
  String plugslotsIssueNeedsApp(String version);

  /// No description provided for @plugslotsIssueNewerProtocol.
  ///
  /// In zh, this message translates to:
  /// **'需要更新 App'**
  String get plugslotsIssueNewerProtocol;

  /// No description provided for @plugslotsIssueUnknownIcon.
  ///
  /// In zh, this message translates to:
  /// **'不认识的图标，已换成默认图标'**
  String get plugslotsIssueUnknownIcon;

  /// No description provided for @plugslotsIssueUnknownEffect.
  ///
  /// In zh, this message translates to:
  /// **'不支持的效果「{name}」'**
  String plugslotsIssueUnknownEffect(String name);

  /// No description provided for @plugslotsIssueLate.
  ///
  /// In zh, this message translates to:
  /// **'点按 3 秒后才返回，已忽略'**
  String get plugslotsIssueLate;

  /// No description provided for @plugslotsIssueHttps.
  ///
  /// In zh, this message translates to:
  /// **'只支持 https 链接'**
  String get plugslotsIssueHttps;

  /// No description provided for @plugslotsIssueUnknownPage.
  ///
  /// In zh, this message translates to:
  /// **'没有「{page}」这个页面'**
  String plugslotsIssueUnknownPage(String page);

  /// No description provided for @plugslotsIssueThrottled.
  ///
  /// In zh, this message translates to:
  /// **'提示太频繁，已略过'**
  String get plugslotsIssueThrottled;

  /// No description provided for @plugslotsIssueInvoke.
  ///
  /// In zh, this message translates to:
  /// **'调用失败：{message}'**
  String plugslotsIssueInvoke(String message);

  /// No description provided for @plugslotsIssueStream.
  ///
  /// In zh, this message translates to:
  /// **'数据出错：{message}'**
  String plugslotsIssueStream(String message);

  /// No description provided for @plugslotsIssueMissing.
  ///
  /// In zh, this message translates to:
  /// **'缺少必填项'**
  String get plugslotsIssueMissing;

  /// No description provided for @plugslotsIssueDuplicate.
  ///
  /// In zh, this message translates to:
  /// **'id 重复，已略过'**
  String get plugslotsIssueDuplicate;

  /// No description provided for @plugslotsIssueNoPlacement.
  ///
  /// In zh, this message translates to:
  /// **'没有可放的位置'**
  String get plugslotsIssueNoPlacement;

  /// No description provided for @plugslotsWantsMessage.
  ///
  /// In zh, this message translates to:
  /// **'「{plugin}」要读取这条回复'**
  String plugslotsWantsMessage(String plugin);

  /// No description provided for @plugslotsCodeInvalidManifest.
  ///
  /// In zh, this message translates to:
  /// **'声明有误，原生部分已停用'**
  String get plugslotsCodeInvalidManifest;

  /// No description provided for @plugslotsCodeInvalidField.
  ///
  /// In zh, this message translates to:
  /// **'格式不对，已略过'**
  String get plugslotsCodeInvalidField;

  /// No description provided for @plugslotsCodeUnknownField.
  ///
  /// In zh, this message translates to:
  /// **'不认识的字段，已忽略'**
  String get plugslotsCodeUnknownField;

  /// No description provided for @plugslotsCodeUnknownSurface.
  ///
  /// In zh, this message translates to:
  /// **'这个位置还不支持，已忽略'**
  String get plugslotsCodeUnknownSurface;

  /// No description provided for @plugslotsCodeTooMany.
  ///
  /// In zh, this message translates to:
  /// **'超出数量，多余的不显示'**
  String get plugslotsCodeTooMany;

  /// No description provided for @plugslotsCodeTooLong.
  ///
  /// In zh, this message translates to:
  /// **'文字太长，已截断'**
  String get plugslotsCodeTooLong;

  /// No description provided for @plugslotsCodeNoHandler.
  ///
  /// In zh, this message translates to:
  /// **'插件还没处理这一项，暂不显示'**
  String get plugslotsCodeNoHandler;

  /// No description provided for @plugslotsCodeUndeclared.
  ///
  /// In zh, this message translates to:
  /// **'注册了清单里没有的项，已忽略'**
  String get plugslotsCodeUndeclared;

  /// No description provided for @plugslotsCodeViewFile.
  ///
  /// In zh, this message translates to:
  /// **'视图文件读不出'**
  String get plugslotsCodeViewFile;

  /// No description provided for @plugslotsCodeBadEffect.
  ///
  /// In zh, this message translates to:
  /// **'动作格式不对，已略过'**
  String get plugslotsCodeBadEffect;

  /// No description provided for @plugslotsCodeViolation.
  ///
  /// In zh, this message translates to:
  /// **'出错 {count} 次'**
  String plugslotsCodeViolation(int count);

  /// No description provided for @plugslotsCodeDegraded.
  ///
  /// In zh, this message translates to:
  /// **'出错太多，已停用到下次启动'**
  String get plugslotsCodeDegraded;

  /// No description provided for @plugslotsCodeTimeout.
  ///
  /// In zh, this message translates to:
  /// **'插件没有及时响应'**
  String get plugslotsCodeTimeout;

  /// No description provided for @plugslotsCodeRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'点得太快了'**
  String get plugslotsCodeRateLimited;

  /// No description provided for @plugslotsCodeNotFound.
  ///
  /// In zh, this message translates to:
  /// **'插件已停用或找不到'**
  String get plugslotsCodeNotFound;

  /// No description provided for @plugslotsCodePluginError.
  ///
  /// In zh, this message translates to:
  /// **'插件出错'**
  String get plugslotsCodePluginError;

  /// No description provided for @plugslotsCodeInvalidView.
  ///
  /// In zh, this message translates to:
  /// **'视图有误'**
  String get plugslotsCodeInvalidView;

  /// No description provided for @plugslotsCodeLimit.
  ///
  /// In zh, this message translates to:
  /// **'订阅太多'**
  String get plugslotsCodeLimit;

  /// No description provided for @plugslotsCodeOther.
  ///
  /// In zh, this message translates to:
  /// **'其他问题'**
  String get plugslotsCodeOther;

  /// No description provided for @plugslotsCodeUnknownEffect.
  ///
  /// In zh, this message translates to:
  /// **'不支持的动作，已略过'**
  String get plugslotsCodeUnknownEffect;

  /// No description provided for @plugslotsNotDone.
  ///
  /// In zh, this message translates to:
  /// **'没完成'**
  String get plugslotsNotDone;

  /// No description provided for @plugslotsWorking.
  ///
  /// In zh, this message translates to:
  /// **'进行中'**
  String get plugslotsWorking;

  /// No description provided for @plugslotsTapToCancel.
  ///
  /// In zh, this message translates to:
  /// **'点按取消'**
  String get plugslotsTapToCancel;

  /// No description provided for @plugslotsCodeTooManyPending.
  ///
  /// In zh, this message translates to:
  /// **'还有两件没做完'**
  String get plugslotsCodeTooManyPending;

  /// No description provided for @plugslotsCodeNoStream.
  ///
  /// In zh, this message translates to:
  /// **'连接断了'**
  String get plugslotsCodeNoStream;

  /// No description provided for @plugslotsVoiceAsk.
  ///
  /// In zh, this message translates to:
  /// **'允许「{plugin}」听你开口？'**
  String plugslotsVoiceAsk(String plugin);

  /// No description provided for @plugslotsVoiceWhen.
  ///
  /// In zh, this message translates to:
  /// **'朗读时你一开口就停。声音只在手机上判断，不保存、不上传'**
  String get plugslotsVoiceWhen;

  /// No description provided for @plugslotsVoiceDeny.
  ///
  /// In zh, this message translates to:
  /// **'不允许'**
  String get plugslotsVoiceDeny;

  /// No description provided for @plugslotsVoiceSwitch.
  ///
  /// In zh, this message translates to:
  /// **'听你开口'**
  String get plugslotsVoiceSwitch;

  /// No description provided for @plugslotsPickerUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'此设备暂不支持文件选择'**
  String get plugslotsPickerUnavailable;

  /// No description provided for @plugslotsPickerBusy.
  ///
  /// In zh, this message translates to:
  /// **'请先完成当前文件选择'**
  String get plugslotsPickerBusy;

  /// No description provided for @plugslotsPickerLimit.
  ///
  /// In zh, this message translates to:
  /// **'最多选 {count} 个文件，单个 8 MiB，总计 16 MiB'**
  String plugslotsPickerLimit(int count);

  /// No description provided for @plugslotsPickerFailed.
  ///
  /// In zh, this message translates to:
  /// **'文件未能交给插件，请重试'**
  String get plugslotsPickerFailed;

  /// No description provided for @plugslotsWebPlacesTitle.
  ///
  /// In zh, this message translates to:
  /// **'网页版界面'**
  String get plugslotsWebPlacesTitle;

  /// No description provided for @plugslotsPlaceBesideComposer.
  ///
  /// In zh, this message translates to:
  /// **'输入框旁'**
  String get plugslotsPlaceBesideComposer;

  /// No description provided for @plugslotsPlaceHeader.
  ///
  /// In zh, this message translates to:
  /// **'对话顶栏'**
  String get plugslotsPlaceHeader;

  /// No description provided for @plugslotsPlaceMessages.
  ///
  /// In zh, this message translates to:
  /// **'消息里'**
  String get plugslotsPlaceMessages;

  /// No description provided for @plugslotsPlaceOverlay.
  ///
  /// In zh, this message translates to:
  /// **'浮层'**
  String get plugslotsPlaceOverlay;

  /// No description provided for @plugslotsPlaceSidebar.
  ///
  /// In zh, this message translates to:
  /// **'侧栏'**
  String get plugslotsPlaceSidebar;

  /// No description provided for @plugslotsPlaceRightbar.
  ///
  /// In zh, this message translates to:
  /// **'右侧栏'**
  String get plugslotsPlaceRightbar;

  /// No description provided for @plugslotsPlaceFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件预览'**
  String get plugslotsPlaceFiles;

  /// No description provided for @plugslotsPlaceSettings.
  ///
  /// In zh, this message translates to:
  /// **'设置'**
  String get plugslotsPlaceSettings;

  /// No description provided for @plugslotsPlacePlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件页'**
  String get plugslotsPlacePlugins;

  /// No description provided for @plugslotsPlaceNewChat.
  ///
  /// In zh, this message translates to:
  /// **'新对话页'**
  String get plugslotsPlaceNewChat;

  /// No description provided for @plugslotsPlaceElsewhere.
  ///
  /// In zh, this message translates to:
  /// **'其他位置'**
  String get plugslotsPlaceElsewhere;

  /// No description provided for @plugslotsPlaceUnknown.
  ///
  /// In zh, this message translates to:
  /// **'它的网页界面'**
  String get plugslotsPlaceUnknown;

  /// No description provided for @plugslotsChatEntry.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get plugslotsChatEntry;

  /// No description provided for @plugslotsChatWebFrom.
  ///
  /// In zh, this message translates to:
  /// **'网页插件 · {names}'**
  String plugslotsChatWebFrom(String names);

  /// No description provided for @plugViewInvalid.
  ///
  /// In zh, this message translates to:
  /// **'插件界面有误'**
  String get plugViewInvalid;

  /// No description provided for @plugViewEmpty.
  ///
  /// In zh, this message translates to:
  /// **'暂无数据'**
  String get plugViewEmpty;

  /// No description provided for @plugViewImageUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'图片无法显示'**
  String get plugViewImageUnavailable;

  /// No description provided for @plugViewUnavailableList.
  ///
  /// In zh, this message translates to:
  /// **'列表无法显示'**
  String get plugViewUnavailableList;

  /// No description provided for @plugViewUnavailableKeyValue.
  ///
  /// In zh, this message translates to:
  /// **'信息无法显示'**
  String get plugViewUnavailableKeyValue;

  /// No description provided for @plugViewUnavailableProgress.
  ///
  /// In zh, this message translates to:
  /// **'进度无法显示'**
  String get plugViewUnavailableProgress;

  /// No description provided for @plugViewUnavailableTable.
  ///
  /// In zh, this message translates to:
  /// **'表格无法显示'**
  String get plugViewUnavailableTable;

  /// No description provided for @plugViewUnavailableActions.
  ///
  /// In zh, this message translates to:
  /// **'按钮无法显示'**
  String get plugViewUnavailableActions;

  /// No description provided for @plugViewFrom.
  ///
  /// In zh, this message translates to:
  /// **'来自 {name}'**
  String plugViewFrom(String name);

  /// No description provided for @plugViewUnknownTone.
  ///
  /// In zh, this message translates to:
  /// **'未知 tone {value}，已忽略；可用：good, warn, bad, info, muted'**
  String plugViewUnknownTone(String value);

  /// No description provided for @plugViewBadActionId.
  ///
  /// In zh, this message translates to:
  /// **'动作 id {value} 不合规，这个元素不可点'**
  String plugViewBadActionId(String value);

  /// No description provided for @plugViewBadAction.
  ///
  /// In zh, this message translates to:
  /// **'动作应该是 id 字符串或 {shape}，已忽略'**
  String plugViewBadAction(String shape);

  /// No description provided for @plugViewArgsLimit.
  ///
  /// In zh, this message translates to:
  /// **'动作参数超过 {limit} 字节，已忽略'**
  String plugViewArgsLimit(int limit);

  /// No description provided for @plugViewUnknownIcon.
  ///
  /// In zh, this message translates to:
  /// **'未知图标 {value}，画默认图标'**
  String plugViewUnknownIcon(String value);

  /// No description provided for @plugViewExpectedItems.
  ///
  /// In zh, this message translates to:
  /// **'应该是数组，每项是 {shape}'**
  String plugViewExpectedItems(String shape);

  /// No description provided for @plugViewSkippedItem.
  ///
  /// In zh, this message translates to:
  /// **'应该是 {shape}，这项已跳过'**
  String plugViewSkippedItem(String shape);

  /// No description provided for @plugViewBadMax.
  ///
  /// In zh, this message translates to:
  /// **'max 应该是大于 0 的数，按 100 算'**
  String get plugViewBadMax;

  /// No description provided for @plugViewColumnLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 列，超过上限 {second}'**
  String plugViewColumnLimit(int first, int second);

  /// No description provided for @plugViewFirstColumns.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {limit} 列'**
  String plugViewFirstColumns(int limit);

  /// No description provided for @plugViewFirstRows.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {limit} 行'**
  String plugViewFirstRows(int limit);

  /// No description provided for @plugViewOnePrimary.
  ///
  /// In zh, this message translates to:
  /// **'一张视图只能有一个主按钮，这个按普通按钮画'**
  String get plugViewOnePrimary;

  /// No description provided for @plugViewBadImageSource.
  ///
  /// In zh, this message translates to:
  /// **'图片只收插件资源 asset:<路径>（png、jpg、webp、gif）或 data:image/…'**
  String get plugViewBadImageSource;

  /// No description provided for @plugViewBadAspect.
  ///
  /// In zh, this message translates to:
  /// **'aspect 应该是 0.25 到 4 之间的数，已忽略'**
  String get plugViewBadAspect;

  /// No description provided for @plugViewImageTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'data: 图片超过 {limit} 字节'**
  String plugViewImageTooLarge(int limit);

  /// No description provided for @plugViewImageDecode.
  ///
  /// In zh, this message translates to:
  /// **'图片无法解码（只收 PNG、JPEG、WebP、GIF）'**
  String get plugViewImageDecode;

  /// No description provided for @plugViewImagePixels.
  ///
  /// In zh, this message translates to:
  /// **'图片尺寸超过上限：单边 4096、总数 400 万像素'**
  String get plugViewImagePixels;

  /// No description provided for @plugViewTooDeep.
  ///
  /// In zh, this message translates to:
  /// **'JSON 嵌套超过 {limit} 层'**
  String plugViewTooDeep(int limit);

  /// No description provided for @plugViewV2Content.
  ///
  /// In zh, this message translates to:
  /// **'插件内容'**
  String get plugViewV2Content;

  /// No description provided for @plugViewVersionFallback.
  ///
  /// In zh, this message translates to:
  /// **'暂不支持视图版本 {version}，已使用兼容显示'**
  String plugViewVersionFallback(String version);

  /// No description provided for @plugViewStyleInvalid.
  ///
  /// In zh, this message translates to:
  /// **'样式无效，支持 {values}'**
  String plugViewStyleInvalid(String values);

  /// No description provided for @plugViewStyleReserved.
  ///
  /// In zh, this message translates to:
  /// **'此样式由 App 保留，已忽略'**
  String get plugViewStyleReserved;

  /// No description provided for @plugViewStyleContainerOnly.
  ///
  /// In zh, this message translates to:
  /// **'此样式仅用于 stack 和 row'**
  String get plugViewStyleContainerOnly;

  /// No description provided for @plugViewStyleTextOnly.
  ///
  /// In zh, this message translates to:
  /// **'此样式仅用于 text、metric 和 callout'**
  String get plugViewStyleTextOnly;

  /// No description provided for @plugViewContrastAdjusted.
  ///
  /// In zh, this message translates to:
  /// **'{mode}：{before} 已校正为 {after}，对比度至少 {minimum}:1'**
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum);

  /// No description provided for @plugViewRichLimit.
  ///
  /// In zh, this message translates to:
  /// **'富文本超出上限，已截断'**
  String get plugViewRichLimit;

  /// No description provided for @plugViewBadTrend.
  ///
  /// In zh, this message translates to:
  /// **'trend 要 2–{max} 个数字（可以有 null），已忽略'**
  String plugViewBadTrend(int max);

  /// No description provided for @plugViewGalleryPicture.
  ///
  /// In zh, this message translates to:
  /// **'第 {index} 张'**
  String plugViewGalleryPicture(int index);

  /// No description provided for @readListUpdating.
  ///
  /// In zh, this message translates to:
  /// **'更新中 · 上次结果'**
  String get readListUpdating;

  /// No description provided for @readListOffline.
  ///
  /// In zh, this message translates to:
  /// **'离线 · 上次结果'**
  String get readListOffline;

  /// No description provided for @readListFailed.
  ///
  /// In zh, this message translates to:
  /// **'未更新 · 上次结果'**
  String get readListFailed;

  /// No description provided for @remoteStartupSection.
  ///
  /// In zh, this message translates to:
  /// **'启动'**
  String get remoteStartupSection;

  /// No description provided for @remoteAutoConnectOnStartup.
  ///
  /// In zh, this message translates to:
  /// **'连接上次使用的主机'**
  String get remoteAutoConnectOnStartup;

  /// No description provided for @remoteAutoConnectOnStartupHint.
  ///
  /// In zh, this message translates to:
  /// **'关闭后从本机开始'**
  String get remoteAutoConnectOnStartupHint;

  /// No description provided for @remoteStepConnect.
  ///
  /// In zh, this message translates to:
  /// **'连接服务器'**
  String get remoteStepConnect;

  /// No description provided for @remoteStepVerifyHostKey.
  ///
  /// In zh, this message translates to:
  /// **'验证主机指纹'**
  String get remoteStepVerifyHostKey;

  /// No description provided for @remoteStepStartDsh.
  ///
  /// In zh, this message translates to:
  /// **'启动 DSH'**
  String get remoteStepStartDsh;

  /// No description provided for @remoteStepTunnel.
  ///
  /// In zh, this message translates to:
  /// **'建立隧道'**
  String get remoteStepTunnel;

  /// No description provided for @remoteConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接'**
  String get remoteConnecting;

  /// No description provided for @remoteConnected.
  ///
  /// In zh, this message translates to:
  /// **'已连接'**
  String get remoteConnected;

  /// No description provided for @remoteReconnecting.
  ///
  /// In zh, this message translates to:
  /// **'重新连接中'**
  String get remoteReconnecting;

  /// No description provided for @remoteReconnectAttempt.
  ///
  /// In zh, this message translates to:
  /// **'重新连接中 · 第 {count} 次'**
  String remoteReconnectAttempt(int count);

  /// No description provided for @remoteErrInvalidServer.
  ///
  /// In zh, this message translates to:
  /// **'服务器地址无效'**
  String get remoteErrInvalidServer;

  /// No description provided for @remoteErrEmailPassword.
  ///
  /// In zh, this message translates to:
  /// **'邮箱或密码不对'**
  String get remoteErrEmailPassword;

  /// No description provided for @remoteErrHostNotInAccount.
  ///
  /// In zh, this message translates to:
  /// **'账号下找不到这台主机'**
  String get remoteErrHostNotInAccount;

  /// No description provided for @remoteHostFallback.
  ///
  /// In zh, this message translates to:
  /// **'这台主机'**
  String get remoteHostFallback;

  /// No description provided for @remoteErrHostOffline.
  ///
  /// In zh, this message translates to:
  /// **'主机现在不在线'**
  String get remoteErrHostOffline;

  /// No description provided for @remoteErrHostRemoved.
  ///
  /// In zh, this message translates to:
  /// **'{name}已不在你的 DSH Remote 账号下'**
  String remoteErrHostRemoved(String name);

  /// No description provided for @remoteErrRelaySignInExpired.
  ///
  /// In zh, this message translates to:
  /// **'DSH Remote 登录已失效'**
  String get remoteErrRelaySignInExpired;

  /// No description provided for @remoteErrIdentityKeyChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机身份密钥和上次不一致'**
  String get remoteErrIdentityKeyChanged;

  /// No description provided for @remoteErrIdentityUnconfirmed.
  ///
  /// In zh, this message translates to:
  /// **'还没有确认主机身份指纹'**
  String get remoteErrIdentityUnconfirmed;

  /// No description provided for @remoteErrConnectionReplaced.
  ///
  /// In zh, this message translates to:
  /// **'远程连接已被替换'**
  String get remoteErrConnectionReplaced;

  /// No description provided for @remoteErrHostRejected.
  ///
  /// In zh, this message translates to:
  /// **'主机拒绝了连接'**
  String get remoteErrHostRejected;

  /// No description provided for @remoteErrHostNotOwned.
  ///
  /// In zh, this message translates to:
  /// **'主机不在你的 DSH Remote 账号下'**
  String get remoteErrHostNotOwned;

  /// No description provided for @remoteErrUpdateNeeded.
  ///
  /// In zh, this message translates to:
  /// **'版本不匹配，请更新 DSH Go 和主机上的远程插件'**
  String get remoteErrUpdateNeeded;

  /// No description provided for @remoteErrVersionIncompatible.
  ///
  /// In zh, this message translates to:
  /// **'主机上的 DSH 或远程插件需要更新'**
  String get remoteErrVersionIncompatible;

  /// No description provided for @remoteErrSignInTimeout.
  ///
  /// In zh, this message translates to:
  /// **'登录超时'**
  String get remoteErrSignInTimeout;

  /// No description provided for @remoteSignInCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消登录'**
  String get remoteSignInCancelled;

  /// No description provided for @remoteErrBrowserSignInUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'服务器不支持浏览器登录'**
  String get remoteErrBrowserSignInUnsupported;

  /// No description provided for @remoteErrTooManyRequests.
  ///
  /// In zh, this message translates to:
  /// **'请求太频繁'**
  String get remoteErrTooManyRequests;

  /// No description provided for @remoteErrHostUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上远程主机'**
  String get remoteErrHostUnreachable;

  /// No description provided for @remoteErrRemoteConnection.
  ///
  /// In zh, this message translates to:
  /// **'远程连接失败'**
  String get remoteErrRemoteConnection;

  /// No description provided for @remoteOnline.
  ///
  /// In zh, this message translates to:
  /// **'在线'**
  String get remoteOnline;

  /// No description provided for @remoteOffline.
  ///
  /// In zh, this message translates to:
  /// **'离线'**
  String get remoteOffline;

  /// No description provided for @remoteUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'暂不可用'**
  String get remoteUnavailable;

  /// No description provided for @remoteErrHostNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到这台主机'**
  String get remoteErrHostNotFound;

  /// No description provided for @remoteConnectionStopped.
  ///
  /// In zh, this message translates to:
  /// **'远程连接已停止'**
  String get remoteConnectionStopped;

  /// No description provided for @remoteBootstrapReusePort.
  ///
  /// In zh, this message translates to:
  /// **'复用已在运行的 DSH（端口 {port}）'**
  String remoteBootstrapReusePort(int port);

  /// No description provided for @remoteBootstrapStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在远端启动 DSH…'**
  String get remoteBootstrapStarting;

  /// No description provided for @remoteErrCommandNotFound.
  ///
  /// In zh, this message translates to:
  /// **'远端找不到「{command}」'**
  String remoteErrCommandNotFound(String command);

  /// No description provided for @remoteErrDshMissing.
  ///
  /// In zh, this message translates to:
  /// **'主机上没有 dsh，装好后重试，或在启动命令里填完整路径'**
  String get remoteErrDshMissing;

  /// No description provided for @remoteStartCommandExample.
  ///
  /// In zh, this message translates to:
  /// **'启动命令示例：~/.nvm/versions/node/v22.0.0/bin/dsh web'**
  String get remoteStartCommandExample;

  /// No description provided for @remoteErrDshStartTimeout.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 启动超时'**
  String get remoteErrDshStartTimeout;

  /// No description provided for @remoteErrDshExited.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 启动后立即退出'**
  String get remoteErrDshExited;

  /// No description provided for @remoteErrDshStart.
  ///
  /// In zh, this message translates to:
  /// **'没能在远端启动 DSH'**
  String get remoteErrDshStart;

  /// No description provided for @remoteExitCode.
  ///
  /// In zh, this message translates to:
  /// **'退出码 {code}'**
  String remoteExitCode(int code);

  /// No description provided for @remoteErrNoShell.
  ///
  /// In zh, this message translates to:
  /// **'主机上没有 sh，只支持 Linux 和 macOS'**
  String get remoteErrNoShell;

  /// No description provided for @remoteErrFingerprintChanged.
  ///
  /// In zh, this message translates to:
  /// **'主机指纹和上次不一致，已断开'**
  String get remoteErrFingerprintChanged;

  /// No description provided for @remoteErrFingerprintUnconfirmed.
  ///
  /// In zh, this message translates to:
  /// **'还没有确认主机指纹'**
  String get remoteErrFingerprintUnconfirmed;

  /// No description provided for @remoteHostTrustCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消信任主机'**
  String get remoteHostTrustCancelled;

  /// No description provided for @remoteCheckingDsh.
  ///
  /// In zh, this message translates to:
  /// **'检查远端的 DSH…'**
  String get remoteCheckingDsh;

  /// No description provided for @remoteErrDshPort.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 端口连不上'**
  String get remoteErrDshPort;

  /// No description provided for @remoteDshReused.
  ///
  /// In zh, this message translates to:
  /// **'复用了远端已在运行的 DSH'**
  String get remoteDshReused;

  /// No description provided for @remoteDshStarted.
  ///
  /// In zh, this message translates to:
  /// **'已在远端启动 DSH'**
  String get remoteDshStarted;

  /// No description provided for @remoteErrDshTokenRejected.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 拒绝了登录令牌'**
  String get remoteErrDshTokenRejected;

  /// No description provided for @remoteErrDshSignIn.
  ///
  /// In zh, this message translates to:
  /// **'没能登录远端 DSH'**
  String get remoteErrDshSignIn;

  /// No description provided for @remoteErrDshTunnel.
  ///
  /// In zh, this message translates to:
  /// **'没能通过隧道连接 DSH'**
  String get remoteErrDshTunnel;

  /// No description provided for @remoteErrDshSignInExpired.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 登录已失效'**
  String get remoteErrDshSignInExpired;

  /// No description provided for @remoteErrDshStopped.
  ///
  /// In zh, this message translates to:
  /// **'远端 DSH 已停止运行'**
  String get remoteErrDshStopped;

  /// No description provided for @remoteErrSshDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'SSH 连接已断开'**
  String get remoteErrSshDisconnected;

  /// No description provided for @remoteErrSshUnresponsive.
  ///
  /// In zh, this message translates to:
  /// **'SSH 连接没有响应'**
  String get remoteErrSshUnresponsive;

  /// No description provided for @remoteRetryCount.
  ///
  /// In zh, this message translates to:
  /// **'已重试 {count} 次'**
  String remoteRetryCount(int count);

  /// No description provided for @remoteErrSshNetworkChanged.
  ///
  /// In zh, this message translates to:
  /// **'网络变化后 SSH 连接已断开'**
  String get remoteErrSshNetworkChanged;

  /// No description provided for @remoteErrReadFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'没能读到主机指纹'**
  String get remoteErrReadFingerprint;

  /// No description provided for @remoteErrNoFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'服务器没有提供主机指纹'**
  String get remoteErrNoFingerprint;

  /// No description provided for @remoteErrPasswordMissing.
  ///
  /// In zh, this message translates to:
  /// **'还没有填写密码'**
  String get remoteErrPasswordMissing;

  /// No description provided for @remoteErrAddressUnresponsive.
  ///
  /// In zh, this message translates to:
  /// **'{host}:{port} 没有响应'**
  String remoteErrAddressUnresponsive(String host, int port);

  /// No description provided for @remoteErrPrivateKeyMissing.
  ///
  /// In zh, this message translates to:
  /// **'还没有填写私钥'**
  String get remoteErrPrivateKeyMissing;

  /// No description provided for @remoteErrKeyNeedsPassword.
  ///
  /// In zh, this message translates to:
  /// **'这把私钥需要密码'**
  String get remoteErrKeyNeedsPassword;

  /// No description provided for @remoteErrKeyPassword.
  ///
  /// In zh, this message translates to:
  /// **'私钥密码不对'**
  String get remoteErrKeyPassword;

  /// No description provided for @remoteErrKeyUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'私钥无法读取'**
  String get remoteErrKeyUnreadable;

  /// No description provided for @remotePrivateKeyFormats.
  ///
  /// In zh, this message translates to:
  /// **'支持 OpenSSH 与 PEM 格式的 Ed25519、RSA、ECDSA 私钥。\n{error}'**
  String remotePrivateKeyFormats(String error);

  /// No description provided for @remoteErrAddressRejected.
  ///
  /// In zh, this message translates to:
  /// **'{address} 拒绝了连接'**
  String remoteErrAddressRejected(String address);

  /// No description provided for @remoteErrSshHostNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到主机 {host}'**
  String remoteErrSshHostNotFound(String host);

  /// No description provided for @remoteErrSshAddressUnresponsive.
  ///
  /// In zh, this message translates to:
  /// **'{address} 没有响应'**
  String remoteErrSshAddressUnresponsive(String address);

  /// No description provided for @remoteErrUsernamePassword.
  ///
  /// In zh, this message translates to:
  /// **'用户名或密码不对'**
  String get remoteErrUsernamePassword;

  /// No description provided for @remoteErrPrivateKeyRejected.
  ///
  /// In zh, this message translates to:
  /// **'服务器不接受这把私钥'**
  String get remoteErrPrivateKeyRejected;

  /// No description provided for @remoteAuthorizedKeysHelp.
  ///
  /// In zh, this message translates to:
  /// **'确认公钥已加入 {username} 的 ~/.ssh/authorized_keys。\n{error}'**
  String remoteAuthorizedKeysHelp(String username, String error);

  /// No description provided for @remoteErrFingerprintUntrusted.
  ///
  /// In zh, this message translates to:
  /// **'主机指纹未被信任'**
  String get remoteErrFingerprintUntrusted;

  /// No description provided for @remoteErrSshHandshakeTimeout.
  ///
  /// In zh, this message translates to:
  /// **'SSH 握手超时'**
  String get remoteErrSshHandshakeTimeout;

  /// No description provided for @remoteErrSshInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'SSH 连接已中断'**
  String get remoteErrSshInterrupted;

  /// No description provided for @remoteErrSshConnection.
  ///
  /// In zh, this message translates to:
  /// **'SSH 连接失败'**
  String get remoteErrSshConnection;

  /// No description provided for @remoteErrCommandTimeout.
  ///
  /// In zh, this message translates to:
  /// **'远端命令超时'**
  String get remoteErrCommandTimeout;

  /// No description provided for @remoteHostedErrNetwork.
  ///
  /// In zh, this message translates to:
  /// **'没能连上分享服务，检查网络后重试'**
  String get remoteHostedErrNetwork;

  /// No description provided for @remoteHostedErrTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'对话太大，生成不了链接'**
  String get remoteHostedErrTooLarge;

  /// No description provided for @remoteHostedErrRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'分享太频繁，稍后再试'**
  String get remoteHostedErrRateLimited;

  /// No description provided for @remoteHostedErrCreate.
  ///
  /// In zh, this message translates to:
  /// **'没能生成链接'**
  String get remoteHostedErrCreate;

  /// No description provided for @remoteHostedErrUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'分享服务暂时不可用，稍后再试'**
  String get remoteHostedErrUnavailable;

  /// No description provided for @remoteHostedErrGone.
  ///
  /// In zh, this message translates to:
  /// **'链接已过期或被删除'**
  String get remoteHostedErrGone;

  /// No description provided for @remoteHostedErrForbidden.
  ///
  /// In zh, this message translates to:
  /// **'没有权限删除这个链接'**
  String get remoteHostedErrForbidden;

  /// No description provided for @remoteHostedErrBroken.
  ///
  /// In zh, this message translates to:
  /// **'链接不完整或已损坏'**
  String get remoteHostedErrBroken;

  /// No description provided for @remoteChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get remoteChat;

  /// No description provided for @remoteHostedTtlWeek.
  ///
  /// In zh, this message translates to:
  /// **'7 天'**
  String get remoteHostedTtlWeek;

  /// No description provided for @remoteHostedTtlMonth.
  ///
  /// In zh, this message translates to:
  /// **'30 天'**
  String get remoteHostedTtlMonth;

  /// No description provided for @remoteHostedTtlForever.
  ///
  /// In zh, this message translates to:
  /// **'永久'**
  String get remoteHostedTtlForever;

  /// No description provided for @remoteForumSignIn.
  ///
  /// In zh, this message translates to:
  /// **'登录论坛'**
  String get remoteForumSignIn;

  /// No description provided for @remoteForumSignInBenefits.
  ///
  /// In zh, this message translates to:
  /// **'发帖、回复、点赞'**
  String get remoteForumSignInBenefits;

  /// No description provided for @remoteForumFinishSignIn.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器里完成登录'**
  String get remoteForumFinishSignIn;

  /// No description provided for @remoteReopenBrowser.
  ///
  /// In zh, this message translates to:
  /// **'重新打开浏览器'**
  String get remoteReopenBrowser;

  /// No description provided for @remoteForumSettings.
  ///
  /// In zh, this message translates to:
  /// **'论坛设置'**
  String get remoteForumSettings;

  /// No description provided for @remoteForumAccount.
  ///
  /// In zh, this message translates to:
  /// **'论坛账号'**
  String get remoteForumAccount;

  /// No description provided for @remoteForumTopic.
  ///
  /// In zh, this message translates to:
  /// **'话题'**
  String get remoteForumTopic;

  /// No description provided for @remoteForumLikesReceived.
  ///
  /// In zh, this message translates to:
  /// **'获赞'**
  String get remoteForumLikesReceived;

  /// No description provided for @remoteForumDaysVisited.
  ///
  /// In zh, this message translates to:
  /// **'访问天数'**
  String get remoteForumDaysVisited;

  /// No description provided for @remoteForumNotifications.
  ///
  /// In zh, this message translates to:
  /// **'通知'**
  String get remoteForumNotifications;

  /// No description provided for @remoteForumUnreadCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条未读'**
  String remoteForumUnreadCount(int count);

  /// No description provided for @remoteForumErrAddress.
  ///
  /// In zh, this message translates to:
  /// **'地址不对'**
  String get remoteForumErrAddress;

  /// No description provided for @remoteForumAddress.
  ///
  /// In zh, this message translates to:
  /// **'论坛地址'**
  String get remoteForumAddress;

  /// No description provided for @remoteForumDefaultAddress.
  ///
  /// In zh, this message translates to:
  /// **'默认：{host}'**
  String remoteForumDefaultAddress(String host);

  /// No description provided for @remoteRestoreDefault.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认'**
  String get remoteRestoreDefault;

  /// No description provided for @remoteForumUploadingImage.
  ///
  /// In zh, this message translates to:
  /// **'正在上传图片…'**
  String get remoteForumUploadingImage;

  /// No description provided for @remoteForumErrUploadImage.
  ///
  /// In zh, this message translates to:
  /// **'图片没传上去'**
  String get remoteForumErrUploadImage;

  /// No description provided for @remoteForumTitleRequired.
  ///
  /// In zh, this message translates to:
  /// **'先写标题'**
  String get remoteForumTitleRequired;

  /// No description provided for @remoteForumCategoryRequired.
  ///
  /// In zh, this message translates to:
  /// **'选一个分类'**
  String get remoteForumCategoryRequired;

  /// No description provided for @remoteForumBodyRequired.
  ///
  /// In zh, this message translates to:
  /// **'写点内容再发'**
  String get remoteForumBodyRequired;

  /// No description provided for @remoteForumReplyCaption.
  ///
  /// In zh, this message translates to:
  /// **'回复 @{username} · {title}'**
  String remoteForumReplyCaption(String username, String title);

  /// No description provided for @remoteForumNewTopic.
  ///
  /// In zh, this message translates to:
  /// **'新话题'**
  String get remoteForumNewTopic;

  /// No description provided for @remoteForumTitle.
  ///
  /// In zh, this message translates to:
  /// **'标题'**
  String get remoteForumTitle;

  /// No description provided for @remoteForumComposerHint.
  ///
  /// In zh, this message translates to:
  /// **'写点什么，支持 Markdown'**
  String get remoteForumComposerHint;

  /// No description provided for @remoteForumPublish.
  ///
  /// In zh, this message translates to:
  /// **'发布'**
  String get remoteForumPublish;

  /// No description provided for @remoteForumImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get remoteForumImage;

  /// No description provided for @remoteForumAttachShareCode.
  ///
  /// In zh, this message translates to:
  /// **'附上分享码'**
  String get remoteForumAttachShareCode;

  /// No description provided for @remoteForumPendingApproval.
  ///
  /// In zh, this message translates to:
  /// **'已提交，审核后可见'**
  String get remoteForumPendingApproval;

  /// No description provided for @remoteForumLatest.
  ///
  /// In zh, this message translates to:
  /// **'最新'**
  String get remoteForumLatest;

  /// No description provided for @remoteForumTop.
  ///
  /// In zh, this message translates to:
  /// **'热门'**
  String get remoteForumTop;

  /// No description provided for @remoteForumErrOpen.
  ///
  /// In zh, this message translates to:
  /// **'没能打开论坛'**
  String get remoteForumErrOpen;

  /// No description provided for @remoteForumNoTopics.
  ///
  /// In zh, this message translates to:
  /// **'还没有话题'**
  String get remoteForumNoTopics;

  /// No description provided for @remoteForumPost.
  ///
  /// In zh, this message translates to:
  /// **'发帖'**
  String get remoteForumPost;

  /// No description provided for @remoteForum.
  ///
  /// In zh, this message translates to:
  /// **'论坛'**
  String get remoteForum;

  /// No description provided for @remoteForumNotificationsUnread.
  ///
  /// In zh, this message translates to:
  /// **'通知，{count} 条未读'**
  String remoteForumNotificationsUnread(int count);

  /// No description provided for @remoteForumSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索'**
  String get remoteForumSearch;

  /// No description provided for @remoteForumSearchHint.
  ///
  /// In zh, this message translates to:
  /// **'搜索话题和帖子'**
  String get remoteForumSearchHint;

  /// No description provided for @remoteForumSignedIn.
  ///
  /// In zh, this message translates to:
  /// **'已登录论坛'**
  String get remoteForumSignedIn;

  /// No description provided for @remoteForumSignInForNotifications.
  ///
  /// In zh, this message translates to:
  /// **'登录后查看通知'**
  String get remoteForumSignInForNotifications;

  /// No description provided for @remoteForumErrNotifications.
  ///
  /// In zh, this message translates to:
  /// **'没能读取通知'**
  String get remoteForumErrNotifications;

  /// No description provided for @remoteForumNoNotifications.
  ///
  /// In zh, this message translates to:
  /// **'还没有通知'**
  String get remoteForumNoNotifications;

  /// No description provided for @remoteForumMarkAllRead.
  ///
  /// In zh, this message translates to:
  /// **'全部已读'**
  String get remoteForumMarkAllRead;

  /// No description provided for @remoteForumSomeone.
  ///
  /// In zh, this message translates to:
  /// **'有人'**
  String get remoteForumSomeone;

  /// No description provided for @remoteForumNotificationMention.
  ///
  /// In zh, this message translates to:
  /// **'{who} 提到了你'**
  String remoteForumNotificationMention(String who);

  /// No description provided for @remoteForumNotificationGroupMention.
  ///
  /// In zh, this message translates to:
  /// **'{who} 提到了你所在的群组'**
  String remoteForumNotificationGroupMention(String who);

  /// No description provided for @remoteForumNotificationReply.
  ///
  /// In zh, this message translates to:
  /// **'{who} 回复了你'**
  String remoteForumNotificationReply(String who);

  /// No description provided for @remoteForumNotificationQuote.
  ///
  /// In zh, this message translates to:
  /// **'{who} 引用了你'**
  String remoteForumNotificationQuote(String who);

  /// No description provided for @remoteForumNotificationEdit.
  ///
  /// In zh, this message translates to:
  /// **'{who} 编辑了你的帖子'**
  String remoteForumNotificationEdit(String who);

  /// No description provided for @remoteForumNotificationLikes.
  ///
  /// In zh, this message translates to:
  /// **'{who} 等 {count} 人赞了你'**
  String remoteForumNotificationLikes(String who, int count);

  /// No description provided for @remoteForumNotificationLike.
  ///
  /// In zh, this message translates to:
  /// **'{who} 赞了你'**
  String remoteForumNotificationLike(String who);

  /// No description provided for @remoteForumNotificationLikedPosts.
  ///
  /// In zh, this message translates to:
  /// **'{who} 赞了你的 {count} 个帖子'**
  String remoteForumNotificationLikedPosts(String who, int count);

  /// No description provided for @remoteForumNotificationReaction.
  ///
  /// In zh, this message translates to:
  /// **'{who} 回应了你'**
  String remoteForumNotificationReaction(String who);

  /// No description provided for @remoteForumNotificationMessage.
  ///
  /// In zh, this message translates to:
  /// **'{who} 发来私信'**
  String remoteForumNotificationMessage(String who);

  /// No description provided for @remoteForumNotificationMessageInvite.
  ///
  /// In zh, this message translates to:
  /// **'{who} 邀请你加入私信'**
  String remoteForumNotificationMessageInvite(String who);

  /// No description provided for @remoteForumNotificationTopicInvite.
  ///
  /// In zh, this message translates to:
  /// **'{who} 邀请你参与话题'**
  String remoteForumNotificationTopicInvite(String who);

  /// No description provided for @remoteForumNotificationNewReply.
  ///
  /// In zh, this message translates to:
  /// **'{who} 发了新回复'**
  String remoteForumNotificationNewReply(String who);

  /// No description provided for @remoteForumNotificationNewTopic.
  ///
  /// In zh, this message translates to:
  /// **'{who} 发了新话题'**
  String remoteForumNotificationNewTopic(String who);

  /// No description provided for @remoteForumNotificationLink.
  ///
  /// In zh, this message translates to:
  /// **'{who} 链接了你的帖子'**
  String remoteForumNotificationLink(String who);

  /// No description provided for @remoteForumNotificationBadge.
  ///
  /// In zh, this message translates to:
  /// **'获得徽章「{badge}」'**
  String remoteForumNotificationBadge(String badge);

  /// No description provided for @remoteForumNotificationMoved.
  ///
  /// In zh, this message translates to:
  /// **'{who} 移动了你的帖子'**
  String remoteForumNotificationMoved(String who);

  /// No description provided for @remoteForumBookmarkReminder.
  ///
  /// In zh, this message translates to:
  /// **'书签提醒'**
  String get remoteForumBookmarkReminder;

  /// No description provided for @remoteForumTopicReminder.
  ///
  /// In zh, this message translates to:
  /// **'话题提醒'**
  String get remoteForumTopicReminder;

  /// No description provided for @remoteForumPostApproved.
  ///
  /// In zh, this message translates to:
  /// **'你的帖子已通过审核'**
  String get remoteForumPostApproved;

  /// No description provided for @remoteForumAdminProblems.
  ///
  /// In zh, this message translates to:
  /// **'论坛有待处理的问题'**
  String get remoteForumAdminProblems;

  /// No description provided for @remoteForumNewNotification.
  ///
  /// In zh, this message translates to:
  /// **'新通知'**
  String get remoteForumNewNotification;

  /// No description provided for @remoteForumUnread.
  ///
  /// In zh, this message translates to:
  /// **'未读'**
  String get remoteForumUnread;

  /// No description provided for @remoteForumErrShareCode.
  ///
  /// In zh, this message translates to:
  /// **'没能打开分享码'**
  String get remoteForumErrShareCode;

  /// No description provided for @remoteForumPoll.
  ///
  /// In zh, this message translates to:
  /// **'投票'**
  String get remoteForumPoll;

  /// No description provided for @remoteForumVideo.
  ///
  /// In zh, this message translates to:
  /// **'视频'**
  String get remoteForumVideo;

  /// No description provided for @remoteForumEmbed.
  ///
  /// In zh, this message translates to:
  /// **'嵌入内容'**
  String get remoteForumEmbed;

  /// No description provided for @remoteForumVoteOnWeb.
  ///
  /// In zh, this message translates to:
  /// **'去网页版投票'**
  String get remoteForumVoteOnWeb;

  /// No description provided for @remoteForumErrSearch.
  ///
  /// In zh, this message translates to:
  /// **'没能搜索'**
  String get remoteForumErrSearch;

  /// No description provided for @remoteForumNoSearchResults.
  ///
  /// In zh, this message translates to:
  /// **'没有找到「{term}」'**
  String remoteForumNoSearchResults(String term);

  /// No description provided for @remoteForumBookmarkRemoved.
  ///
  /// In zh, this message translates to:
  /// **'已取消书签'**
  String get remoteForumBookmarkRemoved;

  /// No description provided for @remoteForumBookmarkAdded.
  ///
  /// In zh, this message translates to:
  /// **'已加入书签'**
  String get remoteForumBookmarkAdded;

  /// No description provided for @remoteLinkCopied.
  ///
  /// In zh, this message translates to:
  /// **'已复制链接'**
  String get remoteLinkCopied;

  /// No description provided for @remoteForumErrTopic.
  ///
  /// In zh, this message translates to:
  /// **'没能打开这个话题'**
  String get remoteForumErrTopic;

  /// No description provided for @remoteForumTopicClosed.
  ///
  /// In zh, this message translates to:
  /// **'话题已关闭'**
  String get remoteForumTopicClosed;

  /// No description provided for @remoteForumReplyHint.
  ///
  /// In zh, this message translates to:
  /// **'写回复…'**
  String get remoteForumReplyHint;

  /// No description provided for @remoteForumSignInToReply.
  ///
  /// In zh, this message translates to:
  /// **'登录后回复'**
  String get remoteForumSignInToReply;

  /// No description provided for @remoteForumReplyTo.
  ///
  /// In zh, this message translates to:
  /// **'回复 @{username}'**
  String remoteForumReplyTo(String username);

  /// No description provided for @remoteForumPostDeleted.
  ///
  /// In zh, this message translates to:
  /// **'帖子已删除'**
  String get remoteForumPostDeleted;

  /// No description provided for @remoteForumPostHidden.
  ///
  /// In zh, this message translates to:
  /// **'帖子已被隐藏'**
  String get remoteForumPostHidden;

  /// No description provided for @remoteForumUnlike.
  ///
  /// In zh, this message translates to:
  /// **'取消点赞'**
  String get remoteForumUnlike;

  /// No description provided for @remoteForumLike.
  ///
  /// In zh, this message translates to:
  /// **'点赞'**
  String get remoteForumLike;

  /// No description provided for @remoteForumRemoveBookmark.
  ///
  /// In zh, this message translates to:
  /// **'取消书签'**
  String get remoteForumRemoveBookmark;

  /// No description provided for @remoteForumBookmark.
  ///
  /// In zh, this message translates to:
  /// **'书签'**
  String get remoteForumBookmark;

  /// No description provided for @remoteForumActionPinned.
  ///
  /// In zh, this message translates to:
  /// **'置顶了话题'**
  String get remoteForumActionPinned;

  /// No description provided for @remoteForumActionUnpinned.
  ///
  /// In zh, this message translates to:
  /// **'取消了置顶'**
  String get remoteForumActionUnpinned;

  /// No description provided for @remoteForumActionClosed.
  ///
  /// In zh, this message translates to:
  /// **'关闭了话题'**
  String get remoteForumActionClosed;

  /// No description provided for @remoteForumActionReopened.
  ///
  /// In zh, this message translates to:
  /// **'重新开放了话题'**
  String get remoteForumActionReopened;

  /// No description provided for @remoteForumActionAutoClosed.
  ///
  /// In zh, this message translates to:
  /// **'话题已自动关闭'**
  String get remoteForumActionAutoClosed;

  /// No description provided for @remoteForumActionAutoOpened.
  ///
  /// In zh, this message translates to:
  /// **'话题已自动开放'**
  String get remoteForumActionAutoOpened;

  /// No description provided for @remoteForumActionArchived.
  ///
  /// In zh, this message translates to:
  /// **'归档了话题'**
  String get remoteForumActionArchived;

  /// No description provided for @remoteForumActionUnarchived.
  ///
  /// In zh, this message translates to:
  /// **'取消了归档'**
  String get remoteForumActionUnarchived;

  /// No description provided for @remoteForumActionListed.
  ///
  /// In zh, this message translates to:
  /// **'公开了话题'**
  String get remoteForumActionListed;

  /// No description provided for @remoteForumActionUnlisted.
  ///
  /// In zh, this message translates to:
  /// **'隐藏了话题'**
  String get remoteForumActionUnlisted;

  /// No description provided for @remoteForumActionSplit.
  ///
  /// In zh, this message translates to:
  /// **'拆分了话题'**
  String get remoteForumActionSplit;

  /// No description provided for @remoteForumActionBanner.
  ///
  /// In zh, this message translates to:
  /// **'设为横幅'**
  String get remoteForumActionBanner;

  /// No description provided for @remoteForumActionRemoveBanner.
  ///
  /// In zh, this message translates to:
  /// **'取消了横幅'**
  String get remoteForumActionRemoveBanner;

  /// No description provided for @remoteForumActionUpdated.
  ///
  /// In zh, this message translates to:
  /// **'更新了话题'**
  String get remoteForumActionUpdated;

  /// No description provided for @remoteLoading.
  ///
  /// In zh, this message translates to:
  /// **'正在加载'**
  String get remoteLoading;

  /// No description provided for @remoteForumJustNow.
  ///
  /// In zh, this message translates to:
  /// **'刚刚'**
  String get remoteForumJustNow;

  /// No description provided for @remoteForumMinutesAgo.
  ///
  /// In zh, this message translates to:
  /// **'{count} 分钟前'**
  String remoteForumMinutesAgo(int count);

  /// No description provided for @remoteForumHoursAgo.
  ///
  /// In zh, this message translates to:
  /// **'{count} 小时前'**
  String remoteForumHoursAgo(int count);

  /// No description provided for @remoteForumDaysAgo.
  ///
  /// In zh, this message translates to:
  /// **'{count} 天前'**
  String remoteForumDaysAgo(int count);

  /// No description provided for @remoteForumReplyCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 回复'**
  String remoteForumReplyCount(int count);

  /// No description provided for @remoteForumNewReplyCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条新回复'**
  String remoteForumNewReplyCount(int count);

  /// No description provided for @remoteForumNew.
  ///
  /// In zh, this message translates to:
  /// **'新'**
  String get remoteForumNew;

  /// No description provided for @remoteForumErrorRetry.
  ///
  /// In zh, this message translates to:
  /// **'{error} · 重试'**
  String remoteForumErrorRetry(String error);

  /// No description provided for @remoteForumNoMore.
  ///
  /// In zh, this message translates to:
  /// **'没有更多了'**
  String get remoteForumNoMore;

  /// No description provided for @remoteHostKeyTrustTitle.
  ///
  /// In zh, this message translates to:
  /// **'信任这台主机？'**
  String get remoteHostKeyTrustTitle;

  /// No description provided for @remoteHostKeyFirstConnection.
  ///
  /// In zh, this message translates to:
  /// **'首次连接「{name}」（{address}）。核对指纹，确认是你自己的主机。'**
  String remoteHostKeyFirstConnection(String name, String address);

  /// No description provided for @remoteHostKeyTrustConnect.
  ///
  /// In zh, this message translates to:
  /// **'信任并连接'**
  String get remoteHostKeyTrustConnect;

  /// No description provided for @remoteHostKeyChangedTitle.
  ///
  /// In zh, this message translates to:
  /// **'身份指纹变了'**
  String get remoteHostKeyChangedTitle;

  /// No description provided for @remoteRelayKeyChangedBody.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」的身份密钥和上次不一样。只在确认这台主机重装过远程插件时继续，否则可能有人冒充它。'**
  String remoteRelayKeyChangedBody(String name);

  /// No description provided for @remoteRelayKeyFirstBody.
  ///
  /// In zh, this message translates to:
  /// **'首次连接「{name}」。核对身份指纹，与主机上远程插件显示的一致再继续。'**
  String remoteRelayKeyFirstBody(String name);

  /// No description provided for @remoteHostKeyChangeWarning.
  ///
  /// In zh, this message translates to:
  /// **'之后指纹一旦变化，App 会拒绝连接。'**
  String get remoteHostKeyChangeWarning;

  /// No description provided for @remoteHostKeyTrustAgain.
  ///
  /// In zh, this message translates to:
  /// **'重新信任'**
  String get remoteHostKeyTrustAgain;

  /// No description provided for @remoteHostKeyReading.
  ///
  /// In zh, this message translates to:
  /// **'正在读取主机指纹…'**
  String get remoteHostKeyReading;

  /// No description provided for @remoteHostSwitcherSemantics.
  ///
  /// In zh, this message translates to:
  /// **'当前主机：{name}，{status}。切换主机'**
  String remoteHostSwitcherSemantics(String name, String status);

  /// No description provided for @remoteSwitchHost.
  ///
  /// In zh, this message translates to:
  /// **'切换主机'**
  String get remoteSwitchHost;

  /// No description provided for @remoteThisPhoneDsh.
  ///
  /// In zh, this message translates to:
  /// **'这台手机上的 DSH'**
  String get remoteThisPhoneDsh;

  /// No description provided for @remoteRemoteLabel.
  ///
  /// In zh, this message translates to:
  /// **'远程'**
  String get remoteRemoteLabel;

  /// No description provided for @remoteRemotePlatform.
  ///
  /// In zh, this message translates to:
  /// **'远程 · {platform}'**
  String remoteRemotePlatform(String platform);

  /// No description provided for @remoteRelaySwitchWarning.
  ///
  /// In zh, this message translates to:
  /// **'DSH Remote 一次只连一台主机，切换会断开上一台'**
  String get remoteRelaySwitchWarning;

  /// No description provided for @remoteConnectComputer.
  ///
  /// In zh, this message translates to:
  /// **'连接电脑或服务器'**
  String get remoteConnectComputer;

  /// No description provided for @remoteManageHosts.
  ///
  /// In zh, this message translates to:
  /// **'管理远程主机'**
  String get remoteManageHosts;

  /// No description provided for @remoteConnectionMethods.
  ///
  /// In zh, this message translates to:
  /// **'通过 SSH 或 DSH Remote'**
  String get remoteConnectionMethods;

  /// No description provided for @remoteRelayLoginRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写服务器地址、邮箱和密码'**
  String get remoteRelayLoginRequired;

  /// No description provided for @remoteErrSignIn.
  ///
  /// In zh, this message translates to:
  /// **'没能登录'**
  String get remoteErrSignIn;

  /// No description provided for @remoteSelfHostedServer.
  ///
  /// In zh, this message translates to:
  /// **'自建服务器'**
  String get remoteSelfHostedServer;

  /// No description provided for @remoteSelfHostedSignInHelp.
  ///
  /// In zh, this message translates to:
  /// **'用邮箱和密码登录自己部署的 liguobao/ds-harness-remote'**
  String get remoteSelfHostedSignInHelp;

  /// No description provided for @remoteServerAddress.
  ///
  /// In zh, this message translates to:
  /// **'服务器地址'**
  String get remoteServerAddress;

  /// No description provided for @remoteEmail.
  ///
  /// In zh, this message translates to:
  /// **'邮箱'**
  String get remoteEmail;

  /// No description provided for @remotePassword.
  ///
  /// In zh, this message translates to:
  /// **'密码'**
  String get remotePassword;

  /// No description provided for @remoteRestoreServer.
  ///
  /// In zh, this message translates to:
  /// **'改回默认服务器 dsh.r2049.cn'**
  String get remoteRestoreServer;

  /// No description provided for @remoteConsole.
  ///
  /// In zh, this message translates to:
  /// **'远程控制台'**
  String get remoteConsole;

  /// No description provided for @remoteHostsIntro.
  ///
  /// In zh, this message translates to:
  /// **'在手机上接着用电脑或服务器上的 DSH'**
  String get remoteHostsIntro;

  /// No description provided for @remoteSshHosts.
  ///
  /// In zh, this message translates to:
  /// **'SSH 主机'**
  String get remoteSshHosts;

  /// No description provided for @remoteSshRequirements.
  ///
  /// In zh, this message translates to:
  /// **'需要那台主机开着 SSH，并装好 DSH'**
  String get remoteSshRequirements;

  /// No description provided for @remoteAddSshHost.
  ///
  /// In zh, this message translates to:
  /// **'添加 SSH 主机'**
  String get remoteAddSshHost;

  /// No description provided for @remoteSshDirect.
  ///
  /// In zh, this message translates to:
  /// **'不经过第三方服务器'**
  String get remoteSshDirect;

  /// No description provided for @remoteOtherMethods.
  ///
  /// In zh, this message translates to:
  /// **'其他方式'**
  String get remoteOtherMethods;

  /// No description provided for @remoteWebConsole.
  ///
  /// In zh, this message translates to:
  /// **'网页版远程控制台'**
  String get remoteWebConsole;

  /// No description provided for @remoteWebConsoleProvider.
  ///
  /// In zh, this message translates to:
  /// **'dsh.r2049.cn · 第三方页面'**
  String get remoteWebConsoleProvider;

  /// No description provided for @remoteActiveHost.
  ///
  /// In zh, this message translates to:
  /// **'正在使用「{name}」'**
  String remoteActiveHost(String name);

  /// No description provided for @remoteSwitchToPhone.
  ///
  /// In zh, this message translates to:
  /// **'切回本机'**
  String get remoteSwitchToPhone;

  /// No description provided for @remoteSignInAgain.
  ///
  /// In zh, this message translates to:
  /// **'重新登录'**
  String get remoteSignInAgain;

  /// No description provided for @remoteHostSettings.
  ///
  /// In zh, this message translates to:
  /// **'主机设置'**
  String get remoteHostSettings;

  /// No description provided for @remoteReconnect.
  ///
  /// In zh, this message translates to:
  /// **'重新连接'**
  String get remoteReconnect;

  /// No description provided for @remoteReconnectingEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'重新连接中…'**
  String get remoteReconnectingEllipsis;

  /// No description provided for @remoteReconnectReason.
  ///
  /// In zh, this message translates to:
  /// **'重新连接中 · {reason}'**
  String remoteReconnectReason(String reason);

  /// No description provided for @remoteConnectedEncrypted.
  ///
  /// In zh, this message translates to:
  /// **'已连接 · 端到端加密'**
  String get remoteConnectedEncrypted;

  /// No description provided for @remoteConnectedVia.
  ///
  /// In zh, this message translates to:
  /// **'已连接 · {path} · 端到端加密'**
  String remoteConnectedVia(String path);

  /// No description provided for @remotePathDirect.
  ///
  /// In zh, this message translates to:
  /// **'直连'**
  String get remotePathDirect;

  /// No description provided for @remotePathTurn.
  ///
  /// In zh, this message translates to:
  /// **'TURN'**
  String get remotePathTurn;

  /// No description provided for @remotePathRelay.
  ///
  /// In zh, this message translates to:
  /// **'Relay 中继'**
  String get remotePathRelay;

  /// No description provided for @remoteConnectedSsh.
  ///
  /// In zh, this message translates to:
  /// **'已连接 · SSH {address}'**
  String remoteConnectedSsh(String address);

  /// No description provided for @remoteErrRefreshHosts.
  ///
  /// In zh, this message translates to:
  /// **'没能刷新主机列表'**
  String get remoteErrRefreshHosts;

  /// No description provided for @remoteSwitchWarning.
  ///
  /// In zh, this message translates to:
  /// **'一次只连一台主机，切换会断开上一台'**
  String get remoteSwitchWarning;

  /// No description provided for @remoteRefreshHosts.
  ///
  /// In zh, this message translates to:
  /// **'刷新主机列表'**
  String get remoteRefreshHosts;

  /// No description provided for @remoteSignOut.
  ///
  /// In zh, this message translates to:
  /// **'退出'**
  String get remoteSignOut;

  /// No description provided for @remoteErrHostsRetry.
  ///
  /// In zh, this message translates to:
  /// **'没能获取主机列表 · 轻点重试'**
  String get remoteErrHostsRetry;

  /// No description provided for @remoteNoHosts.
  ///
  /// In zh, this message translates to:
  /// **'还没有主机'**
  String get remoteNoHosts;

  /// No description provided for @remoteRelaySetupHelp.
  ///
  /// In zh, this message translates to:
  /// **'在主机的 DSH 里装好远程插件并登录'**
  String get remoteRelaySetupHelp;

  /// No description provided for @remoteRelaySignOutTitle.
  ///
  /// In zh, this message translates to:
  /// **'退出 DSH Remote？'**
  String get remoteRelaySignOutTitle;

  /// No description provided for @remoteRelaySignOutBody.
  ///
  /// In zh, this message translates to:
  /// **'这台手机会从账号中移除。主机上的 DSH 和对话不受影响，随时可以重新登录。'**
  String get remoteRelaySignOutBody;

  /// No description provided for @remoteRelaySignInTitle.
  ///
  /// In zh, this message translates to:
  /// **'登录 DSH Remote'**
  String get remoteRelaySignInTitle;

  /// No description provided for @remoteRelaySignInHelp.
  ///
  /// In zh, this message translates to:
  /// **'无需配置网络，连接端到端加密'**
  String get remoteRelaySignInHelp;

  /// No description provided for @remoteBrowserSignIn.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器中登录'**
  String get remoteBrowserSignIn;

  /// No description provided for @remoteSignInWithProvider.
  ///
  /// In zh, this message translates to:
  /// **'使用 {provider} 登录'**
  String remoteSignInWithProvider(String provider);

  /// No description provided for @remoteComingSoon.
  ///
  /// In zh, this message translates to:
  /// **'即将接入'**
  String get remoteComingSoon;

  /// No description provided for @remoteSelfHostedEmailSignIn.
  ///
  /// In zh, this message translates to:
  /// **'自建服务器 · 邮箱登录'**
  String get remoteSelfHostedEmailSignIn;

  /// No description provided for @remoteBrowserSignInPending.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器里完成登录…'**
  String get remoteBrowserSignInPending;

  /// No description provided for @remoteCopySignInLink.
  ///
  /// In zh, this message translates to:
  /// **'复制登录链接'**
  String get remoteCopySignInLink;

  /// No description provided for @remoteSshAddressRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写主机地址（IP 或域名）'**
  String get remoteSshAddressRequired;

  /// No description provided for @remoteSshUsernameRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写登录用户名'**
  String get remoteSshUsernameRequired;

  /// No description provided for @remoteSshPasswordRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写 SSH 密码，或改用私钥'**
  String get remoteSshPasswordRequired;

  /// No description provided for @remoteSshKeyRequired.
  ///
  /// In zh, this message translates to:
  /// **'粘贴私钥（以 -----BEGIN 开头的整段文本）'**
  String get remoteSshKeyRequired;

  /// No description provided for @remoteHostKeyResetTitle.
  ///
  /// In zh, this message translates to:
  /// **'重置主机指纹？'**
  String get remoteHostKeyResetTitle;

  /// No description provided for @remoteHostKeyResetBody.
  ///
  /// In zh, this message translates to:
  /// **'只在确认这台主机重装或更换过时才这么做。下次连接会重新请你核对指纹。'**
  String get remoteHostKeyResetBody;

  /// No description provided for @remoteReset.
  ///
  /// In zh, this message translates to:
  /// **'重置'**
  String get remoteReset;

  /// No description provided for @remoteDeleteHostTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除「{name}」？'**
  String remoteDeleteHostTitle(String name);

  /// No description provided for @remoteDeleteHostBody.
  ///
  /// In zh, this message translates to:
  /// **'这台主机的设置和保存在手机上的密码、私钥都会删除。主机上的 DSH 和对话不受影响。'**
  String get remoteDeleteHostBody;

  /// No description provided for @remoteErrReadKey.
  ///
  /// In zh, this message translates to:
  /// **'没能读取：{error}'**
  String remoteErrReadKey(String error);

  /// No description provided for @remoteErrPublicKeyFile.
  ///
  /// In zh, this message translates to:
  /// **'这不是私钥文件，请选不带 .pub 的那个（例如 id_ed25519）'**
  String get remoteErrPublicKeyFile;

  /// No description provided for @remotePrivateKeyImported.
  ///
  /// In zh, this message translates to:
  /// **'已导入私钥，原文件可以删掉了'**
  String get remotePrivateKeyImported;

  /// No description provided for @remoteEditHost.
  ///
  /// In zh, this message translates to:
  /// **'编辑主机'**
  String get remoteEditHost;

  /// No description provided for @remoteSshHostIntro.
  ///
  /// In zh, this message translates to:
  /// **'连接你电脑或服务器上的 DSH'**
  String get remoteSshHostIntro;

  /// No description provided for @remoteHostBasicInfo.
  ///
  /// In zh, this message translates to:
  /// **'基本信息'**
  String get remoteHostBasicInfo;

  /// No description provided for @remoteHostNameHint.
  ///
  /// In zh, this message translates to:
  /// **'比如：电脑、家里的 Mac'**
  String get remoteHostNameHint;

  /// No description provided for @remoteHost.
  ///
  /// In zh, this message translates to:
  /// **'主机'**
  String get remoteHost;

  /// No description provided for @remoteHostAddressHint.
  ///
  /// In zh, this message translates to:
  /// **'192.168.1.20 或 example.com'**
  String get remoteHostAddressHint;

  /// No description provided for @remoteUsername.
  ///
  /// In zh, this message translates to:
  /// **'用户名'**
  String get remoteUsername;

  /// No description provided for @remotePort.
  ///
  /// In zh, this message translates to:
  /// **'端口'**
  String get remotePort;

  /// No description provided for @remoteAuthentication.
  ///
  /// In zh, this message translates to:
  /// **'登录方式'**
  String get remoteAuthentication;

  /// No description provided for @remotePasswordStorageHelp.
  ///
  /// In zh, this message translates to:
  /// **'只保存在这台手机上，由 Android Keystore 加密'**
  String get remotePasswordStorageHelp;

  /// No description provided for @remoteKeyStorageHelp.
  ///
  /// In zh, this message translates to:
  /// **'只保存在这台手机上，由 Android Keystore 加密。支持 Ed25519、RSA、ECDSA'**
  String get remoteKeyStorageHelp;

  /// No description provided for @remotePrivateKey.
  ///
  /// In zh, this message translates to:
  /// **'私钥'**
  String get remotePrivateKey;

  /// No description provided for @remoteShow.
  ///
  /// In zh, this message translates to:
  /// **'显示'**
  String get remoteShow;

  /// No description provided for @remoteImportKeyFile.
  ///
  /// In zh, this message translates to:
  /// **'从文件导入'**
  String get remoteImportKeyFile;

  /// No description provided for @remotePrivateKeyPassword.
  ///
  /// In zh, this message translates to:
  /// **'私钥密码（可选）'**
  String get remotePrivateKeyPassword;

  /// No description provided for @remoteStartCommand.
  ///
  /// In zh, this message translates to:
  /// **'启动命令'**
  String get remoteStartCommand;

  /// No description provided for @remoteStartCommandHelp.
  ///
  /// In zh, this message translates to:
  /// **'用 nvm 安装的可以填完整路径'**
  String get remoteStartCommandHelp;

  /// No description provided for @remoteWorkingDirectory.
  ///
  /// In zh, this message translates to:
  /// **'工作目录（可选）'**
  String get remoteWorkingDirectory;

  /// No description provided for @remoteWorkingDirectoryHelp.
  ///
  /// In zh, this message translates to:
  /// **'新对话默认在这里，支持 ~/'**
  String get remoteWorkingDirectoryHelp;

  /// No description provided for @remoteHostFingerprint.
  ///
  /// In zh, this message translates to:
  /// **'主机指纹'**
  String get remoteHostFingerprint;

  /// No description provided for @remoteHostKeyNotConfirmed.
  ///
  /// In zh, this message translates to:
  /// **'还没有确认'**
  String get remoteHostKeyNotConfirmed;

  /// No description provided for @remoteHostKeyFirstCheck.
  ///
  /// In zh, this message translates to:
  /// **'首次连接时会请你核对指纹'**
  String get remoteHostKeyFirstCheck;

  /// No description provided for @remoteDeleteHost.
  ///
  /// In zh, this message translates to:
  /// **'删除这台主机'**
  String get remoteDeleteHost;

  /// No description provided for @remoteTesting.
  ///
  /// In zh, this message translates to:
  /// **'正在测试'**
  String get remoteTesting;

  /// No description provided for @remoteTestConnection.
  ///
  /// In zh, this message translates to:
  /// **'测试连接'**
  String get remoteTestConnection;

  /// No description provided for @remoteHostedUpdateRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要更新 App 才能打开'**
  String get remoteHostedUpdateRequired;

  /// No description provided for @remoteHostedCannotOpen.
  ///
  /// In zh, this message translates to:
  /// **'这个链接无法打开'**
  String get remoteHostedCannotOpen;

  /// No description provided for @remoteOpening.
  ///
  /// In zh, this message translates to:
  /// **'正在打开…'**
  String get remoteOpening;

  /// No description provided for @remoteHostedNeverExpires.
  ///
  /// In zh, this message translates to:
  /// **'永久有效'**
  String get remoteHostedNeverExpires;

  /// No description provided for @remoteHostedExpired.
  ///
  /// In zh, this message translates to:
  /// **'已过期'**
  String get remoteHostedExpired;

  /// No description provided for @remoteHostedExpiresToday.
  ///
  /// In zh, this message translates to:
  /// **'今天到期'**
  String get remoteHostedExpiresToday;

  /// No description provided for @remoteHostedExpiresTomorrow.
  ///
  /// In zh, this message translates to:
  /// **'明天到期'**
  String get remoteHostedExpiresTomorrow;

  /// No description provided for @remoteHostedExpiresOn.
  ///
  /// In zh, this message translates to:
  /// **'{date}到期'**
  String remoteHostedExpiresOn(String date);

  /// No description provided for @remoteHostedDeleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除这个链接？'**
  String get remoteHostedDeleteTitle;

  /// No description provided for @remoteHostedDeleteBody.
  ///
  /// In zh, this message translates to:
  /// **'「{title}」的链接会立即失效'**
  String remoteHostedDeleteBody(String title);

  /// No description provided for @remoteHostedLinkDeleted.
  ///
  /// In zh, this message translates to:
  /// **'已删除链接'**
  String get remoteHostedLinkDeleted;

  /// No description provided for @remoteUndo.
  ///
  /// In zh, this message translates to:
  /// **'撤销'**
  String get remoteUndo;

  /// No description provided for @remoteHostedMyLinks.
  ///
  /// In zh, this message translates to:
  /// **'我的分享链接'**
  String get remoteHostedMyLinks;

  /// No description provided for @remoteHostedNoLinks.
  ///
  /// In zh, this message translates to:
  /// **'还没有分享链接'**
  String get remoteHostedNoLinks;

  /// No description provided for @remoteHostedErrDeleteNetwork.
  ///
  /// In zh, this message translates to:
  /// **'没能删除，检查网络后重试'**
  String get remoteHostedErrDeleteNetwork;

  /// No description provided for @remoteHostedErrDelete.
  ///
  /// In zh, this message translates to:
  /// **'没能删除，稍后再试'**
  String get remoteHostedErrDelete;

  /// No description provided for @remoteDirectoryPickerTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择文件夹'**
  String get remoteDirectoryPickerTitle;

  /// No description provided for @remoteDirectoryChoose.
  ///
  /// In zh, this message translates to:
  /// **'选择'**
  String get remoteDirectoryChoose;

  /// No description provided for @remoteDirectoryDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认工作目录'**
  String get remoteDirectoryDefault;

  /// No description provided for @remoteDirectoryHome.
  ///
  /// In zh, this message translates to:
  /// **'主目录'**
  String get remoteDirectoryHome;

  /// No description provided for @remoteDirectoryPhoneStorage.
  ///
  /// In zh, this message translates to:
  /// **'手机存储'**
  String get remoteDirectoryPhoneStorage;

  /// No description provided for @remoteDirectoryDownloads.
  ///
  /// In zh, this message translates to:
  /// **'下载'**
  String get remoteDirectoryDownloads;

  /// No description provided for @remoteDirectoryDownloadsPath.
  ///
  /// In zh, this message translates to:
  /// **'手机存储/Download'**
  String get remoteDirectoryDownloadsPath;

  /// No description provided for @remoteDirectoryDocuments.
  ///
  /// In zh, this message translates to:
  /// **'文档'**
  String get remoteDirectoryDocuments;

  /// No description provided for @remoteDirectoryDocumentsPath.
  ///
  /// In zh, this message translates to:
  /// **'手机存储/Documents'**
  String get remoteDirectoryDocumentsPath;

  /// No description provided for @remoteDirectoryLocations.
  ///
  /// In zh, this message translates to:
  /// **'位置'**
  String get remoteDirectoryLocations;

  /// No description provided for @remoteDirectoryRecent.
  ///
  /// In zh, this message translates to:
  /// **'最近'**
  String get remoteDirectoryRecent;

  /// No description provided for @remoteDirectoryEnterPath.
  ///
  /// In zh, this message translates to:
  /// **'输入路径'**
  String get remoteDirectoryEnterPath;

  /// No description provided for @remoteDirectoryGo.
  ///
  /// In zh, this message translates to:
  /// **'前往'**
  String get remoteDirectoryGo;

  /// No description provided for @remoteDirectoryAbsolutePath.
  ///
  /// In zh, this message translates to:
  /// **'从「/」开始写完整路径'**
  String get remoteDirectoryAbsolutePath;

  /// No description provided for @remoteDirectoryNewFolder.
  ///
  /// In zh, this message translates to:
  /// **'新建文件夹'**
  String get remoteDirectoryNewFolder;

  /// No description provided for @remoteDirectoryParentCaption.
  ///
  /// In zh, this message translates to:
  /// **'在「{name}」里'**
  String remoteDirectoryParentCaption(String name);

  /// No description provided for @remoteDirectoryFolderName.
  ///
  /// In zh, this message translates to:
  /// **'文件夹名称'**
  String get remoteDirectoryFolderName;

  /// No description provided for @remoteDirectoryRoot.
  ///
  /// In zh, this message translates to:
  /// **'根目录'**
  String get remoteDirectoryRoot;

  /// No description provided for @remoteDirectoryErrCreate.
  ///
  /// In zh, this message translates to:
  /// **'没能新建文件夹'**
  String get remoteDirectoryErrCreate;

  /// No description provided for @remoteDirectoryNoSubfolders.
  ///
  /// In zh, this message translates to:
  /// **'这里没有子文件夹'**
  String get remoteDirectoryNoSubfolders;

  /// No description provided for @remoteDirectoryHideHidden.
  ///
  /// In zh, this message translates to:
  /// **'收起隐藏文件夹'**
  String get remoteDirectoryHideHidden;

  /// No description provided for @remoteDirectoryShowHidden.
  ///
  /// In zh, this message translates to:
  /// **'显示 {count} 个隐藏文件夹'**
  String remoteDirectoryShowHidden(int count);

  /// No description provided for @remoteDirectoryTruncated.
  ///
  /// In zh, this message translates to:
  /// **'文件夹太多，只列出了前面一部分'**
  String get remoteDirectoryTruncated;

  /// No description provided for @remoteWorkspaceAdd.
  ///
  /// In zh, this message translates to:
  /// **'添加工作区'**
  String get remoteWorkspaceAdd;

  /// No description provided for @remoteWorkspaceAdded.
  ///
  /// In zh, this message translates to:
  /// **'已添加「{name}」'**
  String remoteWorkspaceAdded(String name);

  /// No description provided for @remoteWorkspaceErrAdd.
  ///
  /// In zh, this message translates to:
  /// **'没能添加工作区'**
  String get remoteWorkspaceErrAdd;

  /// No description provided for @remoteWorkspaceNoChats.
  ///
  /// In zh, this message translates to:
  /// **'没有对话'**
  String get remoteWorkspaceNoChats;

  /// No description provided for @remoteWorkspaceChatCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个对话'**
  String remoteWorkspaceChatCount(int count);

  /// No description provided for @remoteWorkspaceErrRename.
  ///
  /// In zh, this message translates to:
  /// **'没能重命名'**
  String get remoteWorkspaceErrRename;

  /// No description provided for @remoteWorkspaceRemoved.
  ///
  /// In zh, this message translates to:
  /// **'已移除「{name}」'**
  String remoteWorkspaceRemoved(String name);

  /// No description provided for @remoteWorkspaceErrRemove.
  ///
  /// In zh, this message translates to:
  /// **'没能移除工作区'**
  String get remoteWorkspaceErrRemove;

  /// No description provided for @remoteWorkspaceRename.
  ///
  /// In zh, this message translates to:
  /// **'重命名工作区'**
  String get remoteWorkspaceRename;

  /// No description provided for @remoteWorkspaceName.
  ///
  /// In zh, this message translates to:
  /// **'工作区名称'**
  String get remoteWorkspaceName;

  /// No description provided for @remoteWorkspaceNameRequired.
  ///
  /// In zh, this message translates to:
  /// **'起个名字'**
  String get remoteWorkspaceNameRequired;

  /// No description provided for @remoteWorkspaceRemoveTitle.
  ///
  /// In zh, this message translates to:
  /// **'移除「{name}」？'**
  String remoteWorkspaceRemoveTitle(String name);

  /// No description provided for @remoteWorkspaceRemoveBody.
  ///
  /// In zh, this message translates to:
  /// **'文件夹和对话都会保留'**
  String get remoteWorkspaceRemoveBody;

  /// No description provided for @remoteWorkspaceRemove.
  ///
  /// In zh, this message translates to:
  /// **'移除'**
  String get remoteWorkspaceRemove;

  /// No description provided for @remoteWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'工作区'**
  String get remoteWorkspace;

  /// No description provided for @remoteWorkspaceNewChatHere.
  ///
  /// In zh, this message translates to:
  /// **'在这里新建对话'**
  String get remoteWorkspaceNewChatHere;

  /// No description provided for @remoteWorkspaceUnpin.
  ///
  /// In zh, this message translates to:
  /// **'取消置顶'**
  String get remoteWorkspaceUnpin;

  /// No description provided for @remoteWorkspaceGroup.
  ///
  /// In zh, this message translates to:
  /// **'分组'**
  String get remoteWorkspaceGroup;

  /// No description provided for @remoteWorkspaceUngrouped.
  ///
  /// In zh, this message translates to:
  /// **'未分组'**
  String get remoteWorkspaceUngrouped;

  /// No description provided for @remoteWorkspaceRemoveAction.
  ///
  /// In zh, this message translates to:
  /// **'移除工作区'**
  String get remoteWorkspaceRemoveAction;

  /// No description provided for @remoteWorkspaceNewGroup.
  ///
  /// In zh, this message translates to:
  /// **'新建分组'**
  String get remoteWorkspaceNewGroup;

  /// No description provided for @remoteWorkspaceGroupName.
  ///
  /// In zh, this message translates to:
  /// **'分组名称'**
  String get remoteWorkspaceGroupName;

  /// No description provided for @remoteDirectoryPhonePath.
  ///
  /// In zh, this message translates to:
  /// **'手机存储/{path}'**
  String remoteDirectoryPhonePath(String path);

  /// No description provided for @remoteDirectoryInvalidName.
  ///
  /// In zh, this message translates to:
  /// **'名字里不能有「/」'**
  String get remoteDirectoryInvalidName;

  /// No description provided for @remoteWorkspaceErrNameConflict.
  ///
  /// In zh, this message translates to:
  /// **'已有同名的工作区'**
  String get remoteWorkspaceErrNameConflict;

  /// No description provided for @remoteWorkspaceErrInvalidPath.
  ///
  /// In zh, this message translates to:
  /// **'这个文件夹不能用作工作区'**
  String get remoteWorkspaceErrInvalidPath;

  /// No description provided for @remoteWorkspaceErrNotFound.
  ///
  /// In zh, this message translates to:
  /// **'这个工作区已经不在了'**
  String get remoteWorkspaceErrNotFound;

  /// No description provided for @remoteDirectoryErrUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'打不开这个文件夹'**
  String get remoteDirectoryErrUnreadable;

  /// No description provided for @remoteDirectoryErrExists.
  ///
  /// In zh, this message translates to:
  /// **'已经有同名的文件夹'**
  String get remoteDirectoryErrExists;

  /// No description provided for @remoteDirectoryErrUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这台主机不能在这里浏览文件夹'**
  String get remoteDirectoryErrUnavailable;

  /// No description provided for @remoteWorkspaceErrUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这台主机不支持这个操作'**
  String get remoteWorkspaceErrUnsupported;

  /// No description provided for @remoteWorkspaceAllChats.
  ///
  /// In zh, this message translates to:
  /// **'全部对话'**
  String get remoteWorkspaceAllChats;

  /// No description provided for @remoteWorkspaceSwitcherSemantics.
  ///
  /// In zh, this message translates to:
  /// **'工作区：{name}。切换工作区'**
  String remoteWorkspaceSwitcherSemantics(String name);

  /// No description provided for @remoteWorkspaceManage.
  ///
  /// In zh, this message translates to:
  /// **'管理工作区'**
  String get remoteWorkspaceManage;

  /// No description provided for @remoteWorkspaceErrLoad.
  ///
  /// In zh, this message translates to:
  /// **'没能读取工作区'**
  String get remoteWorkspaceErrLoad;

  /// No description provided for @remoteWorkspaceEmpty.
  ///
  /// In zh, this message translates to:
  /// **'还没有工作区'**
  String get remoteWorkspaceEmpty;

  /// No description provided for @remoteWorkspaceEmptyHint.
  ///
  /// In zh, this message translates to:
  /// **'把常用的文件夹加进来'**
  String get remoteWorkspaceEmptyHint;

  /// No description provided for @remoteWorkspaceCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个工作区'**
  String remoteWorkspaceCount(int count);

  /// No description provided for @remoteDirectoryConfirmFolder.
  ///
  /// In zh, this message translates to:
  /// **'{action}「{name}」'**
  String remoteDirectoryConfirmFolder(String action, String name);

  /// No description provided for @remoteHostKeyMismatchDetail.
  ///
  /// In zh, this message translates to:
  /// **'确认主机重装或更换后，可在主机设置中重置指纹。\n已记住：{saved}\n这次收到：{received}（{type}）'**
  String remoteHostKeyMismatchDetail(String saved, String received, String type);

  /// No description provided for @remoteForumCompactReplies.
  ///
  /// In zh, this message translates to:
  /// **'{count, plural, other{{label} 回复}}'**
  String remoteForumCompactReplies(int count, String label);

  /// No description provided for @remoteForumCompactViews.
  ///
  /// In zh, this message translates to:
  /// **'{count, plural, other{{label} 浏览}}'**
  String remoteForumCompactViews(int count, String label);

  /// No description provided for @remoteForumYearDate.
  ///
  /// In zh, this message translates to:
  /// **'{year}年{month}月{day}日'**
  String remoteForumYearDate(int year, String month, int day);

  /// No description provided for @remoteHostedMonthDate.
  ///
  /// In zh, this message translates to:
  /// **'{month} 月 {day} 日'**
  String remoteHostedMonthDate(String month, int day);

  /// No description provided for @remoteHostedYearDate.
  ///
  /// In zh, this message translates to:
  /// **'{year} 年 {month} 月 {day} 日'**
  String remoteHostedYearDate(int year, String month, int day);

  /// No description provided for @remoteForumTenThousands.
  ///
  /// In zh, this message translates to:
  /// **'{value}万'**
  String remoteForumTenThousands(String value);

  /// No description provided for @remoteForumSemanticsSeparator.
  ///
  /// In zh, this message translates to:
  /// **'，'**
  String get remoteForumSemanticsSeparator;

  /// No description provided for @remoteHostKeyVerifyCommand.
  ///
  /// In zh, this message translates to:
  /// **'在那台主机上运行 {command} 能看到同样的指纹。之后指纹一旦变化，App 会拒绝连接。'**
  String remoteHostKeyVerifyCommand(String command);

  /// No description provided for @remoteSshInstallCommand.
  ///
  /// In zh, this message translates to:
  /// **'还没装 DSH？在主机上运行 {command}'**
  String remoteSshInstallCommand(String command);

  /// Under the DSH Remote card; project is the upstream GitHub project (liguobao/ds-harness-remote), drawn as a link.
  ///
  /// In zh, this message translates to:
  /// **'服务由 {project} 提供'**
  String remoteRelayProvider(String project);

  /// No description provided for @remoteRelayProviderServer.
  ///
  /// In zh, this message translates to:
  /// **'服务由 {project} 提供 · 当前服务器 {server}'**
  String remoteRelayProviderServer(String project, String server);

  /// No description provided for @remoteQuotedHostName.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」'**
  String remoteQuotedHostName(String name);

  /// No description provided for @remoteErrorDetail.
  ///
  /// In zh, this message translates to:
  /// **'{message}（{detail}）'**
  String remoteErrorDetail(String message, String detail);

  /// No description provided for @remotePathLan.
  ///
  /// In zh, this message translates to:
  /// **'LAN 局域网'**
  String get remotePathLan;

  /// No description provided for @remotePathP2p.
  ///
  /// In zh, this message translates to:
  /// **'P2P 点对点'**
  String get remotePathP2p;

  /// No description provided for @remoteNetworkDetails.
  ///
  /// In zh, this message translates to:
  /// **'网络详情'**
  String get remoteNetworkDetails;

  /// No description provided for @remoteNetworkAutomatic.
  ///
  /// In zh, this message translates to:
  /// **'自动依次尝试 LAN → P2P → TURN → Relay，连接全程端到端加密。'**
  String get remoteNetworkAutomatic;

  /// No description provided for @remoteNetworkCurrentPath.
  ///
  /// In zh, this message translates to:
  /// **'当前路径'**
  String get remoteNetworkCurrentPath;

  /// No description provided for @remoteNetworkConnectDuration.
  ///
  /// In zh, this message translates to:
  /// **'连接耗时'**
  String get remoteNetworkConnectDuration;

  /// No description provided for @remoteNetworkRoundTripTime.
  ///
  /// In zh, this message translates to:
  /// **'往返延迟（RTT）'**
  String get remoteNetworkRoundTripTime;

  /// No description provided for @remoteNetworkUnmeasured.
  ///
  /// In zh, this message translates to:
  /// **'未测量'**
  String get remoteNetworkUnmeasured;

  /// No description provided for @remoteNetworkUnknownPath.
  ///
  /// In zh, this message translates to:
  /// **'尚未确认'**
  String get remoteNetworkUnknownPath;

  /// No description provided for @remoteNetworkMilliseconds.
  ///
  /// In zh, this message translates to:
  /// **'{value} 毫秒'**
  String remoteNetworkMilliseconds(int value);

  /// No description provided for @remoteNetworkMeasure.
  ///
  /// In zh, this message translates to:
  /// **'刷新网络信息 / 测量延迟'**
  String get remoteNetworkMeasure;

  /// No description provided for @remoteNetworkMeasuring.
  ///
  /// In zh, this message translates to:
  /// **'正在测量…'**
  String get remoteNetworkMeasuring;

  /// No description provided for @remoteNetworkMeasureFailed.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法测量，可以稍后重试'**
  String get remoteNetworkMeasureFailed;

  /// No description provided for @remoteNetworkDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'连接已断开，重新连接后可测量'**
  String get remoteNetworkDisconnected;

  /// No description provided for @remoteNetworkFallback.
  ///
  /// In zh, this message translates to:
  /// **'回落原因'**
  String get remoteNetworkFallback;

  /// No description provided for @remoteNetworkFallbackUnknown.
  ///
  /// In zh, this message translates to:
  /// **'直连未能建立，已自动使用可用路径'**
  String get remoteNetworkFallbackUnknown;

  /// No description provided for @remoteNetworkFallbackWebrtcUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'设备暂不支持 WebRTC，已使用 Relay 中继'**
  String get remoteNetworkFallbackWebrtcUnavailable;

  /// No description provided for @remoteNetworkFallbackDirectFailed.
  ///
  /// In zh, this message translates to:
  /// **'LAN / P2P 直连未成功，已自动尝试后续路径'**
  String get remoteNetworkFallbackDirectFailed;

  /// No description provided for @remoteNetworkFallbackDirectTimeout.
  ///
  /// In zh, this message translates to:
  /// **'LAN / P2P 直连超时，已自动尝试后续路径'**
  String get remoteNetworkFallbackDirectTimeout;

  /// No description provided for @remoteNetworkFallbackDirectRecentlyFailed.
  ///
  /// In zh, this message translates to:
  /// **'近期直连未成功，本次先使用可用中继'**
  String get remoteNetworkFallbackDirectRecentlyFailed;

  /// No description provided for @remoteNetworkFallbackTurnUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'TURN 服务暂不可用，已使用 Relay 中继'**
  String get remoteNetworkFallbackTurnUnavailable;

  /// No description provided for @remoteNetworkFallbackTurnFailed.
  ///
  /// In zh, this message translates to:
  /// **'TURN 未能连接，已使用 Relay 中继'**
  String get remoteNetworkFallbackTurnFailed;

  /// No description provided for @remoteNetworkFallbackTurnTimeout.
  ///
  /// In zh, this message translates to:
  /// **'TURN 连接超时，已使用 Relay 中继'**
  String get remoteNetworkFallbackTurnTimeout;

  /// No description provided for @remoteNetworkFallbackPathUnverified.
  ///
  /// In zh, this message translates to:
  /// **'尚未确认 WebRTC 路径类型'**
  String get remoteNetworkFallbackPathUnverified;

  /// No description provided for @remoteNetworkSnapshotHint.
  ///
  /// In zh, this message translates to:
  /// **'显示最近一次确认的路径与延迟，刷新可重新检测。'**
  String get remoteNetworkSnapshotHint;

  /// No description provided for @remoteNetworkObservedAt.
  ///
  /// In zh, this message translates to:
  /// **'最近观测'**
  String get remoteNetworkObservedAt;

  /// No description provided for @riskDontShowAgain.
  ///
  /// In zh, this message translates to:
  /// **'不再提示'**
  String get riskDontShowAgain;

  /// No description provided for @riskAskAi.
  ///
  /// In zh, this message translates to:
  /// **'不确定？问 AI'**
  String get riskAskAi;

  /// No description provided for @riskConfirmAlwaysAction.
  ///
  /// In zh, this message translates to:
  /// **'始终免确认'**
  String get riskConfirmAlwaysAction;

  /// No description provided for @riskFullAccessAction.
  ///
  /// In zh, this message translates to:
  /// **'开启完全权限'**
  String get riskFullAccessAction;

  /// No description provided for @riskAutoReviewAction.
  ///
  /// In zh, this message translates to:
  /// **'开启自动审查'**
  String get riskAutoReviewAction;

  /// No description provided for @riskAllowForChatTitle.
  ///
  /// In zh, this message translates to:
  /// **'本对话都允许？'**
  String get riskAllowForChatTitle;

  /// No description provided for @riskAllowForChatBody.
  ///
  /// In zh, this message translates to:
  /// **'这个对话之后的命令和改动都直接放行，可在输入框上方随时关闭。'**
  String get riskAllowForChatBody;

  /// No description provided for @riskAllowForChatAction.
  ///
  /// In zh, this message translates to:
  /// **'全部允许'**
  String get riskAllowForChatAction;

  /// No description provided for @riskPetOverlayTitle.
  ///
  /// In zh, this message translates to:
  /// **'显示在其他应用上层？'**
  String get riskPetOverlayTitle;

  /// No description provided for @riskPetOverlayBody.
  ///
  /// In zh, this message translates to:
  /// **'要在系统设置里为 DSH Go 打开「显示在其他应用上层」，宠物才能出现在别的 App 上。'**
  String get riskPetOverlayBody;

  /// No description provided for @riskPetOverlayAction.
  ///
  /// In zh, this message translates to:
  /// **'去设置'**
  String get riskPetOverlayAction;

  /// No description provided for @askAiTooltip.
  ///
  /// In zh, this message translates to:
  /// **'问 AI'**
  String get askAiTooltip;

  /// No description provided for @askAiHelpTitle.
  ///
  /// In zh, this message translates to:
  /// **'使用帮助'**
  String get askAiHelpTitle;

  /// No description provided for @askAiHelpSubtitle.
  ///
  /// In zh, this message translates to:
  /// **'不懂的地方，问 AI'**
  String get askAiHelpSubtitle;

  /// No description provided for @askAiAboutApp.
  ///
  /// In zh, this message translates to:
  /// **'关于 DSH Go App：{question}'**
  String askAiAboutApp(String question);

  /// No description provided for @askAiWithGuide.
  ///
  /// In zh, this message translates to:
  /// **'关于 DSH Go App：{question}\n请按附件里的使用说明回答。'**
  String askAiWithGuide(String question);

  /// No description provided for @askAiNoGuide.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有 DSH Go 使用说明，回答可能不准确'**
  String get askAiNoGuide;

  /// No description provided for @askAiQuestionOverview.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 能做什么？我该从哪里开始？'**
  String get askAiQuestionOverview;

  /// No description provided for @askAiQuestionPhoneControl.
  ///
  /// In zh, this message translates to:
  /// **'手机操控是怎么工作的？有什么风险？'**
  String get askAiQuestionPhoneControl;

  /// No description provided for @askAiQuestionPhoneAlways.
  ///
  /// In zh, this message translates to:
  /// **'手机操控选「始终免确认」会怎样？和「每次都询问」比风险在哪？'**
  String get askAiQuestionPhoneAlways;

  /// No description provided for @askAiQuestionAppRules.
  ///
  /// In zh, this message translates to:
  /// **'手机操控的应用名单有什么用？放开银行、支付类 App 有什么风险？'**
  String get askAiQuestionAppRules;

  /// No description provided for @askAiQuestionFullAccess.
  ///
  /// In zh, this message translates to:
  /// **'「完全权限」打开后会怎样？有什么风险？'**
  String get askAiQuestionFullAccess;

  /// No description provided for @askAiQuestionPhoneFiles.
  ///
  /// In zh, this message translates to:
  /// **'「访问手机文件」打开后，AI 能读写哪些文件？怎么关掉？'**
  String get askAiQuestionPhoneFiles;

  /// No description provided for @askAiQuestionAllowForChat.
  ///
  /// In zh, this message translates to:
  /// **'「本对话都允许」会放行哪些操作？怎么关掉？'**
  String get askAiQuestionAllowForChat;

  /// No description provided for @askAiQuestionPlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件能做什么？装第三方插件要注意什么？'**
  String get askAiQuestionPlugins;

  /// No description provided for @askAiQuestionRemote.
  ///
  /// In zh, this message translates to:
  /// **'怎么连接自己的电脑或服务器？和用本机有什么不同？'**
  String get askAiQuestionRemote;

  /// No description provided for @schemaDocumentationTitle.
  ///
  /// In zh, this message translates to:
  /// **'字段说明'**
  String get schemaDocumentationTitle;

  /// No description provided for @schemaDocumentationOverview.
  ///
  /// In zh, this message translates to:
  /// **'概述'**
  String get schemaDocumentationOverview;

  /// No description provided for @schemaDocumentationEach.
  ///
  /// In zh, this message translates to:
  /// **'每一项'**
  String get schemaDocumentationEach;

  /// No description provided for @schemaDocumentationPosition.
  ///
  /// In zh, this message translates to:
  /// **'第 {position} 项'**
  String schemaDocumentationPosition(int position);

  /// No description provided for @schemaDocumentationOption.
  ///
  /// In zh, this message translates to:
  /// **'选项 {option}'**
  String schemaDocumentationOption(int option);

  /// No description provided for @searchApiKey.
  ///
  /// In zh, this message translates to:
  /// **'API Key'**
  String get searchApiKey;

  /// No description provided for @searchNeedsLocal.
  ///
  /// In zh, this message translates to:
  /// **'连接本机时可用'**
  String get searchNeedsLocal;

  /// No description provided for @searchNeedsPhoneControl.
  ///
  /// In zh, this message translates to:
  /// **'开启手机操控后可用'**
  String get searchNeedsPhoneControl;

  /// No description provided for @searchNeedsNativeUi.
  ///
  /// In zh, this message translates to:
  /// **'原生界面可用'**
  String get searchNeedsNativeUi;

  /// No description provided for @searchNeedsEngineField.
  ///
  /// In zh, this message translates to:
  /// **'当前主机提供时可用'**
  String get searchNeedsEngineField;

  /// No description provided for @searchNeedsChat.
  ///
  /// In zh, this message translates to:
  /// **'打开对话时可用'**
  String get searchNeedsChat;

  /// No description provided for @searchKwTheme.
  ///
  /// In zh, this message translates to:
  /// **'外观,配色,颜色,主题色,强调色,图标'**
  String get searchKwTheme;

  /// No description provided for @searchKwPets.
  ///
  /// In zh, this message translates to:
  /// **'宠物,小鲸,桌宠,悬浮,鲸鱼'**
  String get searchKwPets;

  /// No description provided for @searchKwPerformance.
  ///
  /// In zh, this message translates to:
  /// **'省电,流畅,卡顿,发热,轻量,完整'**
  String get searchKwPerformance;

  /// No description provided for @searchKwVoice.
  ///
  /// In zh, this message translates to:
  /// **'语音识别,麦克风,听写,说话,语音'**
  String get searchKwVoice;

  /// No description provided for @searchKwNotifications.
  ///
  /// In zh, this message translates to:
  /// **'提醒,推送,横幅,消息,铃声'**
  String get searchKwNotifications;

  /// No description provided for @searchKwReplyPrefs.
  ///
  /// In zh, this message translates to:
  /// **'偏好,关于我,自我介绍,回答风格,称呼,AGENTS.md'**
  String get searchKwReplyPrefs;

  /// No description provided for @searchKwSharedLinks.
  ///
  /// In zh, this message translates to:
  /// **'分享链接,链接,公开链接,分享'**
  String get searchKwSharedLinks;

  /// No description provided for @searchKwPhone.
  ///
  /// In zh, this message translates to:
  /// **'无障碍,操作手机,自动点击,代操作,点按'**
  String get searchKwPhone;

  /// No description provided for @searchKwAppRules.
  ///
  /// In zh, this message translates to:
  /// **'名单,黑名单,白名单,禁止,应用'**
  String get searchKwAppRules;

  /// No description provided for @searchKwDnd.
  ///
  /// In zh, this message translates to:
  /// **'免打扰,Shizuku,ADB,后台操作'**
  String get searchKwDnd;

  /// No description provided for @searchKwEngine.
  ///
  /// In zh, this message translates to:
  /// **'引擎,运行环境,启动,停止,重启,DSH'**
  String get searchKwEngine;

  /// No description provided for @searchKwBackground.
  ///
  /// In zh, this message translates to:
  /// **'后台保活,保活,后台,电池优化,自启动,被杀,杀后台,省电'**
  String get searchKwBackground;

  /// No description provided for @searchKwSystemAccess.
  ///
  /// In zh, this message translates to:
  /// **'权限一览,授权,悬浮窗,无障碍,后台弹出界面,麦克风,文件访问,通知权限,受限制的设置,补开权限'**
  String get searchKwSystemAccess;

  /// No description provided for @searchKwDiagnostics.
  ///
  /// In zh, this message translates to:
  /// **'日志,排障,诊断包,问题反馈,报错'**
  String get searchKwDiagnostics;

  /// No description provided for @searchKwModels.
  ///
  /// In zh, this message translates to:
  /// **'模型渠道,渠道,供应商,换模型,OpenRouter,ChatGPT,Claude'**
  String get searchKwModels;

  /// No description provided for @searchKwEngineParams.
  ///
  /// In zh, this message translates to:
  /// **'引擎设置,高级,参数,子代理,命令执行'**
  String get searchKwEngineParams;

  /// No description provided for @searchKwSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理设置,递归,并发,子任务'**
  String get searchKwSubagent;

  /// No description provided for @searchKwAgentLoop.
  ///
  /// In zh, this message translates to:
  /// **'循环,并行,工具调用'**
  String get searchKwAgentLoop;

  /// No description provided for @searchKwShell.
  ///
  /// In zh, this message translates to:
  /// **'命令,超时,输出,终端,Shell'**
  String get searchKwShell;

  /// No description provided for @searchKwWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'搜索,上网,联网,API Key'**
  String get searchKwWebSearch;

  /// No description provided for @searchKwGeneral.
  ///
  /// In zh, this message translates to:
  /// **'通用,网页版设置'**
  String get searchKwGeneral;

  /// No description provided for @searchKwPluginInventory.
  ///
  /// In zh, this message translates to:
  /// **'插件清单,已装插件'**
  String get searchKwPluginInventory;

  /// No description provided for @searchKwPlugins.
  ///
  /// In zh, this message translates to:
  /// **'扩展,市场,安装插件,插件市场'**
  String get searchKwPlugins;

  /// No description provided for @searchKwAllFeatures.
  ///
  /// In zh, this message translates to:
  /// **'功能,目录,所有功能'**
  String get searchKwAllFeatures;

  /// No description provided for @searchKwAccount.
  ///
  /// In zh, this message translates to:
  /// **'账号,余额,充值,登录,退出登录,API Key,用量,DeepSeek'**
  String get searchKwAccount;

  /// No description provided for @searchKwRemote.
  ///
  /// In zh, this message translates to:
  /// **'远程,SSH,电脑,服务器,DSH Remote,连接电脑'**
  String get searchKwRemote;

  /// No description provided for @searchKwPermission.
  ///
  /// In zh, this message translates to:
  /// **'权限,别问我,确认,审批,自动允许,只读,完全权限,自动执行命令'**
  String get searchKwPermission;

  /// No description provided for @searchKwAgentPresets.
  ///
  /// In zh, this message translates to:
  /// **'预设,模式,工作方式'**
  String get searchKwAgentPresets;

  /// No description provided for @searchKwUiMode.
  ///
  /// In zh, this message translates to:
  /// **'原生,网页,网页模式,界面,切换界面'**
  String get searchKwUiMode;

  /// No description provided for @searchKwLanguage.
  ///
  /// In zh, this message translates to:
  /// **'中文,英文,简体,English'**
  String get searchKwLanguage;

  /// No description provided for @searchKwAutoCommands.
  ///
  /// In zh, this message translates to:
  /// **'别问我,不要确认,自动允许,完全权限,免确认'**
  String get searchKwAutoCommands;

  /// No description provided for @searchKwPhoneFiles.
  ///
  /// In zh, this message translates to:
  /// **'存储,文件,相册,下载,手机存储'**
  String get searchKwPhoneFiles;

  /// No description provided for @searchKwVisualReplies.
  ///
  /// In zh, this message translates to:
  /// **'图表,卡片,可视化,选项'**
  String get searchKwVisualReplies;

  /// No description provided for @searchKwTextSize.
  ///
  /// In zh, this message translates to:
  /// **'字号,字体,文字大小,大字,字体大小'**
  String get searchKwTextSize;

  /// No description provided for @searchKwFoldTurns.
  ///
  /// In zh, this message translates to:
  /// **'收起,折叠,过程,步骤'**
  String get searchKwFoldTurns;

  /// No description provided for @searchKwWebPhoneLayout.
  ///
  /// In zh, this message translates to:
  /// **'网页版手机布局,布局'**
  String get searchKwWebPhoneLayout;

  /// No description provided for @searchKwShareConfig.
  ///
  /// In zh, this message translates to:
  /// **'分享,导出配置,分享码,配置'**
  String get searchKwShareConfig;

  /// No description provided for @searchKwOpenWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页版,网页,浏览器,官方网页版'**
  String get searchKwOpenWeb;

  /// No description provided for @searchKwSafeMode.
  ///
  /// In zh, this message translates to:
  /// **'安全模式,恢复正常模式,排障,插件崩溃'**
  String get searchKwSafeMode;

  /// No description provided for @searchKwVersion.
  ///
  /// In zh, this message translates to:
  /// **'版本号,关于'**
  String get searchKwVersion;

  /// No description provided for @searchKwUpdate.
  ///
  /// In zh, this message translates to:
  /// **'更新,升级,新版本'**
  String get searchKwUpdate;

  /// No description provided for @searchKwUpdateAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动更新,检查更新'**
  String get searchKwUpdateAuto;

  /// No description provided for @searchKwHelp.
  ///
  /// In zh, this message translates to:
  /// **'帮助,教程,问 AI,怎么用,说明'**
  String get searchKwHelp;

  /// No description provided for @searchKwCommunity.
  ///
  /// In zh, this message translates to:
  /// **'交流群,QQ 群,论坛,反馈'**
  String get searchKwCommunity;

  /// No description provided for @searchKwStar.
  ///
  /// In zh, this message translates to:
  /// **'GitHub,星标,点赞'**
  String get searchKwStar;

  /// No description provided for @searchKwLicenses.
  ///
  /// In zh, this message translates to:
  /// **'许可证,开源,License'**
  String get searchKwLicenses;

  /// No description provided for @searchKwDarkMode.
  ///
  /// In zh, this message translates to:
  /// **'深色,浅色,暗色,夜间,深色模式,跟随系统,外观'**
  String get searchKwDarkMode;

  /// No description provided for @searchKwAccent.
  ///
  /// In zh, this message translates to:
  /// **'颜色,主题色,强调色,壁纸,取色'**
  String get searchKwAccent;

  /// No description provided for @searchKwTileStyle.
  ///
  /// In zh, this message translates to:
  /// **'图标风格,磁贴'**
  String get searchKwTileStyle;

  /// No description provided for @searchKwAppIcon.
  ///
  /// In zh, this message translates to:
  /// **'启动图标,App 图标,图标'**
  String get searchKwAppIcon;

  /// No description provided for @searchKwPetSize.
  ///
  /// In zh, this message translates to:
  /// **'宠物大小,宠物尺寸'**
  String get searchKwPetSize;

  /// No description provided for @searchKwPetQuiet.
  ///
  /// In zh, this message translates to:
  /// **'安静,宠物安静'**
  String get searchKwPetQuiet;

  /// No description provided for @searchKwPetOutside.
  ///
  /// In zh, this message translates to:
  /// **'悬浮窗,桌面宠物,宠物悬浮'**
  String get searchKwPetOutside;

  /// No description provided for @searchKwPetDisplayWhen.
  ///
  /// In zh, this message translates to:
  /// **'宠物显示,显示时机'**
  String get searchKwPetDisplayWhen;

  /// No description provided for @searchKwBlur.
  ///
  /// In zh, this message translates to:
  /// **'模糊,毛玻璃,玻璃'**
  String get searchKwBlur;

  /// No description provided for @searchKwAnimations.
  ///
  /// In zh, this message translates to:
  /// **'动画,动效,减少动画'**
  String get searchKwAnimations;

  /// No description provided for @searchKwNotifyEnabled.
  ///
  /// In zh, this message translates to:
  /// **'通知开关,关闭通知'**
  String get searchKwNotifyEnabled;

  /// No description provided for @searchKwNotifyDone.
  ///
  /// In zh, this message translates to:
  /// **'完成提醒,回复完成'**
  String get searchKwNotifyDone;

  /// No description provided for @searchKwNotifyFailed.
  ///
  /// In zh, this message translates to:
  /// **'出错提醒,失败'**
  String get searchKwNotifyFailed;

  /// No description provided for @searchKwNotifyApproval.
  ///
  /// In zh, this message translates to:
  /// **'审批提醒,确认提醒'**
  String get searchKwNotifyApproval;

  /// No description provided for @searchKwNotifyQuestion.
  ///
  /// In zh, this message translates to:
  /// **'提问提醒'**
  String get searchKwNotifyQuestion;

  /// No description provided for @searchKwNotifySystem.
  ///
  /// In zh, this message translates to:
  /// **'声音,横幅,锁屏,系统通知'**
  String get searchKwNotifySystem;

  /// No description provided for @searchKwPhoneConfirm.
  ///
  /// In zh, this message translates to:
  /// **'别问我,免确认,每次都询问,始终免确认,确认'**
  String get searchKwPhoneConfirm;

  /// No description provided for @searchKwPhoneAutoCollapse.
  ///
  /// In zh, this message translates to:
  /// **'悬浮条,收起,悬浮球'**
  String get searchKwPhoneAutoCollapse;

  /// No description provided for @searchKwPhoneReturn.
  ///
  /// In zh, this message translates to:
  /// **'返回,完成后返回'**
  String get searchKwPhoneReturn;

  /// No description provided for @searchKwPhoneBackgroundGuide.
  ///
  /// In zh, this message translates to:
  /// **'后台确认,返回 App'**
  String get searchKwPhoneBackgroundGuide;

  /// No description provided for @searchKwAutoStart.
  ///
  /// In zh, this message translates to:
  /// **'自动启动,开机启动,自启'**
  String get searchKwAutoStart;

  /// No description provided for @searchKwAutoSafe.
  ///
  /// In zh, this message translates to:
  /// **'安全模式,自动安全模式'**
  String get searchKwAutoSafe;

  /// No description provided for @searchKwEngineReset.
  ///
  /// In zh, this message translates to:
  /// **'重置,清空,恢复'**
  String get searchKwEngineReset;

  /// No description provided for @searchKwEngineUninstall.
  ///
  /// In zh, this message translates to:
  /// **'卸载,删除运行环境,释放空间'**
  String get searchKwEngineUninstall;

  /// No description provided for @searchKwAddProvider.
  ///
  /// In zh, this message translates to:
  /// **'添加模型,新渠道,自定义模型,Base URL'**
  String get searchKwAddProvider;

  /// No description provided for @searchKwSubagentDepth.
  ///
  /// In zh, this message translates to:
  /// **'递归深度,层数'**
  String get searchKwSubagentDepth;

  /// No description provided for @searchKwParallelCalls.
  ///
  /// In zh, this message translates to:
  /// **'并行,同时调用'**
  String get searchKwParallelCalls;

  /// No description provided for @searchKwCommandTimeout.
  ///
  /// In zh, this message translates to:
  /// **'超时,命令超时,时间限制'**
  String get searchKwCommandTimeout;

  /// No description provided for @searchKwWebSearchKey.
  ///
  /// In zh, this message translates to:
  /// **'搜索 Key,联网 Key'**
  String get searchKwWebSearchKey;

  /// No description provided for @searchKwChatLogUpload.
  ///
  /// In zh, this message translates to:
  /// **'隐私,日志,上传日志,对话日志'**
  String get searchKwChatLogUpload;

  /// No description provided for @searchKwAddSshHost.
  ///
  /// In zh, this message translates to:
  /// **'SSH,添加主机,连接电脑'**
  String get searchKwAddSshHost;

  /// No description provided for @searchKwRemoteAutoConnect.
  ///
  /// In zh, this message translates to:
  /// **'自动连接,启动时连接'**
  String get searchKwRemoteAutoConnect;

  /// No description provided for @searchKwPermissionCurrent.
  ///
  /// In zh, this message translates to:
  /// **'本对话都允许,这个对话,当前权限'**
  String get searchKwPermissionCurrent;

  /// No description provided for @searchKwPermissionDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认权限,只读,工作区内修改,完全权限,自动执行命令,别问我'**
  String get searchKwPermissionDefault;

  /// No description provided for @searchSettingsHint.
  ///
  /// In zh, this message translates to:
  /// **'搜索设置'**
  String get searchSettingsHint;

  /// No description provided for @searchSuggestDark.
  ///
  /// In zh, this message translates to:
  /// **'深色模式'**
  String get searchSuggestDark;

  /// No description provided for @searchSuggestBackground.
  ///
  /// In zh, this message translates to:
  /// **'后台运行'**
  String get searchSuggestBackground;

  /// No description provided for @searchSuggestPermission.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get searchSuggestPermission;

  /// No description provided for @searchSuggestTextSize.
  ///
  /// In zh, this message translates to:
  /// **'字号'**
  String get searchSuggestTextSize;

  /// No description provided for @searchCommon.
  ///
  /// In zh, this message translates to:
  /// **'常用'**
  String get searchCommon;

  /// No description provided for @searchRecent.
  ///
  /// In zh, this message translates to:
  /// **'最近'**
  String get searchRecent;

  /// No description provided for @searchFeatures.
  ///
  /// In zh, this message translates to:
  /// **'功能'**
  String get searchFeatures;

  /// No description provided for @searchNoResults.
  ///
  /// In zh, this message translates to:
  /// **'没有找到相关设置'**
  String get searchNoResults;

  /// No description provided for @searchAskAi.
  ///
  /// In zh, this message translates to:
  /// **'问 AI：「{query}」'**
  String searchAskAi(String query);

  /// No description provided for @searchKwPersonalization.
  ///
  /// In zh, this message translates to:
  /// **'个性化,偏好,风格,习惯'**
  String get searchKwPersonalization;

  /// No description provided for @searchKwInterface.
  ///
  /// In zh, this message translates to:
  /// **'原生,网页,网页模式,网页版,通用设置'**
  String get searchKwInterface;

  /// No description provided for @searchKwPrivacy.
  ///
  /// In zh, this message translates to:
  /// **'隐私,数据,日志,分享,统计'**
  String get searchKwPrivacy;

  /// No description provided for @searchKwAbout.
  ///
  /// In zh, this message translates to:
  /// **'关于,版本,更新,许可,dsh-go'**
  String get searchKwAbout;

  /// No description provided for @searchKwPhoneConfirmEntry.
  ///
  /// In zh, this message translates to:
  /// **'确认方式,手机操控,免确认'**
  String get searchKwPhoneConfirmEntry;

  /// No description provided for @searchKwWebCodingView.
  ///
  /// In zh, this message translates to:
  /// **'代码视图,工作视图,网页版'**
  String get searchKwWebCodingView;

  /// No description provided for @searchKwWebCollapse.
  ///
  /// In zh, this message translates to:
  /// **'工作步骤,收起,折叠,网页版'**
  String get searchKwWebCollapse;

  /// No description provided for @searchKwWebBusySend.
  ///
  /// In zh, this message translates to:
  /// **'发送,排队,插话,AI 工作时'**
  String get searchKwWebBusySend;

  /// No description provided for @searchKwPluginsMarket.
  ///
  /// In zh, this message translates to:
  /// **'插件市场,安装插件,市场,获取插件'**
  String get searchKwPluginsMarket;

  /// No description provided for @searchKwUsageStats.
  ///
  /// In zh, this message translates to:
  /// **'统计,使用统计,匿名,隐私,数据,改进,遥测,分析'**
  String get searchKwUsageStats;

  /// No description provided for @setupAppearanceTitle.
  ///
  /// In zh, this message translates to:
  /// **'选择外观'**
  String get setupAppearanceTitle;

  /// No description provided for @setupAppearanceMessage.
  ///
  /// In zh, this message translates to:
  /// **'随时可以在设置里更改'**
  String get setupAppearanceMessage;

  /// No description provided for @setupLightMode.
  ///
  /// In zh, this message translates to:
  /// **'轻量模式'**
  String get setupLightMode;

  /// No description provided for @setupCapsulePreparing.
  ///
  /// In zh, this message translates to:
  /// **'准备运行环境'**
  String get setupCapsulePreparing;

  /// No description provided for @setupCapsuleProgress.
  ///
  /// In zh, this message translates to:
  /// **'运行环境 {percent}%'**
  String setupCapsuleProgress(int percent);

  /// No description provided for @setupCapsuleProgressSemantics.
  ///
  /// In zh, this message translates to:
  /// **'正在准备运行环境，已完成 {percent}%'**
  String setupCapsuleProgressSemantics(int percent);

  /// No description provided for @setupCapsuleReady.
  ///
  /// In zh, this message translates to:
  /// **'运行环境已就绪'**
  String get setupCapsuleReady;

  /// No description provided for @setupCapsuleFailed.
  ///
  /// In zh, this message translates to:
  /// **'安装未完成'**
  String get setupCapsuleFailed;

  /// No description provided for @setupWaitingBody.
  ///
  /// In zh, this message translates to:
  /// **'完成后自动进入'**
  String get setupWaitingBody;

  /// No description provided for @setupNotifyWhenDone.
  ///
  /// In zh, this message translates to:
  /// **'完成时会通知你'**
  String get setupNotifyWhenDone;

  /// No description provided for @setupAwaitSignIn.
  ///
  /// In zh, this message translates to:
  /// **'就绪后自动打开 DeepSeek 登录'**
  String get setupAwaitSignIn;

  /// No description provided for @shellApiKeyPrefixWarning.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 的 Key 通常以 sk- 开头，确认没有复制错'**
  String get shellApiKeyPrefixWarning;

  /// No description provided for @shellApiKeyIncompleteWarning.
  ///
  /// In zh, this message translates to:
  /// **'Key 似乎不完整，确认复制了整串'**
  String get shellApiKeyIncompleteWarning;

  /// No description provided for @shellBrowserUrlCopied.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器，网址已复制'**
  String get shellBrowserUrlCopied;

  /// No description provided for @shellSaveTryAgain.
  ///
  /// In zh, this message translates to:
  /// **'没能保存，再试一次'**
  String get shellSaveTryAgain;

  /// No description provided for @shellApiKeyUpdated.
  ///
  /// In zh, this message translates to:
  /// **'API Key 已更新'**
  String get shellApiKeyUpdated;

  /// No description provided for @shellReplaceApiKey.
  ///
  /// In zh, this message translates to:
  /// **'更换 API Key'**
  String get shellReplaceApiKey;

  /// No description provided for @shellEnterApiKey.
  ///
  /// In zh, this message translates to:
  /// **'输入 API Key'**
  String get shellEnterApiKey;

  /// No description provided for @shellApiKeyBilling.
  ///
  /// In zh, this message translates to:
  /// **'费用由 DeepSeek 开放平台按量结算'**
  String get shellApiKeyBilling;

  /// No description provided for @shellSaving.
  ///
  /// In zh, this message translates to:
  /// **'正在保存'**
  String get shellSaving;

  /// No description provided for @shellSaveContinue.
  ///
  /// In zh, this message translates to:
  /// **'保存并继续'**
  String get shellSaveContinue;

  /// No description provided for @shellSetUpLater.
  ///
  /// In zh, this message translates to:
  /// **'稍后设置'**
  String get shellSetUpLater;

  /// No description provided for @shellClearField.
  ///
  /// In zh, this message translates to:
  /// **'清空'**
  String get shellClearField;

  /// No description provided for @shellShow.
  ///
  /// In zh, this message translates to:
  /// **'显示'**
  String get shellShow;

  /// No description provided for @shellApiKeyEncrypted.
  ///
  /// In zh, this message translates to:
  /// **'加密保存在本机'**
  String get shellApiKeyEncrypted;

  /// No description provided for @shellGetApiKey.
  ///
  /// In zh, this message translates to:
  /// **'获取 API Key'**
  String get shellGetApiKey;

  /// No description provided for @shellConnectDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'连接 DeepSeek'**
  String get shellConnectDeepSeek;

  /// No description provided for @shellConnectDeepSeekMessage.
  ///
  /// In zh, this message translates to:
  /// **'登录 DeepSeek 账号即可开始，无需 API Key'**
  String get shellConnectDeepSeekMessage;

  /// No description provided for @shellAccountSignInUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持账号登录'**
  String get shellAccountSignInUnsupported;

  /// No description provided for @shellSignInDeepSeek.
  ///
  /// In zh, this message translates to:
  /// **'用 DeepSeek 账号登录'**
  String get shellSignInDeepSeek;

  /// No description provided for @shellUseApiKey.
  ///
  /// In zh, this message translates to:
  /// **'使用 API Key'**
  String get shellUseApiKey;

  /// No description provided for @shellOtherProviders.
  ///
  /// In zh, this message translates to:
  /// **'其他模型渠道'**
  String get shellOtherProviders;

  /// No description provided for @shellOnboardingStep.
  ///
  /// In zh, this message translates to:
  /// **'第 {step} 步，共 {steps} 步'**
  String shellOnboardingStep(int step, int steps);

  /// No description provided for @shellRuntimeUpdating.
  ///
  /// In zh, this message translates to:
  /// **'正在更新运行环境'**
  String get shellRuntimeUpdating;

  /// No description provided for @shellRuntimePreparing.
  ///
  /// In zh, this message translates to:
  /// **'正在准备运行环境'**
  String get shellRuntimePreparing;

  /// No description provided for @shellRuntimeReady.
  ///
  /// In zh, this message translates to:
  /// **'准备就绪'**
  String get shellRuntimeReady;

  /// No description provided for @shellRuntimeIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'安装未完成'**
  String get shellRuntimeIncomplete;

  /// No description provided for @shellRuntimeFilesKept.
  ///
  /// In zh, this message translates to:
  /// **'对话和文件都会保留'**
  String get shellRuntimeFilesKept;

  /// No description provided for @shellRuntimeFirstSetup.
  ///
  /// In zh, this message translates to:
  /// **'首次准备约需一两分钟'**
  String get shellRuntimeFirstSetup;

  /// No description provided for @shellRuntimeContinuing.
  ///
  /// In zh, this message translates to:
  /// **'即将继续'**
  String get shellRuntimeContinuing;

  /// No description provided for @shellRuntimeRestoreFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能放回保留的内容'**
  String get shellRuntimeRestoreFailed;

  /// No description provided for @shellRuntimeExtractFailed.
  ///
  /// In zh, this message translates to:
  /// **'解压时出错'**
  String get shellRuntimeExtractFailed;

  /// No description provided for @shellInstallLogs.
  ///
  /// In zh, this message translates to:
  /// **'安装日志'**
  String get shellInstallLogs;

  /// No description provided for @shellRuntimeLocalOnly.
  ///
  /// In zh, this message translates to:
  /// **'全程在本机完成'**
  String get shellRuntimeLocalOnly;

  /// No description provided for @shellRuntimeContinueWithoutKept.
  ///
  /// In zh, this message translates to:
  /// **'不保留，继续安装'**
  String get shellRuntimeContinueWithoutKept;

  /// No description provided for @shellRuntimeAlmostDone.
  ///
  /// In zh, this message translates to:
  /// **'马上就好'**
  String get shellRuntimeAlmostDone;

  /// No description provided for @shellRuntimeSecondsRemaining.
  ///
  /// In zh, this message translates to:
  /// **'约 {count} 秒'**
  String shellRuntimeSecondsRemaining(int count);

  /// No description provided for @shellRuntimeMinutesRemaining.
  ///
  /// In zh, this message translates to:
  /// **'约 {count} 分钟'**
  String shellRuntimeMinutesRemaining(int count);

  /// No description provided for @shellEngineLogs.
  ///
  /// In zh, this message translates to:
  /// **'引擎日志'**
  String get shellEngineLogs;

  /// No description provided for @shellWelcomeMessage.
  ///
  /// In zh, this message translates to:
  /// **'把 DeepSeek 智能体\n装进口袋'**
  String get shellWelcomeMessage;

  /// No description provided for @shellGetStarted.
  ///
  /// In zh, this message translates to:
  /// **'开始'**
  String get shellGetStarted;

  /// No description provided for @shellSearchChats.
  ///
  /// In zh, this message translates to:
  /// **'搜索对话'**
  String get shellSearchChats;

  /// No description provided for @shellCollapseChatList.
  ///
  /// In zh, this message translates to:
  /// **'收起对话列表'**
  String get shellCollapseChatList;

  /// No description provided for @shellExpandChatList.
  ///
  /// In zh, this message translates to:
  /// **'展开对话列表'**
  String get shellExpandChatList;

  /// No description provided for @shellChatList.
  ///
  /// In zh, this message translates to:
  /// **'对话列表'**
  String get shellChatList;

  /// No description provided for @shellChatDetails.
  ///
  /// In zh, this message translates to:
  /// **'对话详情'**
  String get shellChatDetails;

  /// No description provided for @shellCollapseDetails.
  ///
  /// In zh, this message translates to:
  /// **'收起详情'**
  String get shellCollapseDetails;

  /// No description provided for @shellExpand.
  ///
  /// In zh, this message translates to:
  /// **'展开'**
  String get shellExpand;

  /// No description provided for @shellUndo.
  ///
  /// In zh, this message translates to:
  /// **'撤销'**
  String get shellUndo;

  /// No description provided for @shellFolderDeleted.
  ///
  /// In zh, this message translates to:
  /// **'已删除「{name}」'**
  String shellFolderDeleted(String name);

  /// No description provided for @shellMovedToFolder.
  ///
  /// In zh, this message translates to:
  /// **'已移到「{name}」'**
  String shellMovedToFolder(String name);

  /// No description provided for @shellMovedOutOfFolder.
  ///
  /// In zh, this message translates to:
  /// **'已移出文件夹'**
  String get shellMovedOutOfFolder;

  /// No description provided for @shellUnpinFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能取消置顶，稍后再试'**
  String get shellUnpinFailed;

  /// No description provided for @shellPinFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能置顶，稍后再试'**
  String get shellPinFailed;

  /// No description provided for @shellChatsUnpinned.
  ///
  /// In zh, this message translates to:
  /// **'已取消置顶 {count} 个对话'**
  String shellChatsUnpinned(int count);

  /// No description provided for @shellChatsPinned.
  ///
  /// In zh, this message translates to:
  /// **'已置顶 {count} 个对话'**
  String shellChatsPinned(int count);

  /// No description provided for @shellArchiveFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能归档，稍后再试'**
  String get shellArchiveFailed;

  /// No description provided for @shellChatsStoppedArchived.
  ///
  /// In zh, this message translates to:
  /// **'已停止并归档 {count} 个对话'**
  String shellChatsStoppedArchived(int count);

  /// No description provided for @shellChatsArchived.
  ///
  /// In zh, this message translates to:
  /// **'已归档 {count} 个对话'**
  String shellChatsArchived(int count);

  /// No description provided for @shellFilterLabel.
  ///
  /// In zh, this message translates to:
  /// **'筛选：{label}'**
  String shellFilterLabel(String label);

  /// No description provided for @shellFolders.
  ///
  /// In zh, this message translates to:
  /// **'文件夹'**
  String get shellFolders;

  /// No description provided for @shellNoRunningChats.
  ///
  /// In zh, this message translates to:
  /// **'没有运行中的对话'**
  String get shellNoRunningChats;

  /// No description provided for @shellNoPendingChats.
  ///
  /// In zh, this message translates to:
  /// **'没有待确认的对话'**
  String get shellNoPendingChats;

  /// No description provided for @shellNoUnreadChats.
  ///
  /// In zh, this message translates to:
  /// **'没有未读对话'**
  String get shellNoUnreadChats;

  /// No description provided for @shellNoChatsYet.
  ///
  /// In zh, this message translates to:
  /// **'还没有对话'**
  String get shellNoChatsYet;

  /// No description provided for @shellFolderLabel.
  ///
  /// In zh, this message translates to:
  /// **'文件夹「{name}」'**
  String shellFolderLabel(String name);

  /// No description provided for @shellFolderChatCount.
  ///
  /// In zh, this message translates to:
  /// **'文件夹「{name}」，{count} 个对话'**
  String shellFolderChatCount(String name, int count);

  /// No description provided for @shellSort.
  ///
  /// In zh, this message translates to:
  /// **'排序'**
  String get shellSort;

  /// No description provided for @shellRecentActivity.
  ///
  /// In zh, this message translates to:
  /// **'最近活动'**
  String get shellRecentActivity;

  /// No description provided for @shellCreatedTime.
  ///
  /// In zh, this message translates to:
  /// **'创建时间'**
  String get shellCreatedTime;

  /// No description provided for @shellNewFolder.
  ///
  /// In zh, this message translates to:
  /// **'新建文件夹'**
  String get shellNewFolder;

  /// No description provided for @shellManageFolders.
  ///
  /// In zh, this message translates to:
  /// **'管理文件夹'**
  String get shellManageFolders;

  /// No description provided for @shellMultiSelect.
  ///
  /// In zh, this message translates to:
  /// **'多选'**
  String get shellMultiSelect;

  /// No description provided for @shellFolderNameExists.
  ///
  /// In zh, this message translates to:
  /// **'已有同名文件夹'**
  String get shellFolderNameExists;

  /// No description provided for @shellEditFolder.
  ///
  /// In zh, this message translates to:
  /// **'编辑文件夹'**
  String get shellEditFolder;

  /// No description provided for @shellFolderMark.
  ///
  /// In zh, this message translates to:
  /// **'标记'**
  String get shellFolderMark;

  /// No description provided for @shellFolderColor.
  ///
  /// In zh, this message translates to:
  /// **'颜色 {number}'**
  String shellFolderColor(int number);

  /// No description provided for @shellMoveToFolder.
  ///
  /// In zh, this message translates to:
  /// **'移到文件夹'**
  String get shellMoveToFolder;

  /// No description provided for @shellMoveOutOfFolder.
  ///
  /// In zh, this message translates to:
  /// **'移出文件夹'**
  String get shellMoveOutOfFolder;

  /// No description provided for @shellDeleteFolder.
  ///
  /// In zh, this message translates to:
  /// **'删除文件夹'**
  String get shellDeleteFolder;

  /// No description provided for @shellDragToReorder.
  ///
  /// In zh, this message translates to:
  /// **'拖动排序'**
  String get shellDragToReorder;

  /// No description provided for @shellSelectChats.
  ///
  /// In zh, this message translates to:
  /// **'选择对话'**
  String get shellSelectChats;

  /// No description provided for @shellSelectedCount.
  ///
  /// In zh, this message translates to:
  /// **'已选 {count} 个'**
  String shellSelectedCount(int count);

  /// No description provided for @shellDeselectAll.
  ///
  /// In zh, this message translates to:
  /// **'取消全选'**
  String get shellDeselectAll;

  /// No description provided for @shellSelectAll.
  ///
  /// In zh, this message translates to:
  /// **'全选'**
  String get shellSelectAll;

  /// No description provided for @shellUnpin.
  ///
  /// In zh, this message translates to:
  /// **'取消置顶'**
  String get shellUnpin;

  /// No description provided for @shellArchive.
  ///
  /// In zh, this message translates to:
  /// **'归档'**
  String get shellArchive;

  /// No description provided for @shellCurrentlyRunning.
  ///
  /// In zh, this message translates to:
  /// **'正在运行'**
  String get shellCurrentlyRunning;

  /// No description provided for @shellUnread.
  ///
  /// In zh, this message translates to:
  /// **'未读'**
  String get shellUnread;

  /// No description provided for @shellPinned.
  ///
  /// In zh, this message translates to:
  /// **'已置顶'**
  String get shellPinned;

  /// No description provided for @shellEngineNotRunning.
  ///
  /// In zh, this message translates to:
  /// **'引擎未运行'**
  String get shellEngineNotRunning;

  /// No description provided for @shellHostNotConnected.
  ///
  /// In zh, this message translates to:
  /// **'还没连上「{name}」'**
  String shellHostNotConnected(String name);

  /// No description provided for @shellSearchAfterConnecting.
  ///
  /// In zh, this message translates to:
  /// **'连接后才能搜索'**
  String get shellSearchAfterConnecting;

  /// No description provided for @shellChatsLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'对话列表加载失败'**
  String get shellChatsLoadFailed;

  /// No description provided for @shellSearchHostChats.
  ///
  /// In zh, this message translates to:
  /// **'搜索「{name}」上的对话'**
  String shellSearchHostChats(String name);

  /// No description provided for @shellSearchTitlesHint.
  ///
  /// In zh, this message translates to:
  /// **'按标题查找，含已归档的对话'**
  String get shellSearchTitlesHint;

  /// No description provided for @shellSearchContentHint.
  ///
  /// In zh, this message translates to:
  /// **'按标题和内容查找，含已归档的对话'**
  String get shellSearchContentHint;

  /// No description provided for @shellLoadingChatsEllipsis.
  ///
  /// In zh, this message translates to:
  /// **'正在加载对话…'**
  String get shellLoadingChatsEllipsis;

  /// No description provided for @shellNoMatchingChats.
  ///
  /// In zh, this message translates to:
  /// **'没有相关对话'**
  String get shellNoMatchingChats;

  /// No description provided for @shellSearchDifferentKeywords.
  ///
  /// In zh, this message translates to:
  /// **'换个关键词，或用空格分开多个词'**
  String get shellSearchDifferentKeywords;

  /// No description provided for @shellArchived.
  ///
  /// In zh, this message translates to:
  /// **'已归档'**
  String get shellArchived;

  /// No description provided for @shellRestoreBeforeOpening.
  ///
  /// In zh, this message translates to:
  /// **'已归档的对话需先恢复，才能打开'**
  String get shellRestoreBeforeOpening;

  /// No description provided for @shellRestoreAndOpen.
  ///
  /// In zh, this message translates to:
  /// **'恢复并打开'**
  String get shellRestoreAndOpen;

  /// No description provided for @shellRestoreFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能恢复，稍后再试'**
  String get shellRestoreFailed;

  /// No description provided for @shellSearchingMessages.
  ///
  /// In zh, this message translates to:
  /// **'正在搜索消息内容…'**
  String get shellSearchingMessages;

  /// No description provided for @shellHostTitleSearchOnly.
  ///
  /// In zh, this message translates to:
  /// **'这台主机仅支持按标题搜索'**
  String get shellHostTitleSearchOnly;

  /// No description provided for @shellContentSearchFailed.
  ///
  /// In zh, this message translates to:
  /// **'内容搜索失败，仅显示标题匹配'**
  String get shellContentSearchFailed;

  /// No description provided for @shellContentSearchLimit.
  ///
  /// In zh, this message translates to:
  /// **'内容匹配仅列出最相关的 20 个对话'**
  String get shellContentSearchLimit;

  /// No description provided for @shellMoveToOtherFolder.
  ///
  /// In zh, this message translates to:
  /// **'移到其他文件夹'**
  String get shellMoveToOtherFolder;

  /// No description provided for @shellArchiveStopsTurn.
  ///
  /// In zh, this message translates to:
  /// **'进行中的一轮会停止'**
  String get shellArchiveStopsTurn;

  /// No description provided for @shellRenameFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能重命名，稍后再试'**
  String get shellRenameFailed;

  /// No description provided for @shellChatStoppedArchived.
  ///
  /// In zh, this message translates to:
  /// **'已停止并归档「{title}」'**
  String shellChatStoppedArchived(String title);

  /// No description provided for @shellChatArchived.
  ///
  /// In zh, this message translates to:
  /// **'已归档「{title}」'**
  String shellChatArchived(String title);

  /// No description provided for @shellRenameChat.
  ///
  /// In zh, this message translates to:
  /// **'重命名对话'**
  String get shellRenameChat;

  /// No description provided for @shellChatTitle.
  ///
  /// In zh, this message translates to:
  /// **'对话标题'**
  String get shellChatTitle;

  /// No description provided for @shellUnreadCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条未读'**
  String shellUnreadCount(int count);

  /// No description provided for @shellLoadingChats.
  ///
  /// In zh, this message translates to:
  /// **'正在加载对话'**
  String get shellLoadingChats;

  /// No description provided for @shellWorkspaceNoChats.
  ///
  /// In zh, this message translates to:
  /// **'这里还没有对话'**
  String get shellWorkspaceNoChats;

  /// No description provided for @shellWorkspaceNewChatsHint.
  ///
  /// In zh, this message translates to:
  /// **'新对话会放进这个工作区。旧对话不会自动移入，可在「全部对话」中找到。'**
  String get shellWorkspaceNewChatsHint;

  /// No description provided for @shellNewChatsHint.
  ///
  /// In zh, this message translates to:
  /// **'新对话会出现在这里'**
  String get shellNewChatsHint;

  /// No description provided for @shellEngineStarting.
  ///
  /// In zh, this message translates to:
  /// **'引擎正在启动'**
  String get shellEngineStarting;

  /// No description provided for @shellChatsAfterStarting.
  ///
  /// In zh, this message translates to:
  /// **'启动后显示你的对话'**
  String get shellChatsAfterStarting;

  /// No description provided for @shellStartEngine.
  ///
  /// In zh, this message translates to:
  /// **'启动引擎'**
  String get shellStartEngine;

  /// No description provided for @shellEngineStatusHint.
  ///
  /// In zh, this message translates to:
  /// **'在「引擎」中查看状态'**
  String get shellEngineStatusHint;

  /// No description provided for @shellHostUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上「{name}」'**
  String shellHostUnreachable(String name);

  /// No description provided for @shellHostReconnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在重新连接「{name}」…'**
  String shellHostReconnecting(String name);

  /// No description provided for @shellRetryNow.
  ///
  /// In zh, this message translates to:
  /// **'立即重试'**
  String get shellRetryNow;

  /// No description provided for @shellHostConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接「{name}」…'**
  String shellHostConnecting(String name);

  /// No description provided for @shellHostChatsAfterConnecting.
  ///
  /// In zh, this message translates to:
  /// **'连接后显示这台主机上的对话'**
  String get shellHostChatsAfterConnecting;

  /// No description provided for @shellCurrentHostLabel.
  ///
  /// In zh, this message translates to:
  /// **'当前主机：{name}，{view}。切换主机'**
  String shellCurrentHostLabel(String name, String view);

  /// No description provided for @shellChatGone.
  ///
  /// In zh, this message translates to:
  /// **'这个对话已不在了'**
  String get shellChatGone;

  /// No description provided for @shellAccentMist.
  ///
  /// In zh, this message translates to:
  /// **'雾蓝'**
  String get shellAccentMist;

  /// No description provided for @shellAccentDaiqing.
  ///
  /// In zh, this message translates to:
  /// **'黛青'**
  String get shellAccentDaiqing;

  /// No description provided for @shellAccentDusk.
  ///
  /// In zh, this message translates to:
  /// **'暮紫'**
  String get shellAccentDusk;

  /// No description provided for @shellAccentTurquoise.
  ///
  /// In zh, this message translates to:
  /// **'松石'**
  String get shellAccentTurquoise;

  /// No description provided for @shellAccentAmber.
  ///
  /// In zh, this message translates to:
  /// **'琥珀'**
  String get shellAccentAmber;

  /// No description provided for @shellAccentGraphite.
  ///
  /// In zh, this message translates to:
  /// **'石墨'**
  String get shellAccentGraphite;

  /// No description provided for @shellHideTurnFooter.
  ///
  /// In zh, this message translates to:
  /// **'回合脚注'**
  String get shellHideTurnFooter;

  /// No description provided for @shellHideTokenCount.
  ///
  /// In zh, this message translates to:
  /// **'token 数'**
  String get shellHideTokenCount;

  /// No description provided for @shellHideReasoning.
  ///
  /// In zh, this message translates to:
  /// **'思考过程'**
  String get shellHideReasoning;

  /// No description provided for @shellHideActivityStrip.
  ///
  /// In zh, this message translates to:
  /// **'活动条'**
  String get shellHideActivityStrip;

  /// No description provided for @shellHideWhaleTail.
  ///
  /// In zh, this message translates to:
  /// **'鲸尾'**
  String get shellHideWhaleTail;

  /// No description provided for @shellHideTodoPill.
  ///
  /// In zh, this message translates to:
  /// **'待办条'**
  String get shellHideTodoPill;

  /// No description provided for @shellHideGoalBar.
  ///
  /// In zh, this message translates to:
  /// **'目标条'**
  String get shellHideGoalBar;

  /// No description provided for @shellToday.
  ///
  /// In zh, this message translates to:
  /// **'今天'**
  String get shellToday;

  /// No description provided for @shellThisWeek.
  ///
  /// In zh, this message translates to:
  /// **'本周'**
  String get shellThisWeek;

  /// No description provided for @shellEarlier.
  ///
  /// In zh, this message translates to:
  /// **'更早'**
  String get shellEarlier;

  /// No description provided for @shellSeatNative.
  ///
  /// In zh, this message translates to:
  /// **'原生'**
  String get shellSeatNative;

  /// No description provided for @shellSeatIsland.
  ///
  /// In zh, this message translates to:
  /// **'内嵌网页'**
  String get shellSeatIsland;

  /// No description provided for @shellSeatWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页版打开'**
  String get shellSeatWeb;

  /// No description provided for @shellPlugins.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get shellPlugins;

  /// No description provided for @shellHeaderActions.
  ///
  /// In zh, this message translates to:
  /// **'顶栏按钮'**
  String get shellHeaderActions;

  /// No description provided for @shellAllHidden.
  ///
  /// In zh, this message translates to:
  /// **'全部隐藏'**
  String get shellAllHidden;

  /// No description provided for @shellSettingCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个'**
  String shellSettingCount(int count);

  /// No description provided for @shellQuickActions.
  ///
  /// In zh, this message translates to:
  /// **'快捷胶囊'**
  String get shellQuickActions;

  /// No description provided for @shellSuggestionCards.
  ///
  /// In zh, this message translates to:
  /// **'建议卡片'**
  String get shellSuggestionCards;

  /// No description provided for @shellSuggestionCardCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 张'**
  String shellSuggestionCardCount(int count);

  /// No description provided for @shellDrawerGroups.
  ///
  /// In zh, this message translates to:
  /// **'抽屉分组'**
  String get shellDrawerGroups;

  /// No description provided for @shellDrawerSort.
  ///
  /// In zh, this message translates to:
  /// **'抽屉排序'**
  String get shellDrawerSort;

  /// No description provided for @shellDrawerFilter.
  ///
  /// In zh, this message translates to:
  /// **'抽屉筛选'**
  String get shellDrawerFilter;

  /// No description provided for @shellPending.
  ///
  /// In zh, this message translates to:
  /// **'待确认'**
  String get shellPending;

  /// No description provided for @shellAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get shellAll;

  /// No description provided for @shellDensity.
  ///
  /// In zh, this message translates to:
  /// **'疏密'**
  String get shellDensity;

  /// No description provided for @shellCompact.
  ///
  /// In zh, this message translates to:
  /// **'紧凑'**
  String get shellCompact;

  /// No description provided for @shellSpacious.
  ///
  /// In zh, this message translates to:
  /// **'宽松'**
  String get shellSpacious;

  /// No description provided for @shellThemeMode.
  ///
  /// In zh, this message translates to:
  /// **'外观模式'**
  String get shellThemeMode;

  /// No description provided for @shellAccentColor.
  ///
  /// In zh, this message translates to:
  /// **'强调色'**
  String get shellAccentColor;

  /// No description provided for @shellPet.
  ///
  /// In zh, this message translates to:
  /// **'宠物'**
  String get shellPet;

  /// No description provided for @shellConfigured.
  ///
  /// In zh, this message translates to:
  /// **'已设置'**
  String get shellConfigured;

  /// No description provided for @shellShortcuts.
  ///
  /// In zh, this message translates to:
  /// **'快捷键'**
  String get shellShortcuts;

  /// No description provided for @shellConfigFileTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'文件超过 64 KiB'**
  String get shellConfigFileTooLarge;

  /// No description provided for @shellConfigRootNotObject.
  ///
  /// In zh, this message translates to:
  /// **'顶层必须是对象'**
  String get shellConfigRootNotObject;

  /// No description provided for @shellConfigVersionMissing.
  ///
  /// In zh, this message translates to:
  /// **'缺少 version'**
  String get shellConfigVersionMissing;

  /// No description provided for @shellConfigVersionNotInt.
  ///
  /// In zh, this message translates to:
  /// **'version 必须是整数'**
  String get shellConfigVersionNotInt;

  /// No description provided for @shellConfigVersionTooLow.
  ///
  /// In zh, this message translates to:
  /// **'version 从 1 开始'**
  String get shellConfigVersionTooLow;

  /// No description provided for @shellConfigVersionTooHigh.
  ///
  /// In zh, this message translates to:
  /// **'需要更新 App 才能使用版本 {version}'**
  String shellConfigVersionTooHigh(int version);

  /// No description provided for @shellConfigNotObject.
  ///
  /// In zh, this message translates to:
  /// **'应该是对象'**
  String get shellConfigNotObject;

  /// No description provided for @shellConfigNotArray.
  ///
  /// In zh, this message translates to:
  /// **'应该是数组'**
  String get shellConfigNotArray;

  /// No description provided for @shellConfigNotString.
  ///
  /// In zh, this message translates to:
  /// **'应该是字符串'**
  String get shellConfigNotString;

  /// No description provided for @shellConfigNotBool.
  ///
  /// In zh, this message translates to:
  /// **'应该是 true 或 false'**
  String get shellConfigNotBool;

  /// No description provided for @shellConfigEmpty.
  ///
  /// In zh, this message translates to:
  /// **'不能为空'**
  String get shellConfigEmpty;

  /// No description provided for @shellConfigUnknownKey.
  ///
  /// In zh, this message translates to:
  /// **'未知的键，已忽略'**
  String get shellConfigUnknownKey;

  /// No description provided for @shellConfigDuplicateKey.
  ///
  /// In zh, this message translates to:
  /// **'重复的键，只认最后一个'**
  String get shellConfigDuplicateKey;

  /// No description provided for @shellConfigDuplicateItem.
  ///
  /// In zh, this message translates to:
  /// **'重复了，已忽略'**
  String get shellConfigDuplicateItem;

  /// No description provided for @shellConfigMissing.
  ///
  /// In zh, this message translates to:
  /// **'缺少 {key}'**
  String shellConfigMissing(String key);

  /// No description provided for @shellConfigTruncated.
  ///
  /// In zh, this message translates to:
  /// **'超过 {count} 个字，已截断'**
  String shellConfigTruncated(int count);

  /// No description provided for @shellConfigTooLong.
  ///
  /// In zh, this message translates to:
  /// **'超过 {count} 个字'**
  String shellConfigTooLong(int count);

  /// No description provided for @shellConfigTooMany.
  ///
  /// In zh, this message translates to:
  /// **'最多 {count} 个，多出的已忽略'**
  String shellConfigTooMany(int count);

  /// No description provided for @shellConfigValueNoun.
  ///
  /// In zh, this message translates to:
  /// **'值'**
  String get shellConfigValueNoun;

  /// No description provided for @shellConfigUnsupportedValue.
  ///
  /// In zh, this message translates to:
  /// **'不支持的{noun}「{value}」'**
  String shellConfigUnsupportedValue(String noun, String value);

  /// No description provided for @shellConfigHeaderItem.
  ///
  /// In zh, this message translates to:
  /// **'应该是按钮 id 或对象'**
  String get shellConfigHeaderItem;

  /// No description provided for @shellConfigHeaderId.
  ///
  /// In zh, this message translates to:
  /// **'id 只能用字母、数字和 -，以小写字母开头'**
  String get shellConfigHeaderId;

  /// No description provided for @shellConfigIdTaken.
  ///
  /// In zh, this message translates to:
  /// **'id 重复'**
  String get shellConfigIdTaken;

  /// No description provided for @shellConfigCommandSlash.
  ///
  /// In zh, this message translates to:
  /// **'命令名不带 /，已去掉'**
  String get shellConfigCommandSlash;

  /// No description provided for @shellConfigCommandName.
  ///
  /// In zh, this message translates to:
  /// **'命令名只能用字母、数字和 : . _ -'**
  String get shellConfigCommandName;

  /// No description provided for @shellConfigNoNewline.
  ///
  /// In zh, this message translates to:
  /// **'不能换行'**
  String get shellConfigNoNewline;

  /// No description provided for @shellConfigHttpsOnly.
  ///
  /// In zh, this message translates to:
  /// **'只支持 https 链接'**
  String get shellConfigHttpsOnly;

  /// No description provided for @shellConfigBadUrl.
  ///
  /// In zh, this message translates to:
  /// **'链接格式不对'**
  String get shellConfigBadUrl;

  /// No description provided for @shellConfigAccentFormat.
  ///
  /// In zh, this message translates to:
  /// **'颜色要写成 #RRGGBB'**
  String get shellConfigAccentFormat;

  /// No description provided for @shellConfigAccentBoth.
  ///
  /// In zh, this message translates to:
  /// **'和 accentPreset 二选一，已用 accentPreset'**
  String get shellConfigAccentBoth;

  /// No description provided for @shellConfigPetId.
  ///
  /// In zh, this message translates to:
  /// **'id 只能用小写字母、数字和 -'**
  String get shellConfigPetId;

  /// No description provided for @shellConfigKeysFormat.
  ///
  /// In zh, this message translates to:
  /// **'写法不对，例如 ctrl+k'**
  String get shellConfigKeysFormat;

  /// No description provided for @shellConfigSystemKey.
  ///
  /// In zh, this message translates to:
  /// **'不能用系统键'**
  String get shellConfigSystemKey;

  /// No description provided for @shellConfigNeedModifier.
  ///
  /// In zh, this message translates to:
  /// **'要带 ctrl 或 alt'**
  String get shellConfigNeedModifier;

  /// No description provided for @shellConfigReservedKey.
  ///
  /// In zh, this message translates to:
  /// **'被系统或输入法占用'**
  String get shellConfigReservedKey;

  /// No description provided for @shellConfigDuplicateShortcut.
  ///
  /// In zh, this message translates to:
  /// **'和 {pointer} 重复'**
  String shellConfigDuplicateShortcut(String pointer);

  /// No description provided for @shellConfigSlotName.
  ///
  /// In zh, this message translates to:
  /// **'slot 名格式不对'**
  String get shellConfigSlotName;

  /// No description provided for @shellConfigUnknownSlot.
  ///
  /// In zh, this message translates to:
  /// **'当前 DSH 没有这个 slot，先保留'**
  String get shellConfigUnknownSlot;

  /// No description provided for @shellConfigUnseatableSlot.
  ///
  /// In zh, this message translates to:
  /// **'这个位置不放插件'**
  String get shellConfigUnseatableSlot;

  /// No description provided for @shellConfigPackageName.
  ///
  /// In zh, this message translates to:
  /// **'包名格式不对'**
  String get shellConfigPackageName;

  /// No description provided for @shellConfigActionNoun.
  ///
  /// In zh, this message translates to:
  /// **'动作'**
  String get shellConfigActionNoun;

  /// No description provided for @shellConfigPageNoun.
  ///
  /// In zh, this message translates to:
  /// **'页面'**
  String get shellConfigPageNoun;

  /// No description provided for @shellConfigButtonNoun.
  ///
  /// In zh, this message translates to:
  /// **'按钮'**
  String get shellConfigButtonNoun;

  /// No description provided for @shellConfigIconNoun.
  ///
  /// In zh, this message translates to:
  /// **'图标'**
  String get shellConfigIconNoun;

  /// No description provided for @shellConfigNotTextFile.
  ///
  /// In zh, this message translates to:
  /// **'不是文本文件'**
  String get shellConfigNotTextFile;

  /// No description provided for @shellJsonPosition.
  ///
  /// In zh, this message translates to:
  /// **'第 {line} 行第 {column} 列：{reason}'**
  String shellJsonPosition(int line, int column, String reason);

  /// No description provided for @shellJsonEmptyFile.
  ///
  /// In zh, this message translates to:
  /// **'文件是空的'**
  String get shellJsonEmptyFile;

  /// No description provided for @shellJsonExtraContent.
  ///
  /// In zh, this message translates to:
  /// **'后面还有多余的内容'**
  String get shellJsonExtraContent;

  /// No description provided for @shellJsonIncompleteFile.
  ///
  /// In zh, this message translates to:
  /// **'文件不完整'**
  String get shellJsonIncompleteFile;

  /// No description provided for @shellJsonCommentsUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'不支持注释'**
  String get shellJsonCommentsUnsupported;

  /// No description provided for @shellJsonDoubleQuotes.
  ///
  /// In zh, this message translates to:
  /// **'字符串要用双引号'**
  String get shellJsonDoubleQuotes;

  /// No description provided for @shellJsonMissingValue.
  ///
  /// In zh, this message translates to:
  /// **'这里缺少一个值'**
  String get shellJsonMissingValue;

  /// No description provided for @shellJsonUnknownContent.
  ///
  /// In zh, this message translates to:
  /// **'无法识别的内容「{value}」'**
  String shellJsonUnknownContent(String value);

  /// No description provided for @shellJsonTooDeep.
  ///
  /// In zh, this message translates to:
  /// **'嵌套太深'**
  String get shellJsonTooDeep;

  /// No description provided for @shellJsonExtraComma.
  ///
  /// In zh, this message translates to:
  /// **'多余的逗号'**
  String get shellJsonExtraComma;

  /// No description provided for @shellJsonQuotedKey.
  ///
  /// In zh, this message translates to:
  /// **'键要用双引号括起来'**
  String get shellJsonQuotedKey;

  /// No description provided for @shellJsonExpectedKey.
  ///
  /// In zh, this message translates to:
  /// **'这里应该是一个键'**
  String get shellJsonExpectedKey;

  /// No description provided for @shellJsonMissingColon.
  ///
  /// In zh, this message translates to:
  /// **'键后面缺少冒号'**
  String get shellJsonMissingColon;

  /// No description provided for @shellJsonMissingComma.
  ///
  /// In zh, this message translates to:
  /// **'这里缺少逗号'**
  String get shellJsonMissingComma;

  /// No description provided for @shellJsonUnexpectedContent.
  ///
  /// In zh, this message translates to:
  /// **'这里不应该出现「{value}」'**
  String shellJsonUnexpectedContent(String value);

  /// No description provided for @shellJsonUnterminatedString.
  ///
  /// In zh, this message translates to:
  /// **'字符串没有结束'**
  String get shellJsonUnterminatedString;

  /// No description provided for @shellJsonBadEscape.
  ///
  /// In zh, this message translates to:
  /// **'字符串里的转义不对'**
  String get shellJsonBadEscape;

  /// No description provided for @shellJsonStringNewline.
  ///
  /// In zh, this message translates to:
  /// **'字符串里不能直接换行'**
  String get shellJsonStringNewline;

  /// No description provided for @shellJsonControlCharacter.
  ///
  /// In zh, this message translates to:
  /// **'字符串里有控制字符'**
  String get shellJsonControlCharacter;

  /// No description provided for @shellJsonBadNumber.
  ///
  /// In zh, this message translates to:
  /// **'数字格式不对'**
  String get shellJsonBadNumber;

  /// No description provided for @shellSkillInstallPrompt.
  ///
  /// In zh, this message translates to:
  /// **'请在这台主机上安装 DSH Go 的界面技能 {skill}：'**
  String shellSkillInstallPrompt(String skill);

  /// No description provided for @shellSkillInstallDirectory.
  ///
  /// In zh, this message translates to:
  /// **'1. 目标目录是 `\$DSH_HOME/skills/{skill}/`（没有设置 DSH_HOME 时是 `~/.dsh/skills/{skill}/`），不存在就先建。'**
  String shellSkillInstallDirectory(String skill);

  /// No description provided for @shellSkillInstallFiles.
  ///
  /// In zh, this message translates to:
  /// **'2. 把下面每个文件按给出的相对路径原样写进去，内容一个字都不要改。'**
  String get shellSkillInstallFiles;

  /// No description provided for @shellSkillInstallConfirm.
  ///
  /// In zh, this message translates to:
  /// **'4. 告诉我装好了。'**
  String get shellSkillInstallConfirm;

  /// No description provided for @shellSkillInstallFile.
  ///
  /// In zh, this message translates to:
  /// **'文件 `{path}`：'**
  String shellSkillInstallFile(String path);

  /// No description provided for @shellFromUiJson.
  ///
  /// In zh, this message translates to:
  /// **'来自 ui.json'**
  String get shellFromUiJson;

  /// No description provided for @shellViewSource.
  ///
  /// In zh, this message translates to:
  /// **'查看来源'**
  String get shellViewSource;

  /// No description provided for @shellSourcePosition.
  ///
  /// In zh, this message translates to:
  /// **'位置'**
  String get shellSourcePosition;

  /// No description provided for @shellRestoreDefaults.
  ///
  /// In zh, this message translates to:
  /// **'恢复默认'**
  String get shellRestoreDefaults;

  /// No description provided for @shellConfigNotApplied.
  ///
  /// In zh, this message translates to:
  /// **'没有生效'**
  String get shellConfigNotApplied;

  /// No description provided for @shellConfigDroppedCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 处没生效'**
  String shellConfigDroppedCount(int count);

  /// No description provided for @shellConfigAppliedCount.
  ///
  /// In zh, this message translates to:
  /// **'已应用 {count} 项'**
  String shellConfigAppliedCount(int count);

  /// No description provided for @shellInterfaceConfig.
  ///
  /// In zh, this message translates to:
  /// **'界面配置'**
  String get shellInterfaceConfig;

  /// No description provided for @shellSkillNotInstalled.
  ///
  /// In zh, this message translates to:
  /// **'未安装技能'**
  String get shellSkillNotInstalled;

  /// No description provided for @shellInstallInterfaceSkill.
  ///
  /// In zh, this message translates to:
  /// **'安装界面技能'**
  String get shellInstallInterfaceSkill;

  /// No description provided for @shellInstallInterfaceSkillMessage.
  ///
  /// In zh, this message translates to:
  /// **'装好后，可以让 AI 按你的话调整 App 界面'**
  String get shellInstallInterfaceSkillMessage;

  /// No description provided for @shellNoUiJson.
  ///
  /// In zh, this message translates to:
  /// **'没有 ui.json'**
  String get shellNoUiJson;

  /// No description provided for @shellConfigUsingPrevious.
  ///
  /// In zh, this message translates to:
  /// **'没有生效，仍在用上一次的配置'**
  String get shellConfigUsingPrevious;

  /// No description provided for @shellConfigDroppedHeading.
  ///
  /// In zh, this message translates to:
  /// **'没生效'**
  String get shellConfigDroppedHeading;

  /// No description provided for @shellConfigNotesHeading.
  ///
  /// In zh, this message translates to:
  /// **'提示'**
  String get shellConfigNotesHeading;

  /// No description provided for @shellConfigAppliedHeading.
  ///
  /// In zh, this message translates to:
  /// **'已应用'**
  String get shellConfigAppliedHeading;

  /// No description provided for @shellConfigValueOptions.
  ///
  /// In zh, this message translates to:
  /// **'不支持的{noun}「{value}」，可选：{options}'**
  String shellConfigValueOptions(String noun, String value, String options);

  /// No description provided for @shellListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get shellListSeparator;

  /// No description provided for @shellSkillInstallCheck.
  ///
  /// In zh, this message translates to:
  /// **'3. 写完运行 {command}，能运行就说明装好了（提示还没有 ui.json 是正常的）。'**
  String shellSkillInstallCheck(String command);

  /// No description provided for @shellSemanticsSeparator.
  ///
  /// In zh, this message translates to:
  /// **'，'**
  String get shellSemanticsSeparator;

  /// No description provided for @shellChatsArchivedPartial.
  ///
  /// In zh, this message translates to:
  /// **'已归档 {count} 个对话，{failed} 个没能归档'**
  String shellChatsArchivedPartial(int count, int failed);

  /// The star prompt's first line. hours is the whole hours of use so far, rounded down; 0 is half an hour (the first ask comes after 30 minutes). The word joiner keeps the ~ on the line of the word before it.
  ///
  /// In zh, this message translates to:
  /// **'{hours, plural, =0{本鱼已经在 DSH Go 里陪你半个小时啦⁠~} =1{本鱼已经在 DSH Go 里陪你一个小时啦⁠~} other{本鱼已经在 DSH Go 里陪你 {hours} 个小时啦⁠~}}'**
  String starPromptTitle(int hours);

  /// No description provided for @starPromptBody.
  ///
  /// In zh, this message translates to:
  /// **'这是一个免费开源的项目，如果它让你的移动端体验更好了一点，拜托点个 Star 支持一下，这对本鱼是很大的鼓励！'**
  String get starPromptBody;

  /// No description provided for @starPromptPlea.
  ///
  /// In zh, this message translates to:
  /// **'拜托你啦~ 这真的很重要！！'**
  String get starPromptPlea;

  /// No description provided for @starPromptStar.
  ///
  /// In zh, this message translates to:
  /// **'去 GitHub 点 Star'**
  String get starPromptStar;

  /// No description provided for @starPromptDone.
  ///
  /// In zh, this message translates to:
  /// **'已经点过啦'**
  String get starPromptDone;

  /// No description provided for @starPromptLater.
  ///
  /// In zh, this message translates to:
  /// **'下次再说'**
  String get starPromptLater;

  /// No description provided for @starSettingsTitle.
  ///
  /// In zh, this message translates to:
  /// **'给 DSH Go 点个 star'**
  String get starSettingsTitle;

  /// No description provided for @stateDiagnosticsSubject.
  ///
  /// In zh, this message translates to:
  /// **'DSH Go 诊断包'**
  String get stateDiagnosticsSubject;

  /// No description provided for @stateStoragePermission.
  ///
  /// In zh, this message translates to:
  /// **'没有存储权限，存不进「下载」'**
  String get stateStoragePermission;

  /// No description provided for @stateDiagnosticsStorageFull.
  ///
  /// In zh, this message translates to:
  /// **'存储空间不足，没能生成诊断包'**
  String get stateDiagnosticsStorageFull;

  /// No description provided for @stateDiagnosticsExportFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能导出诊断包'**
  String get stateDiagnosticsExportFailed;

  /// No description provided for @stateForumUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上论坛'**
  String get stateForumUnreachable;

  /// No description provided for @stateSignInExpired.
  ///
  /// In zh, this message translates to:
  /// **'登录已失效，请重新登录'**
  String get stateSignInExpired;

  /// No description provided for @stateForbidden.
  ///
  /// In zh, this message translates to:
  /// **'没有权限'**
  String get stateForbidden;

  /// No description provided for @stateForumContentMissing.
  ///
  /// In zh, this message translates to:
  /// **'内容不存在或已删除'**
  String get stateForumContentMissing;

  /// No description provided for @stateTooManyActions.
  ///
  /// In zh, this message translates to:
  /// **'操作太频繁，稍后再试'**
  String get stateTooManyActions;

  /// No description provided for @stateForumSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能发出去'**
  String get stateForumSendFailed;

  /// No description provided for @stateForumServerError.
  ///
  /// In zh, this message translates to:
  /// **'论坛暂时出了问题'**
  String get stateForumServerError;

  /// No description provided for @stateBrowserOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器'**
  String get stateBrowserOpenFailed;

  /// No description provided for @stateSignInStartFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能开始登录'**
  String get stateSignInStartFailed;

  /// No description provided for @stateSignInIncompleteRetry.
  ///
  /// In zh, this message translates to:
  /// **'登录没有完成，请重试'**
  String get stateSignInIncompleteRetry;

  /// No description provided for @statePluginLabel.
  ///
  /// In zh, this message translates to:
  /// **'插件'**
  String get statePluginLabel;

  /// No description provided for @stateConfigLabel.
  ///
  /// In zh, this message translates to:
  /// **'配置'**
  String get stateConfigLabel;

  /// No description provided for @stateConfigShare.
  ///
  /// In zh, this message translates to:
  /// **'配置分享'**
  String get stateConfigShare;

  /// No description provided for @stateShareCode.
  ///
  /// In zh, this message translates to:
  /// **'分享码'**
  String get stateShareCode;

  /// No description provided for @stateCopyShareCodeFirst.
  ///
  /// In zh, this message translates to:
  /// **'先在分享里复制分享码'**
  String get stateCopyShareCodeFirst;

  /// No description provided for @stateFileOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法打开这个文件'**
  String get stateFileOpenFailed;

  /// No description provided for @stateLinkOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法打开这个链接'**
  String get stateLinkOpenFailed;

  /// No description provided for @stateAlertPublicDone.
  ///
  /// In zh, this message translates to:
  /// **'有一轮完成了'**
  String get stateAlertPublicDone;

  /// No description provided for @stateAlertPublicFailed.
  ///
  /// In zh, this message translates to:
  /// **'有一轮出错了'**
  String get stateAlertPublicFailed;

  /// No description provided for @stateAlertPublicStopped.
  ///
  /// In zh, this message translates to:
  /// **'有一轮停下了'**
  String get stateAlertPublicStopped;

  /// No description provided for @stateAlertPublicApproval.
  ///
  /// In zh, this message translates to:
  /// **'有一步等你确认'**
  String get stateAlertPublicApproval;

  /// No description provided for @stateAlertPublicQuestion.
  ///
  /// In zh, this message translates to:
  /// **'有个问题等你回答'**
  String get stateAlertPublicQuestion;

  /// No description provided for @stateAlertTurnDone.
  ///
  /// In zh, this message translates to:
  /// **'这一轮已完成'**
  String get stateAlertTurnDone;

  /// No description provided for @stateAlertOutputLimit.
  ///
  /// In zh, this message translates to:
  /// **'已结束 · 达到单次输出长度上限'**
  String get stateAlertOutputLimit;

  /// No description provided for @stateAlertTurnBlocked.
  ///
  /// In zh, this message translates to:
  /// **'这一轮被拦截了'**
  String get stateAlertTurnBlocked;

  /// No description provided for @stateAlertEngineRestarted.
  ///
  /// In zh, this message translates to:
  /// **'已中断 · 引擎重启过'**
  String get stateAlertEngineRestarted;

  /// No description provided for @stateAlertMissingKey.
  ///
  /// In zh, this message translates to:
  /// **'出错了 · 还没有配置密钥'**
  String get stateAlertMissingKey;

  /// No description provided for @stateAlertTurnFailed.
  ///
  /// In zh, this message translates to:
  /// **'这一轮出错了'**
  String get stateAlertTurnFailed;

  /// No description provided for @stateRunCommand.
  ///
  /// In zh, this message translates to:
  /// **'运行命令'**
  String get stateRunCommand;

  /// No description provided for @stateWriteFile.
  ///
  /// In zh, this message translates to:
  /// **'写入文件'**
  String get stateWriteFile;

  /// No description provided for @stateEditFile.
  ///
  /// In zh, this message translates to:
  /// **'修改文件'**
  String get stateEditFile;

  /// No description provided for @stateOpenPage.
  ///
  /// In zh, this message translates to:
  /// **'打开网页'**
  String get stateOpenPage;

  /// No description provided for @stateWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get stateWebSearch;

  /// No description provided for @stateAlertQuestion.
  ///
  /// In zh, this message translates to:
  /// **'问你一个问题'**
  String get stateAlertQuestion;

  /// No description provided for @stateSizeSmall.
  ///
  /// In zh, this message translates to:
  /// **'小'**
  String get stateSizeSmall;

  /// No description provided for @stateSizeStandard.
  ///
  /// In zh, this message translates to:
  /// **'标准'**
  String get stateSizeStandard;

  /// No description provided for @stateSizeLarge.
  ///
  /// In zh, this message translates to:
  /// **'大'**
  String get stateSizeLarge;

  /// No description provided for @statePetDone.
  ///
  /// In zh, this message translates to:
  /// **'做完了'**
  String get statePetDone;

  /// No description provided for @statePetFailed.
  ///
  /// In zh, this message translates to:
  /// **'出错了'**
  String get statePetFailed;

  /// No description provided for @statePhoneNotReady.
  ///
  /// In zh, this message translates to:
  /// **'手机操控模块未就绪'**
  String get statePhoneNotReady;

  /// No description provided for @stateBackgroundRestricted.
  ///
  /// In zh, this message translates to:
  /// **'后台联网被系统限制'**
  String get stateBackgroundRestricted;

  /// No description provided for @stateBackgroundFinish.
  ///
  /// In zh, this message translates to:
  /// **'让对话在后台也能跑完'**
  String get stateBackgroundFinish;

  /// No description provided for @stateDeepSeekAccount.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 账号'**
  String get stateDeepSeekAccount;

  /// No description provided for @stateAccountUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上 DeepSeek'**
  String get stateAccountUnreachable;

  /// No description provided for @stateAccountUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 暂时无法登录'**
  String get stateAccountUnavailable;

  /// No description provided for @stateSignInIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'登录没有完成'**
  String get stateSignInIncomplete;

  /// No description provided for @stateSignInTimeout.
  ///
  /// In zh, this message translates to:
  /// **'登录超时'**
  String get stateSignInTimeout;

  /// No description provided for @stateSignInSaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'登录信息没能保存'**
  String get stateSignInSaveFailed;

  /// No description provided for @stateEngineNotReady.
  ///
  /// In zh, this message translates to:
  /// **'引擎还没准备好'**
  String get stateEngineNotReady;

  /// No description provided for @stateSignInInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'登录被中断'**
  String get stateSignInInterrupted;

  /// No description provided for @stateAccountUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持账号登录'**
  String get stateAccountUnsupported;

  /// No description provided for @stateCheckPhoneNetwork.
  ///
  /// In zh, this message translates to:
  /// **'检查手机网络后重试'**
  String get stateCheckPhoneNetwork;

  /// No description provided for @stateServiceUnavailableRetry.
  ///
  /// In zh, this message translates to:
  /// **'服务暂时不可用，稍后重试'**
  String get stateServiceUnavailableRetry;

  /// No description provided for @stateAuthorizationFailed.
  ///
  /// In zh, this message translates to:
  /// **'授权没有成功，重新登录'**
  String get stateAuthorizationFailed;

  /// No description provided for @stateAuthorizationExpired.
  ///
  /// In zh, this message translates to:
  /// **'授权页面已失效，重新登录'**
  String get stateAuthorizationExpired;

  /// No description provided for @stateRestartEngineRetry.
  ///
  /// In zh, this message translates to:
  /// **'在「引擎」页重启后重试'**
  String get stateRestartEngineRetry;

  /// No description provided for @stateEngineStartingRetry.
  ///
  /// In zh, this message translates to:
  /// **'引擎正在启动，稍后再试'**
  String get stateEngineStartingRetry;

  /// No description provided for @stateEngineDisconnectedSignIn.
  ///
  /// In zh, this message translates to:
  /// **'引擎连接已断开，重新登录'**
  String get stateEngineDisconnectedSignIn;

  /// No description provided for @stateUpdateRuntimeOrKey.
  ///
  /// In zh, this message translates to:
  /// **'更新运行环境，或改用 API Key'**
  String get stateUpdateRuntimeOrKey;

  /// No description provided for @stateEngineDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'引擎未连接'**
  String get stateEngineDisconnected;

  /// No description provided for @stateAgentError.
  ///
  /// In zh, this message translates to:
  /// **'出错'**
  String get stateAgentError;

  /// No description provided for @stateNotRunning.
  ///
  /// In zh, this message translates to:
  /// **'未运行'**
  String get stateNotRunning;

  /// No description provided for @stateAgentOneShot.
  ///
  /// In zh, this message translates to:
  /// **'一次性'**
  String get stateAgentOneShot;

  /// No description provided for @stateAgentContinuable.
  ///
  /// In zh, this message translates to:
  /// **'可继续'**
  String get stateAgentContinuable;

  /// No description provided for @stateAgentExternal.
  ///
  /// In zh, this message translates to:
  /// **'外部任务'**
  String get stateAgentExternal;

  /// No description provided for @stateSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get stateSubagent;

  /// No description provided for @stateParentChat.
  ///
  /// In zh, this message translates to:
  /// **'上级对话'**
  String get stateParentChat;

  /// No description provided for @statePreparing.
  ///
  /// In zh, this message translates to:
  /// **'准备中'**
  String get statePreparing;

  /// No description provided for @stateIconMist.
  ///
  /// In zh, this message translates to:
  /// **'雾蓝'**
  String get stateIconMist;

  /// No description provided for @stateIconNight.
  ///
  /// In zh, this message translates to:
  /// **'夜幕'**
  String get stateIconNight;

  /// No description provided for @stateIconFrost.
  ///
  /// In zh, this message translates to:
  /// **'霜白'**
  String get stateIconFrost;

  /// No description provided for @stateIconInk.
  ///
  /// In zh, this message translates to:
  /// **'墨'**
  String get stateIconInk;

  /// No description provided for @stateAppDisclaimer.
  ///
  /// In zh, this message translates to:
  /// **'基于 DeepSeek Harness 构建 · 非 DeepSeek 官方应用'**
  String get stateAppDisclaimer;

  /// No description provided for @stateWallpaper.
  ///
  /// In zh, this message translates to:
  /// **'壁纸'**
  String get stateWallpaper;

  /// No description provided for @stateFileMissing.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个文件了，可能已被删除或移走'**
  String get stateFileMissing;

  /// No description provided for @stateFileNoApp.
  ///
  /// In zh, this message translates to:
  /// **'手机上没有能打开这类文件的应用'**
  String get stateFileNoApp;

  /// No description provided for @stateFileConnectionLimit.
  ///
  /// In zh, this message translates to:
  /// **'文件太大，这个连接传不过来'**
  String get stateFileConnectionLimit;

  /// No description provided for @stateFileReadUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'这个连接不支持读取文件'**
  String get stateFileReadUnsupported;

  /// No description provided for @stateArtifactImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get stateArtifactImage;

  /// No description provided for @stateArtifactDocument.
  ///
  /// In zh, this message translates to:
  /// **'文档'**
  String get stateArtifactDocument;

  /// No description provided for @stateArtifactSheet.
  ///
  /// In zh, this message translates to:
  /// **'表格'**
  String get stateArtifactSheet;

  /// No description provided for @stateArtifactSlides.
  ///
  /// In zh, this message translates to:
  /// **'演示文稿'**
  String get stateArtifactSlides;

  /// No description provided for @stateArtifactArchive.
  ///
  /// In zh, this message translates to:
  /// **'压缩包'**
  String get stateArtifactArchive;

  /// No description provided for @stateArtifactAudio.
  ///
  /// In zh, this message translates to:
  /// **'音频'**
  String get stateArtifactAudio;

  /// No description provided for @stateArtifactVideo.
  ///
  /// In zh, this message translates to:
  /// **'视频'**
  String get stateArtifactVideo;

  /// No description provided for @stateArtifactWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页'**
  String get stateArtifactWeb;

  /// No description provided for @stateArtifactText.
  ///
  /// In zh, this message translates to:
  /// **'文本'**
  String get stateArtifactText;

  /// No description provided for @stateArtifactFile.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get stateArtifactFile;

  /// No description provided for @statePrivateKeyTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'文件太大，不像是私钥'**
  String get statePrivateKeyTooLarge;

  /// No description provided for @stateBotTeamBusy.
  ///
  /// In zh, this message translates to:
  /// **'另一个 DSH 正在使用这个团队'**
  String get stateBotTeamBusy;

  /// No description provided for @stateBotOperationFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能完成操作，再试一次'**
  String get stateBotOperationFailed;

  /// No description provided for @stateBotMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台主机没有 DS Bot'**
  String get stateBotMissing;

  /// No description provided for @stateHostAuthFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能通过主机的验证'**
  String get stateHostAuthFailed;

  /// No description provided for @stateUnexpectedError.
  ///
  /// In zh, this message translates to:
  /// **'出了点问题'**
  String get stateUnexpectedError;

  /// No description provided for @stateGroupChat.
  ///
  /// In zh, this message translates to:
  /// **'群聊'**
  String get stateGroupChat;

  /// No description provided for @stateBotNewMessage.
  ///
  /// In zh, this message translates to:
  /// **'Bot 有新消息'**
  String get stateBotNewMessage;

  /// No description provided for @stateChatAgentBusy.
  ///
  /// In zh, this message translates to:
  /// **'AI 正忙，稍后再试'**
  String get stateChatAgentBusy;

  /// No description provided for @stateChatWriterHeld.
  ///
  /// In zh, this message translates to:
  /// **'这个对话正在别处使用'**
  String get stateChatWriterHeld;

  /// No description provided for @stateChatModelUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这个模型现在用不了'**
  String get stateChatModelUnavailable;

  /// No description provided for @stateChatAttachmentInvalid.
  ///
  /// In zh, this message translates to:
  /// **'这个附件发不了'**
  String get stateChatAttachmentInvalid;

  /// No description provided for @stateChatForkUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这里不能分叉'**
  String get stateChatForkUnavailable;

  /// No description provided for @stateChatImagesTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'图片太大，少选几张再发'**
  String get stateChatImagesTooLarge;

  /// No description provided for @stateChatSyncInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'对话同步中断'**
  String get stateChatSyncInterrupted;

  /// No description provided for @stateChatSynchronizing.
  ///
  /// In zh, this message translates to:
  /// **'正在同步对话'**
  String get stateChatSynchronizing;

  /// No description provided for @stateChatSyncRetry.
  ///
  /// In zh, this message translates to:
  /// **'重新同步'**
  String get stateChatSyncRetry;

  /// No description provided for @stateChatSyncRequired.
  ///
  /// In zh, this message translates to:
  /// **'对话尚未同步，请重新同步后再试'**
  String get stateChatSyncRequired;

  /// No description provided for @stateChatAutoApproveFailed.
  ///
  /// In zh, this message translates to:
  /// **'自动允许失败'**
  String get stateChatAutoApproveFailed;

  /// No description provided for @stateCommandMissing.
  ///
  /// In zh, this message translates to:
  /// **'没有这个指令'**
  String get stateCommandMissing;

  /// No description provided for @stateCommandFailed.
  ///
  /// In zh, this message translates to:
  /// **'指令没有执行'**
  String get stateCommandFailed;

  /// No description provided for @stateChatStopSteered.
  ///
  /// In zh, this message translates to:
  /// **'没能停下本轮，已作为插话发送'**
  String get stateChatStopSteered;

  /// No description provided for @stateChatTextOnlyModel.
  ///
  /// In zh, this message translates to:
  /// **'当前模型只能读文字，图片已作为文件发给 AI。想让 AI 直接看图，请换成 V4.1 Flash'**
  String get stateChatTextOnlyModel;

  /// No description provided for @stateAttachmentUploadFailed.
  ///
  /// In zh, this message translates to:
  /// **'附件上传失败'**
  String get stateAttachmentUploadFailed;

  /// No description provided for @stateChatImageModelRequired.
  ///
  /// In zh, this message translates to:
  /// **'当前模型看不了图片，换成 V4.1 Flash 再发'**
  String get stateChatImageModelRequired;

  /// No description provided for @stateSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'发送失败'**
  String get stateSendFailed;

  /// No description provided for @stateChatStopFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能停下，再试一次'**
  String get stateChatStopFailed;

  /// No description provided for @stateChatTurnEnded.
  ///
  /// In zh, this message translates to:
  /// **'这一轮已经结束，消息会作为新一轮发送'**
  String get stateChatTurnEnded;

  /// No description provided for @stateChatSteerFailed.
  ///
  /// In zh, this message translates to:
  /// **'插话失败'**
  String get stateChatSteerFailed;

  /// No description provided for @stateChatUndoTooLate.
  ///
  /// In zh, this message translates to:
  /// **'来不及了，AI 已经读到这条消息'**
  String get stateChatUndoTooLate;

  /// No description provided for @stateChatUndoFailed.
  ///
  /// In zh, this message translates to:
  /// **'撤回失败'**
  String get stateChatUndoFailed;

  /// No description provided for @stateChatApprovalFailed.
  ///
  /// In zh, this message translates to:
  /// **'审批提交失败'**
  String get stateChatApprovalFailed;

  /// No description provided for @stateChatAnswerFailed.
  ///
  /// In zh, this message translates to:
  /// **'回答提交失败'**
  String get stateChatAnswerFailed;

  /// No description provided for @stateChatModelSwitchFailed.
  ///
  /// In zh, this message translates to:
  /// **'切换模型失败'**
  String get stateChatModelSwitchFailed;

  /// No description provided for @stateChatHistoryFailed.
  ///
  /// In zh, this message translates to:
  /// **'加载历史失败'**
  String get stateChatHistoryFailed;

  /// No description provided for @stateChatBranchLastReply.
  ///
  /// In zh, this message translates to:
  /// **'只能从已完成的一轮的最后一条回复分叉'**
  String get stateChatBranchLastReply;

  /// No description provided for @stateChatBranchFailed.
  ///
  /// In zh, this message translates to:
  /// **'分叉失败'**
  String get stateChatBranchFailed;

  /// No description provided for @stateChatEarlierHistoryFailed.
  ///
  /// In zh, this message translates to:
  /// **'读取更早的记录失败'**
  String get stateChatEarlierHistoryFailed;

  /// No description provided for @stateChatNoEarlierHistory.
  ///
  /// In zh, this message translates to:
  /// **'这条消息之前没有能保留的记录，直接新建对话就好'**
  String get stateChatNoEarlierHistory;

  /// No description provided for @stateCommandNewDescription.
  ///
  /// In zh, this message translates to:
  /// **'开始一个新对话'**
  String get stateCommandNewDescription;

  /// No description provided for @stateModelLabel.
  ///
  /// In zh, this message translates to:
  /// **'模型'**
  String get stateModelLabel;

  /// No description provided for @stateCommandModelDescription.
  ///
  /// In zh, this message translates to:
  /// **'切换模型与思考深度'**
  String get stateCommandModelDescription;

  /// No description provided for @stateCommandExportLabel.
  ///
  /// In zh, this message translates to:
  /// **'导出日志'**
  String get stateCommandExportLabel;

  /// No description provided for @stateCommandExportDescription.
  ///
  /// In zh, this message translates to:
  /// **'把这个对话的完整记录打包成 ZIP，分享或存到「下载」'**
  String get stateCommandExportDescription;

  /// No description provided for @stateAllFeatures.
  ///
  /// In zh, this message translates to:
  /// **'全部功能'**
  String get stateAllFeatures;

  /// No description provided for @stateCommandFeaturesDescription.
  ///
  /// In zh, this message translates to:
  /// **'官方网页版每项功能的入口'**
  String get stateCommandFeaturesDescription;

  /// No description provided for @stateCompactLabel.
  ///
  /// In zh, this message translates to:
  /// **'压缩'**
  String get stateCompactLabel;

  /// No description provided for @stateCommandCompactDescription.
  ///
  /// In zh, this message translates to:
  /// **'压缩以上对话内容，腾出上下文'**
  String get stateCommandCompactDescription;

  /// No description provided for @statePermissionLabel.
  ///
  /// In zh, this message translates to:
  /// **'权限'**
  String get statePermissionLabel;

  /// No description provided for @stateCommandPermissionDescription.
  ///
  /// In zh, this message translates to:
  /// **'切换权限预设（沙箱模式与审批策略）'**
  String get stateCommandPermissionDescription;

  /// No description provided for @stateCommandPermissionHint.
  ///
  /// In zh, this message translates to:
  /// **'<预设名>'**
  String get stateCommandPermissionHint;

  /// No description provided for @statePlanLabel.
  ///
  /// In zh, this message translates to:
  /// **'计划'**
  String get statePlanLabel;

  /// No description provided for @stateCommandPlanDescription.
  ///
  /// In zh, this message translates to:
  /// **'进入或退出计划模式'**
  String get stateCommandPlanDescription;

  /// No description provided for @stateGoalLabel.
  ///
  /// In zh, this message translates to:
  /// **'目标'**
  String get stateGoalLabel;

  /// No description provided for @stateCommandGoalDescription.
  ///
  /// In zh, this message translates to:
  /// **'设置或查看长期任务目标'**
  String get stateCommandGoalDescription;

  /// No description provided for @stateFeedbackLabel.
  ///
  /// In zh, this message translates to:
  /// **'反馈'**
  String get stateFeedbackLabel;

  /// No description provided for @stateCommandFeedbackDescription.
  ///
  /// In zh, this message translates to:
  /// **'发送关于当前对话的反馈'**
  String get stateCommandFeedbackDescription;

  /// No description provided for @stateCommandFeedbackHint.
  ///
  /// In zh, this message translates to:
  /// **'<内容>'**
  String get stateCommandFeedbackHint;

  /// No description provided for @stateShareFileTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'有文件太大，未添加'**
  String get stateShareFileTooLarge;

  /// No description provided for @stateShareFileUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'有文件没能读取'**
  String get stateShareFileUnreadable;

  /// No description provided for @stateShareImagesOnly.
  ///
  /// In zh, this message translates to:
  /// **'当前主机只能发送图片'**
  String get stateShareImagesOnly;

  /// No description provided for @stateComposerInserted.
  ///
  /// In zh, this message translates to:
  /// **'已放进输入框'**
  String get stateComposerInserted;

  /// No description provided for @stateCordisPending.
  ///
  /// In zh, this message translates to:
  /// **'待确认'**
  String get stateCordisPending;

  /// No description provided for @stateCordisStarting.
  ///
  /// In zh, this message translates to:
  /// **'启动中'**
  String get stateCordisStarting;

  /// No description provided for @stateCordisRunFailed.
  ///
  /// In zh, this message translates to:
  /// **'运行失败'**
  String get stateCordisRunFailed;

  /// No description provided for @stateCordisNoApproval.
  ///
  /// In zh, this message translates to:
  /// **'没有获得运行许可'**
  String get stateCordisNoApproval;

  /// No description provided for @stateCordisBackendFailed.
  ///
  /// In zh, this message translates to:
  /// **'后台部分没能启动'**
  String get stateCordisBackendFailed;

  /// No description provided for @stateCordisClientLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'界面没能加载'**
  String get stateCordisClientLoadFailed;

  /// No description provided for @stateCordisRenderFailed.
  ///
  /// In zh, this message translates to:
  /// **'界面显示出错'**
  String get stateCordisRenderFailed;

  /// No description provided for @stateCordisFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能运行'**
  String get stateCordisFailed;

  /// No description provided for @stateDrawerAll.
  ///
  /// In zh, this message translates to:
  /// **'全部'**
  String get stateDrawerAll;

  /// No description provided for @stateDrawerUnread.
  ///
  /// In zh, this message translates to:
  /// **'未读'**
  String get stateDrawerUnread;

  /// No description provided for @stateDrawerToday.
  ///
  /// In zh, this message translates to:
  /// **'今天'**
  String get stateDrawerToday;

  /// No description provided for @stateDrawerThisWeek.
  ///
  /// In zh, this message translates to:
  /// **'本周'**
  String get stateDrawerThisWeek;

  /// No description provided for @stateDrawerEarlier.
  ///
  /// In zh, this message translates to:
  /// **'更早'**
  String get stateDrawerEarlier;

  /// No description provided for @stateEngineAuthFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能通过引擎的验证'**
  String get stateEngineAuthFailed;

  /// No description provided for @stateChatMissing.
  ///
  /// In zh, this message translates to:
  /// **'这个对话已经不在了'**
  String get stateChatMissing;

  /// No description provided for @stateEngineUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎版本不支持'**
  String get stateEngineUnsupported;

  /// No description provided for @stateSettingsRefreshed.
  ///
  /// In zh, this message translates to:
  /// **'刚在别处改过，已刷新'**
  String get stateSettingsRefreshed;

  /// No description provided for @stateCredentialFromEnvironment.
  ///
  /// In zh, this message translates to:
  /// **'引擎的启动环境已提供这个 Key，无法在这里修改'**
  String get stateCredentialFromEnvironment;

  /// No description provided for @stateSettingsFromFile.
  ///
  /// In zh, this message translates to:
  /// **'由配置文件固定'**
  String get stateSettingsFromFile;

  /// No description provided for @stateSettingsInteger.
  ///
  /// In zh, this message translates to:
  /// **'请填整数'**
  String get stateSettingsInteger;

  /// No description provided for @stateSettingsInvalidFormat.
  ///
  /// In zh, this message translates to:
  /// **'格式不对'**
  String get stateSettingsInvalidFormat;

  /// No description provided for @stateSettingsReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'引擎设置是只读的'**
  String get stateSettingsReadOnly;

  /// No description provided for @statePluginDisabled.
  ///
  /// In zh, this message translates to:
  /// **'插件已停用'**
  String get statePluginDisabled;

  /// No description provided for @stateSettingsRestartRequired.
  ///
  /// In zh, this message translates to:
  /// **'这一项要重启引擎才能改'**
  String get stateSettingsRestartRequired;

  /// No description provided for @stateSettingsInvalidValue.
  ///
  /// In zh, this message translates to:
  /// **'值不合法'**
  String get stateSettingsInvalidValue;

  /// No description provided for @stateSettingsRejected.
  ///
  /// In zh, this message translates to:
  /// **'引擎没有接受这个值'**
  String get stateSettingsRejected;

  /// No description provided for @stateInventoryEnabled.
  ///
  /// In zh, this message translates to:
  /// **'已启用'**
  String get stateInventoryEnabled;

  /// No description provided for @stateInventoryDisabled.
  ///
  /// In zh, this message translates to:
  /// **'未启用'**
  String get stateInventoryDisabled;

  /// No description provided for @stateLoading.
  ///
  /// In zh, this message translates to:
  /// **'加载中'**
  String get stateLoading;

  /// No description provided for @stateInventoryWaiting.
  ///
  /// In zh, this message translates to:
  /// **'等待依赖'**
  String get stateInventoryWaiting;

  /// No description provided for @stateInventoryConditional.
  ///
  /// In zh, this message translates to:
  /// **'条件启用'**
  String get stateInventoryConditional;

  /// No description provided for @stateBundleBuiltIn.
  ///
  /// In zh, this message translates to:
  /// **'DSH 内置'**
  String get stateBundleBuiltIn;

  /// No description provided for @stateBundleHeadless.
  ///
  /// In zh, this message translates to:
  /// **'无界面运行'**
  String get stateBundleHeadless;

  /// No description provided for @stateConfigFile.
  ///
  /// In zh, this message translates to:
  /// **'配置文件'**
  String get stateConfigFile;

  /// No description provided for @stateGoalEmpty.
  ///
  /// In zh, this message translates to:
  /// **'目标不能为空'**
  String get stateGoalEmpty;

  /// No description provided for @stateGoalPauseFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能暂停'**
  String get stateGoalPauseFailed;

  /// No description provided for @stateGoalResumeFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能恢复'**
  String get stateGoalResumeFailed;

  /// No description provided for @stateGoalClearOffline.
  ///
  /// In zh, this message translates to:
  /// **'没能清除：没能连上引擎'**
  String get stateGoalClearOffline;

  /// No description provided for @stateGoalClearFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能清除'**
  String get stateGoalClearFailed;

  /// No description provided for @stateGoalStale.
  ///
  /// In zh, this message translates to:
  /// **'目标刚有变化，再试一次'**
  String get stateGoalStale;

  /// No description provided for @stateGoalMissing.
  ///
  /// In zh, this message translates to:
  /// **'目标已不在'**
  String get stateGoalMissing;

  /// No description provided for @stateGoalChatNotReady.
  ///
  /// In zh, this message translates to:
  /// **'对话未就绪，稍后再试'**
  String get stateGoalChatNotReady;

  /// No description provided for @stateGoalTurnsExhausted.
  ///
  /// In zh, this message translates to:
  /// **'轮次已用完'**
  String get stateGoalTurnsExhausted;

  /// No description provided for @stateGoalStateChanged.
  ///
  /// In zh, this message translates to:
  /// **'目标状态已变化'**
  String get stateGoalStateChanged;

  /// No description provided for @stateSshHost.
  ///
  /// In zh, this message translates to:
  /// **'SSH 主机'**
  String get stateSshHost;

  /// No description provided for @stateHostBrowserFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器，可以复制登录链接到浏览器里完成。'**
  String get stateHostBrowserFailed;

  /// No description provided for @stateSignInFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能登录'**
  String get stateSignInFailed;

  /// No description provided for @stateMarketTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'插件目录太大，已停止下载'**
  String get stateMarketTooLarge;

  /// No description provided for @stateMarketUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上插件目录'**
  String get stateMarketUnreachable;

  /// No description provided for @stateMarketInsecure.
  ///
  /// In zh, this message translates to:
  /// **'没能和插件目录建立安全连接'**
  String get stateMarketInsecure;

  /// No description provided for @stateMarketTimeout.
  ///
  /// In zh, this message translates to:
  /// **'插件目录加载超时'**
  String get stateMarketTimeout;

  /// No description provided for @stateMarketInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'插件目录下载中断'**
  String get stateMarketInterrupted;

  /// No description provided for @stateRegistryDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认安装源'**
  String get stateRegistryDefault;

  /// No description provided for @stateRegistryNpm.
  ///
  /// In zh, this message translates to:
  /// **'npm 官方源'**
  String get stateRegistryNpm;

  /// No description provided for @stateRegistryMirror.
  ///
  /// In zh, this message translates to:
  /// **'npmmirror 镜像'**
  String get stateRegistryMirror;

  /// No description provided for @statePluginIncompatible.
  ///
  /// In zh, this message translates to:
  /// **'这个插件不支持当前的 DSH 版本。'**
  String get statePluginIncompatible;

  /// No description provided for @statePluginInstallCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消安装'**
  String get statePluginInstallCancelled;

  /// No description provided for @statePluginNoChanges.
  ///
  /// In zh, this message translates to:
  /// **'没有改动任何东西'**
  String get statePluginNoChanges;

  /// No description provided for @statePluginIncompatibleTitle.
  ///
  /// In zh, this message translates to:
  /// **'和当前 DSH 不兼容'**
  String get statePluginIncompatibleTitle;

  /// No description provided for @statePluginNetworkFailed.
  ///
  /// In zh, this message translates to:
  /// **'网络连不上'**
  String get statePluginNetworkFailed;

  /// No description provided for @statePluginSourceUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上插件源码所在的网站'**
  String get statePluginSourceUnreachable;

  /// No description provided for @statePluginDownloadTimeout.
  ///
  /// In zh, this message translates to:
  /// **'下载超时'**
  String get statePluginDownloadTimeout;

  /// No description provided for @statePluginRegistryUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'安装源暂时没有响应'**
  String get statePluginRegistryUnavailable;

  /// No description provided for @statePluginPnpmMissing.
  ///
  /// In zh, this message translates to:
  /// **'缺少 pnpm'**
  String get statePluginPnpmMissing;

  /// No description provided for @statePluginPhonePnpmMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台手机缺少 pnpm'**
  String get statePluginPhonePnpmMissing;

  /// No description provided for @statePluginHostPnpmMissing.
  ///
  /// In zh, this message translates to:
  /// **'这台主机缺少 pnpm'**
  String get statePluginHostPnpmMissing;

  /// No description provided for @statePluginNotFound.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个插件'**
  String get statePluginNotFound;

  /// No description provided for @statePluginPackageMissing.
  ///
  /// In zh, this message translates to:
  /// **'安装源里没有这个包'**
  String get statePluginPackageMissing;

  /// No description provided for @statePluginTooNew.
  ///
  /// In zh, this message translates to:
  /// **'版本太新'**
  String get statePluginTooNew;

  /// No description provided for @statePluginWaitForRelease.
  ///
  /// In zh, this message translates to:
  /// **'发布满 24 小时后才能安装'**
  String get statePluginWaitForRelease;

  /// No description provided for @statePluginVersionMissing.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个版本'**
  String get statePluginVersionMissing;

  /// No description provided for @statePluginRegistryVersionMissing.
  ///
  /// In zh, this message translates to:
  /// **'安装源里还没有这个版本'**
  String get statePluginRegistryVersionMissing;

  /// No description provided for @stateDeviceStorageFull.
  ///
  /// In zh, this message translates to:
  /// **'设备存储空间不足'**
  String get stateDeviceStorageFull;

  /// No description provided for @statePluginNoWritePermission.
  ///
  /// In zh, this message translates to:
  /// **'没有写入权限'**
  String get statePluginNoWritePermission;

  /// No description provided for @statePluginConfigReadOnly.
  ///
  /// In zh, this message translates to:
  /// **'引擎配置目录不可写'**
  String get statePluginConfigReadOnly;

  /// No description provided for @statePluginIntegrityFailed.
  ///
  /// In zh, this message translates to:
  /// **'文件校验失败'**
  String get statePluginIntegrityFailed;

  /// No description provided for @statePluginDownloadIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'下载的文件不完整'**
  String get statePluginDownloadIncomplete;

  /// No description provided for @statePluginBuildScripts.
  ///
  /// In zh, this message translates to:
  /// **'需要运行构建脚本'**
  String get statePluginBuildScripts;

  /// No description provided for @statePluginBuildApproval.
  ///
  /// In zh, this message translates to:
  /// **'构建脚本等待允许'**
  String get statePluginBuildApproval;

  /// No description provided for @statePluginAlreadyInstalled.
  ///
  /// In zh, this message translates to:
  /// **'已经装过了'**
  String get statePluginAlreadyInstalled;

  /// No description provided for @statePluginUninstallFirst.
  ///
  /// In zh, this message translates to:
  /// **'换版本需先卸载'**
  String get statePluginUninstallFirst;

  /// No description provided for @statePluginInvalid.
  ///
  /// In zh, this message translates to:
  /// **'这不是 DSH 插件'**
  String get statePluginInvalid;

  /// No description provided for @statePluginNoEntry.
  ///
  /// In zh, this message translates to:
  /// **'这个包没有插件入口，已撤销安装'**
  String get statePluginNoEntry;

  /// No description provided for @statePluginInUse.
  ///
  /// In zh, this message translates to:
  /// **'插件正在被使用'**
  String get statePluginInUse;

  /// No description provided for @statePluginHasDependents.
  ///
  /// In zh, this message translates to:
  /// **'有其他插件依赖它'**
  String get statePluginHasDependents;

  /// No description provided for @statePluginManagedElsewhere.
  ///
  /// In zh, this message translates to:
  /// **'不能在这里修改'**
  String get statePluginManagedElsewhere;

  /// No description provided for @statePluginEngineManaged.
  ///
  /// In zh, this message translates to:
  /// **'这个插件由引擎单独管理'**
  String get statePluginEngineManaged;

  /// No description provided for @statePluginAuthorizationExpired.
  ///
  /// In zh, this message translates to:
  /// **'授权已过期'**
  String get statePluginAuthorizationExpired;

  /// No description provided for @statePluginBuildChanged.
  ///
  /// In zh, this message translates to:
  /// **'构建脚本已变化，需要重新安装'**
  String get statePluginBuildChanged;

  /// No description provided for @statePluginInvalidAddress.
  ///
  /// In zh, this message translates to:
  /// **'安装地址无效'**
  String get statePluginInvalidAddress;

  /// No description provided for @statePluginCatalogInvalidAddress.
  ///
  /// In zh, this message translates to:
  /// **'插件目录的安装地址不正确'**
  String get statePluginCatalogInvalidAddress;

  /// No description provided for @statePluginOperationIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'操作没有完成'**
  String get statePluginOperationIncomplete;

  /// No description provided for @statePluginRemoteForbidden.
  ///
  /// In zh, this message translates to:
  /// **'这台主机不允许远程安装'**
  String get statePluginRemoteForbidden;

  /// No description provided for @statePluginRelayToggleOnly.
  ///
  /// In zh, this message translates to:
  /// **'经中转连接只能开关插件'**
  String get statePluginRelayToggleOnly;

  /// No description provided for @statePluginManagementUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'主机不支持插件管理'**
  String get statePluginManagementUnsupported;

  /// No description provided for @statePluginEngineUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持插件管理'**
  String get statePluginEngineUnsupported;

  /// No description provided for @statePluginResultMissing.
  ///
  /// In zh, this message translates to:
  /// **'没能拿到安装结果'**
  String get statePluginResultMissing;

  /// No description provided for @statePluginResultPending.
  ///
  /// In zh, this message translates to:
  /// **'安装结果待确认'**
  String get statePluginResultPending;

  /// No description provided for @statePluginDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'连接断开了'**
  String get statePluginDisconnected;

  /// No description provided for @statePluginQueued.
  ///
  /// In zh, this message translates to:
  /// **'排队中'**
  String get statePluginQueued;

  /// No description provided for @statePluginRemoving.
  ///
  /// In zh, this message translates to:
  /// **'正在卸载旧版本'**
  String get statePluginRemoving;

  /// No description provided for @statePluginInstalling.
  ///
  /// In zh, this message translates to:
  /// **'正在下载安装'**
  String get statePluginInstalling;

  /// No description provided for @statePluginApplying.
  ///
  /// In zh, this message translates to:
  /// **'正在启用'**
  String get statePluginApplying;

  /// No description provided for @statePluginCancelling.
  ///
  /// In zh, this message translates to:
  /// **'正在取消'**
  String get statePluginCancelling;

  /// No description provided for @statePluginInstalledRestart.
  ///
  /// In zh, this message translates to:
  /// **'已安装，重启后生效'**
  String get statePluginInstalledRestart;

  /// No description provided for @statePluginInstallFailed.
  ///
  /// In zh, this message translates to:
  /// **'安装失败'**
  String get statePluginInstallFailed;

  /// No description provided for @statePluginConnectFirst.
  ///
  /// In zh, this message translates to:
  /// **'连接后可安装插件'**
  String get statePluginConnectFirst;

  /// No description provided for @stateProviderOpenAi.
  ///
  /// In zh, this message translates to:
  /// **'OpenAI 兼容'**
  String get stateProviderOpenAi;

  /// No description provided for @stateProviderAnthropic.
  ///
  /// In zh, this message translates to:
  /// **'Anthropic 兼容'**
  String get stateProviderAnthropic;

  /// No description provided for @stateProviderUrlRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写 Base URL'**
  String get stateProviderUrlRequired;

  /// No description provided for @stateProviderUrlInvalid.
  ///
  /// In zh, this message translates to:
  /// **'以 http:// 或 https:// 开头的完整地址'**
  String get stateProviderUrlInvalid;

  /// No description provided for @stateProviderUrlSuffix.
  ///
  /// In zh, this message translates to:
  /// **'去掉 ? 或 # 之后的部分'**
  String get stateProviderUrlSuffix;

  /// No description provided for @stateProviderKeyRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写 API Key'**
  String get stateProviderKeyRequired;

  /// No description provided for @stateProviderKeyOnly.
  ///
  /// In zh, this message translates to:
  /// **'只粘贴 Key 本身，不带变量名'**
  String get stateProviderKeyOnly;

  /// No description provided for @stateProviderKeyQuotes.
  ///
  /// In zh, this message translates to:
  /// **'去掉两边的引号'**
  String get stateProviderKeyQuotes;

  /// No description provided for @stateProviderKeyInvalid.
  ///
  /// In zh, this message translates to:
  /// **'Key 含有无效字符'**
  String get stateProviderKeyInvalid;

  /// No description provided for @stateProviderModelRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写模型 ID'**
  String get stateProviderModelRequired;

  /// No description provided for @stateProviderModelSpaces.
  ///
  /// In zh, this message translates to:
  /// **'模型 ID 不能有空格'**
  String get stateProviderModelSpaces;

  /// No description provided for @stateProviderAlreadyAdded.
  ///
  /// In zh, this message translates to:
  /// **'已经添加过'**
  String get stateProviderAlreadyAdded;

  /// No description provided for @stateProviderConflict.
  ///
  /// In zh, this message translates to:
  /// **'渠道刚被改过，返回后重试'**
  String get stateProviderConflict;

  /// No description provided for @stateProviderUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎版本不支持这个操作'**
  String get stateProviderUnsupported;

  /// No description provided for @stateProviderKeyRejected.
  ///
  /// In zh, this message translates to:
  /// **'API Key 无效或没有权限'**
  String get stateProviderKeyRejected;

  /// No description provided for @stateProviderModelsMissing.
  ///
  /// In zh, this message translates to:
  /// **'找不到模型列表，检查 Base URL'**
  String get stateProviderModelsMissing;

  /// No description provided for @stateProviderRateLimited.
  ///
  /// In zh, this message translates to:
  /// **'请求太频繁，稍后再试'**
  String get stateProviderRateLimited;

  /// No description provided for @stateProviderResponseTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'返回的内容过大'**
  String get stateProviderResponseTooLarge;

  /// No description provided for @stateProviderUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上这个地址，检查 Base URL 和网络'**
  String get stateProviderUnreachable;

  /// No description provided for @stateProviderModelsUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'没有读到模型列表，检查 Base URL'**
  String get stateProviderModelsUnreadable;

  /// No description provided for @stateProviderManualModels.
  ///
  /// In zh, this message translates to:
  /// **'这个协议不能获取模型，请手动添加'**
  String get stateProviderManualModels;

  /// No description provided for @stateProviderConfigRejected.
  ///
  /// In zh, this message translates to:
  /// **'引擎拒绝了这个配置，检查协议和模型'**
  String get stateProviderConfigRejected;

  /// No description provided for @stateProviderOffline.
  ///
  /// In zh, this message translates to:
  /// **'没有连上引擎'**
  String get stateProviderOffline;

  /// No description provided for @stateSafeStartupFailed.
  ///
  /// In zh, this message translates to:
  /// **'启动失败'**
  String get stateSafeStartupFailed;

  /// No description provided for @stateSafeCrashedEarly.
  ///
  /// In zh, this message translates to:
  /// **'启动后很快崩溃'**
  String get stateSafeCrashedEarly;

  /// No description provided for @stateSafeCrashedLate.
  ///
  /// In zh, this message translates to:
  /// **'运行中崩溃'**
  String get stateSafeCrashedLate;

  /// No description provided for @stateSafeKilled.
  ///
  /// In zh, this message translates to:
  /// **'被系统结束'**
  String get stateSafeKilled;

  /// No description provided for @stateSafeManualEntry.
  ///
  /// In zh, this message translates to:
  /// **'我手动进入了安全模式'**
  String get stateSafeManualEntry;

  /// No description provided for @stateScheduleNotCreated.
  ///
  /// In zh, this message translates to:
  /// **'对话结束了，但没有建成任务'**
  String get stateScheduleNotCreated;

  /// No description provided for @stateScheduleChatFailed.
  ///
  /// In zh, this message translates to:
  /// **'对话出错了'**
  String get stateScheduleChatFailed;

  /// No description provided for @stateScheduleResultPending.
  ///
  /// In zh, this message translates to:
  /// **'还没等到结果'**
  String get stateScheduleResultPending;

  /// No description provided for @statePlanPending.
  ///
  /// In zh, this message translates to:
  /// **'计划待审'**
  String get statePlanPending;

  /// No description provided for @stateQuestionPending.
  ///
  /// In zh, this message translates to:
  /// **'待回答'**
  String get stateQuestionPending;

  /// No description provided for @stateExportRelayUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'经中转连接暂不支持导出'**
  String get stateExportRelayUnsupported;

  /// No description provided for @stateExportChatMissing.
  ///
  /// In zh, this message translates to:
  /// **'找不到这个对话了'**
  String get stateExportChatMissing;

  /// No description provided for @stateExportFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能导出'**
  String get stateExportFailed;

  /// No description provided for @stateSizeExtraLarge.
  ///
  /// In zh, this message translates to:
  /// **'特大'**
  String get stateSizeExtraLarge;

  /// No description provided for @stateSubscriptionUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持订阅登录'**
  String get stateSubscriptionUnsupported;

  /// No description provided for @stateSubscriptionUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'连不上登录服务，检查网络后重试'**
  String get stateSubscriptionUnreachable;

  /// No description provided for @stateSubscriptionSignInFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能完成登录，再试一次'**
  String get stateSubscriptionSignInFailed;

  /// No description provided for @stateSubscriptionTimeout.
  ///
  /// In zh, this message translates to:
  /// **'请求超时，检查网络后重试'**
  String get stateSubscriptionTimeout;

  /// No description provided for @stateSubscriptionDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'和引擎的连接断开了，稍后重试'**
  String get stateSubscriptionDisconnected;

  /// No description provided for @stateTerminalLimit.
  ///
  /// In zh, this message translates to:
  /// **'终端数量已达上限'**
  String get stateTerminalLimit;

  /// No description provided for @stateTerminalStartFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能启动终端'**
  String get stateTerminalStartFailed;

  /// No description provided for @stateTileDuotone.
  ///
  /// In zh, this message translates to:
  /// **'扁平双色'**
  String get stateTileDuotone;

  /// No description provided for @stateTileGeometric.
  ///
  /// In zh, this message translates to:
  /// **'极简几何'**
  String get stateTileGeometric;

  /// No description provided for @stateTileGlassy.
  ///
  /// In zh, this message translates to:
  /// **'玻璃渐变'**
  String get stateTileGlassy;

  /// No description provided for @stateUiNative.
  ///
  /// In zh, this message translates to:
  /// **'原生'**
  String get stateUiNative;

  /// No description provided for @stateDefaultWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'默认工作区'**
  String get stateDefaultWorkspace;

  /// No description provided for @stateDiagnosticsSaved.
  ///
  /// In zh, this message translates to:
  /// **'已存到 {where}'**
  String stateDiagnosticsSaved(String where);

  /// No description provided for @stateDownloadsPrefix.
  ///
  /// In zh, this message translates to:
  /// **'下载/'**
  String get stateDownloadsPrefix;

  /// No description provided for @stateSharePluginCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个插件'**
  String stateSharePluginCount(int count);

  /// No description provided for @stateShareSkillCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个技能'**
  String stateShareSkillCount(int count);

  /// No description provided for @stateShareSettingCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 组设置'**
  String stateShareSettingCount(int count);

  /// No description provided for @stateAlertCompletedReply.
  ///
  /// In zh, this message translates to:
  /// **'已完成 · {reply}'**
  String stateAlertCompletedReply(String reply);

  /// No description provided for @stateAlertErrorDetail.
  ///
  /// In zh, this message translates to:
  /// **'出错了 · {detail}'**
  String stateAlertErrorDetail(String detail);

  /// No description provided for @stateAlertUseTool.
  ///
  /// In zh, this message translates to:
  /// **'使用工具 {name}'**
  String stateAlertUseTool(String name);

  /// No description provided for @stateAlertApprovalAction.
  ///
  /// In zh, this message translates to:
  /// **'等你确认：{action}'**
  String stateAlertApprovalAction(String action);

  /// No description provided for @stateAlertApprovalReason.
  ///
  /// In zh, this message translates to:
  /// **'等你确认：{action} · {reason}'**
  String stateAlertApprovalReason(String action, String reason);

  /// No description provided for @stateAlertQuestions.
  ///
  /// In zh, this message translates to:
  /// **'问你：{question}（共 {count} 个）'**
  String stateAlertQuestions(String question, int count);

  /// No description provided for @stateAlertQuestionText.
  ///
  /// In zh, this message translates to:
  /// **'问你：{question}'**
  String stateAlertQuestionText(String question);

  /// No description provided for @statePetChatsDone.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个对话做完了'**
  String statePetChatsDone(int count);

  /// No description provided for @statePetChatsFailed.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个对话出错了'**
  String statePetChatsFailed(int count);

  /// No description provided for @statePetChatsApproval.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个对话等你确认'**
  String statePetChatsApproval(int count);

  /// No description provided for @statePetChatsQuestion.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个对话等你回答'**
  String statePetChatsQuestion(int count);

  /// No description provided for @stateAttachmentEmpty.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」是空文件'**
  String stateAttachmentEmpty(String name);

  /// No description provided for @stateAttachmentImageLimit.
  ///
  /// In zh, this message translates to:
  /// **'图片「{name}」超过 20 MB'**
  String stateAttachmentImageLimit(String name);

  /// No description provided for @stateAttachmentFileLimit.
  ///
  /// In zh, this message translates to:
  /// **'文件「{name}」超过 30 MB'**
  String stateAttachmentFileLimit(String name);

  /// No description provided for @stateBotFinished.
  ///
  /// In zh, this message translates to:
  /// **'{name} 完成了工作'**
  String stateBotFinished(String name);

  /// No description provided for @stateBotQuestion.
  ///
  /// In zh, this message translates to:
  /// **'{name} 问你：{text}'**
  String stateBotQuestion(String name, String text);

  /// No description provided for @stateBotApproval.
  ///
  /// In zh, this message translates to:
  /// **'{name} 等你批准：{text}'**
  String stateBotApproval(String name, String text);

  /// No description provided for @stateCommandPlanHint.
  ///
  /// In zh, this message translates to:
  /// **'[off | 要求]'**
  String get stateCommandPlanHint;

  /// No description provided for @stateCommandGoalHint.
  ///
  /// In zh, this message translates to:
  /// **'[目标 | clear | pause | resume]'**
  String get stateCommandGoalHint;

  /// No description provided for @stateShareReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取「{name}」'**
  String stateShareReadFailed(String name);

  /// No description provided for @stateShareAttachmentLimit.
  ///
  /// In zh, this message translates to:
  /// **'每条消息最多 {count} 个附件'**
  String stateShareAttachmentLimit(int count);

  /// No description provided for @stateShareNamedFileTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'「{name}」太大，未添加'**
  String stateShareNamedFileTooLarge(String name);

  /// No description provided for @stateShareTextTruncated.
  ///
  /// In zh, this message translates to:
  /// **'文字太长，只保留了前 {count} 字'**
  String stateShareTextTruncated(int count);

  /// No description provided for @stateSettingsMinimum.
  ///
  /// In zh, this message translates to:
  /// **'不能小于 {bound}'**
  String stateSettingsMinimum(String bound);

  /// No description provided for @stateSettingsMaximum.
  ///
  /// In zh, this message translates to:
  /// **'不能大于 {bound}'**
  String stateSettingsMaximum(String bound);

  /// No description provided for @stateSettingsMultiple.
  ///
  /// In zh, this message translates to:
  /// **'需是 {bound} 的倍数'**
  String stateSettingsMultiple(String bound);

  /// No description provided for @stateSettingsMinLength.
  ///
  /// In zh, this message translates to:
  /// **'至少 {count} 个字符'**
  String stateSettingsMinLength(int count);

  /// No description provided for @stateSettingsMaxLength.
  ///
  /// In zh, this message translates to:
  /// **'最多 {count} 个字符'**
  String stateSettingsMaxLength(int count);

  /// No description provided for @stateEngineHttpRejected.
  ///
  /// In zh, this message translates to:
  /// **'引擎拒绝了请求（{status}）'**
  String stateEngineHttpRejected(int status);

  /// No description provided for @stateGoalActionOffline.
  ///
  /// In zh, this message translates to:
  /// **'{action}：没能连上引擎'**
  String stateGoalActionOffline(String action);

  /// No description provided for @stateHostRemoteLabel.
  ///
  /// In zh, this message translates to:
  /// **'{name} · 远程'**
  String stateHostRemoteLabel(String name);

  /// No description provided for @stateMarketHttpError.
  ///
  /// In zh, this message translates to:
  /// **'插件目录暂时打不开（HTTP {status}）'**
  String stateMarketHttpError(int status);

  /// No description provided for @statePluginRuntimeIncompatible.
  ///
  /// In zh, this message translates to:
  /// **'这个插件不支持当前的 DSH 版本（{version}）。'**
  String statePluginRuntimeIncompatible(String version);

  /// No description provided for @statePluginRequiredVersion.
  ///
  /// In zh, this message translates to:
  /// **'这个插件要求 DSH {wanted}，当前是 {current}。'**
  String statePluginRequiredVersion(String wanted, String current);

  /// No description provided for @statePluginRegistryUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上安装源'**
  String get statePluginRegistryUnreachable;

  /// No description provided for @statePluginNamedRegistryUnreachable.
  ///
  /// In zh, this message translates to:
  /// **'没能连上安装源（{registry}）'**
  String statePluginNamedRegistryUnreachable(String registry);

  /// No description provided for @statePluginBuildsPending.
  ///
  /// In zh, this message translates to:
  /// **'等待允许：{builds}'**
  String statePluginBuildsPending(String builds);

  /// No description provided for @statePluginRegistryProgress.
  ///
  /// In zh, this message translates to:
  /// **'换用{registry}下载（第 {attempt}/{attempts} 个源）'**
  String statePluginRegistryProgress(String registry, int attempt, int attempts);

  /// No description provided for @stateProviderServiceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'服务暂时不可用（{status}）'**
  String stateProviderServiceUnavailable(int status);

  /// No description provided for @stateProviderServiceStatus.
  ///
  /// In zh, this message translates to:
  /// **'服务返回了 {status}'**
  String stateProviderServiceStatus(int status);

  /// No description provided for @stateProviderKeySaveFailed.
  ///
  /// In zh, this message translates to:
  /// **'渠道已保存，Key 没有存上：{reason}'**
  String stateProviderKeySaveFailed(String reason);

  /// No description provided for @stateSafeSuspectPlugins.
  ///
  /// In zh, this message translates to:
  /// **'{what}，可疑插件：{plugins}'**
  String stateSafeSuspectPlugins(String what, String plugins);

  /// No description provided for @stateSafePreflightFailed.
  ///
  /// In zh, this message translates to:
  /// **'{what}，启动检查没通过：{checks}'**
  String stateSafePreflightFailed(String what, String checks);

  /// No description provided for @stateListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get stateListSeparator;

  /// No description provided for @stateSafeRepairPrompt.
  ///
  /// In zh, this message translates to:
  /// **'我的 DSH 正常模式出了问题（{what}）。请按「安全模式」说明排查原因，先用可逆的办法修好 web 配置，修完用 dsh-app-plugins trial 试启动验证，再告诉我改了什么。'**
  String stateSafeRepairPrompt(String what);

  /// No description provided for @stateScheduleCreatePrompt.
  ///
  /// In zh, this message translates to:
  /// **'新建自动化任务「{title}」：{rule}。\n只调用一次 schedule_create，参数原样使用；现在不要执行任务内容。\n\n```json\n{args}\n```'**
  String stateScheduleCreatePrompt(String title, String rule, String args);

  /// No description provided for @stateActionReason.
  ///
  /// In zh, this message translates to:
  /// **'{action}：{reason}'**
  String stateActionReason(String action, String reason);

  /// No description provided for @stateAlertPreviewRun.
  ///
  /// In zh, this message translates to:
  /// **'运行：{value}'**
  String stateAlertPreviewRun(String value);

  /// No description provided for @stateAlertPreviewWrite.
  ///
  /// In zh, this message translates to:
  /// **'写入：{value}'**
  String stateAlertPreviewWrite(String value);

  /// No description provided for @stateAlertPreviewEdit.
  ///
  /// In zh, this message translates to:
  /// **'修改：{value}'**
  String stateAlertPreviewEdit(String value);

  /// No description provided for @stateAlertPreviewOpen.
  ///
  /// In zh, this message translates to:
  /// **'打开：{value}'**
  String stateAlertPreviewOpen(String value);

  /// No description provided for @stateAlertPreviewUse.
  ///
  /// In zh, this message translates to:
  /// **'使用工具：{value}'**
  String stateAlertPreviewUse(String value);

  /// No description provided for @stateUiWeb.
  ///
  /// In zh, this message translates to:
  /// **'网页'**
  String get stateUiWeb;

  /// No description provided for @statePluginRegistryProgressUnknown.
  ///
  /// In zh, this message translates to:
  /// **'换用{registry}下载（第 {attempt}/null 个源）'**
  String statePluginRegistryProgressUnknown(String registry, int attempt);

  /// No description provided for @stateProviderTokenCountInvalid.
  ///
  /// In zh, this message translates to:
  /// **'填写数字，如 128K'**
  String get stateProviderTokenCountInvalid;

  /// No description provided for @appSlogan.
  ///
  /// In zh, this message translates to:
  /// **'随时随刻，想go就Go！'**
  String get appSlogan;

  /// No description provided for @updateCheck.
  ///
  /// In zh, this message translates to:
  /// **'检查更新'**
  String get updateCheck;

  /// No description provided for @updateAutoCheck.
  ///
  /// In zh, this message translates to:
  /// **'自动检查更新'**
  String get updateAutoCheck;

  /// No description provided for @updateAutoCheckDaily.
  ///
  /// In zh, this message translates to:
  /// **'每天检查一次'**
  String get updateAutoCheckDaily;

  /// No description provided for @updateTileDownloading.
  ///
  /// In zh, this message translates to:
  /// **'下载中'**
  String get updateTileDownloading;

  /// No description provided for @updateTileDownloadingPercent.
  ///
  /// In zh, this message translates to:
  /// **'下载中 {percent}%'**
  String updateTileDownloadingPercent(int percent);

  /// No description provided for @updateTileVerifying.
  ///
  /// In zh, this message translates to:
  /// **'校验中'**
  String get updateTileVerifying;

  /// No description provided for @updateTileReady.
  ///
  /// In zh, this message translates to:
  /// **'可以安装'**
  String get updateTileReady;

  /// No description provided for @updateTileInstalling.
  ///
  /// In zh, this message translates to:
  /// **'安装中'**
  String get updateTileInstalling;

  /// No description provided for @updateTileSkipped.
  ///
  /// In zh, this message translates to:
  /// **'已跳过 {version}'**
  String updateTileSkipped(String version);

  /// No description provided for @updateTileNewVersion.
  ///
  /// In zh, this message translates to:
  /// **'新版本 {version}'**
  String updateTileNewVersion(String version);

  /// No description provided for @updateTileUpToDate.
  ///
  /// In zh, this message translates to:
  /// **'已是最新'**
  String get updateTileUpToDate;

  /// No description provided for @updateTileUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'暂时检查不了'**
  String get updateTileUnavailable;

  /// No description provided for @updateUpToDate.
  ///
  /// In zh, this message translates to:
  /// **'已是最新版本'**
  String get updateUpToDate;

  /// No description provided for @updateCheckUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'暂时检查不了更新，稍后再试'**
  String get updateCheckUnavailable;

  /// No description provided for @updateDownloadInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'下载中断了'**
  String get updateDownloadInterrupted;

  /// No description provided for @updateDownloadInterruptedMessage.
  ///
  /// In zh, this message translates to:
  /// **'网络断开或太慢，重试会接着下载。'**
  String get updateDownloadInterruptedMessage;

  /// No description provided for @updateDownloadUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'下载地址暂时打不开'**
  String get updateDownloadUnavailable;

  /// No description provided for @updateDownloadUnavailableMessage.
  ///
  /// In zh, this message translates to:
  /// **'稍后再试，或去发布页手动下载。'**
  String get updateDownloadUnavailableMessage;

  /// No description provided for @updateChecksumFailed.
  ///
  /// In zh, this message translates to:
  /// **'安装包校验没通过'**
  String get updateChecksumFailed;

  /// No description provided for @updateChecksumFailedMessage.
  ///
  /// In zh, this message translates to:
  /// **'文件和发布时不一致，已删除，请重试。'**
  String get updateChecksumFailedMessage;

  /// No description provided for @updateChecksumMissing.
  ///
  /// In zh, this message translates to:
  /// **'缺少校验信息'**
  String get updateChecksumMissing;

  /// No description provided for @updateChecksumMissingMessage.
  ///
  /// In zh, this message translates to:
  /// **'为了安全不在 App 内安装，可以去发布页手动下载。'**
  String get updateChecksumMissingMessage;

  /// No description provided for @updateStorageWriteFailed.
  ///
  /// In zh, this message translates to:
  /// **'写不进安装包'**
  String get updateStorageWriteFailed;

  /// No description provided for @updateStorageWriteFailedMessage.
  ///
  /// In zh, this message translates to:
  /// **'存储可能已满，清理一些空间后重试。'**
  String get updateStorageWriteFailedMessage;

  /// No description provided for @updateFreeSpaceRetry.
  ///
  /// In zh, this message translates to:
  /// **'清理一些空间后重试。'**
  String get updateFreeSpaceRetry;

  /// No description provided for @updateSpaceRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要约 {size} 可用空间，清理后重试。'**
  String updateSpaceRequired(String size);

  /// No description provided for @updateSettingsOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开系统设置'**
  String get updateSettingsOpenFailed;

  /// No description provided for @updateSettingsOpenFailedMessage.
  ///
  /// In zh, this message translates to:
  /// **'到「设置 → 应用 → DSH Go」里允许「安装未知应用」，再回来安装。'**
  String get updateSettingsOpenFailedMessage;

  /// No description provided for @updateInstallCancelled.
  ///
  /// In zh, this message translates to:
  /// **'已取消安装'**
  String get updateInstallCancelled;

  /// No description provided for @updateInstallCancelledMessage.
  ///
  /// In zh, this message translates to:
  /// **'安装包还在，随时可以再装。'**
  String get updateInstallCancelledMessage;

  /// No description provided for @updateSignatureMismatch.
  ///
  /// In zh, this message translates to:
  /// **'签名不一致，不能直接覆盖'**
  String get updateSignatureMismatch;

  /// No description provided for @updateSignatureMismatchMessage.
  ///
  /// In zh, this message translates to:
  /// **'手机上的 DSH Go 签名不同（多半是测试包），需要先卸载旧版再装新版。卸载会清空对话、Linux 环境和设置。'**
  String get updateSignatureMismatchMessage;

  /// No description provided for @updateWrongPackage.
  ///
  /// In zh, this message translates to:
  /// **'不是 DSH 的安装包'**
  String get updateWrongPackage;

  /// No description provided for @updateWrongPackageMessage.
  ///
  /// In zh, this message translates to:
  /// **'下载到的文件不对，已删除，请稍后重试。'**
  String get updateWrongPackageMessage;

  /// No description provided for @updateDowngradeBlocked.
  ///
  /// In zh, this message translates to:
  /// **'不能降级安装'**
  String get updateDowngradeBlocked;

  /// No description provided for @updateDowngradeBlockedMessage.
  ///
  /// In zh, this message translates to:
  /// **'手机上的 DSH 比这个安装包还新。'**
  String get updateDowngradeBlockedMessage;

  /// No description provided for @updateIncompatible.
  ///
  /// In zh, this message translates to:
  /// **'和这台手机不兼容'**
  String get updateIncompatible;

  /// No description provided for @updateIncompatibleMessage.
  ///
  /// In zh, this message translates to:
  /// **'安装包要求的系统版本或处理器架构和手机不符。'**
  String get updateIncompatibleMessage;

  /// No description provided for @updatePackageCorrupt.
  ///
  /// In zh, this message translates to:
  /// **'安装包已损坏'**
  String get updatePackageCorrupt;

  /// No description provided for @updatePackageCorruptMessage.
  ///
  /// In zh, this message translates to:
  /// **'已删除，请重新下载。'**
  String get updatePackageCorruptMessage;

  /// No description provided for @updateInstallBlocked.
  ///
  /// In zh, this message translates to:
  /// **'安装被拦截了'**
  String get updateInstallBlocked;

  /// No description provided for @updateInstallBlockedMessage.
  ///
  /// In zh, this message translates to:
  /// **'在系统的安装确认里允许，或去发布页手动下载。'**
  String get updateInstallBlockedMessage;

  /// No description provided for @updateInstallIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'安装没有完成'**
  String get updateInstallIncomplete;

  /// No description provided for @updateInstallIncompleteMessage.
  ///
  /// In zh, this message translates to:
  /// **'可以重试，或去发布页手动下载。'**
  String get updateInstallIncompleteMessage;

  /// No description provided for @updateBrowserOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开浏览器，请手动访问 {host}{path}'**
  String updateBrowserOpenFailed(String host, String path);

  /// No description provided for @updateUpToDateVersion.
  ///
  /// In zh, this message translates to:
  /// **'已是最新版本 {version}'**
  String updateUpToDateVersion(String version);

  /// No description provided for @updateCurrentVersion.
  ///
  /// In zh, this message translates to:
  /// **'当前 {version}'**
  String updateCurrentVersion(String version);

  /// No description provided for @updateNewVersionFound.
  ///
  /// In zh, this message translates to:
  /// **'发现新版本'**
  String get updateNewVersionFound;

  /// No description provided for @updateReleaseNotes.
  ///
  /// In zh, this message translates to:
  /// **'更新内容'**
  String get updateReleaseNotes;

  /// No description provided for @updateNoReleaseNotes.
  ///
  /// In zh, this message translates to:
  /// **'这个版本没有写更新说明。'**
  String get updateNoReleaseNotes;

  /// No description provided for @updateInstallKeepsData.
  ///
  /// In zh, this message translates to:
  /// **'安装时 DSH Go 会退出，对话和设置都会保留'**
  String get updateInstallKeepsData;

  /// No description provided for @updateNoCompatiblePackage.
  ///
  /// In zh, this message translates to:
  /// **'没有适合本机的安装包'**
  String get updateNoCompatiblePackage;

  /// No description provided for @updateDownloading.
  ///
  /// In zh, this message translates to:
  /// **'正在下载'**
  String get updateDownloading;

  /// No description provided for @updateDownloadSource.
  ///
  /// In zh, this message translates to:
  /// **'经由 {source}'**
  String updateDownloadSource(String source);

  /// No description provided for @updateDownloadInBackgroundNote.
  ///
  /// In zh, this message translates to:
  /// **'关掉窗口也会继续下载'**
  String get updateDownloadInBackgroundNote;

  /// No description provided for @updateVerifyingPackage.
  ///
  /// In zh, this message translates to:
  /// **'正在校验安装包…'**
  String get updateVerifyingPackage;

  /// No description provided for @updateVerifyingPackageNote.
  ///
  /// In zh, this message translates to:
  /// **'确认文件和发布时一致'**
  String get updateVerifyingPackageNote;

  /// No description provided for @updateInstalling.
  ///
  /// In zh, this message translates to:
  /// **'正在安装…'**
  String get updateInstalling;

  /// No description provided for @updateConfirmInstallNote.
  ///
  /// In zh, this message translates to:
  /// **'在系统弹窗里确认安装'**
  String get updateConfirmInstallNote;

  /// No description provided for @updatePackageDownloaded.
  ///
  /// In zh, this message translates to:
  /// **'安装包已下载'**
  String get updatePackageDownloaded;

  /// No description provided for @updateReadyToInstall.
  ///
  /// In zh, this message translates to:
  /// **'校验通过，可以安装了。'**
  String get updateReadyToInstall;

  /// No description provided for @updateAllowInstall.
  ///
  /// In zh, this message translates to:
  /// **'允许 DSH Go 安装应用'**
  String get updateAllowInstall;

  /// No description provided for @updateAllowInstallMessage.
  ///
  /// In zh, this message translates to:
  /// **'在系统设置里打开「安装未知应用」，回来后自动继续。'**
  String get updateAllowInstallMessage;

  /// No description provided for @updateOpenReleasePage.
  ///
  /// In zh, this message translates to:
  /// **'打开发布页'**
  String get updateOpenReleasePage;

  /// No description provided for @updateUpdateNow.
  ///
  /// In zh, this message translates to:
  /// **'立即更新'**
  String get updateUpdateNow;

  /// No description provided for @updateSkipVersion.
  ///
  /// In zh, this message translates to:
  /// **'跳过这个版本'**
  String get updateSkipVersion;

  /// No description provided for @updateInstallWithSystem.
  ///
  /// In zh, this message translates to:
  /// **'用系统安装器安装'**
  String get updateInstallWithSystem;

  /// No description provided for @updateSystemInstallerFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开系统安装器'**
  String get updateSystemInstallerFailed;

  /// No description provided for @updateStarProject.
  ///
  /// In zh, this message translates to:
  /// **'去 Star'**
  String get updateStarProject;

  /// No description provided for @updateCancelDownload.
  ///
  /// In zh, this message translates to:
  /// **'取消下载'**
  String get updateCancelDownload;

  /// No description provided for @updateDownloadInBackground.
  ///
  /// In zh, this message translates to:
  /// **'后台下载'**
  String get updateDownloadInBackground;

  /// No description provided for @updateVerifying.
  ///
  /// In zh, this message translates to:
  /// **'正在校验…'**
  String get updateVerifying;

  /// No description provided for @updateInstallingBusy.
  ///
  /// In zh, this message translates to:
  /// **'安装中…'**
  String get updateInstallingBusy;

  /// No description provided for @updateOpenPermissionSettings.
  ///
  /// In zh, this message translates to:
  /// **'去开启'**
  String get updateOpenPermissionSettings;

  /// No description provided for @updateNoAbiPackage.
  ///
  /// In zh, this message translates to:
  /// **'这个版本还没有 {abi} 安装包，可以去发布页看看。'**
  String updateNoAbiPackage(String abi);

  /// No description provided for @updateNoPackage.
  ///
  /// In zh, this message translates to:
  /// **'这个版本还没有安装包，可以去发布页看看。'**
  String get updateNoPackage;

  /// No description provided for @updateDownloadingPercent.
  ///
  /// In zh, this message translates to:
  /// **'正在下载 {percent}%'**
  String updateDownloadingPercent(int percent);

  /// No description provided for @usageStatsTitle.
  ///
  /// In zh, this message translates to:
  /// **'发送匿名使用统计'**
  String get usageStatsTitle;

  /// No description provided for @usageStatsSection.
  ///
  /// In zh, this message translates to:
  /// **'改进 DSH Go'**
  String get usageStatsSection;

  /// No description provided for @usageStatsFooter.
  ///
  /// In zh, this message translates to:
  /// **'只含使用次数、版本和手机品牌，不含对话、文件和账号。'**
  String get usageStatsFooter;

  /// No description provided for @usageNoticeBody.
  ///
  /// In zh, this message translates to:
  /// **'不含对话和个人信息，可随时关闭'**
  String get usageNoticeBody;

  /// No description provided for @usageUpgradeNotice.
  ///
  /// In zh, this message translates to:
  /// **'新增匿名使用统计，帮助改进 DSH Go。\n不含对话和个人信息'**
  String get usageUpgradeNotice;

  /// No description provided for @usageUpgradeLearn.
  ///
  /// In zh, this message translates to:
  /// **'了解'**
  String get usageUpgradeLearn;

  /// No description provided for @usageUpgradeOff.
  ///
  /// In zh, this message translates to:
  /// **'关闭'**
  String get usageUpgradeOff;

  /// No description provided for @viewArtifactSaved.
  ///
  /// In zh, this message translates to:
  /// **'已存到 {value}'**
  String viewArtifactSaved(String value);

  /// No description provided for @viewDownloadFolder.
  ///
  /// In zh, this message translates to:
  /// **'下载/'**
  String get viewDownloadFolder;

  /// No description provided for @viewArtifactNoPreview.
  ///
  /// In zh, this message translates to:
  /// **'无法预览'**
  String get viewArtifactNoPreview;

  /// No description provided for @viewArtifactNotText.
  ///
  /// In zh, this message translates to:
  /// **'不是文本文件'**
  String get viewArtifactNotText;

  /// No description provided for @viewArtifactLarge.
  ///
  /// In zh, this message translates to:
  /// **'文件较大'**
  String get viewArtifactLarge;

  /// No description provided for @viewArtifactMissing.
  ///
  /// In zh, this message translates to:
  /// **'文件已经不在了'**
  String get viewArtifactMissing;

  /// No description provided for @viewArtifactNotFile.
  ///
  /// In zh, this message translates to:
  /// **'这不是文件'**
  String get viewArtifactNotFile;

  /// No description provided for @viewArtifactOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开'**
  String get viewArtifactOpenFailed;

  /// No description provided for @viewArtifactMore.
  ///
  /// In zh, this message translates to:
  /// **'更多操作'**
  String get viewArtifactMore;

  /// No description provided for @viewWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'工作区'**
  String get viewWorkspace;

  /// No description provided for @viewArtifactEmpty.
  ///
  /// In zh, this message translates to:
  /// **'空文件'**
  String get viewArtifactEmpty;

  /// No description provided for @viewArtifactLines.
  ///
  /// In zh, this message translates to:
  /// **'文件较大，只显示前 {count} 行'**
  String viewArtifactLines(int count);

  /// No description provided for @viewArtifactRows.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {count} 行'**
  String viewArtifactRows(int count);

  /// No description provided for @viewArtifactColumns.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 200 列'**
  String get viewArtifactColumns;

  /// No description provided for @viewArtifactWorksheet.
  ///
  /// In zh, this message translates to:
  /// **'工作表 {value}'**
  String viewArtifactWorksheet(int value);

  /// No description provided for @viewArtifactEmptySheet.
  ///
  /// In zh, this message translates to:
  /// **'空工作表'**
  String get viewArtifactEmptySheet;

  /// No description provided for @viewArtifactEmptyTable.
  ///
  /// In zh, this message translates to:
  /// **'空表格'**
  String get viewArtifactEmptyTable;

  /// No description provided for @viewArtifactConvertFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能转换'**
  String get viewArtifactConvertFailed;

  /// No description provided for @viewArtifactConverting.
  ///
  /// In zh, this message translates to:
  /// **'正在转换为 PDF 预览…'**
  String get viewArtifactConverting;

  /// No description provided for @viewArtifactImageFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法显示这张图片'**
  String get viewArtifactImageFailed;

  /// No description provided for @viewArtifactPhoneOpen.
  ///
  /// In zh, this message translates to:
  /// **'用手机上的应用打开'**
  String get viewArtifactPhoneOpen;

  /// No description provided for @viewArtifactPdfFailed.
  ///
  /// In zh, this message translates to:
  /// **'无法打开这个 PDF，试试用其他应用打开'**
  String get viewArtifactPdfFailed;

  /// No description provided for @viewArtifactPages.
  ///
  /// In zh, this message translates to:
  /// **'共 {count} 页'**
  String viewArtifactPages(int count);

  /// No description provided for @viewArtifactPage.
  ///
  /// In zh, this message translates to:
  /// **'第 {value} 页'**
  String viewArtifactPage(int value);

  /// No description provided for @viewBalanceInvalidKey.
  ///
  /// In zh, this message translates to:
  /// **'Key 无效，查不到余额'**
  String get viewBalanceInvalidKey;

  /// No description provided for @viewBalancePrefix.
  ///
  /// In zh, this message translates to:
  /// **'余额 '**
  String get viewBalancePrefix;

  /// No description provided for @viewBalanceLowSuffix.
  ///
  /// In zh, this message translates to:
  /// **' · 余额不足'**
  String get viewBalanceLowSuffix;

  /// No description provided for @viewBalanceUnavailableSuffix.
  ///
  /// In zh, this message translates to:
  /// **' · 已不能调用'**
  String get viewBalanceUnavailableSuffix;

  /// No description provided for @viewBalanceTopUp.
  ///
  /// In zh, this message translates to:
  /// **'充值'**
  String get viewBalanceTopUp;

  /// No description provided for @viewBalanceTitle.
  ///
  /// In zh, this message translates to:
  /// **'DeepSeek 余额'**
  String get viewBalanceTitle;

  /// No description provided for @viewBalanceKeyRequired.
  ///
  /// In zh, this message translates to:
  /// **'填写 API Key 后可查询余额'**
  String get viewBalanceKeyRequired;

  /// No description provided for @viewBalanceKeyInvalid.
  ///
  /// In zh, this message translates to:
  /// **'API Key 无效，无法查询余额'**
  String get viewBalanceKeyInvalid;

  /// No description provided for @viewBalancePaid.
  ///
  /// In zh, this message translates to:
  /// **'充值 {value}'**
  String viewBalancePaid(String value);

  /// No description provided for @viewBalanceGranted.
  ///
  /// In zh, this message translates to:
  /// **'赠送 {value}'**
  String viewBalanceGranted(String value);

  /// No description provided for @viewBalanceLow.
  ///
  /// In zh, this message translates to:
  /// **'余额不足'**
  String get viewBalanceLow;

  /// No description provided for @viewBalanceUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'已无法调用'**
  String get viewBalanceUnavailable;

  /// No description provided for @viewBalanceChecking.
  ///
  /// In zh, this message translates to:
  /// **'正在查询余额…'**
  String get viewBalanceChecking;

  /// No description provided for @viewBalanceCheckFailed.
  ///
  /// In zh, this message translates to:
  /// **'暂时无法查询余额'**
  String get viewBalanceCheckFailed;

  /// No description provided for @viewBalanceNoAlert.
  ///
  /// In zh, this message translates to:
  /// **'不提醒'**
  String get viewBalanceNoAlert;

  /// No description provided for @viewBalanceBannerHidden.
  ///
  /// In zh, this message translates to:
  /// **'本次运行不再显示余额提醒'**
  String get viewBalanceBannerHidden;

  /// No description provided for @viewBalanceTurnOff.
  ///
  /// In zh, this message translates to:
  /// **'不再提醒'**
  String get viewBalanceTurnOff;

  /// No description provided for @viewBalanceBelow.
  ///
  /// In zh, this message translates to:
  /// **'低于 {value}'**
  String viewBalanceBelow(String value);

  /// No description provided for @viewBalanceAlert.
  ///
  /// In zh, this message translates to:
  /// **'低余额提醒'**
  String get viewBalanceAlert;

  /// No description provided for @viewBalanceThreshold.
  ///
  /// In zh, this message translates to:
  /// **'提醒线'**
  String get viewBalanceThreshold;

  /// No description provided for @viewBalanceGoTopUp.
  ///
  /// In zh, this message translates to:
  /// **'去充值'**
  String get viewBalanceGoTopUp;

  /// No description provided for @viewBalanceRemaining.
  ///
  /// In zh, this message translates to:
  /// **'余额仅剩 {value}'**
  String viewBalanceRemaining(String value);

  /// No description provided for @viewBalanceModelDisabled.
  ///
  /// In zh, this message translates to:
  /// **'余额不足，模型已停用'**
  String get viewBalanceModelDisabled;

  /// No description provided for @viewBalanceRestore.
  ///
  /// In zh, this message translates to:
  /// **'充值后恢复'**
  String get viewBalanceRestore;

  /// No description provided for @viewUiIncomplete.
  ///
  /// In zh, this message translates to:
  /// **'视图没有生成完'**
  String get viewUiIncomplete;

  /// No description provided for @viewUiInvalid.
  ///
  /// In zh, this message translates to:
  /// **'这个视图格式有误'**
  String get viewUiInvalid;

  /// No description provided for @viewUiResend.
  ///
  /// In zh, this message translates to:
  /// **'让它重发'**
  String get viewUiResend;

  /// No description provided for @viewChartUnit.
  ///
  /// In zh, this message translates to:
  /// **'单位：{value}'**
  String viewChartUnit(String value);

  /// No description provided for @viewChartSeries.
  ///
  /// In zh, this message translates to:
  /// **'第 {value} 组'**
  String viewChartSeries(int value);

  /// No description provided for @viewChartTotal.
  ///
  /// In zh, this message translates to:
  /// **'合计'**
  String get viewChartTotal;

  /// No description provided for @viewChartBar.
  ///
  /// In zh, this message translates to:
  /// **'柱状图'**
  String get viewChartBar;

  /// No description provided for @viewChartHorizontalBar.
  ///
  /// In zh, this message translates to:
  /// **'横向柱状图'**
  String get viewChartHorizontalBar;

  /// No description provided for @viewChartLine.
  ///
  /// In zh, this message translates to:
  /// **'折线图'**
  String get viewChartLine;

  /// No description provided for @viewChartDonut.
  ///
  /// In zh, this message translates to:
  /// **'环形图'**
  String get viewChartDonut;

  /// No description provided for @viewUiResendMessage.
  ///
  /// In zh, this message translates to:
  /// **'上一个 dsh-ui 视图无法显示：{value}。请修正后重发。'**
  String viewUiResendMessage(Object value);

  /// No description provided for @viewUiBytesLimit.
  ///
  /// In zh, this message translates to:
  /// **'视图有 {first} 字节，超过上限 {second} 字节'**
  String viewUiBytesLimit(int first, int second);

  /// No description provided for @viewUiEmptyCode.
  ///
  /// In zh, this message translates to:
  /// **'代码块是空的'**
  String get viewUiEmptyCode;

  /// No description provided for @viewUiInvalidJson.
  ///
  /// In zh, this message translates to:
  /// **'不是合法的 JSON（{message}）'**
  String viewUiInvalidJson(String message);

  /// No description provided for @viewUiJsonRepaired.
  ///
  /// In zh, this message translates to:
  /// **'含注释或尾逗号，已忽略'**
  String get viewUiJsonRepaired;

  /// No description provided for @viewUiExpectedObject.
  ///
  /// In zh, this message translates to:
  /// **'应该是一个组件对象'**
  String get viewUiExpectedObject;

  /// No description provided for @viewUiDepthLimit.
  ///
  /// In zh, this message translates to:
  /// **'第 {first} 层，超过上限 {second} 层'**
  String viewUiDepthLimit(int first, int second);

  /// No description provided for @viewUiMissingType.
  ///
  /// In zh, this message translates to:
  /// **'缺少 type'**
  String get viewUiMissingType;

  /// No description provided for @viewUiUnknownComponent.
  ///
  /// In zh, this message translates to:
  /// **'未知组件 {value}'**
  String viewUiUnknownComponent(String value);

  /// No description provided for @viewUiAvailableTypes.
  ///
  /// In zh, this message translates to:
  /// **'{first}；可用：{second}'**
  String viewUiAvailableTypes(String first, String second);

  /// No description provided for @viewUiExpectedChildren.
  ///
  /// In zh, this message translates to:
  /// **'应该是 1 到 {limit} 个组件的数组'**
  String viewUiExpectedChildren(int limit);

  /// No description provided for @viewUiHiddenItems.
  ///
  /// In zh, this message translates to:
  /// **'已截断：还有 {count} 项没有显示'**
  String viewUiHiddenItems(int count);

  /// No description provided for @viewUiNodeLimit.
  ///
  /// In zh, this message translates to:
  /// **'超过 {first} 个组件，后 {second} 项已截断'**
  String viewUiNodeLimit(int first, int second);

  /// No description provided for @viewUiChildLimit.
  ///
  /// In zh, this message translates to:
  /// **'超过 {first} 项，后 {second} 项已截断'**
  String viewUiChildLimit(int first, int second);

  /// No description provided for @viewUiExpectedString.
  ///
  /// In zh, this message translates to:
  /// **'应该是字符串'**
  String get viewUiExpectedString;

  /// No description provided for @viewUiTextLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 个字符，超过上限 {second}'**
  String viewUiTextLimit(int first, int second);

  /// No description provided for @viewUiTextTruncated.
  ///
  /// In zh, this message translates to:
  /// **'已截断：文字过长'**
  String get viewUiTextTruncated;

  /// No description provided for @viewUiExpectedFinite.
  ///
  /// In zh, this message translates to:
  /// **'应该是有限的数'**
  String get viewUiExpectedFinite;

  /// No description provided for @viewUiYes.
  ///
  /// In zh, this message translates to:
  /// **'是'**
  String get viewUiYes;

  /// No description provided for @viewUiNo.
  ///
  /// In zh, this message translates to:
  /// **'否'**
  String get viewUiNo;

  /// No description provided for @viewUiExpectedStringNumber.
  ///
  /// In zh, this message translates to:
  /// **'应该是字符串或数字'**
  String get viewUiExpectedStringNumber;

  /// No description provided for @viewUiUnknownTone.
  ///
  /// In zh, this message translates to:
  /// **'未知 tone {value}，已忽略；可用：good, warn, bad'**
  String viewUiUnknownTone(String value);

  /// No description provided for @viewUiUnknownChart.
  ///
  /// In zh, this message translates to:
  /// **'未知图表 {value}，按柱状图画；可用：bar, hbar, line, donut'**
  String viewUiUnknownChart(String value);

  /// No description provided for @viewUiExpectedCategories.
  ///
  /// In zh, this message translates to:
  /// **'应该是非空的标签数组'**
  String get viewUiExpectedCategories;

  /// No description provided for @viewUiCategoryLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 个类别，超过上限 {second}'**
  String viewUiCategoryLimit(int first, int second);

  /// No description provided for @viewUiFirstPoints.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {limit} 个点'**
  String viewUiFirstPoints(int limit);

  /// No description provided for @viewUiExpectedSeries.
  ///
  /// In zh, this message translates to:
  /// **'应该是非空的数组，每项是 {shape}'**
  String viewUiExpectedSeries(String shape);

  /// No description provided for @viewUiSkippedSeries.
  ///
  /// In zh, this message translates to:
  /// **'应该是数字数组，这组已跳过'**
  String get viewUiSkippedSeries;

  /// No description provided for @viewUiValuesCategories.
  ///
  /// In zh, this message translates to:
  /// **'{first} 个值对 {second} 个类别，多的截掉、缺的留空'**
  String viewUiValuesCategories(int first, int second);

  /// No description provided for @viewUiNonFiniteValues.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个值不是有限的数，已留空'**
  String viewUiNonFiniteValues(int count);

  /// No description provided for @viewUiNoSeries.
  ///
  /// In zh, this message translates to:
  /// **'没有一组能画的数据'**
  String get viewUiNoSeries;

  /// No description provided for @viewUiDonutSeries.
  ///
  /// In zh, this message translates to:
  /// **'环形图只画一组数据，其余 {count} 组已忽略'**
  String viewUiDonutSeries(int count);

  /// No description provided for @viewUiFirstSeries.
  ///
  /// In zh, this message translates to:
  /// **'只画第一组数据'**
  String get viewUiFirstSeries;

  /// No description provided for @viewUiSeriesLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 组数据，超过上限 {second}'**
  String viewUiSeriesLimit(int first, int second);

  /// No description provided for @viewUiFirstSeriesCount.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {limit} 组数据'**
  String viewUiFirstSeriesCount(int limit);

  /// No description provided for @viewUiNoFiniteValues.
  ///
  /// In zh, this message translates to:
  /// **'没有一个有限的数值'**
  String get viewUiNoFiniteValues;

  /// No description provided for @viewUiTruncated.
  ///
  /// In zh, this message translates to:
  /// **'已截断：{value}'**
  String viewUiTruncated(String value);

  /// No description provided for @viewUiExpectedCompare.
  ///
  /// In zh, this message translates to:
  /// **'应该是 2 到 {limit} 项的数组，每项是 {shape}'**
  String viewUiExpectedCompare(int limit, String shape);

  /// No description provided for @viewUiItemLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 项，超过上限 {second}'**
  String viewUiItemLimit(int first, int second);

  /// No description provided for @viewUiFirstItems.
  ///
  /// In zh, this message translates to:
  /// **'只显示前 {limit} 项'**
  String viewUiFirstItems(int limit);

  /// No description provided for @viewUiSkippedCompare.
  ///
  /// In zh, this message translates to:
  /// **'应该是 {shape}，已跳过'**
  String viewUiSkippedCompare(String shape);

  /// No description provided for @viewUiSkippedItemLabel.
  ///
  /// In zh, this message translates to:
  /// **'应该是非空字符串，这项已跳过'**
  String get viewUiSkippedItemLabel;

  /// No description provided for @viewUiRowLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 行，超过上限 {second}'**
  String viewUiRowLimit(int first, int second);

  /// No description provided for @viewUiSkippedRow.
  ///
  /// In zh, this message translates to:
  /// **'应该是 [名称, 值]，已跳过'**
  String get viewUiSkippedRow;

  /// No description provided for @viewUiNoItems.
  ///
  /// In zh, this message translates to:
  /// **'没有一项能画'**
  String get viewUiNoItems;

  /// No description provided for @viewUiFirstRows.
  ///
  /// In zh, this message translates to:
  /// **'每项只显示前 {limit} 行'**
  String viewUiFirstRows(int limit);

  /// No description provided for @viewUiExpectedSteps.
  ///
  /// In zh, this message translates to:
  /// **'应该是非空数组，每项是 {shape}'**
  String viewUiExpectedSteps(String shape);

  /// No description provided for @viewUiStepLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 步，超过上限 {second}'**
  String viewUiStepLimit(int first, int second);

  /// No description provided for @viewUiFirstSteps.
  ///
  /// In zh, this message translates to:
  /// **'已截断：只显示前 {limit} 步'**
  String viewUiFirstSteps(int limit);

  /// No description provided for @viewUiSkippedStep.
  ///
  /// In zh, this message translates to:
  /// **'应该是 {shape}，已跳过'**
  String viewUiSkippedStep(String shape);

  /// No description provided for @viewUiUnknownStatus.
  ///
  /// In zh, this message translates to:
  /// **'未知状态 {value}，按 todo 画；可用：done, current, todo, failed'**
  String viewUiUnknownStatus(String value);

  /// No description provided for @viewUiNoSteps.
  ///
  /// In zh, this message translates to:
  /// **'没有一步能画'**
  String get viewUiNoSteps;

  /// No description provided for @viewUiUnknownCalloutTone.
  ///
  /// In zh, this message translates to:
  /// **'未知 tone {value}，按 info 画；可用：info, good, warn, bad'**
  String viewUiUnknownCalloutTone(String value);

  /// No description provided for @viewUiExpectedOptions.
  ///
  /// In zh, this message translates to:
  /// **'应该是 1 到 {limit} 个选项的数组，每项是 {shape}'**
  String viewUiExpectedOptions(int limit, String shape);

  /// No description provided for @viewUiOptionLimit.
  ///
  /// In zh, this message translates to:
  /// **'{first} 个选项，超过上限 {second}'**
  String viewUiOptionLimit(int first, int second);

  /// No description provided for @viewUiFirstOptions.
  ///
  /// In zh, this message translates to:
  /// **'已截断：只显示前 {limit} 个选项'**
  String viewUiFirstOptions(int limit);

  /// No description provided for @viewUiDuplicateLabel.
  ///
  /// In zh, this message translates to:
  /// **'重复的 label {value}，已跳过'**
  String viewUiDuplicateLabel(String value);

  /// No description provided for @viewUiNoOptions.
  ///
  /// In zh, this message translates to:
  /// **'没有一个能用的选项'**
  String get viewUiNoOptions;

  /// No description provided for @viewUiSummaryBody.
  ///
  /// In zh, this message translates to:
  /// **'[视图] {value}'**
  String viewUiSummaryBody(String value);

  /// No description provided for @viewUiSummaryTitleBody.
  ///
  /// In zh, this message translates to:
  /// **'[视图] {first}：{second}'**
  String viewUiSummaryTitleBody(String first, String second);

  /// No description provided for @viewUiSummaryInvalid.
  ///
  /// In zh, this message translates to:
  /// **'[视图]（格式有误，未能显示）'**
  String get viewUiSummaryInvalid;

  /// No description provided for @viewUiSummaryText.
  ///
  /// In zh, this message translates to:
  /// **'文字：{value}'**
  String viewUiSummaryText(String value);

  /// No description provided for @viewUiSummaryChart.
  ///
  /// In zh, this message translates to:
  /// **'图表：{summary}'**
  String viewUiSummaryChart(String summary);

  /// No description provided for @viewUiSummaryCompare.
  ///
  /// In zh, this message translates to:
  /// **'对比：{value}'**
  String viewUiSummaryCompare(String value);

  /// No description provided for @viewUiSummarySteps.
  ///
  /// In zh, this message translates to:
  /// **'步骤：{value}'**
  String viewUiSummarySteps(String value);

  /// No description provided for @viewUiSummaryCallout.
  ///
  /// In zh, this message translates to:
  /// **'提示：{value}'**
  String viewUiSummaryCallout(String value);

  /// No description provided for @viewUiSummaryOptions.
  ///
  /// In zh, this message translates to:
  /// **'选项：{value}'**
  String viewUiSummaryOptions(String value);

  /// No description provided for @viewUiSummaryConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认：{first}/{second}'**
  String viewUiSummaryConfirm(String first, String second);

  /// No description provided for @viewUiReplyChoice.
  ///
  /// In zh, this message translates to:
  /// **'选择：{value}'**
  String viewUiReplyChoice(String value);

  /// No description provided for @viewUiReplyConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认：{value}'**
  String viewUiReplyConfirm(String value);

  /// No description provided for @viewUiReplyCancel.
  ///
  /// In zh, this message translates to:
  /// **'取消：{value}'**
  String viewUiReplyCancel(String value);

  /// No description provided for @viewUiChosen.
  ///
  /// In zh, this message translates to:
  /// **'已选择：{value}'**
  String viewUiChosen(String value);

  /// No description provided for @viewUiConfirmed.
  ///
  /// In zh, this message translates to:
  /// **'已确认'**
  String get viewUiConfirmed;

  /// No description provided for @viewUiConfirmedValue.
  ///
  /// In zh, this message translates to:
  /// **'已确认：{value}'**
  String viewUiConfirmedValue(String value);

  /// No description provided for @viewUiCancelledValue.
  ///
  /// In zh, this message translates to:
  /// **'已取消：{value}'**
  String viewUiCancelledValue(String value);

  /// No description provided for @viewUiReplied.
  ///
  /// In zh, this message translates to:
  /// **'已回复'**
  String get viewUiReplied;

  /// No description provided for @viewUiGenerating.
  ///
  /// In zh, this message translates to:
  /// **'正在生成视图'**
  String get viewUiGenerating;

  /// No description provided for @viewUiReplyAfterEnd.
  ///
  /// In zh, this message translates to:
  /// **'回复结束后可选'**
  String get viewUiReplyAfterEnd;

  /// No description provided for @viewUiExpired.
  ///
  /// In zh, this message translates to:
  /// **'已失效'**
  String get viewUiExpired;

  /// No description provided for @viewUiNotStarted.
  ///
  /// In zh, this message translates to:
  /// **'未开始'**
  String get viewUiNotStarted;

  /// No description provided for @viewUiMultiple.
  ///
  /// In zh, this message translates to:
  /// **'可多选'**
  String get viewUiMultiple;

  /// No description provided for @viewSuggestWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'看看工作区有什么'**
  String get viewSuggestWorkspace;

  /// No description provided for @viewSuggestWorkspacePrompt.
  ///
  /// In zh, this message translates to:
  /// **'看看工作区里现在有哪些文件和项目，简单介绍一下。'**
  String get viewSuggestWorkspacePrompt;

  /// No description provided for @viewSuggestWordCount.
  ///
  /// In zh, this message translates to:
  /// **'写个词频统计脚本'**
  String get viewSuggestWordCount;

  /// No description provided for @viewSuggestWordCountPrompt.
  ///
  /// In zh, this message translates to:
  /// **'写一个 Python 脚本：统计一个文本文件里出现最多的 20 个词，并运行一次给我看结果。'**
  String get viewSuggestWordCountPrompt;

  /// No description provided for @viewSuggestNode.
  ///
  /// In zh, this message translates to:
  /// **'新建 Node.js 项目'**
  String get viewSuggestNode;

  /// No description provided for @viewSuggestNodePrompt.
  ///
  /// In zh, this message translates to:
  /// **'在工作区新建一个 Node.js 项目，配好 TypeScript 和一个最小的单元测试。'**
  String get viewSuggestNodePrompt;

  /// No description provided for @viewSuggestGit.
  ///
  /// In zh, this message translates to:
  /// **'rebase 还是 merge'**
  String get viewSuggestGit;

  /// No description provided for @viewSuggestGitPrompt.
  ///
  /// In zh, this message translates to:
  /// **'用一个具体例子解释 git rebase 和 git merge 的区别，各自什么时候用。'**
  String get viewSuggestGitPrompt;

  /// No description provided for @viewGreetingMorning.
  ///
  /// In zh, this message translates to:
  /// **'早上好'**
  String get viewGreetingMorning;

  /// No description provided for @viewGreetingNoon.
  ///
  /// In zh, this message translates to:
  /// **'中午好'**
  String get viewGreetingNoon;

  /// No description provided for @viewGreetingAfternoon.
  ///
  /// In zh, this message translates to:
  /// **'下午好'**
  String get viewGreetingAfternoon;

  /// No description provided for @viewGreetingEvening.
  ///
  /// In zh, this message translates to:
  /// **'晚上好'**
  String get viewGreetingEvening;

  /// No description provided for @viewGreetingNight.
  ///
  /// In zh, this message translates to:
  /// **'夜深了'**
  String get viewGreetingNight;

  /// No description provided for @viewEmptySubtitle.
  ///
  /// In zh, this message translates to:
  /// **'今天想做点什么？'**
  String get viewEmptySubtitle;

  /// No description provided for @viewEmptyStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在启动引擎…'**
  String get viewEmptyStarting;

  /// No description provided for @viewEmptyConnecting.
  ///
  /// In zh, this message translates to:
  /// **'正在连接引擎…'**
  String get viewEmptyConnecting;

  /// No description provided for @viewEmptyDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'引擎未连接'**
  String get viewEmptyDisconnected;

  /// No description provided for @viewEmptyReconnect.
  ///
  /// In zh, this message translates to:
  /// **'重新连接'**
  String get viewEmptyReconnect;

  /// No description provided for @viewEmptyWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'在「{value}」中'**
  String viewEmptyWorkspace(String value);

  /// No description provided for @viewEmptySwitchWorkspace.
  ///
  /// In zh, this message translates to:
  /// **'切换工作区'**
  String get viewEmptySwitchWorkspace;

  /// No description provided for @viewScheduleTitle.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务'**
  String get viewScheduleTitle;

  /// No description provided for @viewScheduleRefreshFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能刷新'**
  String get viewScheduleRefreshFailed;

  /// No description provided for @viewScheduleNone.
  ///
  /// In zh, this message translates to:
  /// **'没有进行中的任务'**
  String get viewScheduleNone;

  /// No description provided for @viewScheduleNext.
  ///
  /// In zh, this message translates to:
  /// **'下次 {value}'**
  String viewScheduleNext(String value);

  /// No description provided for @viewScheduleUntitled.
  ///
  /// In zh, this message translates to:
  /// **'未命名任务'**
  String get viewScheduleUntitled;

  /// No description provided for @viewScheduleSendFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能发送'**
  String get viewScheduleSendFailed;

  /// No description provided for @viewScheduleEnded.
  ///
  /// In zh, this message translates to:
  /// **'已结束'**
  String get viewScheduleEnded;

  /// No description provided for @viewScheduleUpcoming.
  ///
  /// In zh, this message translates to:
  /// **'接下来'**
  String get viewScheduleUpcoming;

  /// No description provided for @viewScheduleSending.
  ///
  /// In zh, this message translates to:
  /// **'发送中…'**
  String get viewScheduleSending;

  /// No description provided for @viewScheduleRunNow.
  ///
  /// In zh, this message translates to:
  /// **'立即运行'**
  String get viewScheduleRunNow;

  /// No description provided for @viewScheduleManage.
  ///
  /// In zh, this message translates to:
  /// **'管理'**
  String get viewScheduleManage;

  /// No description provided for @viewScheduleToday.
  ///
  /// In zh, this message translates to:
  /// **'今天 {value}'**
  String viewScheduleToday(String value);

  /// No description provided for @viewScheduleTomorrow.
  ///
  /// In zh, this message translates to:
  /// **'明天 {value}'**
  String viewScheduleTomorrow(String value);

  /// No description provided for @viewScheduleYesterday.
  ///
  /// In zh, this message translates to:
  /// **'昨天 {value}'**
  String viewScheduleYesterday(String value);

  /// No description provided for @viewScheduleWeekday.
  ///
  /// In zh, this message translates to:
  /// **'周{first} {second}'**
  String viewScheduleWeekday(String first, String second);

  /// No description provided for @viewScheduleDue.
  ///
  /// In zh, this message translates to:
  /// **'即将运行'**
  String get viewScheduleDue;

  /// No description provided for @viewScheduleDaysAhead.
  ///
  /// In zh, this message translates to:
  /// **'{count} 天后'**
  String viewScheduleDaysAhead(int count);

  /// No description provided for @viewScheduleDaysOverdue.
  ///
  /// In zh, this message translates to:
  /// **'已逾期 {count} 天'**
  String viewScheduleDaysOverdue(int count);

  /// No description provided for @viewScheduleSingleLabel.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务：{title}'**
  String viewScheduleSingleLabel(String title);

  /// No description provided for @viewScheduleCountLabel.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个自动化任务'**
  String viewScheduleCountLabel(int count);

  /// No description provided for @viewModelSelect.
  ///
  /// In zh, this message translates to:
  /// **'选择模型'**
  String get viewModelSelect;

  /// No description provided for @viewModelThinkingOff.
  ///
  /// In zh, this message translates to:
  /// **'不思考'**
  String get viewModelThinkingOff;

  /// No description provided for @viewModelThinkingMinimal.
  ///
  /// In zh, this message translates to:
  /// **'极少'**
  String get viewModelThinkingMinimal;

  /// No description provided for @viewModelThinkingLow.
  ///
  /// In zh, this message translates to:
  /// **'低'**
  String get viewModelThinkingLow;

  /// No description provided for @viewModelThinkingMedium.
  ///
  /// In zh, this message translates to:
  /// **'中'**
  String get viewModelThinkingMedium;

  /// No description provided for @viewModelThinkingHigh.
  ///
  /// In zh, this message translates to:
  /// **'高'**
  String get viewModelThinkingHigh;

  /// No description provided for @viewModelThinkingMax.
  ///
  /// In zh, this message translates to:
  /// **'最高'**
  String get viewModelThinkingMax;

  /// No description provided for @viewModelLabel.
  ///
  /// In zh, this message translates to:
  /// **'模型：{value}'**
  String viewModelLabel(String value);

  /// No description provided for @viewModelEffortLabel.
  ///
  /// In zh, this message translates to:
  /// **'思考深度{value}'**
  String viewModelEffortLabel(String value);

  /// No description provided for @viewModelLoadFailed.
  ///
  /// In zh, this message translates to:
  /// **'模型列表加载失败'**
  String get viewModelLoadFailed;

  /// No description provided for @viewModelDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'未连接引擎'**
  String get viewModelDisconnected;

  /// No description provided for @viewModelConnectHint.
  ///
  /// In zh, this message translates to:
  /// **'连接后即可选择模型'**
  String get viewModelConnectHint;

  /// No description provided for @viewModelEffort.
  ///
  /// In zh, this message translates to:
  /// **'思考深度'**
  String get viewModelEffort;

  /// No description provided for @viewModelKeyRequired.
  ///
  /// In zh, this message translates to:
  /// **'需要 API Key'**
  String get viewModelKeyRequired;

  /// No description provided for @viewModelProvidersHint.
  ///
  /// In zh, this message translates to:
  /// **'支持 DeepSeek 和其他模型渠道'**
  String get viewModelProvidersHint;

  /// No description provided for @viewModelEnterKey.
  ///
  /// In zh, this message translates to:
  /// **'填写 API Key'**
  String get viewModelEnterKey;

  /// No description provided for @viewModelAddProvider.
  ///
  /// In zh, this message translates to:
  /// **'添加其他渠道'**
  String get viewModelAddProvider;

  /// No description provided for @viewModelNone.
  ///
  /// In zh, this message translates to:
  /// **'暂无可用模型'**
  String get viewModelNone;

  /// No description provided for @viewModelKeyHint.
  ///
  /// In zh, this message translates to:
  /// **'Key 可能尚未生效或已失效'**
  String get viewModelKeyHint;

  /// No description provided for @viewModelManageProviders.
  ///
  /// In zh, this message translates to:
  /// **'管理渠道'**
  String get viewModelManageProviders;

  /// No description provided for @viewContinuePrompt.
  ///
  /// In zh, this message translates to:
  /// **'接着附件里这段对话聊：'**
  String get viewContinuePrompt;

  /// No description provided for @viewContinueRange.
  ///
  /// In zh, this message translates to:
  /// **'第 {first}–{second} 轮，共 {third} 轮'**
  String viewContinueRange(int first, int second, int third);

  /// No description provided for @viewContinueHeader.
  ///
  /// In zh, this message translates to:
  /// **'> 分享的 DSH Go 对话 · {value}\n'**
  String viewContinueHeader(String value);

  /// No description provided for @viewContinueUser.
  ///
  /// In zh, this message translates to:
  /// **'\n## 用户\n\n'**
  String get viewContinueUser;

  /// No description provided for @viewImageCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 张图片'**
  String viewImageCount(int count);

  /// No description provided for @viewContinueAttachments.
  ///
  /// In zh, this message translates to:
  /// **'\n（附件：{value}）\n'**
  String viewContinueAttachments(String value);

  /// No description provided for @viewContinueAssistant.
  ///
  /// In zh, this message translates to:
  /// **'\n## 助手\n\n'**
  String get viewContinueAssistant;

  /// No description provided for @viewContinueInterrupted.
  ///
  /// In zh, this message translates to:
  /// **'\n（回复被中断）\n'**
  String get viewContinueInterrupted;

  /// No description provided for @viewContinueFailed.
  ///
  /// In zh, this message translates to:
  /// **'（失败）'**
  String get viewContinueFailed;

  /// No description provided for @viewContinueDeclined.
  ///
  /// In zh, this message translates to:
  /// **'（被拒绝）'**
  String get viewContinueDeclined;

  /// No description provided for @viewContinueCancelled.
  ///
  /// In zh, this message translates to:
  /// **'（已取消）'**
  String get viewContinueCancelled;

  /// No description provided for @viewLinkWeek.
  ///
  /// In zh, this message translates to:
  /// **'7 天'**
  String get viewLinkWeek;

  /// No description provided for @viewLinkMonth.
  ///
  /// In zh, this message translates to:
  /// **'30 天'**
  String get viewLinkMonth;

  /// No description provided for @viewLinkForever.
  ///
  /// In zh, this message translates to:
  /// **'永久'**
  String get viewLinkForever;

  /// No description provided for @viewShareChat.
  ///
  /// In zh, this message translates to:
  /// **'对话'**
  String get viewShareChat;

  /// No description provided for @viewShareNoPermission.
  ///
  /// In zh, this message translates to:
  /// **'没有存储权限，没能保存'**
  String get viewShareNoPermission;

  /// No description provided for @viewShareOpenFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开分享'**
  String get viewShareOpenFailed;

  /// No description provided for @viewShareLinkFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能生成链接，稍后再试'**
  String get viewShareLinkFailed;

  /// No description provided for @viewShareLinkText.
  ///
  /// In zh, this message translates to:
  /// **'「{first}」· DSH Go 对话\n{second}'**
  String viewShareLinkText(String first, String second);

  /// No description provided for @viewShareEmpty.
  ///
  /// In zh, this message translates to:
  /// **'这个对话还没有内容'**
  String get viewShareEmpty;

  /// No description provided for @viewShareMessageCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条消息'**
  String viewShareMessageCount(int count);

  /// No description provided for @viewShareToolCount.
  ///
  /// In zh, this message translates to:
  /// **'{count} 次工具调用'**
  String viewShareToolCount(int count);

  /// No description provided for @viewShareFileHint.
  ///
  /// In zh, this message translates to:
  /// **'在 DSH Go 里回放、接着聊'**
  String get viewShareFileHint;

  /// No description provided for @viewShareWebHint.
  ///
  /// In zh, this message translates to:
  /// **'任何浏览器都能打开，不用联网'**
  String get viewShareWebHint;

  /// No description provided for @viewShareMarkdownHint.
  ///
  /// In zh, this message translates to:
  /// **'纯文本，随处可读'**
  String get viewShareMarkdownHint;

  /// No description provided for @viewShareLinkHint.
  ///
  /// In zh, this message translates to:
  /// **'端到端加密，服务器看不到内容'**
  String get viewShareLinkHint;

  /// No description provided for @viewSharePreview.
  ///
  /// In zh, this message translates to:
  /// **'预览'**
  String get viewSharePreview;

  /// No description provided for @viewShareWhole.
  ///
  /// In zh, this message translates to:
  /// **'整段对话'**
  String get viewShareWhole;

  /// No description provided for @viewShareScopeReply.
  ///
  /// In zh, this message translates to:
  /// **'这条回复'**
  String get viewShareScopeReply;

  /// No description provided for @viewShareScopePicked.
  ///
  /// In zh, this message translates to:
  /// **'选中消息'**
  String get viewShareScopePicked;

  /// No description provided for @viewShareThinking.
  ///
  /// In zh, this message translates to:
  /// **'思考过程'**
  String get viewShareThinking;

  /// No description provided for @viewShareIncludeTools.
  ///
  /// In zh, this message translates to:
  /// **'工具调用'**
  String get viewShareIncludeTools;

  /// No description provided for @viewShareChatFile.
  ///
  /// In zh, this message translates to:
  /// **'对话文件'**
  String get viewShareChatFile;

  /// No description provided for @viewShareWebPage.
  ///
  /// In zh, this message translates to:
  /// **'网页'**
  String get viewShareWebPage;

  /// No description provided for @viewShareLink.
  ///
  /// In zh, this message translates to:
  /// **'链接'**
  String get viewShareLink;

  /// No description provided for @viewShareAsImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get viewShareAsImage;

  /// No description provided for @viewShareAsFile.
  ///
  /// In zh, this message translates to:
  /// **'文件'**
  String get viewShareAsFile;

  /// No description provided for @viewShareAsText.
  ///
  /// In zh, this message translates to:
  /// **'文字'**
  String get viewShareAsText;

  /// No description provided for @viewShareRedacted.
  ///
  /// In zh, this message translates to:
  /// **'密钥已隐藏'**
  String get viewShareRedacted;

  /// No description provided for @viewShareAdjust.
  ///
  /// In zh, this message translates to:
  /// **'调整'**
  String get viewShareAdjust;

  /// No description provided for @viewShareTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'超过 {value} MB，请缩小范围'**
  String viewShareTooLarge(int value);

  /// No description provided for @viewShareCreateLink.
  ///
  /// In zh, this message translates to:
  /// **'生成链接'**
  String get viewShareCreateLink;

  /// No description provided for @viewShareStop.
  ///
  /// In zh, this message translates to:
  /// **'停止分享'**
  String get viewShareStop;

  /// No description provided for @viewShareStopTitle.
  ///
  /// In zh, this message translates to:
  /// **'停止分享？'**
  String get viewShareStopTitle;

  /// No description provided for @viewShareStopped.
  ///
  /// In zh, this message translates to:
  /// **'已停止分享'**
  String get viewShareStopped;

  /// No description provided for @viewQrCode.
  ///
  /// In zh, this message translates to:
  /// **'二维码'**
  String get viewQrCode;

  /// No description provided for @viewShareTurn.
  ///
  /// In zh, this message translates to:
  /// **'第 {value} 轮'**
  String viewShareTurn(int value);

  /// No description provided for @viewReplayContinue.
  ///
  /// In zh, this message translates to:
  /// **'接着聊'**
  String get viewReplayContinue;

  /// No description provided for @viewReplayTurns.
  ///
  /// In zh, this message translates to:
  /// **'第 {first}–{second} 轮'**
  String viewReplayTurns(int first, int second);

  /// No description provided for @viewReplaySeconds.
  ///
  /// In zh, this message translates to:
  /// **'{count} 秒'**
  String viewReplaySeconds(int count);

  /// No description provided for @viewReplayMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{count} 分钟'**
  String viewReplayMinutes(int count);

  /// No description provided for @viewReplayFull.
  ///
  /// In zh, this message translates to:
  /// **'全文'**
  String get viewReplayFull;

  /// No description provided for @viewReplayPause.
  ///
  /// In zh, this message translates to:
  /// **'暂停'**
  String get viewReplayPause;

  /// No description provided for @viewReplayRestart.
  ///
  /// In zh, this message translates to:
  /// **'重新播放'**
  String get viewReplayRestart;

  /// No description provided for @viewReplayPlay.
  ///
  /// In zh, this message translates to:
  /// **'播放'**
  String get viewReplayPlay;

  /// No description provided for @viewReplaySpeed.
  ///
  /// In zh, this message translates to:
  /// **'倍速 {value}×'**
  String viewReplaySpeed(int value);

  /// No description provided for @viewTemplatePaper.
  ///
  /// In zh, this message translates to:
  /// **'纸张'**
  String get viewTemplatePaper;

  /// No description provided for @viewTemplateGlass.
  ///
  /// In zh, this message translates to:
  /// **'玻璃'**
  String get viewTemplateGlass;

  /// No description provided for @viewTemplateCard.
  ///
  /// In zh, this message translates to:
  /// **'卡片'**
  String get viewTemplateCard;

  /// No description provided for @viewShareProjectQr.
  ///
  /// In zh, this message translates to:
  /// **'项目主页二维码'**
  String get viewShareProjectQr;

  /// No description provided for @viewShareBrandLine.
  ///
  /// In zh, this message translates to:
  /// **'手机上的 DSH · 扫码获取'**
  String get viewShareBrandLine;

  /// No description provided for @viewShareBrandLineNoQr.
  ///
  /// In zh, this message translates to:
  /// **'手机上的 DSH'**
  String get viewShareBrandLineNoQr;

  /// No description provided for @viewShareSteps.
  ///
  /// In zh, this message translates to:
  /// **'{count} 步'**
  String viewShareSteps(int count);

  /// No description provided for @viewShareWebSearch.
  ///
  /// In zh, this message translates to:
  /// **'联网搜索'**
  String get viewShareWebSearch;

  /// No description provided for @viewShareOpenPage.
  ///
  /// In zh, this message translates to:
  /// **'打开网页'**
  String get viewShareOpenPage;

  /// No description provided for @viewShareRunCommand.
  ///
  /// In zh, this message translates to:
  /// **'运行命令'**
  String get viewShareRunCommand;

  /// No description provided for @viewShareReadFile.
  ///
  /// In zh, this message translates to:
  /// **'查看文件'**
  String get viewShareReadFile;

  /// No description provided for @viewShareEditFile.
  ///
  /// In zh, this message translates to:
  /// **'修改文件'**
  String get viewShareEditFile;

  /// No description provided for @viewShareSubagent.
  ///
  /// In zh, this message translates to:
  /// **'子代理'**
  String get viewShareSubagent;

  /// No description provided for @viewShareSkill.
  ///
  /// In zh, this message translates to:
  /// **'使用技能'**
  String get viewShareSkill;

  /// No description provided for @viewSharePresentFiles.
  ///
  /// In zh, this message translates to:
  /// **'交付文件'**
  String get viewSharePresentFiles;

  /// No description provided for @viewShareWorkflow.
  ///
  /// In zh, this message translates to:
  /// **'工作流'**
  String get viewShareWorkflow;

  /// No description provided for @viewSharePlugin.
  ///
  /// In zh, this message translates to:
  /// **'调用插件'**
  String get viewSharePlugin;

  /// No description provided for @viewShareStars.
  ///
  /// In zh, this message translates to:
  /// **'星标'**
  String get viewShareStars;

  /// No description provided for @viewSharePluginTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH 插件「{value}」'**
  String viewSharePluginTitle(String value);

  /// No description provided for @viewShareInstallCommand.
  ///
  /// In zh, this message translates to:
  /// **'安装：dsh plugin add {value}'**
  String viewShareInstallCommand(String value);

  /// No description provided for @viewSharePhoneInstall.
  ///
  /// In zh, this message translates to:
  /// **'手机上一键安装：{value}'**
  String viewSharePhoneInstall(String value);

  /// No description provided for @viewShareImages.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get viewShareImages;

  /// No description provided for @viewSharePickMessages.
  ///
  /// In zh, this message translates to:
  /// **'选择消息'**
  String get viewSharePickMessages;

  /// No description provided for @viewShareDoneCount.
  ///
  /// In zh, this message translates to:
  /// **'完成（{count}）'**
  String viewShareDoneCount(int count);

  /// No description provided for @viewShareImageMarker.
  ///
  /// In zh, this message translates to:
  /// **'〔图片〕'**
  String get viewShareImageMarker;

  /// No description provided for @viewShareImagesMarker.
  ///
  /// In zh, this message translates to:
  /// **'〔{count} 张图片〕'**
  String viewShareImagesMarker(int count);

  /// No description provided for @viewShareYou.
  ///
  /// In zh, this message translates to:
  /// **'你'**
  String get viewShareYou;

  /// No description provided for @viewShareImageFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能生成图片，请重试'**
  String get viewShareImageFailed;

  /// No description provided for @viewShareQuestion.
  ///
  /// In zh, this message translates to:
  /// **'提问'**
  String get viewShareQuestion;

  /// No description provided for @viewShareModelSteps.
  ///
  /// In zh, this message translates to:
  /// **'模型与过程'**
  String get viewShareModelSteps;

  /// No description provided for @viewShareImagePreview.
  ///
  /// In zh, this message translates to:
  /// **'分享图片预览'**
  String get viewShareImagePreview;

  /// No description provided for @viewShareSaveImage.
  ///
  /// In zh, this message translates to:
  /// **'保存图片'**
  String get viewShareSaveImage;

  /// No description provided for @viewScheduleHoursAhead.
  ///
  /// In zh, this message translates to:
  /// **'{count} 小时后'**
  String viewScheduleHoursAhead(int count);

  /// No description provided for @viewScheduleHoursOverdue.
  ///
  /// In zh, this message translates to:
  /// **'已逾期 {count} 小时'**
  String viewScheduleHoursOverdue(int count);

  /// No description provided for @viewScheduleMinutesAhead.
  ///
  /// In zh, this message translates to:
  /// **'{count} 分钟后'**
  String viewScheduleMinutesAhead(int count);

  /// No description provided for @viewScheduleMinutesOverdue.
  ///
  /// In zh, this message translates to:
  /// **'已逾期 {count} 分钟'**
  String viewScheduleMinutesOverdue(int count);

  /// No description provided for @viewScheduleSecondsAhead.
  ///
  /// In zh, this message translates to:
  /// **'{count} 秒后'**
  String viewScheduleSecondsAhead(int count);

  /// No description provided for @viewScheduleSecondsOverdue.
  ///
  /// In zh, this message translates to:
  /// **'已逾期 {count} 秒'**
  String viewScheduleSecondsOverdue(int count);

  /// No description provided for @viewScheduleDate.
  ///
  /// In zh, this message translates to:
  /// **'{date} {clock}'**
  String viewScheduleDate(String date, String clock);

  /// No description provided for @viewScheduleYearDate.
  ///
  /// In zh, this message translates to:
  /// **'{year}年{date} {clock}'**
  String viewScheduleYearDate(String year, String date, String clock);

  /// No description provided for @viewScheduleWeekdayName.
  ///
  /// In zh, this message translates to:
  /// **'{day, select, 1{一} 2{二} 3{三} 4{四} 5{五} 6{六} other{日}}'**
  String viewScheduleWeekdayName(String day);

  /// No description provided for @viewReplayDate.
  ///
  /// In zh, this message translates to:
  /// **'{month} 月 {day} 日'**
  String viewReplayDate(String month, int day);

  /// No description provided for @viewReplayHours.
  ///
  /// In zh, this message translates to:
  /// **'{count} 小时'**
  String viewReplayHours(int count);

  /// No description provided for @viewReplayHoursMinutes.
  ///
  /// In zh, this message translates to:
  /// **'{hours} 小时 {minutes} 分钟'**
  String viewReplayHoursMinutes(int hours, int minutes);

  /// No description provided for @viewUiHundredMillion.
  ///
  /// In zh, this message translates to:
  /// **'{value}亿'**
  String viewUiHundredMillion(String value);

  /// No description provided for @viewUiTenThousand.
  ///
  /// In zh, this message translates to:
  /// **'{value}万'**
  String viewUiTenThousand(String value);

  /// No description provided for @viewUiMillion.
  ///
  /// In zh, this message translates to:
  /// **'{value}M'**
  String viewUiMillion(String value);

  /// No description provided for @viewListSeparator.
  ///
  /// In zh, this message translates to:
  /// **'，'**
  String get viewListSeparator;

  /// No description provided for @viewAttachmentSeparator.
  ///
  /// In zh, this message translates to:
  /// **'、'**
  String get viewAttachmentSeparator;

  /// No description provided for @viewUiInvalidJsonOffset.
  ///
  /// In zh, this message translates to:
  /// **'不是合法的 JSON（{message}，第 {offset} 个字符附近）'**
  String viewUiInvalidJsonOffset(String message, int offset);

  /// No description provided for @viewUiUnavailableChart.
  ///
  /// In zh, this message translates to:
  /// **'图表无法显示'**
  String get viewUiUnavailableChart;

  /// No description provided for @viewUiUnavailableMetric.
  ///
  /// In zh, this message translates to:
  /// **'指标无法显示'**
  String get viewUiUnavailableMetric;

  /// No description provided for @viewUiUnavailableCompare.
  ///
  /// In zh, this message translates to:
  /// **'对比无法显示'**
  String get viewUiUnavailableCompare;

  /// No description provided for @viewUiUnavailableSteps.
  ///
  /// In zh, this message translates to:
  /// **'步骤无法显示'**
  String get viewUiUnavailableSteps;

  /// No description provided for @viewUiUnavailableCallout.
  ///
  /// In zh, this message translates to:
  /// **'提示无法显示'**
  String get viewUiUnavailableCallout;

  /// No description provided for @viewUiUnavailableOptions.
  ///
  /// In zh, this message translates to:
  /// **'选项无法显示'**
  String get viewUiUnavailableOptions;

  /// No description provided for @viewUiUnavailableConfirm.
  ///
  /// In zh, this message translates to:
  /// **'确认无法显示'**
  String get viewUiUnavailableConfirm;

  /// No description provided for @viewUiUnavailableText.
  ///
  /// In zh, this message translates to:
  /// **'文字无法显示'**
  String get viewUiUnavailableText;

  /// No description provided for @viewUiUnavailableGroup.
  ///
  /// In zh, this message translates to:
  /// **'这一组无法显示'**
  String get viewUiUnavailableGroup;

  /// No description provided for @viewUiUnavailablePart.
  ///
  /// In zh, this message translates to:
  /// **'这部分无法显示'**
  String get viewUiUnavailablePart;

  /// No description provided for @viewScheduleSingleNextLabel.
  ///
  /// In zh, this message translates to:
  /// **'自动化任务：{title}，下次{when}'**
  String viewScheduleSingleNextLabel(String title, String when);

  /// No description provided for @viewScheduleCountNextLabel.
  ///
  /// In zh, this message translates to:
  /// **'{count} 个自动化任务，下次{when}'**
  String viewScheduleCountNextLabel(int count, String when);

  /// No description provided for @viewUiSkippedStepLabel.
  ///
  /// In zh, this message translates to:
  /// **'应该是字符串，这步已跳过'**
  String get viewUiSkippedStepLabel;

  /// No description provided for @viewLabeledValue.
  ///
  /// In zh, this message translates to:
  /// **'{label}：{value}'**
  String viewLabeledValue(String label, String value);

  /// No description provided for @viewDescribedValue.
  ///
  /// In zh, this message translates to:
  /// **'{label}，{description}'**
  String viewDescribedValue(String label, String description);

  /// No description provided for @viewSemicolonSeparator.
  ///
  /// In zh, this message translates to:
  /// **'；'**
  String get viewSemicolonSeparator;

  /// No description provided for @viewChartSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{kind}。{data}'**
  String viewChartSemantics(String kind, String data);

  /// No description provided for @viewMetricSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{label} {value}'**
  String viewMetricSemantics(String label, String value);

  /// No description provided for @viewMetricCaptionSemantics.
  ///
  /// In zh, this message translates to:
  /// **'{label} {value}，{caption}'**
  String viewMetricCaptionSemantics(String label, String value, String caption);

  /// No description provided for @viewScheduleZone.
  ///
  /// In zh, this message translates to:
  /// **'{rule}（{city} · {offset}）'**
  String viewScheduleZone(String rule, String city, String offset);

  /// No description provided for @viewContinueNotice.
  ///
  /// In zh, this message translates to:
  /// **'\n（{text}）\n'**
  String viewContinueNotice(String text);

  /// No description provided for @viewShareAltMarker.
  ///
  /// In zh, this message translates to:
  /// **'〔{alt}〕'**
  String viewShareAltMarker(String alt);

  /// No description provided for @viewModelThinkingXhigh.
  ///
  /// In zh, this message translates to:
  /// **'超高'**
  String get viewModelThinkingXhigh;

  /// No description provided for @viewUiDialectWebOnly.
  ///
  /// In zh, this message translates to:
  /// **'{kind} · 在网页版查看'**
  String viewUiDialectWebOnly(String kind);

  /// No description provided for @viewUiDialectKindInteractive.
  ///
  /// In zh, this message translates to:
  /// **'可交互内容'**
  String get viewUiDialectKindInteractive;

  /// No description provided for @viewUiDialectKindChart.
  ///
  /// In zh, this message translates to:
  /// **'图表'**
  String get viewUiDialectKindChart;

  /// No description provided for @viewUiDialectKindDiagram.
  ///
  /// In zh, this message translates to:
  /// **'示意图'**
  String get viewUiDialectKindDiagram;

  /// No description provided for @viewUiDialectKindImage.
  ///
  /// In zh, this message translates to:
  /// **'图片'**
  String get viewUiDialectKindImage;

  /// No description provided for @viewUiDialectKindAudio.
  ///
  /// In zh, this message translates to:
  /// **'音频'**
  String get viewUiDialectKindAudio;

  /// No description provided for @viewUiDialectKindVideo.
  ///
  /// In zh, this message translates to:
  /// **'视频'**
  String get viewUiDialectKindVideo;

  /// No description provided for @viewUiDialectKindScene.
  ///
  /// In zh, this message translates to:
  /// **'3D 场景'**
  String get viewUiDialectKindScene;

  /// No description provided for @viewUiDialectKindFiles.
  ///
  /// In zh, this message translates to:
  /// **'文件树'**
  String get viewUiDialectKindFiles;

  /// No description provided for @viewUiDialectKindMap.
  ///
  /// In zh, this message translates to:
  /// **'地图'**
  String get viewUiDialectKindMap;

  /// No description provided for @viewUiDialectKindOther.
  ///
  /// In zh, this message translates to:
  /// **'这部分'**
  String get viewUiDialectKindOther;

  /// No description provided for @viewUiDialectInvalid.
  ///
  /// In zh, this message translates to:
  /// **'这块内容在网页版查看'**
  String get viewUiDialectInvalid;

  /// No description provided for @viewUiDialectNote.
  ///
  /// In zh, this message translates to:
  /// **'在网页版查看'**
  String get viewUiDialectNote;

  /// No description provided for @voiceSettingsTitle.
  ///
  /// In zh, this message translates to:
  /// **'语音输入'**
  String get voiceSettingsTitle;

  /// No description provided for @voiceModeAuto.
  ///
  /// In zh, this message translates to:
  /// **'自动'**
  String get voiceModeAuto;

  /// No description provided for @voiceModeSystem.
  ///
  /// In zh, this message translates to:
  /// **'系统'**
  String get voiceModeSystem;

  /// No description provided for @voiceModeEngine.
  ///
  /// In zh, this message translates to:
  /// **'语音模型'**
  String get voiceModeEngine;

  /// No description provided for @voiceModeAutoHint.
  ///
  /// In zh, this message translates to:
  /// **'有语音模型时用它，否则用系统识别'**
  String get voiceModeAutoHint;

  /// No description provided for @voiceModeSystemHint.
  ///
  /// In zh, this message translates to:
  /// **'使用手机设置中的识别服务'**
  String get voiceModeSystemHint;

  /// No description provided for @voiceModeEngineHint.
  ///
  /// In zh, this message translates to:
  /// **'用引擎里的语音模型识别'**
  String get voiceModeEngineHint;

  /// No description provided for @voiceFallbackStarted.
  ///
  /// In zh, this message translates to:
  /// **'已改用语音模型，请再说一次'**
  String get voiceFallbackStarted;

  /// No description provided for @voiceChooseSystem.
  ///
  /// In zh, this message translates to:
  /// **'请在系统设置中选择语音识别服务'**
  String get voiceChooseSystem;

  /// No description provided for @voiceConfigureEngine.
  ///
  /// In zh, this message translates to:
  /// **'请先在语音设置里下载语音模型'**
  String get voiceConfigureEngine;

  /// No description provided for @voiceConfigureEither.
  ///
  /// In zh, this message translates to:
  /// **'系统识别用不了，可以在语音设置里下载语音模型'**
  String get voiceConfigureEither;

  /// No description provided for @voiceErrorNetworkTimeout.
  ///
  /// In zh, this message translates to:
  /// **'语音识别连接超时，请检查网络'**
  String get voiceErrorNetworkTimeout;

  /// No description provided for @voiceErrorNetwork.
  ///
  /// In zh, this message translates to:
  /// **'语音识别网络连接失败'**
  String get voiceErrorNetwork;

  /// No description provided for @voiceErrorAudio.
  ///
  /// In zh, this message translates to:
  /// **'语音录音失败，请检查麦克风'**
  String get voiceErrorAudio;

  /// No description provided for @voiceErrorServer.
  ///
  /// In zh, this message translates to:
  /// **'系统识别服务出错，请稍后再试'**
  String get voiceErrorServer;

  /// No description provided for @voiceErrorClient.
  ///
  /// In zh, this message translates to:
  /// **'无法启动系统识别，请检查语音服务'**
  String get voiceErrorClient;

  /// No description provided for @voiceErrorSpeechTimeout.
  ///
  /// In zh, this message translates to:
  /// **'没有听到声音，请再说一次'**
  String get voiceErrorSpeechTimeout;

  /// No description provided for @voiceErrorNoMatch.
  ///
  /// In zh, this message translates to:
  /// **'没有听清，再说一次'**
  String get voiceErrorNoMatch;

  /// No description provided for @voiceErrorBusy.
  ///
  /// In zh, this message translates to:
  /// **'系统识别正忙，请稍后再试'**
  String get voiceErrorBusy;

  /// No description provided for @voiceErrorPermission.
  ///
  /// In zh, this message translates to:
  /// **'需要麦克风权限才能语音输入'**
  String get voiceErrorPermission;

  /// No description provided for @voiceErrorTooManyRequests.
  ///
  /// In zh, this message translates to:
  /// **'语音识别请求太频繁，请稍后再试'**
  String get voiceErrorTooManyRequests;

  /// No description provided for @voiceErrorDisconnected.
  ///
  /// In zh, this message translates to:
  /// **'系统识别服务已断开'**
  String get voiceErrorDisconnected;

  /// No description provided for @voiceErrorLanguageUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'系统识别不支持这种语言'**
  String get voiceErrorLanguageUnsupported;

  /// No description provided for @voiceErrorLanguageUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'请先在语音服务中下载这种语言'**
  String get voiceErrorLanguageUnavailable;

  /// No description provided for @voiceErrorSupportCheck.
  ///
  /// In zh, this message translates to:
  /// **'语音服务不支持检查识别能力'**
  String get voiceErrorSupportCheck;

  /// No description provided for @voiceErrorDownloadEvents.
  ///
  /// In zh, this message translates to:
  /// **'语音服务不支持查询模型下载进度'**
  String get voiceErrorDownloadEvents;

  /// No description provided for @voiceErrorUnknown.
  ///
  /// In zh, this message translates to:
  /// **'语音服务返回错误 {code}，请更换识别服务'**
  String voiceErrorUnknown(int code);

  /// No description provided for @voiceSettingsFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取语音设置，请重试'**
  String get voiceSettingsFailed;

  /// No description provided for @voiceModeSection.
  ///
  /// In zh, this message translates to:
  /// **'识别方式'**
  String get voiceModeSection;

  /// No description provided for @voiceModelSection.
  ///
  /// In zh, this message translates to:
  /// **'语音模型'**
  String get voiceModelSection;

  /// No description provided for @voiceModelFooter.
  ///
  /// In zh, this message translates to:
  /// **'下载后在手机上识别中文、英文、粤语、日语和韩语，录音不出手机。'**
  String get voiceModelFooter;

  /// No description provided for @voiceModelWaiting.
  ///
  /// In zh, this message translates to:
  /// **'引擎启动后可以下载'**
  String get voiceModelWaiting;

  /// No description provided for @voiceModelUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前引擎不支持语音模型'**
  String get voiceModelUnsupported;

  /// No description provided for @voiceModelAbsent.
  ///
  /// In zh, this message translates to:
  /// **'未下载'**
  String get voiceModelAbsent;

  /// No description provided for @voiceModelDownloading.
  ///
  /// In zh, this message translates to:
  /// **'下载中'**
  String get voiceModelDownloading;

  /// No description provided for @voiceModelPreparing.
  ///
  /// In zh, this message translates to:
  /// **'正在校验和加载'**
  String get voiceModelPreparing;

  /// No description provided for @voiceModelReady.
  ///
  /// In zh, this message translates to:
  /// **'已就绪'**
  String get voiceModelReady;

  /// No description provided for @voiceModelFailed.
  ///
  /// In zh, this message translates to:
  /// **'下载失败'**
  String get voiceModelFailed;

  /// No description provided for @voiceModelBytes.
  ///
  /// In zh, this message translates to:
  /// **'{done} / {total}'**
  String voiceModelBytes(String done, String total);

  /// No description provided for @voiceModelReadyNote.
  ///
  /// In zh, this message translates to:
  /// **'已占用 {size}，可以离线使用'**
  String voiceModelReadyNote(String size);

  /// No description provided for @voiceModelAbsentNote.
  ///
  /// In zh, this message translates to:
  /// **'下载约 {size}'**
  String voiceModelAbsentNote(String size);

  /// No description provided for @voiceModelWaitingNote.
  ///
  /// In zh, this message translates to:
  /// **'下载会在引擎启动后开始'**
  String get voiceModelWaitingNote;

  /// No description provided for @voiceModelFailNetwork.
  ///
  /// In zh, this message translates to:
  /// **'网络连接失败'**
  String get voiceModelFailNetwork;

  /// No description provided for @voiceModelFailTimeout.
  ///
  /// In zh, this message translates to:
  /// **'下载长时间没有进展'**
  String get voiceModelFailTimeout;

  /// No description provided for @voiceModelFailCertificate.
  ///
  /// In zh, this message translates to:
  /// **'安全连接失败，请检查手机时间'**
  String get voiceModelFailCertificate;

  /// No description provided for @voiceModelFailServer.
  ///
  /// In zh, this message translates to:
  /// **'下载源暂时不可用'**
  String get voiceModelFailServer;

  /// No description provided for @voiceModelFailIntegrity.
  ///
  /// In zh, this message translates to:
  /// **'文件校验没有通过'**
  String get voiceModelFailIntegrity;

  /// No description provided for @voiceModelFailStorage.
  ///
  /// In zh, this message translates to:
  /// **'存储空间不足，还需要约 {size}'**
  String voiceModelFailStorage(String size);

  /// No description provided for @voiceModelFailEngine.
  ///
  /// In zh, this message translates to:
  /// **'引擎没有响应'**
  String get voiceModelFailEngine;

  /// No description provided for @voiceModelFailUnknown.
  ///
  /// In zh, this message translates to:
  /// **'下载没有完成'**
  String get voiceModelFailUnknown;

  /// No description provided for @voiceModelDownload.
  ///
  /// In zh, this message translates to:
  /// **'下载'**
  String get voiceModelDownload;

  /// No description provided for @voiceModelResume.
  ///
  /// In zh, this message translates to:
  /// **'继续下载'**
  String get voiceModelResume;

  /// No description provided for @voiceModelRedownload.
  ///
  /// In zh, this message translates to:
  /// **'重新下载'**
  String get voiceModelRedownload;

  /// No description provided for @voiceModelMeteredTitle.
  ///
  /// In zh, this message translates to:
  /// **'用移动数据下载？'**
  String get voiceModelMeteredTitle;

  /// No description provided for @voiceModelMeteredBody.
  ///
  /// In zh, this message translates to:
  /// **'语音模型约 {size}，会使用移动数据流量。'**
  String voiceModelMeteredBody(String size);

  /// No description provided for @voiceModelDeleteTitle.
  ///
  /// In zh, this message translates to:
  /// **'删除语音模型？'**
  String get voiceModelDeleteTitle;

  /// No description provided for @voiceModelDeleteBody.
  ///
  /// In zh, this message translates to:
  /// **'删除后语音输入改用系统识别，需要时可以重新下载。'**
  String get voiceModelDeleteBody;

  /// No description provided for @voiceModelDeleteFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能删除语音模型，请重试'**
  String get voiceModelDeleteFailed;

  /// No description provided for @voiceModelDeleteStopping.
  ///
  /// In zh, this message translates to:
  /// **'下载还在停止，请稍后再删'**
  String get voiceModelDeleteStopping;

  /// No description provided for @voiceModelStartedToast.
  ///
  /// In zh, this message translates to:
  /// **'语音模型开始下载 · 约 {size}'**
  String voiceModelStartedToast(String size);

  /// No description provided for @voiceModelResumedToast.
  ///
  /// In zh, this message translates to:
  /// **'继续下载语音模型 · 还剩约 {size}'**
  String voiceModelResumedToast(String size);

  /// No description provided for @voiceModelReadyToast.
  ///
  /// In zh, this message translates to:
  /// **'语音输入已就绪'**
  String get voiceModelReadyToast;

  /// No description provided for @voiceModelFailedToast.
  ///
  /// In zh, this message translates to:
  /// **'语音模型下载失败：{reason}'**
  String voiceModelFailedToast(String reason);

  /// No description provided for @voiceModelNoticeDownloading.
  ///
  /// In zh, this message translates to:
  /// **'正在下载语音模型 {percent}%'**
  String voiceModelNoticeDownloading(int percent);

  /// No description provided for @voiceModelNoticePreparing.
  ///
  /// In zh, this message translates to:
  /// **'正在校验语音模型'**
  String get voiceModelNoticePreparing;

  /// No description provided for @voiceModelNoticeFailed.
  ///
  /// In zh, this message translates to:
  /// **'语音模型下载失败，打开 App 重试'**
  String get voiceModelNoticeFailed;

  /// No description provided for @voiceScribeReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能读取语音设置，请重试。'**
  String get voiceScribeReadFailed;

  /// No description provided for @voiceScribeSavedReadFailed.
  ///
  /// In zh, this message translates to:
  /// **'已保存，刷新后可查看最新设置。'**
  String get voiceScribeSavedReadFailed;

  /// No description provided for @voiceScribeSaveUnconfirmed.
  ///
  /// In zh, this message translates to:
  /// **'没能确认保存，请刷新或重试。'**
  String get voiceScribeSaveUnconfirmed;

  /// No description provided for @voiceScribeTitle.
  ///
  /// In zh, this message translates to:
  /// **'语音设置'**
  String get voiceScribeTitle;

  /// No description provided for @voiceScribePolishPrompt.
  ///
  /// In zh, this message translates to:
  /// **'润色提示词'**
  String get voiceScribePolishPrompt;

  /// No description provided for @voiceScribeLanguage.
  ///
  /// In zh, this message translates to:
  /// **'识别语言'**
  String get voiceScribeLanguage;

  /// No description provided for @voiceScribeRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get voiceScribeRefresh;

  /// No description provided for @voiceScribeHostChanged.
  ///
  /// In zh, this message translates to:
  /// **'连接已变化，请重新打开。'**
  String get voiceScribeHostChanged;

  /// No description provided for @voiceScribeUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'当前连接暂不支持语音设置。'**
  String get voiceScribeUnsupported;

  /// No description provided for @voiceScribePluginDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认'**
  String get voiceScribePluginDefault;

  /// No description provided for @voiceScribeBuiltInPrompt.
  ///
  /// In zh, this message translates to:
  /// **'内置提示词'**
  String get voiceScribeBuiltInPrompt;

  /// No description provided for @voiceScribeProviders.
  ///
  /// In zh, this message translates to:
  /// **'识别服务'**
  String get voiceScribeProviders;

  /// No description provided for @voiceScribeKeySet.
  ///
  /// In zh, this message translates to:
  /// **'已设置密钥'**
  String get voiceScribeKeySet;

  /// No description provided for @voiceScribeNoKey.
  ///
  /// In zh, this message translates to:
  /// **'未设置密钥'**
  String get voiceScribeNoKey;

  /// No description provided for @voiceScribeHotwords.
  ///
  /// In zh, this message translates to:
  /// **'热词'**
  String get voiceScribeHotwords;

  /// No description provided for @voiceScribeHotwordRules.
  ///
  /// In zh, this message translates to:
  /// **'{count} 条规则'**
  String voiceScribeHotwordRules(int count);

  /// No description provided for @wallpaperTitle.
  ///
  /// In zh, this message translates to:
  /// **'壁纸'**
  String get wallpaperTitle;

  /// No description provided for @wallpaperDefault.
  ///
  /// In zh, this message translates to:
  /// **'默认'**
  String get wallpaperDefault;

  /// No description provided for @wallpaperCustom.
  ///
  /// In zh, this message translates to:
  /// **'自定义'**
  String get wallpaperCustom;

  /// No description provided for @wallpaperFrame.
  ///
  /// In zh, this message translates to:
  /// **'调整位置'**
  String get wallpaperFrame;

  /// No description provided for @wallpaperBlur.
  ///
  /// In zh, this message translates to:
  /// **'模糊'**
  String get wallpaperBlur;

  /// No description provided for @wallpaperLighten.
  ///
  /// In zh, this message translates to:
  /// **'提亮'**
  String get wallpaperLighten;

  /// No description provided for @wallpaperDim.
  ///
  /// In zh, this message translates to:
  /// **'压暗'**
  String get wallpaperDim;

  /// No description provided for @wallpaperReplace.
  ///
  /// In zh, this message translates to:
  /// **'更换图片'**
  String get wallpaperReplace;

  /// No description provided for @wallpaperPreview.
  ///
  /// In zh, this message translates to:
  /// **'预览'**
  String get wallpaperPreview;

  /// No description provided for @wallpaperFooter.
  ///
  /// In zh, this message translates to:
  /// **'用于首页、对话和抽屉。提亮在浅色模式、压暗在深色模式下各自生效，文字始终清晰。PNG、JPEG、WebP，15 MB 以内'**
  String get wallpaperFooter;

  /// No description provided for @wallpaperChanged.
  ///
  /// In zh, this message translates to:
  /// **'壁纸已更换'**
  String get wallpaperChanged;

  /// No description provided for @wallpaperTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'图片超过 15 MB'**
  String get wallpaperTooLarge;

  /// No description provided for @wallpaperUnsupported.
  ///
  /// In zh, this message translates to:
  /// **'支持 PNG、JPEG 和 WebP'**
  String get wallpaperUnsupported;

  /// No description provided for @wallpaperUnreadable.
  ///
  /// In zh, this message translates to:
  /// **'无法读取这张图片'**
  String get wallpaperUnreadable;

  /// No description provided for @wallpaperUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'无法打开相册'**
  String get wallpaperUnavailable;

  /// No description provided for @wallpaperBroken.
  ///
  /// In zh, this message translates to:
  /// **'无法读取'**
  String get wallpaperBroken;

  /// No description provided for @wallpaperEditorHint.
  ///
  /// In zh, this message translates to:
  /// **'拖动、双指缩放'**
  String get wallpaperEditorHint;

  /// No description provided for @wallpaperEditorReset.
  ///
  /// In zh, this message translates to:
  /// **'复原'**
  String get wallpaperEditorReset;

  /// No description provided for @wallpaperSampleTitle.
  ///
  /// In zh, this message translates to:
  /// **'周末去海边'**
  String get wallpaperSampleTitle;

  /// No description provided for @wallpaperSampleStatus.
  ///
  /// In zh, this message translates to:
  /// **'刚刚'**
  String get wallpaperSampleStatus;

  /// No description provided for @wallpaperSampleQuestion.
  ///
  /// In zh, this message translates to:
  /// **'这周六适合去海边吗？'**
  String get wallpaperSampleQuestion;

  /// No description provided for @wallpaperSampleAnswer.
  ///
  /// In zh, this message translates to:
  /// **'适合。周六午后晴，风力 2 级，浪高不到半米，是这周最好的一天。'**
  String get wallpaperSampleAnswer;

  /// No description provided for @wallpaperSampleNote.
  ///
  /// In zh, this message translates to:
  /// **'傍晚降温明显，带一件薄外套。'**
  String get wallpaperSampleNote;

  /// No description provided for @wallpaperSampleTool.
  ///
  /// In zh, this message translates to:
  /// **'查了 3 个天气来源'**
  String get wallpaperSampleTool;

  /// No description provided for @searchKwWallpaper.
  ///
  /// In zh, this message translates to:
  /// **'背景,背景图,聊天背景,自定义背景,换背景,模糊,壁纸图片'**
  String get searchKwWallpaper;

  /// No description provided for @webTitle.
  ///
  /// In zh, this message translates to:
  /// **'DSH 网页版'**
  String get webTitle;

  /// No description provided for @webSshAppOnly.
  ///
  /// In zh, this message translates to:
  /// **'经 SSH 隧道的地址只能在 App 内打开'**
  String get webSshAppOnly;

  /// No description provided for @webRelayUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'经 DSH Remote 中转时打不开网页版，请在那台电脑上打开'**
  String get webRelayUnavailable;

  /// No description provided for @webSshHost.
  ///
  /// In zh, this message translates to:
  /// **'SSH 主机'**
  String get webSshHost;

  /// No description provided for @webLocalAppOnly.
  ///
  /// In zh, this message translates to:
  /// **'本机地址带启动令牌，只能在 App 内打开'**
  String get webLocalAppOnly;

  /// No description provided for @webEngineStatus.
  ///
  /// In zh, this message translates to:
  /// **'引擎状态'**
  String get webEngineStatus;

  /// No description provided for @webEngineStarting.
  ///
  /// In zh, this message translates to:
  /// **'正在启动引擎'**
  String get webEngineStarting;

  /// No description provided for @webEngineStartFailed.
  ///
  /// In zh, this message translates to:
  /// **'引擎没能启动'**
  String get webEngineStartFailed;

  /// No description provided for @webEngineNotRunning.
  ///
  /// In zh, this message translates to:
  /// **'引擎没有运行'**
  String get webEngineNotRunning;

  /// No description provided for @webEngineProblem.
  ///
  /// In zh, this message translates to:
  /// **'引擎遇到了问题'**
  String get webEngineProblem;

  /// No description provided for @webStartingSoon.
  ///
  /// In zh, this message translates to:
  /// **'稍等片刻，网页版马上就好'**
  String get webStartingSoon;

  /// No description provided for @webStartToOpen.
  ///
  /// In zh, this message translates to:
  /// **'网页版由本机引擎提供，启动后就能打开'**
  String get webStartToOpen;

  /// No description provided for @webRestart.
  ///
  /// In zh, this message translates to:
  /// **'重新启动'**
  String get webRestart;

  /// No description provided for @webStartEngine.
  ///
  /// In zh, this message translates to:
  /// **'启动引擎'**
  String get webStartEngine;

  /// No description provided for @webSwitchToWeb.
  ///
  /// In zh, this message translates to:
  /// **'切换到网页界面'**
  String get webSwitchToWeb;

  /// No description provided for @webNativeFeatures.
  ///
  /// In zh, this message translates to:
  /// **'原生功能'**
  String get webNativeFeatures;

  /// No description provided for @webSwitchToNative.
  ///
  /// In zh, this message translates to:
  /// **'切回原生界面'**
  String get webSwitchToNative;

  /// No description provided for @webAppSettings.
  ///
  /// In zh, this message translates to:
  /// **'App 设置'**
  String get webAppSettings;

  /// No description provided for @webSwitchHost.
  ///
  /// In zh, this message translates to:
  /// **'切换主机'**
  String get webSwitchHost;

  /// No description provided for @webAttachmentTooLarge.
  ///
  /// In zh, this message translates to:
  /// **'附件太大，没能带进网页版'**
  String get webAttachmentTooLarge;

  /// No description provided for @webTextCopied.
  ///
  /// In zh, this message translates to:
  /// **'文字已复制，粘贴到输入框即可'**
  String get webTextCopied;

  /// No description provided for @webAttachmentFailed.
  ///
  /// In zh, this message translates to:
  /// **'附件没能带进网页版'**
  String get webAttachmentFailed;

  /// No description provided for @webHostUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'这台主机打不开网页版'**
  String get webHostUnavailable;

  /// No description provided for @webChatGone.
  ///
  /// In zh, this message translates to:
  /// **'这个对话已不在了'**
  String get webChatGone;

  /// No description provided for @webPageClosed.
  ///
  /// In zh, this message translates to:
  /// **'网页已关闭'**
  String get webPageClosed;

  /// No description provided for @webChatsWorkspaces.
  ///
  /// In zh, this message translates to:
  /// **'对话与工作区'**
  String get webChatsWorkspaces;

  /// No description provided for @webRefresh.
  ///
  /// In zh, this message translates to:
  /// **'刷新'**
  String get webRefresh;

  /// No description provided for @webOpenInBrowser.
  ///
  /// In zh, this message translates to:
  /// **'在浏览器打开'**
  String get webOpenInBrowser;

  /// No description provided for @webBrowserUnavailable.
  ///
  /// In zh, this message translates to:
  /// **'不能在浏览器打开'**
  String get webBrowserUnavailable;

  /// No description provided for @webReopen.
  ///
  /// In zh, this message translates to:
  /// **'重新打开'**
  String get webReopen;

  /// No description provided for @webPageNotOpened.
  ///
  /// In zh, this message translates to:
  /// **'页面没有打开'**
  String get webPageNotOpened;

  /// No description provided for @webCheckConnection.
  ///
  /// In zh, this message translates to:
  /// **'检查网络或引擎状态后再试'**
  String get webCheckConnection;

  /// No description provided for @webTargetSessionMissing.
  ///
  /// In zh, this message translates to:
  /// **'网页版里没找到这个对话，已停在首页'**
  String get webTargetSessionMissing;

  /// No description provided for @webTargetNotLoaded.
  ///
  /// In zh, this message translates to:
  /// **'网页版没有加载完成'**
  String get webTargetNotLoaded;

  /// No description provided for @webTargetSettingsMissing.
  ///
  /// In zh, this message translates to:
  /// **'没找到这页设置，可能需要先登录或开启对应插件'**
  String get webTargetSettingsMissing;

  /// No description provided for @webTargetPluginMissing.
  ///
  /// In zh, this message translates to:
  /// **'没找到这个插件，可能当前配置里没有它'**
  String get webTargetPluginMissing;

  /// No description provided for @webTargetSidebarFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能打开侧边栏，先在网页版里打开这个对话再试'**
  String get webTargetSidebarFailed;

  /// No description provided for @webTargetCordisMissing.
  ///
  /// In zh, this message translates to:
  /// **'没找到 Cordis 面板，插件可能已经移除'**
  String get webTargetCordisMissing;

  /// No description provided for @webTargetNewChatFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能新建对话，已停在网页版首页'**
  String get webTargetNewChatFailed;

  /// No description provided for @webTargetPageFailed.
  ///
  /// In zh, this message translates to:
  /// **'没能直接打开这一页，已停在网页版首页'**
  String get webTargetPageFailed;

  /// No description provided for @webConnectHostFirst.
  ///
  /// In zh, this message translates to:
  /// **'还没连上「{name}」，连上后再打开网页版'**
  String webConnectHostFirst(String name);
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return L10nEn();
    case 'pt':
      return L10nPt();
    case 'zh':
      return L10nZh();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
