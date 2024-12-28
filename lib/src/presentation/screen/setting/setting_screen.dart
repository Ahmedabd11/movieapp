import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/local/app_text_style.dart';
import '../../../core/params/app_ui/app_ui_params.dart';
import '../../../core/utils/app_custom_color.dart';

import '../../../injector.dart';
import '../../widgets/base/base_widget.dart';
import '../../widgets/generics/generic_text/generic_text.dart';

class SettingScreen extends StatelessWidget {
  static const String id = '/setting_screen';
  final AppUIParams appUIParams;

  const SettingScreen({super.key, required this.appUIParams});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      resizeToAvoidBottomPadding: false,
      useBaseWidgetPadding: true,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GenericText(
                          'Setting',
                          textAlign: TextAlign.start,
                          style: AppTextStyles().bold22.copyWith(
                              color:
                                  injector<AppCustomColor>().mainContentColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        GenericText('General Settings',
                            textAlign: TextAlign.center,
                            style: AppTextStyles().medium13.apply(
                                color: injector<AppCustomColor>()
                                    .subContentColor)),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GenericText('Notification Settings',
                                      style: AppTextStyles().medium15.apply(
                                          color: injector<AppCustomColor>()
                                              .mainBlackColor)),
                                  const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GenericText('Account Settings',
                                      style: AppTextStyles().medium15.apply(
                                          color: injector<AppCustomColor>()
                                              .mainBlackColor)),
                                  const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GenericText('Subscription',
                                      style: AppTextStyles().medium15.apply(
                                          color: injector<AppCustomColor>()
                                              .mainBlackColor)),
                                  const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GenericText('Profile Settings',
                                        style: AppTextStyles().medium15.apply(
                                            color: injector<AppCustomColor>()
                                                .mainBlackColor)),
                                    const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Color(0xff666666),
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        GenericText('Other Settings',
                            textAlign: TextAlign.center,
                            style: AppTextStyles().medium13.apply(
                                color: injector<AppCustomColor>()
                                    .subContentColor)),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GenericText('Customer Support',
                                      style: AppTextStyles().medium15.apply(
                                          color: injector<AppCustomColor>()
                                              .mainBlackColor)),
                                  const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GenericText('Privacy & Policies',
                                      style: AppTextStyles().medium15.apply(
                                          color: injector<AppCustomColor>()
                                              .mainBlackColor)),
                                  const Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: Color(0xff666666),
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        // this is new
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
