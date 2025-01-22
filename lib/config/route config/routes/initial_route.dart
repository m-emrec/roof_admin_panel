import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/redirectors/authentication_based_redirect.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';

/// The initial route.
/// here user will be redirected to the appropriate route based on their
/// authentication state.
final class InitialRoute extends BaseRouteClass {
  /// The initial route.
  factory InitialRoute() => _instance;

  InitialRoute._internal();

  static final InitialRoute _instance = InitialRoute._internal();

  /// The initial route.
  /// here user will be redirected to the appropriate route based on their
  /// authentication state.
  @override
  GoRoute get route => GoRoute(
        redirect: AuthenticationBasedRedirector()
            .redirect, // RouteRedirector().authenticationBasedRedirect,
        path: '/',
        name: 'root',
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.backgroundColor,
        ),
      );
}
