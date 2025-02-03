import 'dart:async';

import 'package:core/core.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';

/// A service class that handles authentication operations using Firebase.
class AuthService extends FirebaseUtils with FirebaseAuthUtils, FirestoreUtils {
  /// Singleton instance of [AuthService].
  factory AuthService() => _instance;

  AuthService._internal();
  static final AuthService _instance = AuthService._internal();

  /// Signs in a user with email and password.
  Future<void> signWithEmailAndPassword(
    AuthModel credentials,
  ) async {
    await auth.signInWithEmailAndPassword(
      email: credentials.email,
      password: credentials.password,
    );
  }
}
