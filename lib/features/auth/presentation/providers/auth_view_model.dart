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
  /// The [authService] parameter is required to handle
  /// authentication operations
  /// The [signInWithPhoneNumberUsecase] parameter is required to sign in a user with phone number
  /// The [verifyCodeUsecase] parameter is required to verify the code sent to the user's phone number
  AuthViewModel({
    required SignInWithEmailAndPasswordUseCase
        signInWithEmailAndPasswordUseCase,
  })  : _signInWithEmailAndPasswordUseCase = signInWithEmailAndPasswordUseCase,
        super();

  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;

  Future<void> signInWithEmailAndPassword(AuthModel credentials) async {
    await Toast.toastDataStateMessageWrapper(
      dataState: await _signInWithEmailAndPasswordUseCase(credentials),
    );
    notifyListeners();
  }
}
