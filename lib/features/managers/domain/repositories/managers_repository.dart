import 'package:core/core.dart';
import 'package:roof_admin_panel/features/managers/domain/entities/add_manager_entity.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

///
abstract class ManagersRepository {
  /// Get all managers
  Future<DataState<List<ManagerModel>>> getManagers();

  ///
  Future<DataState<void>> deleteManager(String id);

  ///
  Future<DataState<void>> addManager(AddManagerEntity manager);

  ///
  Future<DataState<void>> updateManager(ManagerModel updatedManager);
}
