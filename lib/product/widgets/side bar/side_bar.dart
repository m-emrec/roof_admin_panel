///
// ignore: unnecessary_library_name
library side_bar;

import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/account_settings_route.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_control_button.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_item_view_switcher.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_items_builder.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_state_mixin.dart';

part 'side_bar_user_avar.dart';

/// SideBar is a widget that contains the sidebar layout.
class SideBar extends StatefulWidget {
  /// SideBar is a widget that contains the sidebar layout.
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin, SideBarStateMixin {
  @override
  void didChangeDependencies() {
    initializeAnimationController(this);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => child ?? const SizedBox(),
      child: Container(
        width: animationController.value,
        color:
            context.theme.extension<SideBarThemeExtension>()?.backgroundColor,
        child: Column(
          spacing: SpacingSizes.extraSmall,
          children: [
            SideBarControlButton(animationController: animationController),
            Column(
              spacing: SpacingSizes.extraSmall,
              children: [
                SideBarUserAvatar(),
                ...SideBarItemsBuilder.create(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
