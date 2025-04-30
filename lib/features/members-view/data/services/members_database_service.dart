import 'package:core/core.dart';

/// [MembersDatabaseService] is a class that is responsible for communicating
/// with the database to fetch users.
///
/// This class is used by [MembersRepositoryImpl] to fetch users from the database.
///
/// This class uses [FirebaseUtils] and [FirestoreUtils] to communicate with the database.
///
///
class MembersDatabaseService extends FirebaseUtils
    with FirestoreUtils, FirebaseCloudFunctionsUtils {
  /// Get the total number of users in the database.
  /// This function returns the total number of users in the database.
  ///
  /// ? **The reason I use this function instead of**
  /// ```dart
  /// await getCollectionRef(CollectionEnum.users).get().then((value) => value.docs.length)
  /// ```
  /// is that the above code will fetch all the documents in the collection and then count them.
  /// and that means huge data transfer and processing.
  ///
  ///
  /// This way we only fetch the count of the documents in the collection without
  /// downloading the documents themselves.
  Future<int> fetchTotalUsersCount() async {
    final querySnapshot =
        await getCollectionRef(CollectionEnum.users).count().get();
    return querySnapshot.count ?? 0;
  }

  /// Fetch the first 20 users from the database.
  ///
  /// I fetch the first 20 users initially because I don't want to fetch all the users at once.
  /// This way I can reduce the data transfer and processing time.
  Future<List<Map<String, dynamic>>> fetchFirst20Users() async {
    final querySnapshots = await getCollectionRef(CollectionEnum.users)
        .orderBy(UserDocEnum.memberNumber.name)
        .limit(20) // limit the number of docs to 20
        .get();

    return querySnapshots.docs.map((e) => e.data()).toList();
  }

  /// Fetch the next 20 users from the database.
  ///
  /// This function fetches the next 20 users from the database when its needed.
  ///
  Future<List<Map<String, dynamic>>> fetchNext20Users(String lastDocId) async {
    final querySnapshots = await getCollectionRef(CollectionEnum.users)
        .orderBy(UserDocEnum.memberNumber.name)
        .startAfterDocument(
          await getDocumentRef(
            collection: CollectionEnum.users,
            docId: lastDocId,
          ).snapshots().first,
        )
        .limit(20)
        .get();
    return querySnapshots.docs.map((e) => e.data()).toList();
  }
}
