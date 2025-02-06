import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/controller.dart';
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
    return Row(
      mainAxisAlignment: SideBarController().isExpanded.value
          ? MainAxisAlignment.end
          : MainAxisAlignment.center,
      children: [
        IconButton(
          style: context.theme.iconButtonTheme.style?.copyWith(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          ),
          icon: SideBarController().isExpanded.value
              ? const Icon(Icons.close_rounded)
              : SvgPicture.asset(Assets.icons.sidebarIcon),
          onPressed: () {
            if (SideBarController().isExpanded.value) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
        ),
      ],
    );
  }
}
