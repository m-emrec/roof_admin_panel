import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/account%20settings/data/datasources/account_settings_database_service.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';

class AccountSettingsRepositoryImpl implements AccountSettingsRepository {
  AccountSettingsRepositoryImpl(this._accountSettingsDatabaseService);

  final AccountSettingsDatabaseService _accountSettingsDatabaseService;
  @override
  Future<DataState<void>> changePassword(String newPassword) {
    return DataState.handleDataState(
      () => _accountSettingsDatabaseService.changePassword(newPassword),
    );
  }

  @override
  Future<DataState<void>> updateEmail(String email) {
    return DataState.handleDataState(
      () => _accountSettingsDatabaseService.updateEmail(email),
    );
  }

  @override
  Future<DataState<void>> updateName(String name) {
    return DataState.handleDataState(
      () => _accountSettingsDatabaseService.updateName(name),
    );
  }

  @override
  Future<DataState<void>> updateProfilePicture(String profilePicture) {
    // TODO: implement updateProfilePicture
    throw UnimplementedError();
  }
}
