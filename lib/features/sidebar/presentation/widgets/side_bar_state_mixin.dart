import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/config/route%20config/routes/feedback_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/guests_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/members_route.dart';
import 'package:roof_admin_panel/features/sidebar/data/models/side_bar_item_model.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/controller.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/side_bar.dart';
import 'package:roof_admin_panel/features/sidebar/presentation/widgets/side_bar_item_view_switcher.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
part 'side_bar_item.dart';

/// SideBarStateMixin is a mixin class that contains the logic for the sidebar state.
mixin SideBarStateMixin on State<SideBar> {
  /// sideBarItems is a list of [SideBarItemModel].
  ///
  /// It contains the sidebar items.
  ///
  ///* When you want to add a new sidebar item, you should add it to this list.
  final List<SideBarItemModel> sideBarItems = [
    SideBarItemModel(
      route: const MembersRoute(),
      icon: SvgPicture.asset(Assets.icons.membersIcon),
      title: LocaleKeys.sidebar_members.tr(),
    ),
    SideBarItemModel(
      route: FeedbackRoute(),
      icon: SvgPicture.asset(Assets.icons.feedbacksIcon),
      title: LocaleKeys.sidebar_feedback.tr(),
    ),
    SideBarItemModel(
      title: LocaleKeys.sidebar_guests.tr(),
      icon: SvgPicture.asset(Assets.icons.guestsIcon),
      route: GuestsRoute(),
    ),
  ];

  /// createSideBarItems is a function that creates the sidebar items.
  ///
  List<Widget> createSideBarItems() {
    return sideBarItems
        .map(
          (item) => _SideBarItem(
            route: item.route,
            icon: item.icon,
            title: item.title,
          ),
        )
        .toList();
  }

  /// expandedWidth is the width of the sidebar when it is expanded.
  /// ? This value is arbitrary. It  looks good when it is 300.
  double expandedWidth = 300;

  /// collapsedWidth is the width of the sidebar when it is collapsed.
  /// ? Also this value is arbitrary. It  looks good when it is 64.
  double collapsedWidth = 64;

  /// animationController is the controller for the sidebar collapse/expand
  /// animation .
  late final AnimationController animationController;

  /// sideBarAnimationStatusListener is a listener function that listens to
  /// the animation status.
  ///
  /// If the animation status is forward, it will expand the sidebar.
  ///
  /// If the animation status is reverse, it will collapse the sidebar.
  void sideBarAnimationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      SideBarController().expandSideBar();
    } else if (status == AnimationStatus.reverse) {
      SideBarController().collapseSideBar();
    }
  }

  /// Just to initialize the animation controller.
  void initializeAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
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
      ..addStatusListener(sideBarAnimationStatusListener);
  }

  @override
  void dispose() {
    animationController
      ..removeListener(() {})
      ..removeStatusListener(sideBarAnimationStatusListener)
      ..dispose();

    super.dispose();
  }
}
