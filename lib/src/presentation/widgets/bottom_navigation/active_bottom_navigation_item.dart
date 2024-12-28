import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/src/config/theme/local/app_text_style.dart';
import 'package:movie/src/core/utils/app_custom_color.dart';
import 'package:movie/src/injector.dart';
import 'package:movie/src/presentation/widgets/generics/generic_text/generic_text.dart';

import '../../../core/params/app_ui/app_ui_params.dart';
import '../../../core/typedefs/typedefs.dart';
import '../../../model/dashboard_acrive_page_index_and_menu_relationship.dart';
import '../../../model/dashboard_bottom_navigation_model.dart';


class ActiveBottomNavigationItem extends StatelessWidget {
  final DashboardBottomNavigationModel dashboardBottomNavigationModel;
  final DashboardActivePageIndexAndMenuRelationship indexMenuRelationship;
  final AppUIParams appUIParams;
  final BottomNavOnPressedCallBack onPressed;

  const ActiveBottomNavigationItem(
      {super.key,
        required this.dashboardBottomNavigationModel,
        required this.indexMenuRelationship,
        required this.appUIParams,
        required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    final activeColor =  injector<AppCustomColor>().white;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed(indexMenuRelationship.index);
          print(indexMenuRelationship.index);
        },
        child:
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5.h,),
                Center(
                  child:SvgPicture.asset(
                    height: 30.sp,
                    width: 30.sp,
                      dashboardBottomNavigationModel.imageUrl,
                    color: activeColor,
                ),
                ),
                Center(
                  child:GenericText(dashboardBottomNavigationModel.name,style: injector<AppTextStyles>().medium13.copyWith(color: activeColor),)
                )
              ],
            ),
            Center(
              child: Container(
                width: 5,
                height: 5,
                margin: EdgeInsets.only(top: 65.h),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // color: dashboardScreenThemeConfig.bottomNavigation!
                    //     .activeNavigationIconColor!.toColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
