import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';

class MentorshipWidgetService extends FirebaseUtils with FirestoreUtils {
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
