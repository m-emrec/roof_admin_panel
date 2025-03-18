import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/pages/email_update_redirection_page.dart';

///
final class EmailUpdateVerificationRedirectionRoute extends BaseRouteClass {
  ///
  /// This route serves the following purpose:
  ///
  /// After a user updates their email, a verification email is sent to them.
  /// Upon clicking the verification link, they are redirected to this page.
  /// Here, their email is updated in Firestore, and a success message is displayed.
  ///
  EmailUpdateVerificationRedirectionRoute();
  @override
  String get name => "EmailUpdateVerificationRedirectionRoute";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) {
        final uid = state.pathParameters["uid"];
        final email = state.pathParameters["email"];
        return EmailUpdateRedirectionPage(uid ?? "", email ?? "");
      };

  @override
  String get path => "/email_update_verification_redirection/:email/:uid";
}
