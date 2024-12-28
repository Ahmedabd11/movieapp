
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


import '../../../core/typedefs/typedefs.dart';
import '../../../core/utils/app_custom_color.dart';
import '../../../core/utils/app_util.dart';
import '../../../injector.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  final Widget? appBar;
  final Widget? bottomNavigation;
  final Color? scaffoldBackgroundColor;
  final Color? appNavigationBarColor;
  final bool showBg;
  final String? dummyImage;
  final bool useBaseWidgetPadding;
  final bool? extendedBody;
  final bool resizeToAvoidBottomPadding;
  final bool useTransparentBg;
  final OnWillPopCallBack? onWillPop;
  final Widget? floatingButton;
  final bool giveBasePaddingOnlyToAppBar;

  const BaseWidget(
      {Key? key,
        required this.child,
        this.bottomNavigation,
        this.appNavigationBarColor,
        this.scaffoldBackgroundColor,
        this.appBar,
        this.onWillPop,
        this.dummyImage,
        this.floatingButton,
        this.useBaseWidgetPadding = true,
        this.useTransparentBg = false,
        this.resizeToAvoidBottomPadding = true,
        this.giveBasePaddingOnlyToAppBar = false,
        this.showBg = true, this.extendedBody,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor:injector<AppCustomColor>().mainContentColor.withOpacity(0.5),
          systemNavigationBarColor: appNavigationBarColor ??injector<AppCustomColor>().mainContentColor),
      child: WillPopScope(
        onWillPop: onWillPop,

        /// we're getting LanguageType here so that we should not use
        /// Directionality Widget in every other widget
        /// Note:: if you want that your widget should not use
        /// Directionality widget explicitly, make sure that it is
        /// wrapped with BaseWidget
        child: Scaffold(
            extendBody:extendedBody??false,
           backgroundColor: scaffoldBackgroundColor??injector<AppCustomColor>().mainAppColor,
            bottomNavigationBar: bottomNavigation??const SizedBox.shrink(),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.zero,
              child: floatingButton,
            ),
            resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
            body: Stack(
              fit: StackFit.expand,
              children: [
                if (showBg)
                // const AppPrimaryBg(),
                  Container(
                        decoration:   BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.white,
                              injector<AppCustomColor>().light,
                            ],
                          ),
                    ),

                      padding: giveBasePaddingOnlyToAppBar
                          ? EdgeInsets.zero
                          : useBaseWidgetPadding
                          ? EdgeInsets.symmetric(
                          horizontal: injector<AppUtil>()
                              .getBaseWidgetPadding())
                          : EdgeInsets.zero,
                      child: Column(
                        children: [
                          if (appBar != null)
                            Padding(
                                padding: giveBasePaddingOnlyToAppBar
                                    ? EdgeInsets.symmetric(
                                    horizontal: injector<AppUtil>()
                                        .getBaseWidgetPadding())
                                    : EdgeInsets.zero,
                                child: appBar!),
                          Expanded(child: child),
                        ],
                      )),
              ],
            )),
      ),
    );
  }
}
