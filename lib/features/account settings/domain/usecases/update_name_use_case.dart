import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';

///
class UpdateNameUseCase extends UseCase<DataState<void>, String> {
  ///
  UpdateNameUseCase(this._repository);
  final AccountSettingsRepository _repository;
  @override
  Future<DataState<void>> call(String params) {
    return _repository.updateName(params);
  }
}
