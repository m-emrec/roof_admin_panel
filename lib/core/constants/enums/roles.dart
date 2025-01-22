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
}

/// An extension that provides utility methods for the [Role] enum.
extension RoleExtension on Role {
  /// Returns the localized text for the role.
  String text([String? otherRole]) {
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
}
