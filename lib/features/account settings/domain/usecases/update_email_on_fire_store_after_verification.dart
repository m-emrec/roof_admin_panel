import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/entities/update_email_entity.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';

///
class UpdateEmailOnFireStoreAfterVerificationUseCase
    extends UseCase<DataState<void>, UpdateEmailEntity> {
  ///
  UpdateEmailOnFireStoreAfterVerificationUseCase(this._repository);
  final AccountSettingsRepository _repository;
  @override
  Future<DataState<void>> call(UpdateEmailEntity params) {
    return _repository.updateEmailOnFireStoreAfterVerification(params);
  }
}
