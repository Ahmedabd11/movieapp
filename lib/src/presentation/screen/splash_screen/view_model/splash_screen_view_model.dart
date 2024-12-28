


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

}
