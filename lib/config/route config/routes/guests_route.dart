import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/guests/presentation/pages/guests_view.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';

/// Route of the [GuestsView].
final class GuestsRoute extends BaseRouteClass {
  @override
  String get name => "Guests";
  @override
  String get title => LocaleKeys.guestsView_pageTitle.tr();

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => PermissionBasedVisibility(
            child: const GuestsView(),
            necessaryPermissions: [
              Permissions.canReadGuests,
              Permissions.canRead
            ],
          ).visibleOrPermissionInfo;

  @override
  String get path => "/misafirler";
}
