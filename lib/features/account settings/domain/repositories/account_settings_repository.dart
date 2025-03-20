import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/entities/update_email_entity.dart';

abstract class AccountSettingsRepository {
  /// Change the password of the user
  ///
  /// [newpassword] is the new password of the user
  Future<DataState<void>> changePassword(
    String newpassword,
  );

  ///
  Future<DataState<void>> updateEmail(String email);

  ///
  Future<DataState<void>> updateName(String name);

  ///
  Future<DataState<String>> updateProfilePicture(String profilePicturePath);

  ///
  /// This is used for updating user's email on firestore after the
  /// email update process is done
  ///
  ///**I use this because I wanted to update the email on Firestore too.**
  ///
  /// Unfortunately, [updateEmail] method does not enough to update the email on
  /// Firestore. It can only update it on Firebase Auth.
  ///
  ///So, I had to add one more step to update the email on Firestore.
  ///
  /// This is mainly created for to use in the [EmailUpdateRedirectionPage].
  Future<DataState<void>> updateEmailOnFireStoreAfterVerification(
    UpdateEmailEntity updateEmailEntity,
  );
}
