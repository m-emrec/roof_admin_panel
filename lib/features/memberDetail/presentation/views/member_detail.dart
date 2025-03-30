import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/about_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership_info_card.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/personal%20information%20section/personal_information_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

class MemberDetailDialog extends StatelessWidget {
  const MemberDetailDialog({super.key, required this.member});
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: Badge(
        padding: EdgeInsets.zero,
        largeSize: context.theme.buttonTheme.height,
        backgroundColor: AppColors.accentError[10],
        label: CloseButton(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            foregroundColor: WidgetStatePropertyAll(AppColors.accentError[70]),
          ),
        ),
        child: SizedBox(
          width: context.dynamicWidth(0.9),
          height: context.dynamicHeight(0.9),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MembershipInfoCard(member: member),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: PersonalInformationSection(member: member),
                    ),
                    Flexible(
                      child: AboutSection(member: member),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      actions: const [],
    ).makeSelectable();
  }
}
