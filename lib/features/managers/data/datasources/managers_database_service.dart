import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/logger/logger.dart';
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

    return _updateManagerDataWithManagerRole(managers.docs);
  }

  Future<List<Map<String, dynamic>>> _updateManagerDataWithManagerRole(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
  ) async {
    final updatedManagersList = <Map<String, dynamic>>[];
    for (final manager in docs) {
      final role = await _getManagerRole(
        manager.data()[ManagerDocKeys.role.name]
            as DocumentReference<Map<String, dynamic>>,
      );
      final data = manager.data();
      data[ManagerDocKeys.role.name] = role;
      updatedManagersList.add(data);
    }
    return updatedManagersList;
  }

  Future<Map<String, dynamic>> _getManagerRole(
      DocumentReference<Map<String, dynamic>> doc) async {
    final data = await doc.get();
    return data.data() ?? {};
  }

  Future<void> updateManager(Map<String, dynamic> updatedManager) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: updatedManager[ManagerDocKeys.uid.name].toString(),
      data: updatedManager,
    );
  }
}
