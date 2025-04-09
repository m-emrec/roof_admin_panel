import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/views/mentorship_widget.dart';

final class MentorMembershipInfoField
    extends BaseMembershipInfoField<UserModel> {
  MentorMembershipInfoField({
    required super.label,
    required super.value,
    super.controller,
  });

  @override
  Widget editStateWidget(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget widget(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: MentorshipWidget(value),
    );
  }
}
