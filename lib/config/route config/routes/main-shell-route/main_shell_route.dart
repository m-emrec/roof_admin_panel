import 'package:core/utils/logger/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/account_settings_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_shell_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/managers_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/members_route.dart';
import 'package:roof_admin_panel/features/view%20manager/view_manager.dart';

final class MainShellRoute extends BaseShellRoute {
  const MainShellRoute();

  ShellRoute get shell => ShellRoute(
        routes: [
          const MembersRoute().route,
          FeedbackRoute().route,
          GuestsRoute().route,
          ManagersRoute().route,
          AccountSettingsRoute().route,
        ],
        builder: (context, state, child) {
          return ViewManager(
            child: child,
          );
        },
      );

  String get path => "/";
}
