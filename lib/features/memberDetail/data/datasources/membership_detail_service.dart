import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/user_doc_enum.dart';

///
class MembershipDetailService extends FirebaseUtils with FirestoreUtils {
  /// This method updates the membership details of a user in the Firestore database.
  Future<void> editMembershipDetails(
    Map<String, dynamic> updatedMembershipDetails,
  ) async {
    await updateDocument(
      collection: CollectionEnum.users,
      docId: updatedMembershipDetails[UserDocEnum.uid.name].toString(),
      data: updatedMembershipDetails,
    );
  }
}
