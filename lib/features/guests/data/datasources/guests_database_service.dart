import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/guest_doc_enum.dart';

/// GuestsDatabaseService
///
class GuestsDatabaseService extends FirebaseUtils with FirestoreUtils {
  /// Get all guests from the database
  Future<List<Map<String, dynamic>>> getGuests() async {
    final guests = getCollectionRef(CollectionEnum.guests);
    final guestsData = await guests.get();

    return guestsData.docs
        .map((doc) => doc.data())
        .toList()
        .cast<Map<String, dynamic>>();
  }

  /// Add a guest to the database
  Future<void> addGuest(Map<String, dynamic> guest) async {
    await addDocumentToCollectionWithCustomId(
      collection: CollectionEnum.guests,
      docId: guest[GuestDocEnum.id.name].toString(),
      data: guest,
    );
  }

  /// Update a guest in the database
  ///
  Future<void> updateGuest(List<Map<String, dynamic>> guests) async {
    for (final guest in guests) {
      await updateDocument(
        collection: CollectionEnum.guests,
        docId: guest[GuestDocEnum.id.name].toString(),
        data: guest,
      );
    }
  }

  /// Delete a guest from the database
  /// The [guest] parameter must not be null.
  ///
  ///
  Future<void> deleteGuest(List<Map<String, dynamic>> guests) async {
    for (final guest in guests) {
      await deleteDocument(
        collection: CollectionEnum.guests,
        docId: guest[GuestDocEnum.id.name].toString(),
      );
    }
  }
}
