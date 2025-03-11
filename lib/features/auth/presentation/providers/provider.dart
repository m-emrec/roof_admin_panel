import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';
import 'package:roof_admin_panel/features/auth/domain/repositories/auth_repository.dart';
import 'package:roof_admin_panel/features/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:roof_admin_panel/features/auth/domain/usecases/sign_in_with_email_and_password_use_case.dart';

import 'auth_view_model.dart';

/// Dependency Injection
final _authServiceProvider = Provider.autoDispose<AuthService>((ref) {
  return AuthService();
});

final _authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(_authServiceProvider));
});

final _signInWithEmailAndPasswordUseCaseProvider =
    Provider<SignInWithEmailAndPasswordUseCase>((ref) {
  return SignInWithEmailAndPasswordUseCase(
    ref.read(_authRepositoryProvider),
  );
});

final _forgotPasswordUseCaseProvider = Provider<ForgotPasswordUseCase>((ref) {
  return ForgotPasswordUseCase(
    ref.read(_authRepositoryProvider),
  );
});

/// ViewModel
final authViewModelProvider =
    ChangeNotifierProvider.autoDispose<AuthViewModel>((ref) {
  return AuthViewModel(
    forgotPasswordUseCase: ref.read(_forgotPasswordUseCaseProvider),
    signInWithEmailAndPasswordUseCase:
        ref.read(_signInWithEmailAndPasswordUseCaseProvider),
  );
});
