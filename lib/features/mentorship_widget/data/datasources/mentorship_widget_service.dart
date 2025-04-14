import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';

/// A service class for managing mentorship-related data in Firestore.
/// It provides methods to retrieve mentor and member information based on their IDs.
class MentorshipWidgetService extends FirebaseUtils with FirestoreUtils {
  Future<Map<String, dynamic>?> fetchMentorForMember(String mentorId) async {
    if (mentorId.isEmpty) {
      return null;
    }
    return getDocumentRef(collection: CollectionEnum.users, docId: mentorId)
        .get()
        .then((value) {
      if (value.exists) {
        return value.data();
      } else {
        return null;
      }
    });
  }

  Future<Map<String, dynamic>?> fetchMentatForMentor(
    String mentatId,
  ) async {
    if (mentatId.isEmpty) {
      return null;
    }
    return getDocumentRef(collection: CollectionEnum.users, docId: mentatId)
        .get()
        .then((value) {
      if (value.exists) {
        return value.data();
      } else {
        return null;
      }
    });
  }

  Future<List<Map<String, dynamic>>?> fetchMembersForMentor(
    List<String> memberIds,
  ) async {
    if (memberIds.isEmpty) {
      return null;
    }
    return getCollectionRef(CollectionEnum.users)
        .where(UserDocEnum.uid.name, whereIn: memberIds)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.map((e) => e.data()).toList();
      } else {
        return null;
      }
    });
  }

  /// Retrieves the mentor information for a given member ID.
  /// Returns a [Map] containing the mentor's data if found, otherwise returns null.
  Future<Map<String, dynamic>?> getMentorForMember(String mentorId) async {
    if (mentorId.isEmpty) {
      return null;
    }
    return getDocumentRef(collection: CollectionEnum.users, docId: mentorId)
        .get()
        .then((value) {
      if (value.exists) {
        return value.data();
      } else {
        return null;
      }
    });
  }

  /// Retrieves the mentat information for a given mentor ID.
  /// Returns a [Map] containing the mentat's data if found, otherwise returns null.
  Future<Map<String, dynamic>?> getMentatForMentor(String mentatId) async {
    if (mentatId.isEmpty) {
      return null;
    }
    return getDocumentRef(collection: CollectionEnum.users, docId: mentatId)
        .get()
        .then((value) {
      if (value.exists) {
        return value.data();
      } else {
        return null;
      }
    });
  }

  /// Retrieves a list of mentors for a given list of mentor IDs.
  /// Returns a [List] of [Map]s containing the mentors' data if found, otherwise returns null.
  Future<List<Map<String, dynamic>>?> getMentorsForMentat(
    List<String> mentorIds,
  ) async {
    if (mentorIds.isEmpty) {
      return null;
    }
    return getCollectionRef(CollectionEnum.users)
        .where(UserDocEnum.uid.name, whereIn: mentorIds)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.map((e) => e.data()).toList();
      } else {
        return [];
      }
    });
  }

  /// Retrieves a list of members for a given list of member IDs.
  /// Returns a [List] of [Map]s containing the members' data if found, otherwise returns null.
  Future<List<Map<String, dynamic>>?> getMembersForMentor(
    List<String> memberIds,
  ) async {
    if (memberIds.isEmpty) {
      return null;
    }
    return getCollectionRef(CollectionEnum.users)
        .where(UserDocEnum.uid.name, whereIn: memberIds)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.map((e) => e.data()).toList();
      } else {
        return [];
      }
    });
  }
}
