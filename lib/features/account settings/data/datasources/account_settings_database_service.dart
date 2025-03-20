// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:core/resources/firebase%20utilities/firebase_storage_utils.dart';
import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:roof_admin_panel/config/route%20config/routes/email_update_verification_redirection_route.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/database%20keys/manager_doc_keys.dart';

/// This class is responsible for handling all the database operations
/// related to the account settings feature.
class AccountSettingsDatabaseService extends FirebaseUtils
    with FirestoreUtils, FirebaseStorageUtils {
  Future<void> changePassword(String newPassword) async {
    await currentUser?.updatePassword(newPassword);
  }

  Future<void> updateEmail(String email) async {
    /// TODO: Change this after flavors are implemented
    final redirectionUrl =
        "http://localhost:52247/#${EmailUpdateVerificationRedirectionRoute().path.replaceFirst("/:uid", "").replaceFirst("/:email", "")}/$email/$uid";
    await currentUser?.verifyBeforeUpdateEmail(
      email,
      ActionCodeSettings(
        url: redirectionUrl,
      ),
    );
  }

  Future<void> updateName(String name) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: uid ?? "",
      data: {ManagerDocKeys.name.name: name},
    );
  }

  Future<String> updateProfilePicture(Uint8List profilePicture) async {
    final url = await _uploadImageToFirebaseStorage(profilePicture);
    if (url == null) {
      throw Exception("Image upload failed");
    }
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: uid ?? "",
      data: {ManagerDocKeys.imageUrl.name: url},
    );
    return url;
  }

  Future<String?> _uploadImageToFirebaseStorage(
    Uint8List file,
  ) async {
    final ref = storage.ref(StoragePaths.profileImage.path(uid));
    final task = await ref.putData(
      file,
      SettableMetadata(contentType: "image/jpeg"),
    );
    return task.ref.getDownloadURL();
  }

  Future<void> updateEmailOnFireStoreAfterVerification(
    String uid,
    String email,
  ) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: uid,
      data: {ManagerDocKeys.email.name: email},
    );
  }
}
