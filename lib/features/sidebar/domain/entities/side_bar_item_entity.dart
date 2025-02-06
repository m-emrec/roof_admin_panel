import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';

class SideBarItemEntity {
  SideBarItemEntity({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final Widget icon;
  final BaseRouteClass route;
}
