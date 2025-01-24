import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/auth/domain/entities/auth_entity.dart';
import 'package:roof_admin_panel/features/auth/domain/repositories/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase
    extends UseCase<DataState<void>, AuthEntity> {
  final AuthRepository repository;

  SignInWithEmailAndPasswordUseCase(this.repository);

  @override
  Future<DataState<void>> call(AuthEntity params) {
    return repository.signInWithEmailAndPassword(params);
  }
}
