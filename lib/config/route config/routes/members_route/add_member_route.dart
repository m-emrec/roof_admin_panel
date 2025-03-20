import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/pages/add_member_page.dart';

/// The route for the AddMemberPage.
/// This route is used to navigate to the AddMemberPage.
///
///
final class AddMemberRoute extends BaseRouteClass {
  @override
  String get name => "add-member";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const AddMemberPage();

  @override
  String get path => "/uye-ekle";
}
