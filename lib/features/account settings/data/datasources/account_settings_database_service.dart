import 'package:core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:core/utils/constants/firebase/collection_enums.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roof_admin_panel/config/route%20config/routes/email_update_verification_redirection_route.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/database%20keys/manager_doc_keys.dart';

class AccountSettingsDatabaseService extends FirebaseUtils with FirestoreUtils {
  Future<void> changePassword(String newPassword) async {
    await currentUser?.updatePassword(newPassword);
  }

  Future<void> updateEmail(String email) async {
    await currentUser?.verifyBeforeUpdateEmail(
      email,
      ActionCodeSettings(
        url:
            "http://localhost:52247/#${EmailUpdateVerificationRedirectionRoute().path.replaceFirst("/:uid", "").replaceFirst("/:email", "")}/$email/$uid",
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

  Future<void> updateEmailOnFireStoreAfterVerification(
      String uid, String email) async {
    await updateDocument(
      collection: CollectionEnum.managers,
      docId: uid,
      data: {ManagerDocKeys.email.name: email},
    );
  }
}
