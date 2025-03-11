import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/auth/domain/repositories/auth_repository.dart';

///
class ForgotPasswordUseCase extends UseCase<DataState<void>, String> {
  ///
  ForgotPasswordUseCase(this._repository);
  final AuthRepository _repository;
  @override
  Future<DataState<void>> call(String params) {
    return _repository.forgotPassword(params);
  }
}
