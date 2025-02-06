import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';

class SideBarDatabaseService extends FirebaseUtils with FirestoreUtils {
  Future<Map<String, dynamic>?> getUser() async {
    return getUserDocRef().then(
      (docRef) => docRef.get().then(
            (doc) => doc.data(),
          ),
    );
  }
}
