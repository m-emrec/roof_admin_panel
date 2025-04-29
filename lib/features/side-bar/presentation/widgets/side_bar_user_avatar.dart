import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/account_settings_route.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/widgets/side_bar_item_switcher.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

/// SideBarUserAvatar is a widget that contains the user avatar and current
/// user name  in the sidebar.
class SideBarUserAvatar extends ConsumerWidget {
  /// SideBarUserAvatar is a widget that contains the user avatar and current
  /// user name  in the sidebar.
  // ignore: prefer_const_constructors_in_immutables
  SideBarUserAvatar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.backgroundColor[30] ?? Colors.transparent,
          ),
        ),
        color:
            ref.watch(isItemSelectedProvider([context, AccountSettingsRoute()]))
                ? context.theme
                    .extension<SideBarThemeExtension>()
                    ?.selectedItemColor
                : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => context.goNamed(AccountSettingsRoute().name),

        /// ! !! !! DO NOT MAKE [SideBarItemViewSwitcher] CONST !! !! !
        /// Because when this widget is const it will not rebuild it self when the
        /// [SideBarController().isExpanded] value changes.
        /// So, it will not change the avatar when the sidebar is expanded or collapsed.
        // ignore: prefer_const_constructors
        child: SideBarItemSwitcher(
          expandedChild: _ExpandedSideBarUserAvatar(
            ref.watch(
              isItemSelectedProvider([context, AccountSettingsRoute()]),
            ),
          ),
          collapsedChild: const _CollapsedSideBarUserAvatar(),
        ),
      ),
    );
  }
}

class _ExpandedSideBarUserAvatar extends StatelessWidget {
  const _ExpandedSideBarUserAvatar(this.isSelected);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CurrentUser.instance.managerModelNotifier,
      builder: (context, user, child) => ListTile(
        style: ListTileStyle.drawer,
        onTap: () => context.goNamed(AccountSettingsRoute().name),
        title: Text(
          user.name,
          style: isSelected
              ? context.theme
                  .extension<SideBarThemeExtension>()
                  ?.selectedTextStyle
              : context.theme.extension<SideBarThemeExtension>()?.textStyle,
          maxLines: 1,
        ),
        leading: Avatar(
          imageUrl: user.imageUrl,
          radius: 12,
        ),
      ),
    );
  }
}

class _CollapsedSideBarUserAvatar extends StatelessWidget {
  const _CollapsedSideBarUserAvatar();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CurrentUser.instance.managerModelNotifier,
      builder: (context, user, child) => Padding(
        padding: const AppPadding.horizontalxsSymmetric() +
            const AppPadding.verticalxsSymmetric(),
        child: Avatar(
          imageUrl: user.imageUrl,
          radius: 16,
        ),
      ),
    );
  }
}
