import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                                  Icon(
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
                                  Icon(
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
                                  Icon(
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
                                    Icon(
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
                                  Icon(
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
                                  Icon(
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

class WebViewMainPage extends StatefulWidget {
  const WebViewMainPage({super.key});

  @override
  State<WebViewMainPage> createState() => _WebViewMainPageState();
}

class _WebViewMainPageState extends State<WebViewMainPage> {
  late final WebViewController webViewController;
  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      // The set navigation delegate method is used to sets the [NavigationDelegate] containing the callback methods that are called during navigation events.
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          print("On page started url : $url");
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          print("Page progress : $progress");
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          print("On Page finished Url : $url");
          setState(() {
            loadingPercentage = 100;
          });
        },
        onNavigationRequest: (navigationRequest) {
          // WebView provides your app with a NavigationDelegate, which enables your app to track and control the page navigation of the WebView widget. When a navigation is initiated by the WebView, for example when a user clicks on a link, the NavigationDelegate is called. The NavigationDelegate callback can be used to control whether the WebView proceeds with the navigation.
          final String host = Uri.parse(navigationRequest.url).host;
          //  This code is used to prevent the user to navigate to the youtube .
          if (host.contains("youtube.com")) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Navigation to $host is blocked")));
            // The navigation decision is the enum in which we have to call it's constant value of the name prevent which is used to Prevent the navigation from taking place.

            return NavigationDecision.prevent;
          } else {
            // Allow the navigation to take place.

            return NavigationDecision.navigate;
          }
        },
      ))

      // The load request method of the web view flutter is used to makes a specific HTTP request and loads the response in the webview.
      ..loadRequest(
        // Makes a specific HTTP request and loads the response in the webview.

        Uri.parse('https://ebanking.meezanbank.com/AmbitRetailFrontEnd/login'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                if (await webViewController.canGoBack()) {
                  await webViewController.goBack();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No Back History Found")));
                }
              },
              icon: const Icon(Icons.arrow_back)),
          IconButton(
              onPressed: () async {
                if (await webViewController.canGoForward()) {
                  await webViewController.goForward();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("No Forward History Fund")));
                }
              },
              icon: const Icon(Icons.arrow_forward)),
          IconButton(
              onPressed: () {
                webViewController.reload();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      // The web view widget is used to display the web page in your flutter app .

      body: Stack(
        children: [
          WebViewWidget(
            controller: webViewController,
          ),
          if (loadingPercentage < 100)
            Center(
              child: CircularProgressIndicator(
                // The circular progress indicator is used to display the circular progress in the center of the screen with the value of the loading of page progress .
                value: loadingPercentage / 100.0,
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await webViewController.loadRequest(
              Uri.parse('https://github.com/AbubakarSaddiqueKhan'));
        },
        child: const Icon(Icons.golf_course),
      ),
    );
  }
}
