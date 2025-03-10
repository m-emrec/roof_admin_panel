import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/database%20keys/manager_doc_keys.dart';

///
class ManagersDatabaseService extends FirebaseUtils with FirestoreUtils {
  ///
  ///
  Future<void> addManager(Map<String, dynamic> managerToBeAdded) async {
    /// TODO: FirebaseCloudFunctions'ı product'a taşı
    await FirebaseFunctions.instanceFor(region: 'europe-west1')
        .httpsCallable("createNewManager")
        .call<void>(
          managerToBeAdded,
        );
  }

  ///
  Future<void> deleteManager(String id) async {
    await FirebaseFunctions.instanceFor(region: 'europe-west1')
        .httpsCallable("deleteManager")
        .call<void>(
      {"uid": id},
    );
  }

  ///
  Future<List<Map<String, dynamic>>> getManagers() async {
    final managers = await getCollectionRef(CollectionEnum.managers).get();

    return _updateManagerDataWithManagerRole(managers.docs);
  }

  ///? Since the [ManagerRoleModel] is stored as a [DocumentReference]
  ///? in the Firestore, we need to get the role data using the reference.
  Future<List<Map<String, dynamic>>> _updateManagerDataWithManagerRole(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
  ) async {
    final updatedManagersList = <Map<String, dynamic>>[];
    for (final doc in docs) {
      final managerData = doc.data();
      final role = await _getManagerRoleData(
        managerData[ManagerDocKeys.role.name]
            as DocumentReference<Map<String, dynamic>>,
      );
      managerData[ManagerDocKeys.role.name] = role;
      updatedManagersList.add(managerData);
    }
    return updatedManagersList;
  }

  Future<Map<String, dynamic>> _getManagerRoleData(
    DocumentReference<Map<String, dynamic>> doc,
  ) async {
    final data = await doc.get();
    return data.data() ?? {};
  }

  ///
  Future<void> updateManager(Map<String, dynamic> updatedManager) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: updatedManager[ManagerDocKeys.uid.name].toString(),
      data: updatedManager,
    );
  }
}
