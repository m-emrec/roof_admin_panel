import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// An extension on [List<Role?>] that provides convenient role-checking utilities.
///
/// This extension makes it easier to determine whether a list of roles
/// includes specific roles such as [Role.admin], [Role.mentor], or [Role.mentat].
///
/// Useful in scenarios where user permissions or role-based access logic
/// needs to be handled in a more readable and reusable way.
///
/// Example usage:
/// ```dart
/// if (user.roles.isAdmin) {
///   // Grant admin access
/// }
/// ```
extension RoleUtilsExtension on List<Role?> {
  /// Returns `true` if the list contains the [Role.admin] role.
  bool get isAdmin => contains(Role.admin);

  /// Returns `true` if the list contains the [Role.mentor] role.
  bool get isMentor => contains(Role.mentor);

  /// Returns `true` if the list contains the [Role.member] role.
  bool get isMentat => contains(Role.mentat);
}

extension UserModelRole on MemberModel {
  /// Returns `true` if the list contains the [Role.admin] role.
  bool get isAdmin => role?.contains(Role.admin) ?? false;

  /// Returns `true` if the list contains the [Role.mentor] role.
  bool get isMentor => role?.contains(Role.mentor) ?? false;

  /// Returns `true` if the list contains the [Role.member] role.
  bool get isMentat => role?.contains(Role.mentat) ?? false;
}

extension RoleListExtensions on List<Role> {
  List<Role> get getMemberRelatedRoles {
    return where((element) {
      return element != Role.guest &&
          element != Role.approvedGuest &&
          element != Role.other;
    }).toList();
  }
}
