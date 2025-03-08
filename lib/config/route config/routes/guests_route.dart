import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/guests/presentation/pages/guests_view.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';

/// Route of the [GuestsView].
final class GuestsRoute extends BaseRouteClass {
  @override
  String get name => "Guests";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => PermissionBasedVisibility(
            child: const GuestsView(),
            necessaryPermissions: [Permissions.canReadGuests],
          ).visibleOrPermissionInfo;

  @override
  String get path => "/guests";
}
