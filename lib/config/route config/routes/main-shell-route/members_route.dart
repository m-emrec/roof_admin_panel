import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/members-page/members_page.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';

final class MembersRoute extends BaseRouteClass {
  const MembersRoute();
  @override
  String get name => "membersRoute";
  @override
  String get title => LocaleKeys.membersView_pageTitle.tr();

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => PermissionBasedVisibility(
            child: const MembersPage(),
            necessaryPermissions: [
              Permissions.canReadMembers,
              Permissions.canRead,
            ],
          ).visibleOrPermissionInfo;

  @override
  String get path => "/uyeler";
}
