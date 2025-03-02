import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

/// This class is a Singleton class that holds the information
/// of the current manager.
///
/// It is used to access the manager's information from anywhere in the app.
///
///
final class ManagerInfo {
  ManagerInfo._(this.managerModel);

  static ManagerInfo? _instance;

  ///
  static ManagerInfo get instance {
    if (_instance == null) {
      init();
    }
    return _instance!;
  }

  ///
  final ManagerModel managerModel;

  /// Initializes the [ManagerInfo] instance.
  ///
  /// This method should be called before accessing the [instance] getter.
  static Future<void> init() async {
    _instance ??= ManagerInfo._(
      ManagerModel.fromJson(await _getManagerData()),
    );
  }

  /// Clears the [ManagerInfo] instance.
  ///
  static void clear() {
    _instance = null;
  }

  static Future<Map<String, dynamic>> _getManagerData() async {
    final doc = await FirebaseFirestore.instance
        .collection(CollectionEnum.managers.name)
        .doc(
          FirebaseAuth.instance.currentUser?.uid,
        )
        .get();
    return doc.data() ?? {};
  }
}
