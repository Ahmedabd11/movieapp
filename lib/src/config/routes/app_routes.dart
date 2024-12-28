import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie/src/presentation/screen/home/home_screen.dart';
import 'package:movie/src/presentation/screen/setting/setting_screen.dart';
import '../../injector.dart';
import '../../presentation/screen/dashboard/view/dashboard_screen.dart';
import '../../presentation/screen/splash_screen/view/splash_screen.dart';
import '../../presentation/screen/welcome/view/welcome_screen.dart';

class AppRoutes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log("GOING TO ROUTE: ${settings.name}");

    switch (settings.name) {
      case SplashScreen.id:
        return buildMaterialPageRoute(
            route: SplashScreen(
          appUIParams: injector(),
        ));
      case WelcomeScreen.id:
        return buildMaterialPageRoute(
            route: WelcomeScreen(
          appUIParams: injector(),
        ));
      case HomeScreen.id:
        return buildMaterialPageRoute(
            route: HomeScreen(
          appUIParams: injector(),
        ));

      case DashboardScreen.id:
        return buildMaterialPageRoute(
            route: DashboardScreen(
          appUIParams: injector(),
        ));
      case SettingScreen.id:
        return buildMaterialPageRoute(
            route: SettingScreen(
          appUIParams: injector(),
        ));
      default:
        return buildMaterialPageRoute(route: const Scaffold());
    }
  }

  MaterialPageRoute buildMaterialPageRoute({required Widget route}) {
    return MaterialPageRoute(builder: (_) => route);
  }
}
