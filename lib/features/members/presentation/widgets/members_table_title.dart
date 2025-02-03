import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/add%20new%20user/add_new_user_dialog.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
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
    final totalMembersCount = ref.watch(totalMembersCountProvider);
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
            Text(
              LocaleKeys.membersView_memberCount.tr(
                args: [totalMembersCount.value.toString()],
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.darkTextColors[30],
                  ),
            ),
          ],
        ),
        // Add member button
        ElevatedButton(
          onPressed: () => CustomAlertDialog.showAlertDialog(
            context: context,
            content: const AddNewUserDialog(),
          ),
          child: Text(LocaleKeys.membersView_addMember.tr()),
        ),
      ],
    );
  }
}
