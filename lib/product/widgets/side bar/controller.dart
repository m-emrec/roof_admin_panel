import 'package:flutter/material.dart';

class SideBarController {
  factory SideBarController() => _instance;

  SideBarController._internal();
  static final SideBarController _instance = SideBarController._internal();

  Duration get animationDuration => const Duration(milliseconds: 300);

  ValueNotifier<int> selectedPage = ValueNotifier(0);

  ValueNotifier<bool> isExpanded = ValueNotifier(true);

  void navigationManager(int index) {
    selectedPage.value = index;
  }

  void closeSideBar() {
    isExpanded.value = false;
  }

  void openSideBar() {
    isExpanded.value = true;
  }
}
