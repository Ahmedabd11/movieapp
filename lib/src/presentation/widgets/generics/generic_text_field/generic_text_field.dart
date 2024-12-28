import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../config/theme/local/app_local_color.dart';
import '../../../../config/theme/local/app_text_style.dart';
import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../injector.dart';
class GenericTextField extends StatelessWidget {
  final Color? borderColor,
      focusedBorder,
      fillColor,
      requiredSpanColor,
      labelColor,
      textColor,
      hintColor;
  final TextStyle? hintStyle, textStyle, fieldLabelStyle;
  final String? hintText, errorText, fieldLabel,semantics;
  final Widget? leadingIcon, trailingIcon;
  final TextInputType? textInputType;
  final EdgeInsets? wholePadding;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool? isObscure, enableSuggestion, autoCorrection, filled;
  final InputDecoration? decoration;
  final bool isRequired;
  final bool useBottomPadding;
  final bool isNumberField;
  final TextEditingController controller;
  final Function(String)? onFieldSubmit;
  final Function(dynamic)? onChange;
  final Function()? onTap;
  final double? borderRadius;
  final int? maxLength;
  final bool? enable;
  final bool? readOnly;
  final bool useUnderLinedInputBorder;
  final bool useZeroPrefixPadding;
  final List<TextInputFormatter> inputFormatters;
  final int? errorMaxLines;
  final AppUIParams appUIParams;
  final TextAlign textAlign;
  final double? spaceBetweenLabelAndField;

  const GenericTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.borderColor,
    this.isObscure,
    this.labelColor,
    this.textColor,
    this.semantics,
    this.hintColor,
    this.focusNode,
    this.leadingIcon,
    this.maxLines,
    this.textInputType,
    this.useBottomPadding = true,
    this.fieldLabel,
    this.useUnderLinedInputBorder = false,
    this.requiredSpanColor,
    this.isRequired = false,
    this.textInputAction,
    this.wholePadding,
    this.hintStyle,
    this.textStyle,
    this.decoration,
    this.fillColor,
    this.fieldLabelStyle,
    this.filled,
    this.spaceBetweenLabelAndField,
    this.contentPadding,
    this.focusedBorder,
    this.enableSuggestion,
    this.autoCorrection,
    this.errorText,
    this.errorMaxLines,
    this.trailingIcon,
    this.isNumberField = false,
    this.useZeroPrefixPadding = false,
    this.borderRadius,
    this.maxLength,
    this.enable,
    this.onFieldSubmit,
    this.onTap,
    required this.appUIParams,
    this.inputFormatters = const [],
    this.textAlign = TextAlign.start, this.onChange, this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: wholePadding??EdgeInsets.symmetric(horizontal: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (fieldLabel != null) ...[
            RichText(
                text: TextSpan(
                    text: fieldLabel,
                    style: fieldLabelStyle ??
                        injector<AppTextStyles>().regular19.copyWith(
                            color: labelColor ??
                                injector<AppLocalColors>().black,
                            fontWeight: FontWeight.w700),
                    children: [
                      if (isRequired)
                        TextSpan(
                            text: '',
                            style: injector<AppUIParams>()
                                .appTextStyles
                                .regular19
                                .copyWith(
                                color: injector<AppLocalColors>().errorRed))
                    ])),
            SizedBox(
              height: spaceBetweenLabelAndField ?? 12.h,
            )
          ],
          TextFormField(
            readOnly: readOnly??false,
            onChanged: onChange,
            controller: controller,
            obscureText: isObscure ?? false,
            maxLines: maxLines ?? 1,
            enabled: enable ?? true,
            maxLength: maxLength,
            textAlign: textAlign,
            style: textStyle ??
                injector<AppTextStyles>().regular19.copyWith(
                    color: textColor ?? injector<AppLocalColors>().black),
            enableSuggestions: enableSuggestion ?? true,
            keyboardType:
            isNumberField ? TextInputType.phone : textInputType,
            onTap: onTap,
            autocorrect: autoCorrection ?? true,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmit,
            decoration: decoration ??
                InputDecoration(
                  errorStyle: TextStyle(
                    color: Theme.of(context).primaryColor, // or any other color
                  ),
                  counterText: "",
                  disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color:
                        injector<AppLocalColors>().transparent,
                        width: 0,
                      )),
                  contentPadding: contentPadding ??
                      ((maxLines == null)
                          ? EdgeInsets.symmetric(horizontal: 5.w)
                          : EdgeInsets.symmetric(
                          horizontal: 5.w, vertical: 15.h)),
                  hintText: hintText ?? '',
                  hintMaxLines: 1,
                  filled: filled,
                  fillColor: fillColor,
                  hintStyle: hintStyle ??
                      injector<AppTextStyles>().regular19.copyWith(
                        color: hintColor ),
                  errorText: errorText,
                  errorMaxLines: errorMaxLines,
                  border: useUnderLinedInputBorder
                      ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor ??
                            fillColor ??
                            injector<AppLocalColors>().transparent,
                      ))
                      : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ??
                          fillColor ??
                          injector<AppLocalColors>().transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                       borderRadius ?? 10.r),
                  ),
                  enabledBorder: useUnderLinedInputBorder
                      ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor ??
                            fillColor ??
                            injector<AppLocalColors>().transparent,
                      ))
                      : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ??
                          fillColor ??
                          injector<AppLocalColors>().transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                    borderRadius ?? 10.r),
                  ),
                  focusedBorder: useUnderLinedInputBorder
                      ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: borderColor ??
                            fillColor ??
                            injector<AppLocalColors>().transparent,
                      ))
                      : OutlineInputBorder(
                    borderSide: BorderSide(
                      color: focusedBorder ??
                          fillColor ??
                          borderColor ??
                          injector<AppLocalColors>().transparent,
                    ),
                    borderRadius: BorderRadius.circular(
                        borderRadius ?? 10.r),
                  ),
                  suffixIcon: trailingIcon != null
                      ? Padding(
                    padding: EdgeInsetsDirectional.only(
                        end: 10.w, start: 5.w),
                    child: trailingIcon,
                  )
                      : null,
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: useZeroPrefixPadding ? 0.w : 10.w,
                      end: 5.w,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (leadingIcon != null) ...[
                          leadingIcon!,
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      ],
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: 0.h,
                    minWidth: 0.h,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minHeight: 0.h,
                    minWidth: 0.h,
                  ),
                ),
            inputFormatters: inputFormatters,
          ),
          if (useBottomPadding)
            SizedBox(
              height: 20.h,
            )
        ],
      )
    );
  }
}