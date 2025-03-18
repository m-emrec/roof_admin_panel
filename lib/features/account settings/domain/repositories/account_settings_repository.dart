import 'package:core/resources/data_state.dart';

abstract class AccountSettingsRepository {
  Future<DataState<void>> changePassword(
    String newpassword,
  );

  Future<DataState<void>> updateEmail(String email);

  Future<DataState<void>> updateName(String name);

  Future<DataState<void>> updateProfilePicture(String profilePicture);

  Future<DataState<void>> updateEmailOnFireStoreAfterVerification(
      String uid, String email);
}
