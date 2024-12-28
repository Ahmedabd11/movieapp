

import '../../../config/theme/local/app_text_style.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../injector.dart';
import '../../utils/font_constants.dart';


extension Fonts on AppTextStyles {
  static TextStyle currentlyActiveFont(
      {TextStyle? textStyle,
        Color? color,
        Color? backgroundColor,
        double? fontSize,
        FontWeight? fontWeight,
        String? fontFamily,
        FontStyle? fontStyle,
        double? letterSpacing,
        double? wordSpacing,
        TextBaseline? textBaseline,
        double? height,
        Paint? foreground,
        Paint? background,
        List<ui.Shadow>? shadows,
        List<ui.FontFeature>? fontFeatures,
        TextDecoration? decoration,
        Color? decorationColor,
        TextDecorationStyle? decorationStyle,
        double? decorationThickness}) {
    return
        TextStyle(
        color: color,
        height: height,
        fontFamily:fontFamily??injector<FontConstants>().regular,
        background: background,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        backgroundColor: backgroundColor,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFeatures: fontFeatures,
        fontStyle: fontStyle,
        foreground: foreground,
        letterSpacing: letterSpacing,
        shadows: shadows,
        textBaseline: textBaseline,
        wordSpacing: wordSpacing);
  }
}