import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/base_route_redirector.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/members_route.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';

/// Redirects the user based on email verification status.
///
/// If the user is verified, they are redirected to the members route.
///
/// If the user is not verified, they are shown a toast message and
/// redirected to the sign-in route.
class EmailVerificationBasedRedirector implements BaseRouteRedirector {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final isVerified = AuthService().isVerified;
    if (isVerified) {
      return state.namedLocation(const MembersRoute().route.name ?? "");
    } else {
      return null;
    }
  }
}
