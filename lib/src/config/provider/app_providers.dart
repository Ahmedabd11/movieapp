import 'package:provider/provider.dart';

import 'package:movie/src/presentation/screen/home/home_screen_view_model.dart';

import '../../presentation/screen/dashboard/view_model/dashboard_screen_view_model.dart';
import '../../presentation/screen/splash_screen/view_model/splash_screen_view_model.dart';
import '../../presentation/screen/welcome/view_model/welcome_viewModel.dart';

class AppProviders {
  final List<ChangeNotifierProvider> providers = [
    // ============== Test =================
    ///Splash Screen
    ChangeNotifierProvider<SplashScreenViewModel>(
        create: (_) => SplashScreenViewModel()),
    ChangeNotifierProvider<DashboardViewModel>(
        create: (_) => DashboardViewModel()),
    ChangeNotifierProvider<WelcomeViewModel>(create: (_) => WelcomeViewModel()),
    ChangeNotifierProvider<HomeScreenViewModel>(
        create: (_) => HomeScreenViewModel()),
  ];
}
