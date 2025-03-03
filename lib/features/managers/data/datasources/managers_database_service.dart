import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/database%20keys/manager_doc_keys.dart';

class ManagersDatabaseService extends FirebaseUtils with FirestoreUtils {
  Future<void> addManager(Map<String, dynamic> managerToBeAdded) async {
    //TODO: Implement this method in the backend
  }

  Future<void> deleteManager(String id) async {
    //TODO: Implement this method in the backend
  }

  Future<List<Map<String, dynamic>>> getManagers() async {
    final managers = await getCollectionRef(CollectionEnum.managers).get();
    return managers.docs.map((e) => e.data()).toList();
  }

  Future<void> updateManager(Map<String, dynamic> updatedManager) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: updatedManager[ManagerDocKeys.uid.name].toString(),
      data: updatedManager,
    );
  }
}
