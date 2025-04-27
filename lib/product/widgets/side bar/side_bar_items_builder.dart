import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/main_shell_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/managers_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/members_route.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/side_bar_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';
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
  static List<SideBarItemModel> _sideBarItems(BuildContext context) {
    final Size iconSize =
        context.theme.extension<SideBarThemeExtension>()?.iconSize ?? Size.zero;
    return [
      SideBarItemModel(
        route: const MembersRoute(),
        icon: AppIcon(Assets.icons.membersIcon, size: iconSize),
        title: LocaleKeys.sidebar_members.tr(),
      ),
      SideBarItemModel(
        route: FeedbackRoute(),
        icon: AppIcon(
          Assets.icons.feedbacksIcon,
          size: iconSize,
        ),
        title: LocaleKeys.sidebar_feedback.tr(),
      ),
      SideBarItemModel(
        title: LocaleKeys.sidebar_guests.tr(),
        icon: AppIcon(
          Assets.icons.guestsIcon,
          size: iconSize,
        ),
        route: GuestsRoute(),
      ),
      SideBarItemModel(
        title: LocaleKeys.sidebar_managers.tr(),
        icon: AppIcon(
          Assets.icons.managersIcon,
          size: iconSize,
        ),
        route: ManagersRoute(),
      ),
    ];
  }

  static List<Widget> create(BuildContext context) {
    return _sideBarItems(context)
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
