import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/firebase/database%20keys/manager_doc_keys.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';

/// Manages and provides access to the current manager's information.
///
/// This class follows the **Lazy Singleton** pattern, meaning that an instance
/// of `CurrentManager` is created only when it is accessed for the first time.
///
/// ## Usage
/// - To access the instance, use the [instance] getter.
/// - To initialize the instance, call the [init] method before using [instance].
/// - To clear the instance, use the [clear] method.
///
/// ## Purpose
/// `CurrentManager` retrieves and stores the manager's data from Firestore.
/// It allows easy access to the manager's details from anywhere in the app.
///
/// ### Example
/// ```dart
/// await CurrentManager.init();  // Ensure initialization before accessing
/// final manager = CurrentManager.instance.managerModel;
/// print(manager.name); // Access manager details
/// ```
///
/// **Note:** Calling [instance] without initializing via [init] will result
/// in fetching the default dummy manager data.
final class CurrentManager extends ChangeNotifier {
  /// Private constructor to enforce singleton usage.
  CurrentManager._(this.managerModel);

  /// Holds the singleton instance.
  static CurrentManager? _instance;

  /// The current manager's data.
  final ManagerModel managerModel;
  static ValueNotifier<ManagerModel>? valueNotifier;

  /// Dummy manager data used as fallback.
  static final _DUMMY_MANAGER_DATA = ManagerModel(
    uid: "",
    name: "",
    email: "",
    role: ManagerRoleModel(name: "", permissions: [], id: ""),
  );

  /// Returns the singleton instance of [CurrentManager].
  ///
  /// If the instance is not initialized, it will attempt to call [init].
  static CurrentManager get instance {
    if (_instance == null) {
      init();
    }
    return _instance ?? CurrentManager._(_DUMMY_MANAGER_DATA);
  }

  /// Initializes the singleton instance by fetching manager data from Firestore.
  ///
  /// This method **must** be called before accessing [instance].
  ///
  /// Example:
  /// ```dart
  /// await CurrentManager.init();
  /// ```
  static Future<void> init() async {
    _instance ??= CurrentManager._(
      ManagerModel.fromJson(await _getManagerData()),
    );
    if (_instance != null) {
      valueNotifier = ValueNotifier(_instance!.managerModel);
    }
  }

  void changePicture(String url) {
    if (_instance != null) {
      _instance = CurrentManager._(
        _instance!.managerModel.copyWith(
          imageUrl: url,
        ),
      );
      valueNotifier?.value = _instance!.managerModel;
      // notifyListeners();
    }
  }

  /// Fetches the current manager's data from Firestore.
  ///
  /// - Retrieves manager details using the current FirebaseAuth user ID.
  /// - Fetches the associated role data and merges it into the manager data.
  ///
  /// Returns a `Map<String, dynamic>` containing the manager's information.
  static Future<Map<String, dynamic>> _getManagerData() async {
    final doc = await FirebaseFirestore.instance
        .collection(CollectionEnum.managers.name)
        .doc(
          FirebaseAuth.instance.currentUser?.uid,
        )
        .get();

    final data = doc.data() ?? {};
    // Fetch role data and attach it to the manager's data
    data[ManagerDocKeys.role.name] = await _getManagerRole(
      data[ManagerDocKeys.role.name].toString(),
    );

    return data;
  }

  /// Retrieves the manager's role data from Firestore.
  ///
  /// - Accepts a [DocumentReference] pointing to the manager's role.
  /// - Fetches the role details and returns it as a `Map<String, dynamic>`.
  static Future<Map<String, dynamic>> _getManagerRole(
    String docPath,
  ) async {
    final data = await FirebaseFirestore.instance.doc(docPath).get();
    return data.data() ?? {};
  }

  /// Clears the current instance, resetting it to `null`.
  ///
  /// This method should be used when logging out or switching accounts.
  static void clear() {
    _instance = null;
  }
}
