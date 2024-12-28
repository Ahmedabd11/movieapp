import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:movie/src/core/utils/app_custom_color.dart';
import 'package:movie/src/injector.dart';

import '../../../core/params/app_ui/app_ui_params.dart';
import '../../../model/dashboard_acrive_page_index_and_menu_relationship.dart';

import '../../screen/dashboard/view_model/dashboard_screen_view_model.dart';
import 'active_bottom_navigation_item.dart';
import 'inactive_bottom_navigation_item.dart';
class BottomNavigation extends StatelessWidget {
  final AppUIParams appUIParams = injector();
  final bool fromMenu;

  BottomNavigation({Key? key, this.fromMenu = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewModel>(
      builder: (context, viewModel, _) => ValueListenableProvider<
          DashboardActivePageIndexAndMenuRelationship>.value(
        value: viewModel.currentlyActiveDashboardPageIndexModel,
        child: Consumer<DashboardActivePageIndexAndMenuRelationship>(
          builder: (context, currentlyActiveDashboardPageIndex, _) =>
          Container(
            height: 63.h,
            decoration: BoxDecoration(
              boxShadow:[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
              ],
              color: injector<AppCustomColor>().mainContentColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r)), //80
            ),

            /// listen to [AppContent] so that whenever [AppContent] changes
            /// it should reflect on our bottom navigation bar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                      viewModel.dashboardPages.length,
                      (index) => index ==
                      currentlyActiveDashboardPageIndex.index
                      ? ActiveBottomNavigationItem(
                    dashboardBottomNavigationModel:
                    viewModel.dashboardPages[index],
                    appUIParams: appUIParams,
                    indexMenuRelationship:
                    currentlyActiveDashboardPageIndex,
                    onPressed: (previousIndex) {
                      print('hello work same $index');
                      viewModel.updateCurrentPageIndex(
                        newIndex:index,
                      );
                    },
                  )
                      : InActiveBottomNavigationItem(
                    appUIParams: appUIParams,
                    dashboardBottomNavigationModel:
                    viewModel.dashboardPages[index],
                    onPressed: () {
                      /// here we'll check if bottom navigation is creating
                      /// from menu dialog or from screen, if its coming
                      /// from menu dialog then on clicking of any item
                      /// we'll dismiss app menu first and then move to
                      /// other screen
                      if (fromMenu) {
                       // injector<AppPopups>().dismissAppMenu();
                        viewModel.updateCurrentPageIndex(
                            newIndex: index);
                      } else {
                        viewModel.updateCurrentPageIndex(
                            newIndex: index);
                      }
                    },
                  )),
            ),
          ),
        ),
      ),
    );
  }
}