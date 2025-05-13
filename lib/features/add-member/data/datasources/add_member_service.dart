import 'package:core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// Service class to communicate with the Database.
class AddMemberService extends FirebaseUtils
    with FirestoreUtils, FirebaseCloudFunctionsUtils {
  /// Add a new member to the database.
  ///
  /// This function add a new user to [CollectionEnum.users] collection.
  Future<void> addNewMember(MemberModel user) async {
    final response = await createUserWithPhoneNumber(
      user: user.toJson(),
    );
    Log.debug(response.data);
    if (getResponseSuccess(response) == false) {
      throw getErrorCode(response);
    }
  }
}
