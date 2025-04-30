import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/banned-members/data/datasources/banned_members_Service.dart';
import 'package:roof_admin_panel/features/banned-members/data/models/banned_member_model.dart';
import 'package:roof_admin_panel/features/banned-members/domain/entities/banned_member_entity.dart';
import 'package:roof_admin_panel/features/banned-members/domain/repositories/banned_members_repository.dart';

class BannedMembersRepoImpl implements BannedMembersRepository {
  BannedMembersRepoImpl(this._bannedMembersService);

  final BannedMembersService _bannedMembersService;
  @override
  Future<DataState<void>> deletePermanently(String memberId) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<BannedMemberEntity>>> fetchBannedMembers() async {
    return DataState.handleDataState(
      () async {
        final data = await _bannedMembersService.fetchBannedMembers();
        return data.map((e) {
          return BannedMemberModel.fromJson(e);
        }).toList();
      },
    );
  }

  @override
  Future<DataState<void>> unbanMember(String memberId) {
    return DataState.handleDataState(
      () async {
        await _bannedMembersService.unbanMember(memberId);
      },
    );
  }
}
