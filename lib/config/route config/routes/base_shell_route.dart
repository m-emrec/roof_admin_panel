import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract base class BaseShellRoute {
  const BaseShellRoute();

  /// The redirect function for the route.
  /// This is the function that will be called to determine if the user should be redirected to another route.
  FutureOr<String?> Function(BuildContext, GoRouterState)? get redirect => null;

  ShellRoute get shell;
}
