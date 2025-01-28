import 'package:roof_admin_panel/core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/user_doc_enum.dart';

class MembersDatabaseService extends FirebaseUtils with FirestoreUtils {
  Future<int> fetchTotalUsersCount() async {
    final querySnapshot =
        await getCollectionRef(CollectionEnum.users).count().get();
    return querySnapshot.count ?? 0;
  }

  Future<List<Map<String, dynamic>>> fetchFirst20Users() async {
    final querySnapshots = await getCollectionRef(CollectionEnum.users)
        .orderBy(UserDocEnum.memberNumber.name)
        .limit(20)
        .get();

    return querySnapshots.docs.map((e) => e.data()).toList();
  }

  Future<List<Map<String, dynamic>>> fetchNext20Users(String lastDocId) async {
    final a = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.uid.name,
          isEqualTo: lastDocId,
        )
        .get();
    final querySnapshots = await getCollectionRef(CollectionEnum.users)
        .orderBy(UserDocEnum.memberNumber.name)
        .startAfterDocument(
          await getDocumentRef(
            collection: CollectionEnum.users,
            docId: a.docs.first.id, //lastDocId,
          ).snapshots().first,
        )
        .limit(20)
        .get();
    return querySnapshots.docs.map((e) => e.data()).toList();
  }
}
