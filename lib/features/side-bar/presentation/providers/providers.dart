import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import "package:web/web.dart" as web;

final isSideBarExpandedProvider = StateProvider<bool>((ref) {
  final isExpanded = web.window.localStorage.getItem("isExpanded");
  // Log.debug(isExpanded);

  if (isExpanded == "true") {
    return true;
  } else if (isExpanded == "false") {
    return false;
  }

  return true;
});

final localeStorageProvider = Provider<void>((ref) {
  final isExpanded = ref.watch(isSideBarExpandedProvider);
  if (isExpanded) {
    web.window.localStorage.setItem("isExpanded", "true");
  } else {
    web.window.localStorage.setItem("isExpanded", "false");
  }
});

final isItemSelectedProvider =
    StateProvider.family<bool, List<dynamic>>((ref, params) {
  final route = params[1] as BaseRouteClass;
  final context = params[0] as BuildContext;

  return GoRouterState.of(context).fullPath?.contains(route.path) ?? false;
});
