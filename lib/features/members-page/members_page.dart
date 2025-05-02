import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/banned-members/presentation/view/banned_members_view.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members-view/presentation/view/members_view.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';
import 'package:web/web.dart' as web;

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});
  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: views.length,
      vsync: this,
      initialIndex: int.parse(
        web.window.sessionStorage.getItem("membersPageTabIndex") ?? "0",
      ),
    );
    super.initState();
  }

  List<Widget> get tabs => [
        Tab(
          child: Consumer(
            builder: (context, ref, child) => Row(
              spacing: SpacingSizes.extraExtraSmall,
              children: [
                Text(
                  LocaleKeys.membersView_pageTitle.tr(),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: CircleAvatar(
                    radius: tabController.index == 0 ? 12 : 8,
                    backgroundColor: AppColors.backgroundColor[40],
                    child: Text(
                      ref
                              .watch(totalMembersCountProvider)
                              .whenData(
                                (data) => data.toString(),
                              )
                              .value ??
                          "",
                      style: context.textTheme.labelSmall,
                      textScaler: TextScaler.linear(
                        tabController.index == 0 ? 1 : 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Tab(
          text: LocaleKeys.bannedMemberView_pageTitle.tr(),
        ),
        const Tab(
          text: "Stats",
        ),
        const Tab(
          text: "Prices",
        ),
      ];

  final List<Widget> views = const [
    MembersView(),
    BannedMembersView(),
    TitleWidget(title: "Stats"),
    TitleWidget(title: "Prices"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingSizes.extraSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(title: LocaleKeys.membersView_pageTitle.tr()),
        TabBar(
          indicatorAnimation: TabIndicatorAnimation.elastic,
          controller: tabController,
          onTap: onTabChanged,
          tabs: tabs,
          unselectedLabelColor: AppColors.secondaryColor.withValues(alpha: 0.5),
          labelColor: AppColors.secondaryColor,
          isScrollable: true,
          indicatorColor: AppColors.secondaryColor,
          tabAlignment: TabAlignment.start,
        ),
        Expanded(
          child: TabBarView(
            clipBehavior: Clip.none,
            controller: tabController,
            children: views,
          ),
        ),
      ],
    );
  }

  void onTabChanged(int value) {
    web.window.sessionStorage.setItem('membersPageTabIndex', value.toString());
    setState(() {});
  }
}
