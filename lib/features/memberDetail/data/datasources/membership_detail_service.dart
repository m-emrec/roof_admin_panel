import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/resources/firebase%20utilities/firebase_cloud_functions_utils.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/cloud_function_names.dart';

///
class MembershipDetailService extends FirebaseUtils
    with FirestoreUtils, FirebaseCloudFunctionsUtils {
  /// This method updates the membership details of a user in the Firestore database.
  Future<void> editMembershipDetails(
    Map<String, dynamic> updatedMembershipDetails,
  ) async {
    Log.info(updatedMembershipDetails);
    await updateDocument(
      collection: CollectionEnum.users,
      docId: updatedMembershipDetails[UserDocEnum.uid.name].toString(),
      data: updatedMembershipDetails,
    );
  }

  Future<void> banMember({
    required Map<String, dynamic> memberData,
  }) async {
    Log.info('Banning member with data: $memberData');
    final Map<String, dynamic> modifiedUserMap = memberData.map((key, val) {
      if (key == UserDocEnum.membershipEndDate.name ||
          key == UserDocEnum.membershipStartDate.name ||
          key == UserDocEnum.birthDate.name) {
        val as Timestamp;
        return MapEntry(key, val.millisecondsSinceEpoch);
      }
      return MapEntry(key, val);
    });
    final response = await functions
        .httpsCallable(CloudFunctionNames.banMember.name)
        .call<Map<String, dynamic>>(
          modifiedUserMap,
        );
    if (getResponseSuccess(response)) {
      Log.info('Member banned successfully');
    } else {
      Log.error('Error banning member: ${getErrorCode(response)}');
      throw Exception(
        getErrorCode(response),
      );
    }
  }
}
