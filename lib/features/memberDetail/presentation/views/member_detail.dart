import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/about%20and%20personal%20info/about_and_personal_info.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership_info_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
class MemberDetailDialog extends StatelessWidget {
  ///
  const MemberDetailDialog({
    required this.member,
    super.key,
  });

  ///
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: SizedBox(
        width: context.dynamicWidth(0.9),
        height: context.dynamicHeight(0.9),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MembershipInfoCard(member: member),
              AboutAndPersonalInfo(member),
            ],
          ),
        ),
      ),
      showCloseButton: true,
      actions: const [],
    ).makeSelectable();
  }
}
