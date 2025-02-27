import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/constants/firebase/guest_doc_enum.dart';

/// GuestsDatabaseService
///
class GuestsDatabaseService extends FirebaseUtils with FirestoreUtils {
  /// Get the count of guests from the database
  ///
  /// Returns the count of guests as an integer
  ///
  /// if the count is null, return 0
  ///
  Future<int> getGuestsCount() async {
    final query = getCollectionRef(CollectionEnum.guests).count();

    final count = await query.get().then((value) => value.count);

    return count ?? 0;
  }

  /// Get all guests from the database
  ///
  /// Return the list of guests as a list of maps
  ///
  Future<List<Map<String, dynamic>>> getGuests() async {
    final guests = getCollectionRef(CollectionEnum.guests);
    final guestsData = await guests.get();

    return guestsData.docs
        .map((doc) => doc.data())
        .toList()
        .cast<Map<String, dynamic>>();
  }

  /// Adds a new guest to the database with the [guest] parameter
  ///
  ///
  Future<void> addGuest(Map<String, dynamic> guest) async {
    await addDocumentToCollectionWithCustomId(
      collection: CollectionEnum.guests,
      docId: guest[GuestDocEnum.id.name].toString(),
      data: guest,
    );
  }

  /// Update the given guests in the database
  ///
  Future<void> updateGuests(List<Map<String, dynamic>> guests) async {
    for (final guest in guests) {
      await updateDocument(
        collection: CollectionEnum.guests,
        docId: guest[GuestDocEnum.id.name].toString(),
        data: guest,
      );
    }
  }

  /// Delete the given guests from the database
  ///
  Future<void> deleteGuests(List<Map<String, dynamic>> guests) async {
    for (final guest in guests) {
      await deleteDocument(
        collection: CollectionEnum.guests,
        docId: guest[GuestDocEnum.id.name].toString(),
      );
    }
  }
}
