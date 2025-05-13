import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/membership_detail_notifier.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/avatar%20role%20name%20section/role_selection_dropdown_field.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/mentor_membership_info_field.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class NameAndRoleSection extends ConsumerWidget {
  const NameAndRoleSection({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name =
        ref.watch(membershipDetailNotifierProvider.select((m) => m?.name));
    final role =
        ref.watch(membershipDetailNotifierProvider.select((m) => m?.role));
    final roleKey =
        ref.watch(membershipDetailNotifierProvider.notifier).roleController;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      spacing: SpacingSizes.extraSmall,
      children: [
        TitleWidget(
          title: name ?? '',
        ),
        RoleSelectionDropdownField(
          roleKey: roleKey,
          value: role ?? [],
        ).build(context, isEditing: ref.watch(isEditingProvider)),

        // Mentorship Info
        MentorMembershipInfoField(
          role: roleKey,
          value: ref.watch(membershipDetailNotifierProvider)?.copyWith(
                role: [roleKey.value],
              ) ??
              MemberModel(),
          mentorList:
              ref.watch(membershipDetailNotifierProvider.notifier).mentorList,
        ).build(
          context,
          isEditing: ref.watch(isEditingProvider),
        ),
      ],
    );
  }
}
