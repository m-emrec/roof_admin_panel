import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';

///
class UpdateEmailOnFireStoreAfterVerificationUseCase
    extends UseCase<DataState<void>, List<String>> {
  ///
  UpdateEmailOnFireStoreAfterVerificationUseCase(this._repository);
  final AccountSettingsRepository _repository;
  @override
  Future<DataState<void>> call(List<String> params) {
    return _repository.updateEmailOnFireStoreAfterVerification(
        params[0], params[1]);
  }
}
