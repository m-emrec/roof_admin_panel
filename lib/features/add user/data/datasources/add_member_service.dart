import 'package:roof_admin_panel/core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/user_doc_enum.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';

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

  Future<List<Map<String, dynamic>>> fetchMembersWithoutMentor() async {
    final membersWithoutMentor = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.mentorId.name,
          isEqualTo: null,
        )
        .get();
    Log.debug(membersWithoutMentor.docs);
    final membersWithoutMentorList =
        membersWithoutMentor.docs.map((e) => e.data()).toList();
    return membersWithoutMentorList;
  }

  // Future<List<Map<String,dynamic>>  fetchMentorsWithoutMentat() async {
  //   final response = await getMentorsWithoutMentat();
  //   Log.debug(response.data);
  //   if (getResponseSuccess(response) == false) {
  //     throw Exception(getErrorCode(response));
  //   }
  //   return response.data;
  // }
}
