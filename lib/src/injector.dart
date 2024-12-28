import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import 'config/provider/app_providers.dart';
import 'config/routes/app_routes.dart';
import 'config/theme/local/app_local_color.dart';
import 'config/theme/local/app_text_style.dart';
import 'core/images/app_image.dart';

import 'core/params/app_ui/app_ui_params.dart';

import 'core/utils/app_constants.dart';
import 'core/utils/app_custom_color.dart';

import 'core/utils/app_util.dart';
import 'core/utils/font_constants.dart';

final injector = GetIt.I;

Future<void> initializeDependencies() async {
  injector.allowReassignment = true;
  // ============ REGISTRATION OF APP PROVIDERS =================
  injector.registerSingleton<AppProviders>(AppProviders());

  // ============ REGISTRATION OF APP ROUTES ================
  injector.registerSingleton<AppRoutes>(AppRoutes());

  // ============ REGISTRATION OF APP CONSTANTS ===============
  injector.registerSingleton<AppConstants>(AppConstants());

  // ============ REGISTRATION OF FONT CONSTANTS ===============
  injector.registerSingleton<FontConstants>(FontConstants());

  // ============ REGISTRATION OF APP LOCAL COLORS ===============
  injector.registerSingleton<AppCustomColor>(AppCustomColor());
  injector.registerSingleton<AppLocalColors>(AppLocalColors());

  // ============ REGISTRATION OF APP IMAGES ===============

  injector.registerSingleton<AppImages>(AppImages());
  // ============ REGISTRATION OF API CONSTANTS ===============

  // ============ REGISTRATION SEMANTICS===============

  // ============ REGISTRATION CRYPTOGRAPHIC MANAGER===============

  // ============ REGISTRATION SHARED PREF MANAGER===============

  // ============ REGISTRATION CACHE CONSTANTS ===============

  // ============ REGISTRATION CACHE MANAGER ===============

  // ============ REGISTRATION OF LOCALIZATION ============

  // ============ REGISTRATION OF AppUtil ==============
  injector.registerSingleton<AppUtil>(AppUtil());

  // ============ REGISTRATION OF APP TEXT STYLES ===============

  injector.registerFactory<AppTextStyles>(() => AppTextStyles());
  // ============ REGISTRATION OF TEXT FIELD VALIDATOR ===============

  // ============ REGISTRATION OF INPUT FORMATTERS ===============

  // ============ REGISTRATION CRYPTOGRAPHIC CONSTANTS===============

  // ============ REGISTRATION CRYPTOGRAPHIC MANAGER===============

  // =========== REGISTRATION OF THEME ENGINE =============

  // =========== REGISTRATION OF TAB BAR MANAGER ==============

  // ============ REGISTRATION FIREBASE REMOTE CONFIG SERVICE ===============

  // ============ REGISTRATION OF APP UI PARAMS ===============

  injector.registerSingleton<AppUIParams>(
      AppUIParams(injector(), injector(), injector()));
  // ============ REGISTRATION APP POPUPS ===============

  // ============ REGISTRATION PERMISSION MANAGER ===============

  // ============ REGISTRATION OF DIO ==============
  injector.registerSingleton<Dio>(Dio());

  // ============ REGISTRATION OF API CLIENT ==============

  // ============ REGISTRATION OF REPOSITORIES ============

  // ============ REGISTRATION OF USE CASES ===============
}
