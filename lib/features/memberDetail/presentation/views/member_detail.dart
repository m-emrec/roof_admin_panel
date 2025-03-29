import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership_info_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class MemberDetailDialog extends StatelessWidget {
  const MemberDetailDialog({super.key, required this.member});
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: Align(
        alignment: Alignment.centerRight,
        child: CloseButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            foregroundColor: WidgetStatePropertyAll(AppColors.accentError[70]),
          ),
        ),
      ),
      content: SizedBox(
        width: context.dynamicWidth(0.9),
        height: context.dynamicHeight(0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MembershipInfoCard(member: member),
          ],
        ),
      ),
      actions: const [],
    ).makeSelectable();
  }
}
