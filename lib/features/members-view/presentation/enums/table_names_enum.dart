import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// This enum contains the names of the columns in the  table.
enum MemberTableNames {
  memberNumber,
  memberName,
  phoneNumber,
  membershipEndDate,
  role,
  age,
  membershipDuration,
  mentor,
  fees,
  membershipType,
  gender,
  livingCity,
  ;

  static final _locale = {
    memberNumber: LocaleKeys.membersView_tableColumnLabels_memberNumber.tr(),
    memberName: LocaleKeys.membersView_tableColumnLabels_name.tr(),
    phoneNumber: LocaleKeys.membersView_tableColumnLabels_phoneNumber.tr(),
    membershipEndDate:
        LocaleKeys.membersView_tableColumnLabels_membershipEndDate.tr(),
    role: LocaleKeys.membersView_tableColumnLabels_role.tr(),
    age: LocaleKeys.membersView_tableColumnLabels_age.tr(),
    membershipDuration:
        LocaleKeys.membersView_tableColumnLabels_memberShipDuration.tr(),
    mentor: LocaleKeys.membersView_tableColumnLabels_mentor.tr(),
    fees: LocaleKeys.membersView_tableColumnLabels_fees.tr(),
    membershipType:
        LocaleKeys.membersView_tableColumnLabels_membershipType.tr(),
    gender: LocaleKeys.membersView_tableColumnLabels_gender.tr(),
    livingCity: LocaleKeys.membersView_tableColumnLabels_livingCity.tr(),
  };

  static MemberTableNames toTableNamesEnum(String tableName) {
    switch (tableName) {
      case 'memberNumber':
        return MemberTableNames.memberNumber;
      case 'memberName':
        return MemberTableNames.memberName;
      case 'phoneNumber':
        return MemberTableNames.phoneNumber;
      case 'membershipEndDate':
        return MemberTableNames.membershipEndDate;
      case 'role':
        return MemberTableNames.role;
      case 'age':
        return MemberTableNames.age;
      case 'membershipDuration':
        return MemberTableNames.membershipDuration;
      case 'mentor':
        return MemberTableNames.mentor;
      case 'fees':
        return MemberTableNames.fees;
      case 'membershipType':
        return MemberTableNames.membershipType;
      case "gender":
        return MemberTableNames.gender;
      case "livingCity":
        return MemberTableNames.livingCity;
      default: // Default case to handle unexpected values
        return MemberTableNames.memberNumber;
    }
  }

  String get toLocale {
    if (_locale.containsKey(this)) {
      return _locale[this]!;
    }
    return "";
  }
}
