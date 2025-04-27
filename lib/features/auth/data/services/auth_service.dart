import 'dart:async';

import 'package:core/core.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';

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
    if (!isEmailVerified) {
      await signOut();
      throw Exception(Errors.email_not_verified.name);
    }
  }

  ///
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(
      email: email,
    );
  }

  ///
  bool get isEmailVerified => auth.currentUser?.emailVerified ?? false;

  @override
  Future<void> signOut() async {
    await auth.signOut();
    CurrentUser.clear();
  }
}
