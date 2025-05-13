import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/add_mentor_button.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/views/mentorship_widget.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

final class MentorMembershipInfoField extends BaseMembershipField<MemberModel> {
  MentorMembershipInfoField({
    required super.value,
    required this.mentorList,
    required this.role,
    super.controller,
  }) : super(label: "", isEditable: true);

  final ValueNotifier<MemberModel> mentorList;
  final ValueNotifier<Role> role;
  @override
  Widget editStateWidget(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: role,
      builder: (context, a, child) {
        return AddMentorButton(
          selectedUsers: mentorList,
          user: value.copyWith(
            role: [a],
          ),
        );
      },
    );
  }

  @override
  Widget widget(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: MentorshipWidget(value),
    ).fadeAnimation().scaleAnimation();
  }
}
