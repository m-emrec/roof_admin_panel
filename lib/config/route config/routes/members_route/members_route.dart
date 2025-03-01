import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/add_member_route.dart';
import 'package:roof_admin_panel/features/members/presentation/pages/members_view.dart';
import 'package:roof_admin_panel/features/view%20manager/view_manager.dart';

final class MembersRoute extends BaseRouteClass {
  const MembersRoute();

  @override
  String get name => "Members";
  @override
  List<GoRoute> get routes => [
        AddMemberRoute().route,
      ];
  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const MembersView();

  ShellRoute get shell => ShellRoute(
        routes: [
          route,
          FeedbackRoute().route,
          GuestsRoute().route,
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
