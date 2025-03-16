import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/entities/password_enitiy.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';

///
class ChangePasswordUseCase extends UseCase<DataState<void>, PasswordEntity> {
  ///
  ChangePasswordUseCase(this._repository);
  final AccountSettingsRepository _repository;
  @override
  Future<DataState<void>> call(PasswordEntity params) {
    return _repository.changePassword(params);
  }
}
