import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/providers/providers.dart';

class SideBarItemSwitcher extends ConsumerWidget {
  const SideBarItemSwitcher({
    required this.expandedChild,
    required this.collapsedChild,
  });

  final Widget expandedChild;
  final Widget collapsedChild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(isSideBarExpandedProvider);
    return AnimatedSwitcher(
      duration: isExpanded ? Durations.long2 : Durations.short1,
      transitionBuilder: (child, animation) {
        return isExpanded
            ? child
            : ScaleTransition(
                alignment: Alignment.centerLeft,
                scale: animation,
                child: child,
              );
      },
      child: isExpanded ? expandedChild : collapsedChild,
    );
  }
}
