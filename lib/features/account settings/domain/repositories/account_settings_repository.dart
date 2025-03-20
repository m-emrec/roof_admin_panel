import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/entities/update_email_entity.dart';

abstract class AccountSettingsRepository {
  Future<DataState<void>> changePassword(
    String newpassword,
  );

  Future<DataState<void>> updateEmail(String email);

  Future<DataState<void>> updateName(String name);

  Future<DataState<String>> updateProfilePicture(String profilePicturePath);

  Future<DataState<void>> updateEmailOnFireStoreAfterVerification(
    UpdateEmailEntity updateEmailEntity,
  );
}
