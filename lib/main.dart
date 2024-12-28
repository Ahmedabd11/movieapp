import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:movie/src/config/provider/app_providers.dart';
import 'package:movie/src/config/routes/app_routes.dart';
import 'package:movie/src/core/utils/app_constants.dart';
import 'package:movie/src/core/utils/app_util.dart';
import 'package:movie/src/core/utils/global_utils.dart';
import 'package:movie/src/injector.dart';

import 'package:movie/src/presentation/screen/splash_screen/view/splash_screen.dart'
    as splash_screen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppUtil().initializePreStartupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: injector<AppProviders>().providers,
        child: ScreenUtilInit(
            designSize: injector<AppConstants>().appDesignSize,
            builder: (context, _) => MaterialApp(
                  builder: (BuildContext context, Widget? widget) => MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: widget!),
                  debugShowCheckedModeBanner: false,
                  title: 'The Movie App',
                  navigatorKey: navigatorKey,
                  onGenerateRoute: injector<AppRoutes>().onGenerateRoute,
                  initialRoute: splash_screen.SplashScreen.id,
                  theme: ThemeData(
                    colorSchemeSeed: Colors.blue,
                  ),
                )));
  }
}
