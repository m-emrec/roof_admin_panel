// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum AddMemberTableColumnNames {
  memberNumber,
  name,
  phoneNumber,
  role,
  mentor,
  gender,
  membershipStartDate,
  membershipDuration;

  static final _locale = {
    memberNumber: LocaleKeys.addMember_memberNumber.tr(),
    name: LocaleKeys.addMember_name.tr(),
    phoneNumber: LocaleKeys.addMember_phoneNumber.tr(),
    role: LocaleKeys.addMember_role.tr(),
    // mentor: LocaleKeys.addMember_.tr(),
    gender: LocaleKeys.addMember_gender.tr(),
    membershipStartDate: LocaleKeys.addMember_memberShipStartDate.tr(),
    membershipDuration: LocaleKeys.addMember_memberShipDuration.tr(),
  };

  static AddMemberTableColumnNames toTableNamesEnum(String tableName) {
    switch (tableName) {
      case 'memberNumber':
        return AddMemberTableColumnNames.memberNumber;
      case 'name':
        return AddMemberTableColumnNames.name;
      case 'phoneNumber':
        return AddMemberTableColumnNames.phoneNumber;
      case 'role':
        return AddMemberTableColumnNames.role;
      case 'mentor':
        return AddMemberTableColumnNames.mentor;
      default:
        return AddMemberTableColumnNames.memberNumber;
    }
  }

  String get toLocale {
    if (_locale.containsKey(this)) {
      return _locale[this]!;
    }
    return "";
  }
}
