import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/domain/usecases/sign_in_with_email_and_password_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

/// ViewModel for handling authentication-related operations.
///
/// This class extends [ChangeNotifier] to provide state management capabilities
class AuthViewModel extends ChangeNotifier {
  /// Creates an instance of [AuthViewModel].
  ///

  AuthViewModel({
    required SignInWithEmailAndPasswordUseCase
        signInWithEmailAndPasswordUseCase,
  })  : _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
        super();

  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;

  /// Sign in with email and password.
  Future<void> signInWithEmailAndPassword(AuthModel credentials) async {
    await DataState.handleDataStateBasedAction(
      await _signInWithEmailAndPasswordUseCase(credentials),
      onSuccess: (p0) => notifyListeners(),
      onFailure: (failed) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(failed?.errorMessage),
      ),
    );
  }
}
