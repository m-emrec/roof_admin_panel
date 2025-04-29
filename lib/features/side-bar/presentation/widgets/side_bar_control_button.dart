import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/widgets/side_bar_item_switcher.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';

class SideBarControlButton extends ConsumerWidget {
  const SideBarControlButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const AppPadding.horizontalxsSymmetric() +
          const AppPadding.verticalxxSSymmetric(),
      child: SideBarItemSwitcher(
        expandedChild: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => ref.read(isSideBarExpandedProvider.notifier).state =
                !ref.read(isSideBarExpandedProvider.notifier).state,
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: IconSizes.medium.height,
              color: context.theme
                  .extension<SideBarThemeExtension>()
                  ?.selectedItemColor
                  ?.withValues(alpha: 0.5),
            ),
          ),
        ),
        collapsedChild: InkWell(
          onTap: () => ref.read(isSideBarExpandedProvider.notifier).state =
              !ref.read(isSideBarExpandedProvider.notifier).state,
          child: AppIcon(
            Assets.icons.sidebarIcon,
          ),
        ),
      ),
    );
  }
}
