import 'package:easy_localization/easy_localization.dart';
import '../../../config/localization/lang/locale_keys.g.dart';

/// An enum that defines the roles of users in the application.
enum Role {
  /// An administrator role.
  admin,

  /// A member role.
  member,

  /// A guest role.
  guest,

  /// An approved guest role. This means the guest is approved by an admin.
  /// and is waiting for the payment to be processed.
  approvedGuest,

  /// mentat role
  mentat,

  /// mentor role
  mentor,

  /// A custom role that is not defined in the enum.
  other,
  ;

  /// Returns the localized text for the role.
  String localizedText([String? otherRole]) {
    switch (this) {
      case Role.admin:
        return tr(LocaleKeys.roles_admin);
      case Role.member:
        return tr(LocaleKeys.roles_member);
      case Role.guest:
        return tr(LocaleKeys.roles_guest);
      case Role.approvedGuest:
        return tr(LocaleKeys.roles_approvedGuest);
      // if it is [other] role, that means the role is not defined in the enum.
      // and it will be received from the database directly
      case Role.other:
        assert(
          this == Role.other && otherRole != null,
          'otherRole must not be null',
        );
        return otherRole ?? "";
      case Role.mentat:
        return tr(LocaleKeys.roles_mentat);
      case Role.mentor:
        return tr(LocaleKeys.roles_mentor);
    }
  }
}

/// An extension that provides utility methods for the [String] class.
extension RoleStringExtension on String {
  /// Converts a string to a [Role] enum.
  Role toRole() {
    switch (this) {
      case 'admin':
        return Role.admin;
      case 'member':
        return Role.member;
      case 'guest':
        return Role.guest;
      case 'approvedGuest':
        return Role.approvedGuest;
      case 'mentat':
        return Role.mentat;
      case 'mentor':
        return Role.mentor;
      default:
        return Role.other;
    }
  }

  /// Converts a string to a [Role] enum.
  ///
  /// Use this method when you want to convert a localized string to a [Role] enum.
  ///
  /// For example, if you have a string that is localized and you want to convert it to a [Role] enum,
  /// you can use this method.
  Role fromLocalizedStringToRoleEnum() {
    if (this == Role.admin.localizedText()) {
      return Role.admin;
    }
    if (this == Role.member.localizedText()) {
      return Role.member;
    }
    if (this == Role.guest.localizedText()) {
      return Role.guest;
    }
    if (this == Role.approvedGuest.localizedText()) {
      return Role.approvedGuest;
    }
    if (this == Role.mentat.localizedText()) {
      return Role.mentat;
    }
    if (this == Role.mentor.localizedText()) {
      return Role.mentor;
    }
    return Role.other;
  }
}
