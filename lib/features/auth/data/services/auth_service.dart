import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roof_admin_panel/core/resources/error_manager.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firebase_auth_utils.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firestore_utils.dart';
import 'package:roof_admin_panel/core/resources/id_generator.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/collection_enums.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/firebase utilities/firebase_utils.dart';

/// A service class that handles authentication operations using Firebase.
class AuthService extends FirebaseUtils with FirebaseAuthUtils, FirestoreUtils {
  factory AuthService() => _instance;
  // ignore: public_member_api_docs

  AuthService._internal();

  static final AuthService _instance = AuthService._internal();

  /// Signs in a user with phone number.
  Future<DataState<void>> signInWithPhoneNumber({
    required AuthModel credentials,
  }) async {
    // Create a completer to handle the async operation
    final completer = Completer<DataState<dynamic>>();

    try {
      if (await checkUserExists(credentials)) {
        await auth.verifyPhoneNumber(
          // ignore: avoid_redundant_argument_values
          timeout: ConstantValues.FIREBASE_PHONE_AUTH_TIMEOUT,
          phoneNumber: credentials.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // If automatic verification happens (optional behavior)
            await auth.signInWithCredential(credential);
            if (!completer.isCompleted) {
              completer.complete(
                DataSuccess(),
              ); // Emit DataSuccess for auto-verification
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            Log.error('Verification failed: ${e.message}');
            if (!completer.isCompleted) {
              completer.complete(
                DataFailed(e.code),
              ); // Emit DataFailed for verification failure
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            // ref?.invalidate(isTimeOutProvider);
            // ref?.read(isTimeOutProvider);
            if (!completer.isCompleted) {
              completer.complete(
                DataSuccess(verificationId),
              ); // Emit DataSuccess for code sent
            }
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // ref?.invalidate(isTimeOutProvider);
          },
        );
        return completer.future;
      } else {
        return DataFailed(
          Errors.user_is_not_exist.name,
        );
      }
    } on FirebaseAuthException catch (e) {
      Log.error('FirebaseAuthException: ${e.message}');
      return DataFailed(e.code); // Emit a failed state if exception occurs
    } catch (e) {
      Log.error('Unexpected error: $e');
      return DataFailed(
        e.toString(),
      ); // Emit a failed state for any other error
    }
  }

  Future<bool> checkUserExists(
    AuthModel credentials,
  ) async {
    // user is exists
    try {
      final userDoc = await getDocumentRef(
        collection: CollectionEnum.users,
        docId: IDGenerator.generateId(credentials.phoneNumber),
      ).get();
      return userDoc.exists;
    } catch (e) {
      return false;
    }
  }

  /// Verifies the code sent to the user's phone number.
  ///
  /// Takes [verificationCredential] which includes the verification ID and the code.
  Future<DataState<void>> verifyCode({
    required VerificationCodeModel verificationCredential,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationCredential.verificationId,
      smsCode: verificationCredential.code,
    );
    final dataState = DataState.handleDataState(
      () => auth.signInWithCredential(
        credential,
      ),
    );

    return dataState;
  }
}
