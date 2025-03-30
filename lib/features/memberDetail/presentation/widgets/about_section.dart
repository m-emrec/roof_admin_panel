import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return MembersDetailSectionCard(
      child: Section(
        title: LocaleKeys.memberDetailView_about.tr(),
        child: Text(
          member?.about ?? '',
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
