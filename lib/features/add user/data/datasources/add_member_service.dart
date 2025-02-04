// ignore_for_file: unnecessary_import

import 'package:core/core.dart';
import 'package:core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/logger/logger.dart';

class AddMemberService extends FirebaseUtils
    with FirestoreUtils, FirebaseCloudFunctionsUtils {
  /// Add a new member to the database.
  ///
  /// This function add a new user to [CollectionEnum.users] collection.
  Future<void> addNewMember(UserModel user) async {
    final response = await createUserWithPhoneNumber(
      user: user.toJson(),
    );
    Log.debug(response.data);
    if (getResponseSuccess(response) == false) {
      throw Exception(getErrorCode(response));
    }
  }

  Future<List<Map<String, dynamic>>> fetchMentors() async {
    final snapshot = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentor.name,
        )
        .get();

    final mentors = snapshot.docs.map((e) => e.data()).toList();
    return mentors;
  }

  Future<List<Map<String, dynamic>>> fetchMentats() async {
    final snapshot = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentat.name,
        )
        .get();

    final mentats = snapshot.docs.map((e) => e.data()).toList();
    return mentats;
  }

  Future<List<Map<String, dynamic>>> fetchMentorsWithOutMentat() async {
    return getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentor.name,
        )
        .where(
          UserDocEnum.mentatId.name,
          isEqualTo: null,
          isNull: true,
        )
        .get()
        .then((snapshot) => snapshot.docs.map((e) => e.data()).toList());
  }

  Future<List<Map<String, dynamic>>> fetchMembersWithoutMentor() async {
    final membersWithoutMentor = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.role.name,
          arrayContainsAny: [Role.member.name, Role.admin.name],
        )
        .where(
          UserDocEnum.mentorId.name,
          isEqualTo: null,
          isNull: true,
        )
        .get();
    final membersWithoutMentorList =
        membersWithoutMentor.docs.map((e) => e.data()).toList();
    Log.debug(membersWithoutMentorList);
    return membersWithoutMentorList;
  }
}
