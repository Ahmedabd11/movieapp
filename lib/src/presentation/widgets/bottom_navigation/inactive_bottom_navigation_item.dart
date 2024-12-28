import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/src/core/utils/app_custom_color.dart';
import 'package:movie/src/injector.dart';

import '../../../config/theme/local/app_text_style.dart';
import '../../../core/params/app_ui/app_ui_params.dart';
import '../../../model/dashboard_bottom_navigation_model.dart';
import '../generics/generic_text/generic_text.dart';


class InActiveBottomNavigationItem extends StatelessWidget {
  final DashboardBottomNavigationModel dashboardBottomNavigationModel;
  final AppUIParams appUIParams;
  final VoidCallback onPressed;

  const InActiveBottomNavigationItem(
      {Key? key,
        required this.appUIParams,
        required this.dashboardBottomNavigationModel,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inActiveColor = injector<AppCustomColor>().defaultHintColor;
    // final inActiveColor = HexColor(appUIParams
    //     .themeEngine
    //     .currentlyActiveTheme!
    //     .screens!
    //     .controllerScreens!
    //     .dashboardScreenThemeConfig!
    //     .bottomNavigation!
    //     .inactiveNavigationIconColor!);
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: appUIParams.appLocalColors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.h,),
              Center(
                child:SvgPicture.asset(
                  height: 25.sp,
                  width: 25.sp,
                  color: inActiveColor,
            dashboardBottomNavigationModel.imageUrl,
              ),

              ),
              Center(
                  child:GenericText(dashboardBottomNavigationModel.name,style: injector<AppTextStyles>().medium13.copyWith(color: inActiveColor),)
              )
            ],
          ),
        ),
      ),
    );
  }
}