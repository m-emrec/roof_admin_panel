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
      default:
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
