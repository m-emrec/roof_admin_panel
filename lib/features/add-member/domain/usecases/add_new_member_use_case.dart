import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

class AddNewMemberUseCase extends UseCase<DataState<MemberModel>, MemberModel> {
  AddNewMemberUseCase({
    required this.addUserRepository,
  });

  final AddMemberRepository addUserRepository;

  @override
  Future<DataState<MemberModel>> call(MemberModel params) {
    return addUserRepository.addNewMember(params);
  }
}
