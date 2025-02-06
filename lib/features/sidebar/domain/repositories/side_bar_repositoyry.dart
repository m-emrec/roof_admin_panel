import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';

abstract class SideBarRepositoyry {
  Future<DataState<UserModel>> getUser();
}
