import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';

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
