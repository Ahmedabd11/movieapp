import 'package:flutter/material.dart';

class AppCustomColor{
  // final mainContentColor=const Color(0xff198450);
  final mainContentColor=const Color(0xff2e2739);
  final light=const Color(0xffdbdbdf);
  final subContentColor=const Color(0xff787878);
  final mainAppColor=const Color(0xfffff8f6);
  final mainAppTextColor=const Color(0xff4d4d4d);
  final mainBlackColor=const Color(0xff333333);
  final appbarColor=const Color(0xffF49619);
  final greenShadeColor=const Color(0xffF5DEB3);
  final greenDarkShadeColor=const  Color(0xffF5DEB3);
  final greenDarkShadeColor2=const  Color(0xa2875941);
  final brown=const  Color(0xffB29366);
  final buttonTextColor=const Color(0xfffbd9c0);
  final starColor=const Color(0xfffca229);
  final starGreyColor=const Color(0xffe9e9e9);
  // final textFieldColor=const Color(0xfff5eeec);
  // final textFieldColor=const Color(0xfff8f5f4);
  final textFieldColor=const Color(0xfffaf6f5);
  final dropContainerColor=const Color(0xffb38d80);
  final dropContainerBorderColor=const Color(0xa2875941);
  final hintTextFieldColor=const Color(0xffdbd5d3);
  final textFieldTextColor=const Color(0xff1a1a1a);
  final textFieldLabelColor= const Color(0xff333333);
  final buttonColor= const Color(0xff875941);
  final white = const Color(0xffffffff);
  final defaultHintColor = const Color(0xff939393);
  final errorRed = const Color(0xffE04343);
  final transparent = Colors.transparent;
  final black = const Color(0xff000000);

}

class CustomColors {
  static Color primaryTextColor = Colors.white;
  static Color dividerColor = Colors.white54;
  static Color pageBackgroundColor = Color(0xFF2D2F41);
  static Color menuBackgroundColor = Color(0xFF242634);

  static Color clockBG = Color(0xff198450);
  static Color clockOutline =  Color(0xFF242634);
  static Color? secHandColor = Colors.orange[300];
  static Color minHandStatColor = Color(0xFF748EF6);
  static Color minHandEndColor = Color(0xFF77DDFF);
  static Color hourHandStatColor = Color(0xFFC279FB);
  static Color hourHandEndColor = Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [Color(0xffE5F6DF), Color(0xff198450)];
  static List<Color> sunset = [Color(0xffE5F6DF), Color(0xff198450)];
  static List<Color> sea = [Color(0xffE5F6DF), Color(0xff198450)];
  // static List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];
  // static List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];
  // static List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];
  // static List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];
}

class GradientTemplate {
  static List<GradientColors> gradientTemplate = [
    GradientColors(GradientColors.sky),
    GradientColors(GradientColors.sunset),
    GradientColors(GradientColors.sea),
    // GradientColors(GradientColors.mango),
    // GradientColors(GradientColors.fire),
  ];
}