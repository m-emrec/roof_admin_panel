// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';

enum SortBy {
  name,
  // membershipStartDate,
  membershipEndDate,
  membershipDuration,
  memberNumber,
  age,
  ;

  static final _locale = {
    name: LocaleKeys.membersView_sort_name.tr(),
    // membershipStartDate: LocaleKeys.membersView_sort_membershipStartDate.tr(),
    membershipEndDate: LocaleKeys.membersView_sort_membershipEndDate.tr(),
    membershipDuration: LocaleKeys.membersView_sort_memberShipDuration.tr(),
    memberNumber: LocaleKeys.membersView_sort_memberNumber.tr(),
    age: LocaleKeys.membersView_sort_age.tr(),
  };

  static String fromTableColumnName(String columnName) {
    switch (columnName) {
      case "memberName":
        return name.toLocale;
      // case "membershipStartDate":
      //   return membershipStartDate.toLocale;
      case "membershipEndDate":
        return membershipEndDate.toLocale;
      case "membershipDuration":
        return membershipDuration.toLocale;
      case "memberNumber":
        return memberNumber.toLocale;
      case "age":
        return age.toLocale;
      default:
        return "";
    }
  }

  MemberTableNames get toTableColumnName {
    switch (this) {
      case name:
        return MemberTableNames.memberName;
      // case membershipStartDate:
      //   return MemberTableNames.membershipEndDate;
      case membershipEndDate:
        return MemberTableNames.membershipEndDate;
      case membershipDuration:
        return MemberTableNames.membershipDuration;
      case memberNumber:
        return MemberTableNames.memberNumber;
      case age:
        return MemberTableNames.age;
    }
  }

  String get toLocale {
    if (_locale.containsKey(this)) {
      return _locale[this]!;
    }
    return "";
  }
}
