
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:movie/src/presentation/screen/dashboard/view/dashboard_screen.dart';

import '../../../../config/theme/local/app_text_style.dart';
import '../../../../core/images/app_image.dart';
import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/utils/app_custom_color.dart';
import '../../../../core/utils/global_utils.dart';
import '../../../../injector.dart';
import '../../../widgets/base/base_widget.dart';
import '../../../widgets/generics/generic_button/generic_button.dart';
import '../../../widgets/generics/generic_text/generic_text.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = '/welcome_screen';
  final AppUIParams appUIParams;

  const WelcomeScreen({Key? key, required this.appUIParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BaseWidget(
      resizeToAvoidBottomPadding: false,
      useBaseWidgetPadding: false,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 35.h,),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height/2.5 ,
            //   child:   Image.asset(
            //       'assets/png/deb.png',
            //       fit: BoxFit.cover
            //   ),
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.2,
              height: MediaQuery.of(context).size.height/2.5 ,
              child:   SvgPicture.asset(
                injector<AppImages>().movieSvg,
                fit: BoxFit.cover
              ),
            ),
            SizedBox(height: 30.h,),
            SizedBox(
              width: MediaQuery.of(context).size.width/1.4,
              child: GenericText('The Movie App',wholePadding: EdgeInsets.zero,textAlign: TextAlign.center, style: injector<AppTextStyles>().bold35.copyWith(color: injector<AppCustomColor>().mainContentColor),),
            ),
            SizedBox(height: 20.h),

          SizedBox(
              width: MediaQuery.of(context).size.width/1.2,
              child: GenericText('An innovative app crafted to lead you on a Managing your Movie App',wholePadding: EdgeInsets.zero,textAlign: TextAlign.center, style: injector<AppTextStyles>().regular12.copyWith(color: injector<AppCustomColor>().subContentColor),),
            ),

            SizedBox(height: 65.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.h),
              child: GenericButton(
                  borderRadius: BorderRadius.all(Radius.circular(25.h)),
                  text:"Get Started",
                  padding: EdgeInsets.symmetric(
                      vertical: 15.0.h, horizontal: 5.w),
                  onPressed: (){
                    navigatorKey.currentState?.pushNamed(DashboardScreen.id);


                  }, appUIParams: appUIParams),
            ),
            SizedBox(height: 25.h,),

          ],
        ),
      ),
    );
  }
}
