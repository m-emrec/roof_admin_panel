import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/route_redirector.dart';
import 'package:roof_admin_panel/config/route%20config/routes/initial_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/signin_route.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';

/// Checks if the user is authenticated and determines the appropriate route.
///
/// This function checks if the user is authenticated or not. If the user is
/// trying to reach the home page but is not authenticated, they will be
// ignore: comment_references
/// redirected to the [SignIn] page.
///
/// - Parameters:
///   - context: The BuildContext of the widget.
///   - state: The current state of the GoRouter.
///
/// - Returns: A FutureOr<String?> that represents the path to redirect to,
///  or null if no redirection is needed.
class AuthenticationBasedRedirector implements BaseRouteRedirector {
  ///
  factory AuthenticationBasedRedirector() => _instance;

  AuthenticationBasedRedirector._internal();
  static final AuthenticationBasedRedirector _instance =
      AuthenticationBasedRedirector._internal();

  /// Checks if the user is authenticated and determines the appropriate route.
  ///
  /// This function checks if the user is authenticated or not. If the user is
  /// trying to reach the home page but is not authenticated, they will be
  // ignore: comment_references
  /// redirected to the [SignIn] page.
  ///
  /// - Parameters:
  ///   - context: The BuildContext of the widget.
  ///   - state: The current state of the GoRouter.
  ///
  /// - Returns: A FutureOr<String?> that represents the path to redirect to,
  ///  or null if no redirection is needed.

  @override
  FutureOr<String?> redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isLoggedIn = AuthService().currentUser != null;
    final currentLocation = state.fullPath;
    if (!isLoggedIn) {
      return SignInRoute().route.path;
    }

    if (isLoggedIn) {
      if (currentLocation == InitialRoute().route.path ||
          currentLocation == SignInRoute().route.path) {
        return state.namedLocation(ProfileRoute().route.name ?? "");
      }
      if (currentLocation == ProfileRoute().route.path) {
        return null;
      }
    }
    return null;
  }
}
