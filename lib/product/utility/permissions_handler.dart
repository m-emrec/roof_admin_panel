import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/manager_info.dart';

/// An abstract class for handling permission-based actions and visibility.
///
/// This class provides a structure for checking whether a user has the
/// necessary permissions to perform certain actions or display specific UI elements.
/// It retrieves the current user's permissions and verifies them against the
/// required permissions.
///
abstract class PermissionHandler {
  ///
  PermissionHandler({required this.necessaryPermissions});

  ///
  final List<Permissions> necessaryPermissions;
  final List<Permissions> _currentUserPermissions =
      ManagerInfo.instance.managerModel.role.permissions;

  bool get _hasPermission {
    for (final permission in _currentUserPermissions) {
      if (necessaryPermissions.contains(permission)) {
        return true;
      }
    }
    return false;
  }
}

///
class PermissionBasedAction extends PermissionHandler {
  /// A permission-based action handler that enables or disables an action
  /// based on the user's permissions.
  ///
  /// This class extends [PermissionHandler] and determines whether a given
  /// action (callback function) should be executed or disabled depending
  /// on the user's permission level. If the user has the necessary permissions,
  /// the provided [onPressed] callback is returned; otherwise, it is null.
  PermissionBasedAction(
    this.onPressed, {
    required super.necessaryPermissions,
  });

  ///
  final VoidCallback? onPressed;

  ///
  VoidCallback? get actionIfAllowed => _hasPermission ? onPressed : null;
}

///
class PermissionBasedVisibility extends PermissionHandler {
  ///
  /// A permission-based widget visibility handler that conditionally
  /// displays or hides a widget based on user permissions.
  ///
  /// This class extends [PermissionHandler] and determines whether the
  /// provided [child] widget should be displayed. If the user has the required
  /// permissions, the widget is shown; otherwise, an empty [SizedBox] is returned.
  PermissionBasedVisibility({
    required this.child,
    required super.necessaryPermissions,
  });

  ///
  final Widget child;

  ///
  Widget get build => _hasPermission ? child : const SizedBox();
}
