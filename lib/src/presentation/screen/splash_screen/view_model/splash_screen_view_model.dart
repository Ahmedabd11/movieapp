


import 'package:flutter/foundation.dart';


import 'package:movie/src/core/lifecycle/use_lifecycle.dart';


import '../../../../core/utils/global_utils.dart';
import '../../welcome/view/welcome_screen.dart';


class SplashScreenViewModel extends UseLifeCycle with ChangeNotifier {
  moveToDashboardScreen() {
    navigatorKey.currentState?.pushNamed(WelcomeScreen.id);

  }


  SplashScreenViewModel() {
    Future.delayed(const Duration(seconds: 5), () async {
      moveToDashboardScreen();
      // Do something
    });

  }


  // determinePosition() async {
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  // }


}
