import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';

///
class MembershipFeesService extends FirebaseUtils with FirestoreUtils {
  ///
  Future<Map<String, dynamic>?> getMembershipFees() async {
    final docRef = getDocumentRef(
        collection: CollectionEnum.membershipFees, docId: "fees");
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      return snapshot.data();
    } else {
      return null;
    }
  }

  Future<void> updateMembershipFee(Map<String, dynamic> data) async {
    final docRef = getDocumentRef(
      collection: CollectionEnum.membershipFees,
      docId: "fees",
    );
    await docRef.update(data);
  }
}
