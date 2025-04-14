//
// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// Enum for the guest table names
///
/// This enum mainly used on the [GuestTable] class to define the table name
enum GuestTableNames {
  name,
  phoneNumber,
  gender,
  guestStartDate,
  joinedEventCount,
  role,
  ;

  static Map<GuestTableNames, String> _locale = {
    GuestTableNames.name: LocaleKeys.guestsView_tableColumnLabels_name.tr(),
    GuestTableNames.phoneNumber:
        LocaleKeys.guestsView_tableColumnLabels_phoneNumber.tr(),
    GuestTableNames.gender: LocaleKeys.guestsView_tableColumnLabels_gender.tr(),
    GuestTableNames.guestStartDate:
        LocaleKeys.guestsView_tableColumnLabels_guestStartDate.tr(),
    GuestTableNames.joinedEventCount:
        LocaleKeys.guestsView_tableColumnLabels_joinedEventCount.tr(),
    GuestTableNames.role: LocaleKeys.guestsView_tableColumnLabels_role.tr(),
  };

  String get toLocale {
    return _locale[this] ?? '';
  }
}
