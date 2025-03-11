import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/animated_roof_logo_state_mixin.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';

///
class AnimatedRoofLogo extends StatefulWidget {
  /// This widget has shown on the left side of the screen.
  /// It has a logo image that scales up and down.
  ///
  const AnimatedRoofLogo({
    super.key,
  });

  @override
  State<AnimatedRoofLogo> createState() => _AnimatedRoofLogoState();
}

class _AnimatedRoofLogoState extends State<AnimatedRoofLogo>
    with SingleTickerProviderStateMixin, AnimatedRoofLogoStateMixin {
  @override
  void initState() {
    initAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // html.window
    return Padding(
      padding: const AppPadding.verticalLSymmetric() +
          const AppPadding.horizontalLSymmetric(),
      child: AnimatedBuilder(
        animation: animationController,
        child: Image.asset(
          Assets.icons.roofLogo.path,
        ),
        builder: (context, child) => child != null
            ? Transform.scale(
                scale: animationController.value,
                child: child,
              )
            : const SizedBox(),
      ),
    );
  }
}
