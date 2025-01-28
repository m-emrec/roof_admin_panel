///
// ignore: unnecessary_library_name
library side_bar;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/core/extensions/context_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/controller.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_state_mixin.dart';
part 'side_bar_item.dart';
part 'user_avar_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin, SideBarStateMixin {
  @override
  void initState() {
    SideBarController().selectedPage.addListener(navigationManager);
    animationController = AnimationController(
      vsync: this,
      lowerBound: collapsedWidth,
      upperBound: expandedWidth,
      duration: SideBarController().animationDuration,
      value: expandedWidth,
    );
    animationController
      ..forward()
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener(sideBarAnimationListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => child!,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: animationController.value,
        decoration: BoxDecoration(
          // boxShadow: SideBarController().isExpanded.value
          //     ? context.theme.extension<SideBarThemeExtension>()?.boxShadow
          //     : null,
          color:
              context.theme.extension<SideBarThemeExtension>()?.backgroundColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: SideBarController().isExpanded.value
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: SvgPicture.asset(Assets.icons.addIcon),
                  onPressed: () {
                    if (SideBarController().isExpanded.value) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                ),
              ],
            ),
            SideBarUserAvatar(),
            _SideBarItem(
              index: 0,
              icon: const Icon(Icons.home),
              title: LocaleKeys.sidebar_members.tr(),
              isSelected: SideBarController().selectedPage.value == 0,
            ),
            _SideBarItem(
              index: 1,
              icon: const Icon(Icons.home),
              title: LocaleKeys.sidebar_feedback.tr(),
              isSelected: SideBarController().selectedPage.value == 1,
            ),
          ],
        ),
      ),
    );
  }
}
