import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../../core/builders/consumer/consumer_on_ready_callback.dart';
import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../core/utils/app_custom_color.dart';
import '../../../../injector.dart';
import '../../../widgets/base/base_widget.dart';
import '../../../widgets/bottom_navigation/bottom_navigation.dart';
import '../view_model/dashboard_screen_view_model.dart';

class DashboardScreen extends StatelessWidget {
  static const String id = "/dashboard_screen";
  final AppUIParams appUIParams;

  const DashboardScreen({
    Key? key,
    required this.appUIParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConsumerWithOnReadyCallBack<DashboardViewModel>(
      onModelReady: (model) {
        model.initialize();
      },
      builder: (context, viewModel, _) {
        return WillPopScope(onWillPop: () async {
          return viewModel.handleDashboardBackPressed();
        }, child: BaseWidget(
          resizeToAvoidBottomPadding: false,
          useBaseWidgetPadding: false,
          child: Column(
            children: [
              ValueListenableProvider<int>.value(
                value: viewModel.currentlyActiveDashboardPageIndex,
                child: Consumer<int>(
                  builder: (context, currentlyActiveDashboardPageModel, _) =>
                      Expanded(
                    child: viewModel
                            .dashboardPages[currentlyActiveDashboardPageModel]
                            .screen ??
                        Container(),
                  ),
                ),
              ),
              BottomNavigation(
              )
            ],
          ),
        ));
      },
    );
  }
}
