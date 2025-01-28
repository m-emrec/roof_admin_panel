import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/app_colors.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class MembersTableTitle extends ConsumerWidget {
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
            Text(
              LocaleKeys.membersView_memberCount.tr(
                args: [ref.watch(totalMembersCountProvider).value.toString()],
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.darkTextColors[30],
                  ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(LocaleKeys.membersView_addMember.tr()),
        ),
      ],
    );
  }
}
