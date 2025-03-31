import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/about_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/personal%20information%20section/personal_information_section.dart';
import 'package:roof_admin_panel/product/widgets/responsive_builder.dart';

class AboutAndPersonalInfo extends StatelessWidget {
  const AboutAndPersonalInfo(this.member, {super.key});
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _Mobile(member),
      tablet: _Mobile(member),
      desktop: _Desktop(member),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop(
    this.member,
  );

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AboutSection(member: member),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: PersonalInformationSection(member: member),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile(
    this.member,
  );

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutSection(member: member),
        SizedBox(
          width: context.dynamicWidth(0.9),
          child: PersonalInformationSection(member: member),
        ),
      ],
    );
  }
}
