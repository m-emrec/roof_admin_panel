import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/features/members/presentation/pages/members_view.dart';

final class MembersRoute extends BaseRouteClass {
  @override
  String get name => "Members";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const MembersView();

  ShellRoute get shell => ShellRoute(
        routes: [
          route,
          FeedbackRoute().route,
          // MembersRoute().route,
        ],
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
                // title: const Text('Home Page'),
                ),
            drawer: Drawer(
              elevation: 0,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Members'),
                    onTap: () => context.go('/members'),
                  ),
                  ListTile(
                    title: const Text('feedback'),
                    onTap: () => context.goNamed(FeedbackRoute().name),
                  ),
                ],
              ),
            ),
            body: child,
          );
        },
      );

  @override
  String get path => "/members";
}
