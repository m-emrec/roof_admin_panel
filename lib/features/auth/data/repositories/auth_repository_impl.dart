import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';
import 'package:roof_admin_panel/features/auth/domain/entities/auth_entity.dart';
import 'package:roof_admin_panel/features/auth/domain/repositories/auth_repository.dart';

///
class AuthRepositoryImpl implements AuthRepository {
  ///
  AuthRepositoryImpl(this._authService);

  final AuthService _authService;
  @override
  Future<DataState<void>> signInWithEmailAndPassword(AuthEntity authEntity) {
    return DataState.handleDataState(
      () => _authService
          .signWithEmailAndPassword(AuthModel.fromEntity(authEntity)),
    );
  }

  @override
  Future<DataState<void>> forgotPassword(String email) {
    return DataState.handleDataState(() => _authService.forgotPassword(email));
  }
}
