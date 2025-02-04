import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/widgets/select%20users%20grid%20dialog/select_users_grid_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
/// Purpose of this widget is to show buttons based on the selected role on [RoleDropdown]
///
/// This widget is used in [AddNewUserDialog]
class RoleBasedButtons extends ConsumerWidget {
  ///
  /// Purpose of this widget is to show buttons based on the selected role on [RoleDropdown]
  ///
  /// This widget is used in [AddNewUserDialog]
  const RoleBasedButtons({super.key});

  void _onPressed(
    BuildContext context,
    Future<List<UserModel>> fetchUsersMethod,
  ) {
    CustomAlertDialog.showAlertDialog(
      context: context,
      content: SelectsUsersGridDialog(
        fetchUsersMethod: fetchUsersMethod,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role =
        ref.watch(addMemberProvider.select((value) => value.user.role))?.first;
    switch (role) {
      case Role.mentor:
        return Column(
          spacing: SpacingSizes.extraExtraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () => _onPressed(
                context,
                ref.read(addMemberProvider).fetchMembersWithoutMentor(),
              ),
              child: Text(LocaleKeys.addMember_addMemberToMentor.tr()),
            ),
            OutlinedButton(
              onPressed: () => _onPressed(
                context,
                ref.read(addMemberProvider).fetchMentats(),
              ),
              child: Text(LocaleKeys.addMember_addMentatToMentor.tr()),
            ),
          ],
        );
      case Role.member:
        return OutlinedButton(
          onPressed: () => _onPressed(
            context,
            ref.read(addMemberProvider).fetchMentors(),
          ),
          child: Text(LocaleKeys.addMember_addMentorToMember.tr()),
        );
      case Role.admin:
        return OutlinedButton(
          onPressed: () => _onPressed(
            context,
            ref.read(addMemberProvider).fetchMentors(),
          ),
          child: Text(LocaleKeys.addMember_addMentorToMember.tr()),
        );
      case Role.mentat:
        return OutlinedButton(
          onPressed: () => _onPressed(
            context,
            ref.read(addMemberProvider).fetchMentorsWithoutMentat(),
          ),
          child: Text(LocaleKeys.addMember_addMentorToMentat.tr()),
        );

      default:
        return const SizedBox();
    }
  }
}
