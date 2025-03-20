import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/managers_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/members_route.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/controller.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_item_model.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar_item_view_switcher.dart';

part 'side_bar_item.dart';

/// This class contains the sidebar items.
///
/// * When you want to add a new sidebar item, you should add it to this list.
///
final class SideBarItemsBuilder {
  /// sideBarItems is a list of [SideBarItemModel].
  ///
  /// It contains the sidebar items.
  ///
  ///* When you want to add a new sidebar item, you should add it to this list.
  static List<SideBarItemModel> sideBarItems(BuildContext context) => [
        SideBarItemModel(
          route: const MainRoute(),
          icon: SvgPicture.asset(
            Assets.icons.membersIcon,
            width: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.width,
            height: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.height,
          ),
          title: LocaleKeys.sidebar_members.tr(),
        ),
        SideBarItemModel(
          route: FeedbackRoute(),
          icon: SvgPicture.asset(
            Assets.icons.feedbacksIcon,
            width: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.width,
            height: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.height,
          ),
          title: LocaleKeys.sidebar_feedback.tr(),
        ),
        SideBarItemModel(
          title: LocaleKeys.sidebar_guests.tr(),
          icon: SvgPicture.asset(
            Assets.icons.guestsIcon,
            width: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.width,
            height: context.theme
                .extension<SideBarThemeExtension>()
                ?.iconSize
                ?.height,
          ),
          route: GuestsRoute(),
        ),
        SideBarItemModel(
          title: LocaleKeys.sidebar_managers.tr(),
          icon: _icon(Assets.icons.managersIcon, context),
          route: ManagersRoute(),
        ),
      ];

  static SvgPicture _icon(String iconPath, BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: context.theme.extension<SideBarThemeExtension>()?.iconSize?.width,
      height:
          context.theme.extension<SideBarThemeExtension>()?.iconSize?.height,
    );
  }

  static List<Widget> create(BuildContext context) {
    return sideBarItems(context)
        .map(
          (item) => _SideBarItem(
            icon: item.icon,
            title: item.title,
            route: item.route,
          ),
        )
        .toList();
  }
}
