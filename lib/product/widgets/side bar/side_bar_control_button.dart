import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_item_view_switcher.dart';

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
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          onPressed: animationController.reverse,
          // style: context.theme.iconButtonTheme.style?.copyWith(
          //   backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          // ),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
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
