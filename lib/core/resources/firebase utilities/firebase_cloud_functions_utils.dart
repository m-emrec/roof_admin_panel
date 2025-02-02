import 'package:cloud_functions/cloud_functions.dart';
import 'package:roof_admin_panel/core/resources/firebase%20utilities/firebase_utils.dart';
import 'package:roof_admin_panel/core/utils/constants/firebase/cloud_function_names.dart';

/// A mixin that provides Firebase Cloud Functions utilities.
///
///
/// This mixin includes methods that interact with Firebase Cloud Functions.
mixin FirebaseCloudFunctionsUtils on FirebaseUtils {
  /// return the success status of the response.
  ///
  /// This function returns a [bool] value that indicates if the response was successful.
  ///
  bool getResponseSuccess(HttpsCallableResult<Map<String, dynamic>> response) =>
      response.data['success'].toString().toLowerCase() == 'true';

  /// Get the error code from the response.
  ///
  /// This function returns the error code from the given response.
  ///
  ///
  String getErrorCode(HttpsCallableResult<Map<String, dynamic>> response) =>
      response.data['error']["errorInfo"]["code"].toString();

  /// Create a new user with a phone number.
  ///
  /// This function is provided by the Firebase Cloud Function `createUserWithPhoneNumber`.
  ///
  /// It creates a new user on FirebaseAuth with the provided phone number.
  ///
  /// The function returns a [HttpsCallableResult] which contains the result of the function.
  ///
  /// The result is a [Map] with the following keys:
  /// - `success` - A [bool] value that indicates if the function was successful.
  /// - `error` - A [String] message that contains the error message.
  Future<HttpsCallableResult<Map<String, dynamic>>> createUserWithPhoneNumber({
    required Map<String, dynamic> user,
  }) =>
      functions
          .httpsCallable(
            CloudFunctionNames.createUserWithPhoneNumber.name,
          )
          .call(user);
}
