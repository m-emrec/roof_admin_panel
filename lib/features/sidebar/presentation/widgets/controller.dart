import 'package:flutter/material.dart';

/// Controller class to control the sidebar expansion
/// and the current location of the sidebar
///
/// This class is a singleton class
/// To get the instance of this class, use [SideBarController()]
class SideBarController {
  /// Factory constructor to get the instance of the controller
  factory SideBarController() => _instance;

  /// Private constructor
  SideBarController._internal();

  /// Singleton instance of the controller
  static final SideBarController _instance = SideBarController._internal();

  /// Duration of the sidebar animation
  Duration get animationDuration => const Duration(milliseconds: 300);

  /// ValueNotifier to control the sidebar expansion
  ///
  /// If the value is true, the sidebar is expanded
  /// If the value is false, the sidebar is collapsed
  ValueNotifier<bool> isExpanded = ValueNotifier(true);

  /// ValueNotifier to control the current location of the sidebar
  ValueNotifier<String> currentLocation = ValueNotifier("");

  /// Method to collapse the sidebar
  void collapseSideBar() {
    isExpanded.value = false;
  }

  /// Method to expand the sidebar
  void expandSideBar() {
    isExpanded.value = true;
  }

  /// This method is used to check if the item is selected
  ///
  bool isItemSelected(String route) => currentLocation.value == route;
}
