// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum Permissions {
  canEdit,
  canRead,
  canEditMembers,
  canReadMembers,
  canEditFeedbacks,
  canReadFeedbacks,
  canEditGuests,
  canReadGuests,
  canReadManagers,
  canEditManagers,
  ;

  const Permissions();
  static Map<Permissions, String> _localizations = {
    Permissions.canEdit: LocaleKeys.permissions_canEdit.tr(),
    Permissions.canRead: LocaleKeys.permissions_canRead.tr(),
    Permissions.canEditMembers: LocaleKeys.permissions_canEditMembers.tr(),
    Permissions.canReadMembers: LocaleKeys.permissions_canReadMembers.tr(),
    Permissions.canEditFeedbacks: LocaleKeys.permissions_canEditFeedbacks.tr(),
    Permissions.canReadFeedbacks: LocaleKeys.permissions_canReadFeedbacks.tr(),
    Permissions.canEditGuests: LocaleKeys.permissions_canEditGuests.tr(),
    Permissions.canReadGuests: LocaleKeys.permissions_canReadGuests.tr(),
    Permissions.canReadManagers: LocaleKeys.permissions_canReadManagers.tr(),
    Permissions.canEditManagers: LocaleKeys.permissions_canEditManagers.tr(),
  };

  String toLocale() {
    assert(
      Permissions.values.length == _localizations.length,
      "Please add all the values in the localizations",
    );

    return _localizations[this] ?? "";
  }

  static Permissions? fromLocale(String permission) {
    final localizedPermissionsMap =
        _localizations.map((key, value) => MapEntry(value, key));
    return localizedPermissionsMap[permission];
  }
}
