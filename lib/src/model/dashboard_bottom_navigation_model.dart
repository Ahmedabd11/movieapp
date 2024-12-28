import 'package:flutter/material.dart';
class DashboardBottomNavigationModel {
  String imageUrl;
  Widget? screen;
  String name;
  bool isMenuOpened;
  int menuOpenedAtIndex;

  DashboardBottomNavigationModel(
      {
        this.screen,
        required this.name,
        required this.imageUrl,
        this.isMenuOpened = false,
        this.menuOpenedAtIndex = -1});
}
