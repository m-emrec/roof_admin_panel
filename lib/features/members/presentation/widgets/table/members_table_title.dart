import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/add_member_route.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

/// This is the title of the members table.
///
/// It displays the title and the total number of members.
///
/// It also contains a button to add a new member.
class MembersTableTitle extends ConsumerWidget {
  /// This is the title of the members table.
  ///
  /// It displays the title and the total number of members.
  ///
  /// It also contains a button to add a new member.
  const MembersTableTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: SpacingSizes.medium,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          spacing: SpacingSizes.extraExtraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(
              title: LocaleKeys.membersView_pageTitle.tr(),
            ),
            // Total members count
            AsyncDataBuilder(
              provider: totalMembersCountProvider,
              data: (count) => Text(
                LocaleKeys.membersView_memberCount.tr(
                  args: [count.toString()],
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.darkTextColors[30],
                    ),
              ),
              skeletonType: SkeletonType.text,
            ),
          ],
        ),
        // Add member button
        ElevatedButton(
          onPressed: PermissionBasedAction(
            () => context.pushNamed(AddMemberRoute().name),
            necessaryPermissions: [
              Permissions.canEdit,
              Permissions.canEditMembers,
            ],
          ).call(),
          child: Text(LocaleKeys.membersView_addMember.tr()),
        ),
      ],
    );
  }
}
