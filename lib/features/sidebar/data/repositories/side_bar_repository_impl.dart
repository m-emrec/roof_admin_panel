import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/sidebar/data/datasources/side_base_database_service.dart';
import 'package:roof_admin_panel/features/sidebar/domain/repositories/side_bar_repositoyry.dart';

class SideBarRepositoryImpl implements SideBarRepositoyry {
  // ignore: public_member_api_docs
  SideBarRepositoryImpl({required SideBarDatabaseService databaseService})
      : _databaseService = databaseService;

  final SideBarDatabaseService _databaseService;

  @override
  Future<DataState<UserModel>> getUser() async {
    return DataState.handleDataState(
      () => _databaseService.getUser().then(
            (value) => UserModel.fromJson(value ?? {}),
          ),
    );
  }
}
