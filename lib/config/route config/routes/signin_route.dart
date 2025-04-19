import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/redirectors/authentication_based_redirect.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/auth/presentation/pages/sign_in_page.dart';

/// The sign-in route.
/// This route is used to navigate to the sign-in screen.
/// It is a child route of the initial route.
/// If the user is authenticated, they will be redirected to the appropriate route.
/// If the user is not authenticated, they will be redirected to the sign-in page.
final class SignInRoute extends BaseRouteClass {
  /// The sign-in route.
  factory SignInRoute() => _instance;

  SignInRoute._internal();

  static final SignInRoute _instance = SignInRoute._internal();
  @override
  FutureOr<String?> Function(BuildContext p1, GoRouterState p2)? get redirect =>
      AuthenticationBasedRedirector().redirect;
  @override
  String get title => LocaleKeys.auth_signin_pageTitle.tr();
  @override
  String get name => "signIn";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const SignIn();

  @override
  String get path => '/giris-yap';
}
