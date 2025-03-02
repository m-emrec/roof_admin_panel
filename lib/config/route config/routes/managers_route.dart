import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/managers/presentation/pages/managers_view.dart';

final class ManagersRoute extends BaseRouteClass {
  @override
  String get name => "managers";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const ManagersView();

  @override
  String get path => "/managers";
}
