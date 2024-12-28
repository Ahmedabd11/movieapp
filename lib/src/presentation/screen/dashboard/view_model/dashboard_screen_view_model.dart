import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/src/core/lifecycle/use_lifecycle.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie/src/core/utils/app_util.dart';
import 'package:movie/src/core/utils/global_utils.dart';

import 'package:movie/src/presentation/screen/home/home_screen.dart';
import 'package:movie/src/presentation/screen/setting/setting_screen.dart';

import '../../../../core/params/app_ui/app_ui_params.dart';
import '../../../../injector.dart';
import '../../../../model/dashboard_acrive_page_index_and_menu_relationship.dart';
import '../../../../model/dashboard_bottom_navigation_model.dart';

class DashboardViewModel extends UseLifeCycle with ChangeNotifier {
  /// this index is used to handle menu icon changes we'll check whether current
  /// nav item is of menu or not if menu than we'll change icon on runtime click
  /// for that particular nav item and this model will be responsible to tell
  /// UI that whether currently building item is menu or not
  ValueNotifier<DashboardActivePageIndexAndMenuRelationship>
      currentlyActiveDashboardPageIndexModel =
      ValueNotifier<DashboardActivePageIndexAndMenuRelationship>(
          DashboardActivePageIndexAndMenuRelationship(index: 0, isMenu: false));

  /// this activePageIndex variable will use to manage screen stack
  /// because this index will be responsible of dashboard screen changes
  /// logic::: in dashboard_screen we'll simply get screen from dashboardPages
  /// list on this particular index
  ValueNotifier<int> currentlyActiveDashboardPageIndex = ValueNotifier<int>(0);

  final List<DashboardBottomNavigationModel> dashboardPages =
      List.empty(growable: true);

  /// we're declaring [AppContent] here
  // ValueNotifier<AppContent?> appContent = ValueNotifier(null);

  /// called whenever build method call for [DashboardScreen]
  initialize() {
    // appContent.value = injector<AppContent>();
    generateDashboardPages();
  }

  /// This method will be responsible for generating dashboard pages
  /// we got from [AppContent] API
  generateDashboardPages() {
    /// clearing dashboard pages initially so that if there's any previous
    /// pages present in the list should be cleared
    dashboardPages.clear();
    dashboardPages.addAll([
      DashboardBottomNavigationModel(
          screen: HomeScreen(appUIParams: injector<AppUIParams>()),
          name: "Watch",
          imageUrl: "assets/icon/play.svg"),
      DashboardBottomNavigationModel(
          screen: SettingScreen(appUIParams: injector<AppUIParams>()),
          name: "Settings",
          imageUrl: "assets/icon/setting.svg"),
    ]);
  }

  /// method will be used to dismiss App menu at any point
  void closeAppMenu() {
    /// we'll check if currently app menu is opened
    if (currentlyActiveDashboardPageIndexModel.value.isMenu) {
      /// if yes then reset the state of [isMenu], so that close button
      /// of app menu dismissed
      currentlyActiveDashboardPageIndexModel.value =
          DashboardActivePageIndexAndMenuRelationship(
        index: currentlyActiveDashboardPageIndex.value,
        isMenu: false,
      );

      /// at last dismiss app menu
    }
  }

  updateCurrentPageIndex({required int newIndex}) {
    // here initially we'll check whether currently pressed nav item has menu items in it or not
    if (currentPageIndexContainsItems(index: newIndex) ?? true) {
      currentlyActiveDashboardPageIndex.value = newIndex;

      /// if currently pressed nav item has menu items then we'll handle its
      /// click callbacks with conditions if it is clicked first time then we'll
      /// update icon with cross icon and if it's been clicking when cross icon
      /// is being showing then we'll simply update icon with original icon
      if (currentlyActiveDashboardPageIndexModel.value.isMenu) {
        currentlyActiveDashboardPageIndexModel.value =
            DashboardActivePageIndexAndMenuRelationship(
          index: newIndex,
          isMenu: false,
        );
      } else {
        currentlyActiveDashboardPageIndexModel.value =
            DashboardActivePageIndexAndMenuRelationship(
          index: newIndex,
          isMenu: true,
        );
      }
    } else {
      /// if currently clicked nav item is not a menu item then we'll simply
      /// navigate to that particular screen by updating active page index
      currentlyActiveDashboardPageIndex.value = newIndex;
      currentlyActiveDashboardPageIndexModel.value =
          DashboardActivePageIndexAndMenuRelationship(
              index: newIndex, isMenu: false);
    }
  }

  bool? currentPageIndexContainsItems({required int index}) {
    // if currentPageIndex is null it will be treated as false
    // if (injector<AppContent>().menu?.menuHorizontalList != null) {
    //   if (injector
    //       .get<AppContent>()
    //       .menu!
    //       .menuHorizontalList![index]
    //       .menuItemsList!
    //       .isNotEmpty) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // } else {
    //   return null;
    // }
    return null;
  }

  /// This method will be responsible for getting data of already called
  /// dashboard apis with updated language so that UI can be changed
  /// according to new language
  ///
  /// NOTE: this is mandatory because most of the content is coming from
  /// remote and that content needs to be updated, this content wil be updated
  /// by calling all APIs with [language: 'ar'] in the body
  // void callRequiredAPIsOnLanguageChange({bool needToCallDashboardAPIs = true}) {
  //   injector<GetAppContentUseCase>()().listen((event) {
  //     /// we'll update value of [appContent] just after we get result
  //     /// from remote source, so that wherever UI is listening to
  //     /// this [appContent] can be updated with update response
  //     appContent.value = event;
  //
  //     /// after updating language we'll regenerate Dashboard pages so that UI
  //     /// could be updated with the new pages and new labels
  //     generateDashboardPages();
  //
  //     /// after updating dashboard pages we'll update app menu container, labels
  //     /// and translations for menu container also coming from [AppContent] API
  //     updateAppMenuContainer();
  //
  //     if (needToCallDashboardAPIs) {
  //       /// after completing things for [AppContent] we'll then call dashboard APIs
  //       /// from [HomeViewModel] so that Dashboard also update with new translations
  //       HomeViewModel.of().callDashboardAPI();
  //     }
  //   });
  // }

  /// This method will be responsible for updating app language we got from
  /// remote source and bind that language with the UI of [AppMenuContainerGrid]
  /// so that UI could be updated with the new content according to the
  /// new language
  // void updateAppMenuContainer() {
  //   AppMenuContainerViewModel.of(navigatorKey.currentState!.context)
  //       .generateMenuItemsGridListFromAppContent(
  //       itemsPerPage: injector<AppConstants>().appMenuItemsPerPage,
  //       menuItemsList: injector<AppContent>()
  //           .menu!
  //           .menuHorizontalList!
  //           .where((element) => element.identifier == "menu")
  //           .first
  //           .menuItemsList!
  //           .where((element) =>
  //       element.status ==
  //           injector<AppConstants>().appContentActiveStatus)
  //           .toList());
  // }

  // DashboardScreenThemeConfig getDashboardScreenThemeConfig(
  //     {required AppUIParams appUIParams}) {
  //   return appUIParams.themeEngine.currentlyActiveTheme!.screens!
  //       .controllerScreens!.dashboardScreenThemeConfig!;
  // }

  bool handleDashboardBackPressed() {
    if (currentlyActiveDashboardPageIndex.value == 0) {
      injector<AppUtil>().showExitPopup(navigatorKey.currentContext!);
      return false;
    } else {
      currentlyActiveDashboardPageIndex.value = 0;
      currentlyActiveDashboardPageIndexModel.value =
          DashboardActivePageIndexAndMenuRelationship(index: 0, isMenu: false);
      return false;
    }
  }

  static DashboardViewModel of(BuildContext context, {bool listen = false}) {
    return Provider.of(context, listen: listen);
  }
}
