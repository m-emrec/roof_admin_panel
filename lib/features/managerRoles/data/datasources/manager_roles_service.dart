import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';

///
class ManagerRolesService extends FirebaseUtils with FirestoreUtils {
  /// Get manager roles from firestore
  Future<List<Map<String, dynamic>>> getManagerRoles() async {
    return getCollectionRef(CollectionEnum.managerRoles)
        .get()
        .then((query) => query.docs.map((doc) => doc.data()).toList());
  }
}
