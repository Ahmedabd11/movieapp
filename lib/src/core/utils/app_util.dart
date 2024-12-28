import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '';
import '../../../main.dart';
import '../../injector.dart';
import '../../presentation/screen/dashboard/view/dashboard_screen.dart';
import '../images/app_image.dart';
import 'app_constants.dart';
import 'app_custom_color.dart';
import 'global_utils.dart';

class AppUtil {
  /// this object will be used to control timer in otp cases, this will be initialized in [startTimer] method

  static const platform = MethodChannel('com.example.your_app/notifications');

  //
  // double getBaseWidgetPadding() {
  //   return 20.h;
  // }
  dynamic database;

  String getRoundedValueFromString(String? value) {
    return double.parse(value ?? "0").round().toString();
  }

  String getRoundedValueFromListOfString(List<String>? list) {
    if (list == null || list.isEmpty) {
      return "0";
    }
    return double.parse(list.first).round().toString();
  }

  void postLanguageChangeProcessing({bool needToCallDashboardAPIs = true}) {
    // DashboardViewModel.of(
    //   navigatorKey.currentState!.context,
    // ).callRequiredAPIsOnLanguageChange(
    //     needToCallDashboardAPIs: needToCallDashboardAPIs);
  }

  /// this method is being called from [main.dart] file in the main function
  /// and this method will purely be responsible for pre startup dependencies
  /// of the app, every dependency that is need to be initialized before app
  /// startup, will be initialized here
  Future<void> initializePreStartupDependencies() async {
    //await flutterNotify();
    // await Alarm.init();

    // await AndroidAlarmManager.initialize();
    // port.listen((_) async => backgroundAlarmCallingMain);
    // Workmanager().initialize(callbackDispatcher);

    await initializeDependencies();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await setupLogs();
    return;
  }

  //
  // void registerNotificationTask(String scheduledNotificationDateTime, AlarmInfo alarmInfo, {required bool isRepeating}) {
  //   Workmanager().registerOneOffTask(
  //     "service",
  //     "service",
  //     inputData: <String, dynamic>{
  //       'scheduledNotificationDateTime':scheduledNotificationDateTime,
  //       'title':alarmInfo.title,
  //       'id':alarmInfo.id??0,
  //       'suratNo':alarmInfo.suratNo,
  //       'verseNo':alarmInfo.verseNo,
  //       'ayah':alarmInfo.ayah,
  //       'translation':alarmInfo.translation,
  //       'isRepeating':isRepeating,
  //     },
  //   );
  //   debugPrint('********* registeration complted **************');
  // }
  //
  //   scheduleDailyNotification(DateTime notificationTime, AlarmInfo alarmInfo, {required bool isRepeating}) async {
  //   var time= notificationTime.difference(DateTime.now());
  //
  //   await AndroidAlarmManager.periodic(
  //     const Duration(minutes: 1),
  //     alarmInfo.id??0,
  //     backgroundAlarmCallingMain,
  //     startAt: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, notificationTime.hour, notificationTime.minute),
  //     rescheduleOnReboot: true,
  //     exact: true,
  //     wakeup: true,
  //     params: <String, dynamic>{
  //       'title':alarmInfo.title,
  //       'id':alarmInfo.id??0,
  //       'suratNo':alarmInfo.suratNo,
  //       'verseNo':alarmInfo.verseNo,
  //       'ayah':alarmInfo.ayah,
  //       'translation':alarmInfo.translation,
  //       'isRepeating':isRepeating,
  //     },
  //   );
  // }
  // ======================== GET NETWORK IMAGE URLS =====================

  // String getProfileImageUrl({required String fileName}) {
  //   return "${apiConstants.baseProfileImageUrl}$fileName";
  // }

  // ======================== DASHBOARD ==============================

  /// this method will be used when you'll need distance or size ratio between
  /// two limits
  double getSizeBetweenTwoBounds({
    required double lowerBound,
    required double upperBound,
    required double ratio,
  }) {
    return (upperBound * (1 - ratio)).clamp(lowerBound, upperBound);
  }

  /// this method will be used with [Positioned] widgets, so that we'll give
  /// max bound of positioned from any side, and according to the ration it'll
  /// return boundRatio from the particular side
  double? getSizeForSingleBound({
    required bound,
    required double ratio,
  }) {
    return (bound * ratio);
  }

  // ============================= DASHBOARD UTIL FUNCTIONS ==================

  // ============================= UTIL FUNCTIONS ==========================
  String roundUpToPlaceByConvertingStringIntoDouble(String value,
      {int? upToPlace}) {
    return double.parse(value).toStringAsFixed(upToPlace ?? 1);
  }

  String convertDoubleToInteger(String? value) {
    return double.parse(value ?? "0.0").round().toString();
  }

  /// this method is responsible for getting device id from user's phone
  /// and setting it in [DeviceInfoManager.setDeviceId]
  ///
  /// this method is being called from [initializePreStartupDependencies]

  // flutterNotify()async {
  //   flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
  //   var initializationSettingsAndroid = const AndroidInitializationSettings('codex_logo');
  //   var initializationSettingsIOS = IOSInitializationSettings(
  //       requestAlertPermission: true,
  //       requestBadgePermission: true,
  //       requestSoundPermission: true,
  //       onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {});
  //   var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async {
  //     if (payload != null) {
  //       debugPrint('notification payload: ' + payload);
  //     }
  //   });
  // }

  setupLogs() async {
    debugPrint = (String? message, {int? wrapWidth}) {
      if (!kReleaseMode) {
        log("${injector<AppConstants>().debugLogKey}"
            "$message");
      }
    };
  }

  String getBase64fromImage(Uint8List unit8List) {
    String base64String = base64Encode(unit8List);
    return base64String;
  }

  // Future<String> openImagePicker() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     return Future.value(getBase64fromImage(await image.readAsBytes()));
  //   }
  //   return Future.value('');
  // }

  String getCountryFlag({required String countryCode}) {
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  // decimal control in market place if there is .0 at end it will remove .0 from end;
  String decimalCalculation(String price) {
    if (price.split(".")[1] == "0") {
      return price.split(".")[0];
    } else {
      return (double.parse(price)).toStringAsFixed(2);
    }
  }

  double getBaseWidgetPadding() {
    return 24.h;
  }

  showExitPopup2() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: navigatorKey.currentContext!,
          builder: (context) => AlertDialog(
            backgroundColor: injector<AppCustomColor>().mainAppColor,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SvgPicture.asset(injector<AppImages>().movieSvg,
                      fit: BoxFit.cover, width: 31, height: 31),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Login Required',
                  style: TextStyle(
                      fontFamily: "Uber move", fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: const Text('Please Login into the The Movie App'),
            actions: [
              TextButton(
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    fontFamily: "Uber move",
                    fontWeight: FontWeight.bold,
                    color: injector<AppCustomColor>().mainContentColor,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                    fontFamily: "Uber move",
                    fontWeight: FontWeight.bold,
                    color: injector<AppCustomColor>().mainContentColor,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
            elevation: 24,
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  showDeletePopup2(String uniqueKey) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: navigatorKey.currentContext!,
          builder: (context) => AlertDialog(
            backgroundColor: injector<AppCustomColor>().mainAppColor,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SvgPicture.asset(injector<AppImages>().movieSvg,
                      fit: BoxFit.cover, width: 31, height: 31),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Delete ',
                  style: TextStyle(
                      fontFamily: "Uber move", fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: const Text('Do you want to delete this person record'),
            actions: [
              TextButton(
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    fontFamily: "Uber move",
                    fontWeight: FontWeight.bold,
                    color: injector<AppCustomColor>().mainContentColor,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontFamily: "Uber move",
                      fontWeight: FontWeight.bold,
                      color: injector<AppCustomColor>().mainContentColor,
                    ),
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(navigatorKey.currentContext!)
                        .showSnackBar(
                      const SnackBar(
                        content: Text('All records deleted successfully!',
                            style: TextStyle(fontFamily: "OpenSans-Regular")),
                      ),
                    );
                    navigatorKey.currentState!.pushReplacementNamed(
                      DashboardScreen.id,
                    );
                  }),
            ],
            elevation: 24,
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  void showExitPopup(BuildContext context) async {
    bool? shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: injector<AppCustomColor>().mainAppColor,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: SvgPicture.asset(injector<AppImages>().movieSvg,
                  fit: BoxFit.cover, width: 31, height: 31),
            ),
            const SizedBox(width: 10),
            const Text(
              'Confirm Exit',
              style: TextStyle(
                fontFamily: "Uber move",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: const Text('Do you want to close the app?'),
        actions: [
          TextButton(
            child: Text(
              "CANCEL",
              style: TextStyle(
                fontFamily: "Uber move",
                fontWeight: FontWeight.bold,
                color: injector<AppCustomColor>().mainContentColor,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: Text(
              "OK",
              style: TextStyle(
                fontFamily: "Uber move",
                fontWeight: FontWeight.bold,
                color: injector<AppCustomColor>().mainContentColor,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
        elevation: 24,
      ),
    );

    // Check if the user confirmed exit
    if (shouldExit ?? false) {
      // Exit the app
      SystemNavigator.pop();
    }
  }

  //FORMAT THE TIMER TO MINUTES:SECONDS
  String formatTimerFromString(int otpCounter) {
    String sec = (otpCounter % 60).toString();
    String min = (otpCounter / 60).toStringAsFixed(5);

    if (sec.length == 1) {
      sec = '0$sec';
    }

    if (min[1] == '.') {
      min = min.substring(0, 1);
    }

    return '$min:$sec';
  }

  DateTime getTodayDateTimeForCalendar() {
    return DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
  }

  DateTime getInitialDateTimeForCalendar() {
    return DateTime(DateTime.now().year - 50, 8);
  }
}
