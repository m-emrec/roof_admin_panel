import '../../product/utility/logger/logger.dart';
import '../resources/firebase%20utilities/firebase_utils.dart';
import '../resources/firebase%20utilities/firestore_utils.dart';
import '../resources/id_generator.dart';
import '../utils/constants/firebase/collection_enums.dart';
import '../utils/constants/firebase/user_doc_enum.dart';

/// A service class that provides methods for interacting with user data.
class UserService extends FirebaseUtils with FirestoreUtils {
  /// A private constructor to prevent instantiation.
  factory UserService() => _instance;
  UserService._internal();

  static final UserService _instance = UserService._internal();

  List<String>? _userRole;

  /// Returns the role of the user with the specified UID.
  Future<List<String>?>? getCurrentUserRole() async {
    if (_userRole != null) {
      return _userRole!;
    } else {
      try {
        // ignore: join_return_with_assignment
        _userRole = await _checkRole(uid ?? "");
        return _userRole;
      } catch (e) {
        Log.error('Error getting user role: $e');
        return null;
      }
    }
  }

  /// Returns the role of the user with the given phone number.
  Future<List<String>?>? getUserRole(String id) async {
    try {
      // ignore: join_return_with_assignment
      final role = await _checkRole(id);
      return role;
    } catch (e) {
      Log.error('Error getting user role: $e');
      return null;
    }
  }

  /// Checks the role of the user with the specified UID.
  Future<List<String>> _checkRole(String id) async {
    final user = await getDocumentRef(
      collection: CollectionEnum.users,
      docId: id,
    ).get();

    final role = await user.get(UserDocEnum.role.name);
    if (role.runtimeType == List) {
      role as List;
      final roleList = role.map((e) => e.toString()).toList();

      return roleList;
    }

    return [role.toString()];
  }

  /// Checks if the user has a profile.
  Future<bool> hasProfile() async {
    try {
      final user = await getDocumentRef(
        collection: CollectionEnum.users,
        docId: uid ?? '',
      ).get();

      final hasProfile = await user.get(UserDocEnum.birthDate.name) != null;
      return hasProfile;
    } catch (e) {
      return false;
    }
  }

  /// Clears the user role from memory.
  void clear() {
    _userRole = null;
  }
}
