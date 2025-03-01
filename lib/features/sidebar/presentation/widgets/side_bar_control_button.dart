import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/side_bar_item_view_switcher.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';

/// This is the top right button in the sidebar that controls the sidebar's
/// expansion and collapse.
class SideBarControlButton extends StatelessWidget {
  /// This is the top right button in the sidebar that controls the sidebar's
  /// expansion and collapse.
  const SideBarControlButton({
    required this.animationController,
    super.key,
  });

  ///
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SideBarItemViewSwitcher(
      expandedChild: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          style: context.theme.iconButtonTheme.style?.copyWith(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          icon: const Icon(Icons.close_rounded),
          onPressed: animationController.reverse,
        ),
      ),
      collapsedChild: IconButton(
        style: context.theme.iconButtonTheme.style?.copyWith(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        icon: SvgPicture.asset(Assets.icons.sidebarIcon),
        onPressed: animationController.forward,
      ),
    );
  }
}
