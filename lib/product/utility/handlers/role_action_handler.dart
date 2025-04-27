import 'package:core/utils/constants/enums/roles.dart';

/// RoleActionHandler is responsible for executing role-based actions
/// by determining the highest priority role from a list of roles.
///
/// It uses [_RolePriorityManager] to evaluate role importance and
/// runs the corresponding callback. If no specific callback is defined,
/// it falls back to the [memberAction].
///
/// This is useful when business logic needs to vary based on a user's role
/// in a clean and centralized way.
///
/// Example usage:
/// ```dart
/// RoleActionHandler(
///   roles: user.roles,
///   mentatAction: () => doMentatStuff(),
///   mentorAction: () => doMentorStuff(),
///   adminAction: () => doAdminStuff(),
///   memberAction: () => doMemberStuff(),
/// ).handle()
/// ```
class RoleActionHandler<T> {
  /// Constructs a [RoleActionHandler] with the provided roles and actions.
  /// The [roles] parameter is a list of roles that the user has.
  RoleActionHandler({
    required this.roles,
    required this.memberAction,
    this.mentatAction,
    this.mentorAction,
    this.adminAction,
  });

  /// The list of roles to evaluate.
  final List<Role?> roles;

  /// The action to perform if the user has the [Role.mentat] role.
  final T Function()? mentatAction;

  /// The action to perform if the user has the [Role.mentor] role.
  final T Function()? mentorAction;

  /// The action to perform if the user has the [Role.admin] role.
  final T Function()? adminAction;

  /// The action to perform if the user has the [Role.member] role.
  /// This is the default action that will be executed if no other role
  /// matches.
  /// It is required and must be provided.
  final T Function() memberAction;

  /// Handles the action based on the highest priority role.
  T handle() {
    final role = _RolePriorityManager.getHighestPriorityRole(roles);

    switch (role) {
      case Role.mentat:
        return mentatAction?.call() ?? memberAction();
      case Role.mentor:
        return mentorAction?.call() ?? memberAction();
      case Role.admin:
        return adminAction?.call() ?? memberAction();
      case Role.member:
        return memberAction();
      default:
        throw Exception("Unknown role");
    }
  }
}

/// RolePriorityManager provides role comparison logic to determine
/// which role in a list has the highest priority.
///
/// The priority order is:
/// - Mentat (0)
/// - Mentor (1)
/// - Admin (2)
/// - Member (3)
///
/// This is used internally by [RoleActionHandler].

class _RolePriorityManager {
  static const _priorityMap = {
    Role.mentat: 0,
    Role.mentor: 1,
    Role.admin: 2,
    Role.member: 3,
  };

  static Role? getHighestPriorityRole(List<Role?> roles) {
    if (roles.isEmpty) return null;
    roles.sort((a, b) => _priorityMap[a]!.compareTo(_priorityMap[b]!));
    return roles.first;
  }
}
