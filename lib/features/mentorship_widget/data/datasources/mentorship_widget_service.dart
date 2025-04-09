import 'package:core/core.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';

class MentorshipWidgetService extends FirebaseUtils with FirestoreUtils {
  Future<Map<String, dynamic>?> getMentor(String mentorId) async {
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

  Future<Map<String, dynamic>?> getMentat(String mentatId) async {
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

  Future<List<Map<String, dynamic>>> getMentors(List<String> mentorIds) async {
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

  Future<List<Map<String, dynamic>>> getMembers(List<String> memberIds) async {
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
