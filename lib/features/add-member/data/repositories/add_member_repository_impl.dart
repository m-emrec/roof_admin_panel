import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/add-member/data/datasources/add_member_service.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// [AddMemberRepositoryImpl] class is the implementation of [AddMemberRepository].
class AddMemberRepositoryImpl implements AddMemberRepository {
  /// [AddMemberRepositoryImpl] class is the implementation of [AddMemberRepository].
  AddMemberRepositoryImpl({required AddMemberService addMemberService})
      : _addMemberService = addMemberService;

  final AddMemberService _addMemberService;
  @override
  Future<DataState<MemberModel>> addNewMember(MemberModel userModel) async {
    return DataState.handleDataState(
      () async {
        await _addMemberService.addNewMember(userModel);
        return userModel;
      },
    );
  }
}
