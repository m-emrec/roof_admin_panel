import 'package:core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';

/// Service class to communicate with the Database.
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
      throw getErrorCode(response);
    }
  }

  /// Fetch all the mentors from the database.
  Future<List<Map<String, dynamic>>> fetchMentors() async {
    final snapshot = await getCollectionRef(CollectionEnum.users)
        // Fetch the mentors
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentor.name,
        )
        .get();

    final mentors = snapshot.docs.map((e) => e.data()).toList();
    return mentors;
  }

  /// Fetch all the mentats from the database.
  Future<List<Map<String, dynamic>>> fetchMentats() async {
    final snapshot = await getCollectionRef(CollectionEnum.users)
        // Fetch the mentats
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentat.name,
        )
        .get();

    final mentats = snapshot.docs.map((e) => e.data()).toList();
    return mentats;
  }

  /// Fetch the mentors who doesn't have a mentat.
  Future<List<Map<String, dynamic>>> fetchMentorsWithOutMentat() async {
    return getCollectionRef(CollectionEnum.users)
        // Fetch the mentors
        .where(
          UserDocEnum.role.name,
          arrayContains: Role.mentor.name,
        )
        // Fetch the mentors who doesn't have a mentat
        .where(
          UserDocEnum.mentatId.name,
          isEqualTo: null,
          isNull: true,
        )
        .get()
        .then((snapshot) => snapshot.docs.map((e) => e.data()).toList());
  }

  /// Fetch the members who doesn't have a mentor.
  Future<List<Map<String, dynamic>>> fetchMembersWithoutMentor() async {
    final membersAndAdmins = getCollectionRef(CollectionEnum.users).where(
      UserDocEnum.role.name,
      arrayContainsAny: [Role.member.name, Role.admin.name],
    );

    final membersAndAdminsWithoutMentor = await membersAndAdmins
        .where(
          UserDocEnum.mentorId.name,
          isEqualTo: null,
          isNull: true,
        )
        .get();

    final membersAndAdminsWithoutMentorList =
        membersAndAdminsWithoutMentor.docs.map((e) => e.data()).toList();
    return membersAndAdminsWithoutMentorList;
  }
}
