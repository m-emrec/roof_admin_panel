import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/sidebar/domain/repositories/side_bar_repositoyry.dart';

class GetUserUseCase extends UseCase<DataState<UserModel>, NoParams> {
  final SideBarRepositoyry repository;

  GetUserUseCase(this.repository);

  @override
  Future<DataState<UserModel>> call(NoParams params) {
    return repository.getUser();
  }
}
