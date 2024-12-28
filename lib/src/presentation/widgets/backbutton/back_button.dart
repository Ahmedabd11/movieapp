
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/params/app_ui/app_ui_params.dart';
import '../../../core/utils/app_custom_color.dart';
import '../../../injector.dart';
class BackArrowButton extends StatelessWidget {
  final AppUIParams appUIParams;
  const BackArrowButton({Key? key,required this.appUIParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.h),
      child: SvgPicture.asset(
        appUIParams.appImages.movieSvg,
        width: 24.w,
        height:24.h,
        color:injector<AppCustomColor>().black,
      ),
    );
  }
}
