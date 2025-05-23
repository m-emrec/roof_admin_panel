import 'package:core/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/about_section.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/personal-info-section/personal_information_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';

///
/// This widget is responsible for displaying the about and personal information
/// sections of the member detail dialog.
///
///
class AboutAndPersonalInfo extends StatelessWidget {
  ///
  const AboutAndPersonalInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return context.responsiveSelector(
      mobile: const _Mobile(),
      tablet: const _Mobile(),
      desktop: const _Desktop(),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: AboutSection(),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: PersonalInformationSection(),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AboutSection(),
        SizedBox(
          width: context.dynamicWidth(0.9),
          child: const PersonalInformationSection(),
        ),
      ],
    );
  }
}
