
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/utils/app_custom_color.dart';
import '../../../../injector.dart';

class GenericButton extends StatelessWidget {
  final double? width, height, radius, textSize;
  final Color? color, textColor;
  final EdgeInsets? margin, padding,wholePadding;
  final VoidCallback onPressed;
  final String? text;
  final String? semantics;
  final Widget? child;
  final bool enableMarquee;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget? leading;
  final AppUIParams? appUIParams;

  const GenericButton(
      {Key? key,
        this.text,
        required this.onPressed,
        this.height,
        this.width,
        this.textSize,
        this.color,
        this.textColor,
        this.semantics,
        this.radius,
        this.margin,
        this.padding,
        this.wholePadding,
        this.borderColor,
        this.textStyle,
        this.borderRadius,
        this.leading,
        this.child,
        required this.appUIParams,
        this.enableMarquee = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Semantics(
        value: semantics,
        button: true,
        child: Padding(
          padding: wholePadding??EdgeInsets.symmetric(horizontal: 8.0.h),
          child: Container(
            margin: margin ?? const EdgeInsets.symmetric(horizontal: 0),
            width: width ?? 338,
            height: height ?? 52,
            decoration: BoxDecoration(
                 border: Border.all(color: borderColor??injector<AppCustomColor>().transparent),
                borderRadius: borderRadius ??
                    BorderRadius.circular(radius ?? 10,),
                color: color ?? injector<AppCustomColor>()
                    .mainContentColor,),
            child: Center(
              child: Padding(
                padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
                child: child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            text ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: textStyle?? const TextStyle(
                                color: Colors.white
                            ),),
                        ),
                        leading ?? Container(),
                        SizedBox(
                          width: leading != null ? 10 : 0,
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}