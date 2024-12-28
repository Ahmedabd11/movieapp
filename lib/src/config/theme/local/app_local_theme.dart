import 'package:flutter/material.dart';

import '../../../core/utils/app_custom_color.dart';
import '../../../injector.dart';

// final darkTheme = ThemeData(
//   primaryColor: injector<AppCustomColor>().black,
//   brightness: Brightness.dark,
//   dividerColor: Colors.black12,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
//       .copyWith(background: const Color(0xFF181A1F))
//       .copyWith(secondary: injector<AppCustomColor>().mainContentColor,brightness:Brightness.dark),
// );
//
// final lightTheme = ThemeData(
//   primaryColor: injector<AppCustomColor>().mainContentColor,
//   brightness: Brightness.light,
//   dividerColor: Colors.white54,
//   colorScheme: ColorScheme.fromSwatch(primarySwatch:  Colors.amber)
//     .copyWith(background: injector<AppCustomColor>().backgroundColorLight)
//     .copyWith(secondary: injector<AppCustomColor>().black,brightness:Brightness.light),
// );