import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/add-member/data/datasources/add_member_service.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';

/// [AddMemberRepositoryImpl] class is the implementation of [AddMemberRepository].
class AddMemberRepositoryImpl implements AddMemberRepository {
  /// [AddMemberRepositoryImpl] class is the implementation of [AddMemberRepository].
  AddMemberRepositoryImpl({required AddMemberService addMemberService})
      : _addMemberService = addMemberService;

  final AddMemberService _addMemberService;
  @override
  Future<DataState<UserModel>> addNewMember(UserModel userModel) async {
    return DataState.handleDataState(
      () async {
        await _addMemberService.addNewMember(userModel);
        return userModel;
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMembersWithoutMentor() async {
    return DataState.handleDataState(
      () async {
        final membersWithoutMentor =
            await _addMemberService.fetchMembersWithoutMentor();
        return membersWithoutMentor.map(UserModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMentorsWithoutMentat() {
    return DataState.handleDataState(
      () async {
        final mentorsWithoutMentat =
            await _addMemberService.fetchMentorsWithOutMentat();
        return mentorsWithoutMentat.map(UserModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMentats() {
    return DataState.handleDataState(
      () async {
        final mentats = await _addMemberService.fetchMentats();
        return mentats.map(UserModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<UserModel>>> fetchMentors() {
    return DataState.handleDataState(
      () async {
        final mentors = await _addMemberService.fetchMentors();
        return mentors.map(UserModel.fromJson).toList();
      },
    );
  }
}
