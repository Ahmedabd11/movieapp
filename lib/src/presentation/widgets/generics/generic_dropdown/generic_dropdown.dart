import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/local/app_local_color.dart';
import '../../../../config/theme/local/app_text_style.dart';
import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/typedefs/typedefs.dart';
import '../../../../core/utils/app_custom_color.dart';
import '../../../../injector.dart';
import '../generic_text/generic_text.dart';


class DropdownGeneric<T> extends StatelessWidget {
  final OnDropDownItemChanged<T?> onDropDownItemChanged;
  final MapDropDownText<T> mapDropDownText;
  final List<T> items;
  final T? value;
  final Widget? icon;
  final Color? iconColor;
  final Color? dropDownColor;
  final String? hintText;
  final String? dropdownLabel;
  final Color? dropdownLabelColor;
  final TextStyle? hintTextStyle;
  final TextStyle? dropdownLabelStyle;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? hintColor;
  final bool isRequired;
  final bool useTransparentBorder;
  final bool useBottomPadding;
  final InputDecoration? decoration;
  final EdgeInsets? contentPadding;
  final AppUIParams appUIParams;
  final bool filled;
  final Color? boxColor;
  final Color? fillColor;
  final Widget? leading;
  final Color? dropdownPopupBgColor;
  final bool? image;
  final double? radius;
  final double? spaceBetweenLabelAndField;
  final double? paddingBetweenLabelAndDropdown;

  const DropdownGeneric({
    Key? key,
    required this.items,
    required this.mapDropDownText,
    required this.onDropDownItemChanged,
    required this.appUIParams,
    this.contentPadding,
    this.value,
    this.dropDownColor,
    this.dropdownLabel,
    this.dropdownLabelStyle,
    this.dropdownLabelColor,
    this.hintText,
    this.hintTextStyle,
    this.textStyle,
    this.textColor,
    this.leading,
    this.hintColor,
    this.dropdownPopupBgColor,
    this.paddingBetweenLabelAndDropdown,
    this.fillColor,
    this.filled = true,
    this.useBottomPadding = true,
    this.useTransparentBorder = false,
    this.isRequired = false,
    this.icon,
    this.iconColor,
    this.decoration, this.boxColor, this.spaceBetweenLabelAndField, this.image, this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (dropdownLabel!= null) ...[
            RichText(
                text: TextSpan(
                    text: dropdownLabel,
                    style: dropdownLabelStyle ??
                        injector<AppTextStyles>().regular19.copyWith(
                            color: dropdownLabelColor ??
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
          Container(

            padding: EdgeInsets.symmetric(horizontal: 15.0.h,vertical: 5.h),
            decoration: BoxDecoration(
              color: fillColor??injector<AppCustomColor>().mainAppColor,
              border: Border.all(
                  color: boxColor!, style: BorderStyle.solid, width: 1),
              borderRadius: BorderRadius.circular(radius??15.h),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                hint: GenericText(hintText!,style:hintTextStyle),
                dropdownColor: dropDownColor,
                icon: leading??Icon(
                  Icons.keyboard_arrow_down,
                  color: textColor,
                ),
                items: items
                    .map((e) => DropdownMenuItem<T>(
                  value: e,
                  child: Row(
                    children: [
                      // image==true?Image.asset(appUIPa):const SizedBox.shrink(),
                      image==true?SizedBox(width: 10.w,):const SizedBox.shrink(),
                      mapDropDownText(e),
                    ],
                  ),
                ))
                    .toList(),
                onChanged: (T? value) {
                  onDropDownItemChanged(value);
                  // viewModel.updateDropdownLanguage(value!);
                },
                isExpanded: true,
                value: (value != null)
                    ? value
                    : (hintText == null)
                    ? items.first
                    : null,
                // value: viewModel.dropdownGender.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}