import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/personal%20information%20section/personal_information_item.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

///
class PersonalInformationSection extends StatelessWidget {
  /// This is the section which displays the personal information of the user.
  ///
  /// It contains the following information:
  ///
  /// - [birthdate]
  /// - [gender]
  /// - [living city]
  /// - [work city]
  /// - [occupation]
  /// - [hobbies]
  /// - [interests]
  ///
  const PersonalInformationSection({
    required this.member,
    super.key,
  });

  ///
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
              title: LocaleKeys.memberDetailView_personalInfo_birthDate.tr(),
              children: [
                Text(
                  member?.birthDate?.formatDate(context) ?? "",
                ),
              ],
            ),
            // gender
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_personalInfo_gender.tr(),
              children: [
                Text(
                  member?.gender?.localizedText ?? "",
                ),
              ],
            ),
            // living city
            Wrap(
              spacing: SpacingSizes.medium,
              runSpacing: SpacingSizes.medium,
              children: [
                PersonalInformationItem(
                  title:
                      LocaleKeys.memberDetailView_personalInfo_livingCity.tr(),
                  children: [
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
                  title:
                      LocaleKeys.memberDetailView_personalInfo_workingCity.tr(),
                  children: [
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
              title: LocaleKeys.memberDetailView_personalInfo_occupation.tr(),
              children: [
                Text(
                  member?.occupation ?? "",
                ),
              ],
            ),
            // hobbies
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_personalInfo_hobbies.tr(),
              children: member?.hobbies?.map(Text.new).toList() ?? [],
            ),
            // interests
            PersonalInformationItem(
              title: LocaleKeys.memberDetailView_personalInfo_interests.tr(),
              children: member?.interests?.map(Text.new).toList() ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
