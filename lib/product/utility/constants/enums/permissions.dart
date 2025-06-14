// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum Permissions {
  canEdit(Permissions.canRead),
  canRead(null),
  canEditMembers(Permissions.canReadMembers),
  canReadMembers(null),
  canEditMembershipFees(Permissions.canReadMembershipFees),
  canReadMembershipFees(null),
  canEditBannedMembers(Permissions.canReadBannedMembers),
  canReadBannedMembers(null),
  canEditFeedbacks(Permissions.canReadFeedbacks),
  canReadFeedbacks(null),
  canEditGuests(Permissions.canReadGuests),
  canReadGuests(null),
  canEditManagers(Permissions.canReadManagers),
  canReadManagers(null),
  ;

  const Permissions(this.parent);
  final Permissions? parent;

  static Map<Permissions, String> _localizations = {
    Permissions.canEdit: LocaleKeys.permissions_canEdit_label.tr(),
    Permissions.canRead: LocaleKeys.permissions_canRead_label.tr(),
    Permissions.canEditMembers:
        LocaleKeys.permissions_canEditMembers_label.tr(),
    Permissions.canReadMembers:
        LocaleKeys.permissions_canReadMembers_label.tr(),
    Permissions.canEditFeedbacks:
        LocaleKeys.permissions_canEditFeedbacks_label.tr(),
    Permissions.canReadFeedbacks:
        LocaleKeys.permissions_canReadFeedbacks_label.tr(),
    Permissions.canEditGuests: LocaleKeys.permissions_canEditGuests_label.tr(),
    Permissions.canReadGuests: LocaleKeys.permissions_canReadGuests_label.tr(),
    Permissions.canReadManagers:
        LocaleKeys.permissions_canReadManagers_label.tr(),
    Permissions.canEditManagers:
        LocaleKeys.permissions_canEditManagers_label.tr(),
    Permissions.canEditMembershipFees:
        LocaleKeys.permissions_canEditMembershipFees_label.tr(),
    Permissions.canReadMembershipFees:
        LocaleKeys.permissions_canReadMembershipFees_label.tr(),
    Permissions.canEditBannedMembers:
        LocaleKeys.permissions_canEditBannedMembers_label.tr(),
    Permissions.canReadBannedMembers:
        LocaleKeys.permissions_canReadBannedMembers_label.tr(),
  };

  static Map<Permissions, String> _localizationDescriptions = {
    Permissions.canEdit: LocaleKeys.permissions_canEdit_description.tr(),
    Permissions.canRead: LocaleKeys.permissions_canRead_description.tr(),
    Permissions.canEditMembers:
        LocaleKeys.permissions_canEditMembers_description.tr(),
    Permissions.canReadMembers:
        LocaleKeys.permissions_canReadMembers_description.tr(),
    Permissions.canEditFeedbacks:
        LocaleKeys.permissions_canEditFeedbacks_description.tr(),
    Permissions.canReadFeedbacks:
        LocaleKeys.permissions_canReadFeedbacks_description.tr(),
    Permissions.canEditGuests:
        LocaleKeys.permissions_canEditGuests_description.tr(),
    Permissions.canReadGuests:
        LocaleKeys.permissions_canReadGuests_description.tr(),
    Permissions.canReadManagers:
        LocaleKeys.permissions_canReadManagers_description.tr(),
    Permissions.canEditManagers:
        LocaleKeys.permissions_canEditManagers_description.tr(),
    Permissions.canEditMembershipFees:
        LocaleKeys.permissions_canEditMembershipFees_description.tr(),
    Permissions.canReadMembershipFees:
        LocaleKeys.permissions_canReadMembershipFees_description.tr(),
    Permissions.canEditBannedMembers:
        LocaleKeys.permissions_canEditBannedMembers_description.tr(),
    Permissions.canReadBannedMembers:
        LocaleKeys.permissions_canReadBannedMembers_description.tr(),
  };

  String get description {
    return _localizationDescriptions[this] ?? "";
  }

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
