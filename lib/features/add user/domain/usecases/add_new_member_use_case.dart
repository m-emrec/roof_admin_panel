import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

class AddNewMemberUseCase extends UseCase<DataState<UserModel>, UserModel> {
  AddNewMemberUseCase({
    required this.addUserRepository,
  });

  final AddMemberRepository addUserRepository;

  @override
  Future<DataState<UserModel>> call(UserModel params) {
    return addUserRepository.addNewMember(params);
  }
}
