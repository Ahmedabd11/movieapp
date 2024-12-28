
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import '../../../../config/theme/local/app_text_style.dart';
import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/utils/app_custom_color.dart';
import '../../../../injector.dart';
import '../../../widgets/base/base_widget.dart';
import '../../../widgets/generics/generic_text/generic_text.dart';
import '../view_model/splash_screen_view_model.dart';



class SplashScreen extends StatelessWidget {
  final AppUIParams appUIParams;
  static const String id = '/';
  const SplashScreen({Key? key, required this.appUIParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SplashScreenViewModel userViewModel=context.watch<SplashScreenViewModel>();
    return Consumer<SplashScreenViewModel>(
      builder: (context,viewModel, _)
      =>  BaseWidget(
        useBaseWidgetPadding: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(top: 150.h,bottom: 50.h,left: 20.w,right: 20.w),
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color:injector<AppCustomColor>().transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SvgPicture.asset('assets/icon/d.svg',
                    //   fit: BoxFit.cover,
                    //   width: 120.w,
                    //   height: 120.h,
                    // ),

                    Container(
                      width: 110.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: injector<AppCustomColor>().mainContentColor
                      ),
                      child: Center(
                        child:GenericText( "Movie", textAlign: TextAlign.center,style:injector<AppTextStyles>().medium30.copyWith(color: injector<AppCustomColor>().white)
                      ),
                    ),
                    ),
                    // Container(
                    //   alignment: Alignment.bottomCenter,
                    //   height: 430.h,
                    //   width: 420.w,
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.all(Radius.circular(70)),
                    //     image: DecorationImage(
                    //       fit: BoxFit.contain,
                    //       image: AssetImage(appUIParams.appImages.splashBgPng),
                    //
                    //     ),
                    //   ),
                    //
                    // ),
                    SizedBox(height: 20.h,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width/1.4,
                          child: GenericText('The Movie App', textAlign: TextAlign.center,style: injector<AppTextStyles>().bold30.copyWith(color: injector<AppCustomColor>().mainContentColor)
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        GenericText('The Details Study for Movie App, Please explore to new findings', style:injector<AppTextStyles>().medium15.copyWith(color: injector<AppCustomColor>().mainContentColor,fontWeight: FontWeight.w100),textAlign: TextAlign.center,),

                      ],
                    ),

                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Container(
                      height: 30.h,
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(injector<AppCustomColor>().mainContentColor,),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Column(

                      children:  [
                        Text('Copyright © All Rights Reserved',
                          style:injector<AppTextStyles>().regular8.copyWith(color: injector<AppCustomColor>().mainContentColor),
                        ),
                        Text('The Movie App 2024',
                          style: injector<AppTextStyles>().medium10.copyWith(color: injector<AppCustomColor>().mainContentColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );



  }

}