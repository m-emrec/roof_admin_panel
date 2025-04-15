import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';

/// A service class for managing mentorship-related data in Firestore.
/// It provides methods to retrieve mentor and member information based on their IDs.
class MentorshipWidgetService extends FirebaseUtils with FirestoreUtils {
  /// Fetches the mentor of the member using the provided mentor ID.
  /// Returns a [Map] containing the mentor's data if found, otherwise returns null.
  /// If the [mentorId] is empty, it returns null.
  Future<Map<String, dynamic>?> fetchMentorForMember(String mentorId) async =>
      _fetchForId(mentorId);

  /// Fetches the mentat for the mentor using the provided mentat ID.
  /// Returns a [Map] containing the mentat's data if found, otherwise returns null.
  Future<Map<String, dynamic>?> fetchMentatForMentor(
    String mentatId,
  ) async =>
      _fetchForId(mentatId);

  /// Retrieves a list of members for a given list of member IDs.
  /// Returns a [List] of [Map]s containing the members' data if found, otherwise returns null.
  Future<List<Map<String, dynamic>>?> fetchMembersForMentor(
    List<String> memberIds,
  ) async =>
      _fetchForListOfIds(memberIds);

  /// Retrieves a list of mentors for a given list of mentor IDs.
  /// Returns a [List] of [Map]s containing the mentors' data if found, otherwise returns null.
  Future<List<Map<String, dynamic>>?> fetchMentorsForMentat(
    List<String> mentorIds,
  ) async =>
      _fetchForListOfIds(mentorIds);

  Future<List<Map<String, dynamic>>?> _fetchForListOfIds(
    List<String> ids,
  ) async {
    if (ids.isEmpty) {
      return null;
    }

    return getCollectionRef(CollectionEnum.users)
        .where(UserDocEnum.uid.name, whereIn: ids)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.map((e) => e.data()).toList();
      } else {
        return [];
      }
    });
  }

  Future<Map<String, dynamic>?> _fetchForId(String id) async {
    if (id.isEmpty) {
      return null;
    }
    return getDocumentRef(collection: CollectionEnum.users, docId: id)
        .get()
        .then((value) {
      if (value.exists) {
        return value.data();
      } else {
        return null;
      }
    });
  }
}
