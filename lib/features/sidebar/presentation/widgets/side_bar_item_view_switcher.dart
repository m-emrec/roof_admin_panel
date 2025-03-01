import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/controller.dart';

/// This widget contains a [AnimatedCrossFade] widget,
///
/// it gives the [expandedChild] as the first child
/// and [collapsedChild] as the second child.
///
/// It will switch between the two children based on the
/// [SideBarController().isExpanded] value.
class SideBarItemViewSwitcher extends StatelessWidget {
  /// This widget contains a [AnimatedCrossFade] widget,
  ///
  /// it gives the [expandedChild] as the first child
  /// and [collapsedChild] as the second child.
  ///
  /// It will switch between the two children based on the
  /// [SideBarController().isExpanded] value.
  const SideBarItemViewSwitcher({
    required this.expandedChild,
    required this.collapsedChild,
    super.key,
  });

  /// The child widget that will be shown when the sidebar is expanded.
  final Widget expandedChild;

  /// The child widget that will be shown when the sidebar is collapsed.
  final Widget collapsedChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: SideBarController().animationDuration,
      crossFadeState: SideBarController().isExpanded.value
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      secondChild: collapsedChild,
      firstChild: expandedChild,
      alignment: Alignment.centerLeft,
      sizeCurve: Curves.easeIn,
      firstCurve: Curves.easeIn,
      secondCurve: Curves.easeIn,
    );
  }
}
