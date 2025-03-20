import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/no_permission_card.dart';

/// An abstract class for handling permission-based actions and visibility.
///
/// This class provides a structure for checking whether a user has the
/// necessary permissions to perform certain actions or display specific UI elements.
/// It retrieves the current user's permissions and verifies them against the
/// required permissions.
///
abstract class PermissionHandler {
  /// Creates a permission handler with the given required permissions.
  ///
  /// This class checks if the current user has the necessary permissions
  /// for performing certain actions.
  PermissionHandler({required this.necessaryPermissions});

  /// The required permissions for the action or widget.
  final List<Permissions> necessaryPermissions;

  /// The current user's permissions, fetched from [CurrentManager].
  final List<Permissions> _currentUserPermissions =
      CurrentManager.instance.managerModelNotifier.value.role.permissions;

  /// Checks if the user has at least one of the required permissions.
  ///
  /// This method returns `true` if the user has any of the necessary permissions,
  /// otherwise, it returns `false`.
  bool get _hasPermission =>
      _currentUserPermissions.any(necessaryPermissions.contains);
}

/// A permission-based action handler that enables or disables an action
/// based on the user's permissions.
///
/// This class extends [PermissionHandler] and determines whether a given
/// action (callback function) should be executed or disabled depending
/// on the user's permission level. If the user has the necessary permissions,
/// the provided [onPressed] callback is returned; otherwise, it is null.
///
class PermissionBasedAction extends PermissionHandler {
  /// Creates a permission-based action handler.
  ///
  /// If the user has the required permissions, [onPressed] will be executed
  /// when triggered; otherwise, it will be disabled.
  PermissionBasedAction(
    this.onPressed, {
    required super.necessaryPermissions,
  });

  /// The action to be executed if permissions are met.
  final VoidCallback? onPressed;

  /// Returns [onPressed] if the user has permission; otherwise, `null`
  VoidCallback? get actionIfAllowed => _hasPermission ? onPressed : null;
}

/// A permission-based widget visibility handler that conditionally
/// displays or hides a widget based on user permissions.
///
/// This class extends [PermissionHandler] and determines whether the
/// provided [child] widget should be displayed. If the user has the required
/// permissions, the widget is shown; otherwise, an empty [SizedBox] is returned.
class PermissionBasedVisibility extends PermissionHandler {
  /// Creates a permission-based visibility handler.
  ///
  /// If the user has the required permissions, [child] is displayed.
  /// Otherwise, an alternative widget or empty space is used.
  PermissionBasedVisibility({
    required this.child,
    required super.necessaryPermissions,
  });

  ///
  final Widget child;

  /// Returns the child widget if the user has permission; otherwise, an empty container.
  Widget get visibleIfAllowed => Visibility(
        visible: _hasPermission,
        child: child,
      );

  /// Returns the child widget if the user has permission.
  /// Otherwise, it displays a permission error message.
  Widget get visibleOrPermissionInfo =>
      _hasPermission ? child : const NoPermissionCard();
}
