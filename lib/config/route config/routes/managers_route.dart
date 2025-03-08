import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/managers/presentation/pages/managers_view.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';

final class ManagersRoute extends BaseRouteClass {
  @override
  String get name => "managers";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => PermissionBasedVisibility(
            child: const ManagersView(),
            necessaryPermissions: [Permissions.canReadManagers],
          ).visibleOrPermissionInfo;

  @override
  String get path => "/managers";
}
