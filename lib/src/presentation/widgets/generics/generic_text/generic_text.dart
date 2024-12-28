import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextStyle? style;
  final TextDirection? textDirection;
  final Locale? locale;
  final String? semantics;
  final Color? selectionColor;
  final EdgeInsets? wholePadding;
  final String? semanticsLabel;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;
  final bool multiLineText;

  const GenericText(this.text,
      {Key? key,
        this.overflow,
        this.maxLines,
        this.style,
        this.semantics,
        this.textDirection,
        this.strutStyle,
        this.textWidthBasis,
        this.textScaleFactor,
        this.textHeightBehavior,
        this.textAlign,
        this.locale,
        this.selectionColor,
        this.wholePadding,
        this.semanticsLabel,
        this.multiLineText = false,
        this.softWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding??EdgeInsets.symmetric(horizontal: 8.0.h),
      child: Semantics(
        value: semantics,
        child: Text(
          text,
          style: style?.copyWith(height: multiLineText ? 1 : null),
          overflow: overflow,
          maxLines: maxLines,
          textDirection: textDirection,
          locale: locale,
          selectionColor: selectionColor,
          semanticsLabel: semanticsLabel,
          softWrap: softWrap,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textHeightBehavior: textHeightBehavior,
          textScaleFactor: textScaleFactor,
          textWidthBasis: textWidthBasis,
        ),
      ),
    );
  }
}