import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/widgets/side_bar_control_button.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/widgets/side_bar_item_builder.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/widgets/side_bar_user_avatar.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(localeStorageProvider);
    final theme = context.theme.extension<SideBarThemeExtension>();
    return ClipRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: ref.watch(isSideBarExpandedProvider)
            ? theme?.expandedWidth
            : theme?.collapsedWidth,
        decoration: BoxDecoration(
          color: theme?.backgroundColor,
          boxShadow: theme?.boxShadow,
        ),
        child: Column(
          spacing: SpacingSizes.extraSmall,
          children: [
            const SideBarControlButton(),
            SideBarUserAvatar(),
            ...SideBarItemsBuilder.create(context),
          ],
        ),
      ),
    );
  }
}
