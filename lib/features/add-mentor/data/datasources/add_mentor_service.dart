import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';

class AddMentorService extends FirebaseUtils with FirestoreUtils {
  Future<List<Map<String, dynamic>>> fetchMentors() async {
    final query = _roleQuery(Role.mentor);
    final snapshot = await query.get();
    final data = snapshot.docs.map((e) => e.data()).toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchMentats() async {
    final query = _roleQuery(Role.mentat);
    final snapshot = await query.get();
    final data = snapshot.docs.map((e) => e.data()).toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchMembersWithoutMentors() async {
    final nullQuery = _roleQuery(Role.member).where(
      UserDocEnum.mentorId.name,
      // whereIn: [null],
      isEqualTo: null,
    );
    final snapshot = await nullQuery.get();
    snapshot.docs.addAll(
      await _roleQuery(Role.member)
          .where(
            UserDocEnum.mentorId.name,
            isEqualTo: "",
          )
          .get()
          .then((value) => value.docs),
    );
    final data = snapshot.docs.map((e) => e.data()).toList();
    return data;
  }

  Future<List<Map<String, dynamic>>> fetchMentorsWithoutMentat() async {
    final nullQuery = _roleQuery(Role.mentor).where(
      UserDocEnum.mentatId.name,
      isEqualTo: null,
    );
    final snapshot = await nullQuery.get();
    snapshot.docs.addAll(
      await _roleQuery(Role.mentor)
          .where(
            UserDocEnum.mentatId.name,
            isEqualTo: "",
          )
          .get()
          .then((value) => value.docs),
    );
    final data = snapshot.docs.map((e) => e.data()).toList();
    return data;
  }

  Query<Map<String, dynamic>> _roleQuery(
    Role role,
  ) {
    return getCollectionRef(CollectionEnum.users).where(
      UserDocEnum.role.name,
      arrayContains: role.name,
    );
  }
}
