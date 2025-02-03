import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/features/add%20user/data/datasources/add_member_service.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

class AddMemberRepositoryImpl implements AddMemberRepository {
  AddMemberRepositoryImpl({required AddMemberService addMemberService})
      : _addMemberService = addMemberService;

  final AddMemberService _addMemberService;
  @override
  Future<DataState<UserModel>> addNewMember(UserModel userModel) async {
    return await DataState.handleDataState(
      () async {
        await _addMemberService.addNewMember(userModel);
        return userModel;
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMembersWithoutMentor() async {
    return await DataState.handleDataState(
      () async {
        final membersWithoutMentor =
            await _addMemberService.fetchMembersWithoutMentor();
        return membersWithoutMentor.map(UserModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMentorsWithoutMentat() {
    // TODO: implement fetchMentorsWithoutMentat
    throw UnimplementedError();
  }
}
