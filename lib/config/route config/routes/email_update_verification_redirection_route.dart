import 'package:core/utils/logger/logger.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/src/state.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/pages/email_update_redirection_page.dart';

final class EmailUpdateVerificationRedirectionRoute extends BaseRouteClass {
  @override
  String get name => "EmailUpdateVerificationRedirectionRoute";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) {
        final uid = state.pathParameters["uid"];
        final email = state.pathParameters["email"];
        Log.debug("UID : ${state.pathParameters["uid"]}");
        return EmailUpdateRedirectionPage(uid ?? "", email ?? "");
      };

  @override
  String get path => "/email_update_verification_redirection/:email/:uid";
}
