import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/cloud_function_names.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/database%20keys/manager_doc_keys.dart';

///
class ManagersDatabaseService extends FirebaseUtils with FirestoreUtils {
  ///
  ///
  Future<void> addManager(Map<String, dynamic> managerToBeAdded) async {
    await functions
        .httpsCallable(CloudFunctionNames.createNewManager.name)
        .call<void>(
          managerToBeAdded,
        );
  }

  ///
  Future<void> deleteManager(String id) async {
    await functions
        .httpsCallable(CloudFunctionNames.deleteManager.name)
        .call<void>(
      {ManagerDocKeys.uid.name: id},
    );
  }

  ///
  Future<List<Map<String, dynamic>>> getManagers() async {
    final managers = await getCollectionRef(CollectionEnum.managers).get();

    return _updateManagerDataWithManagerRole(managers.docs);
  }

  ///? Since the [ManagerRoleModel] is stored as a [DocumentPath]
  ///? in the Firestore, we need to get the role data using the path.
  Future<List<Map<String, dynamic>>> _updateManagerDataWithManagerRole(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
  ) async {
    final updatedManagersList = <Map<String, dynamic>>[];
    for (final doc in docs) {
      final managerData = doc.data();
      await _getManagerRoleData(
        managerData[ManagerDocKeys.role.name].toString(),
      ).then((value) => managerData[ManagerDocKeys.role.name] = value);
      // managerData[ManagerDocKeys.role.name] = role;
      updatedManagersList.add(managerData);
    }

    return updatedManagersList;
  }

  Future<Map<String, dynamic>> _getManagerRoleData(
    String docPath,
  ) async {
    final data = await firestore.doc(docPath).get();
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
