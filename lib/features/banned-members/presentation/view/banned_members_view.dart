import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/banned-members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/banned-members/presentation/widgets/banned_members_info.dart';
import 'package:roof_admin_panel/features/members-page/members_page.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/handlers/permissions_handler.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

///
/// It is part of [MembersPage] and is used to show the members that have been banned.
class BannedMembersView extends ConsumerWidget {
  /// Constructor for [BannedMembersView].
  const BannedMembersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const BannedMembersInfo(),
        Expanded(
          child: AsyncDataBuilder(
            provider: bannedMembersViewModelProvider,
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final member = data[index];
                return ListTile(
                  /// Image
                  leading: Avatar(
                    imageUrl: member.imageUrl,
                    radius: IconSizes.small.height,
                  ),

                  /// Name
                  title: Text(member.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Phone Number
                      Text(
                        member.phoneNumber,
                        style: context.textTheme.labelLarge,
                      ),

                      /// Banned Date
                      Tooltip(
                        message: LocaleKeys.bannedMemberView_bannedDate.tr(),
                        child: Text(
                          "${member.bannedDate?.formatDate(context)}",
                          style: context.textTheme.labelLarge?.copyWith(
                            color: AppColors.neutralGray500[80],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Unban Button
                  trailing: IconButton(
                    tooltip: LocaleKeys.bannedMemberView_unBan.tr(),
                    icon: const Icon(Icons.undo_rounded),
                    onPressed: PermissionBasedAction(
                      () => ref
                          .read(bannedMembersViewModelProvider.notifier)
                          .unbanMember(member.uid ?? ""),
                      necessaryPermissions: [
                        Permissions.canEditMembers,
                        Permissions.canEdit,
                      ],
                    ).executeIfAuthorized(),
                  ).visibleIfEditMemberAllowed,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
