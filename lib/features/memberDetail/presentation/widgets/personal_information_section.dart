import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/personal_information_item.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context) {
    return MembersDetailSectionCard(
      child: Section(
        title: LocaleKeys.memberDetailView_personalInfo.tr(),
        child: Column(
          spacing: SpacingSizes.medium,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // birthdate
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_birthDate.tr(),
              label: [
                Text(
                  member?.birthDate?.formatDate(context) ?? "",
                  // style: context.textTheme.bodyLarge,
                ),
              ],
            ),
            // gender
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_gender.tr(),
              label: [
                Text(
                  member?.gender?.localizedText ?? "",
                ),
              ],
            ),
            // living city
            Row(
              spacing: SpacingSizes.medium,
              children: [
                PersonalInformationItem(
                  title: LocaleKeys.memberDetailView_livingCity.tr(),
                  label: [
                    Text(
                      member?.livingCity?.cityName ?? "",
                    ),
                    Text(
                      member?.livingCity?.town ?? "",
                    ),
                  ],
                ),
                // work city
                PersonalInformationItem(
                  title: LocaleKeys.memberDetailView_workingCity.tr(),
                  label: [
                    Text(
                      member?.workCity?.cityName ?? "",
                    ),
                    Text(
                      member?.workCity?.town ?? "",
                    ),
                  ],
                ),
              ],
            ),

            // occupation
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_occupation.tr(),
              label: [
                Text(
                  member?.occupation ?? "",
                ),
              ],
            ),
            // hobbies
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_hobbies.tr(),
              label: member?.hobbies?.map(Text.new).toList() ?? [],
            ),
            // interests
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_interests.tr(),
              label: member?.interests?.map(Text.new).toList() ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
