import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/account_settings_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/managers_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/add_member_route.dart';
import 'package:roof_admin_panel/features/members/presentation/pages/members_view.dart';
import 'package:roof_admin_panel/features/view%20manager/view_manager.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';

final class MainRoute extends BaseRouteClass {
  const MainRoute();

  @override
  String get name => "Members";

  @override
  String get title => LocaleKeys.membersView_pageTitle.tr();

  @override
  List<GoRoute> get routes => [
        AddMemberRoute().route,
      ];
  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => PermissionBasedVisibility(
            child: const MembersView(),
            necessaryPermissions: [
              Permissions.canReadMembers,
              Permissions.canRead,
            ],
          ).visibleOrPermissionInfo;

  ShellRoute get shell => ShellRoute(
        routes: [
          route,
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

  @override
  String get path => "/members";
}
