import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/feedback/presentation/pages/feedback_view.dart';

final class FeedbackRoute extends BaseRouteClass {
  @override
  String get name => "Feedback";

  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const FeedbackView();

  @override
  String get path => "/feedback";
}
