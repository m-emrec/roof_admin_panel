import 'package:core/core.dart';
import 'package:roof_admin_panel/features/banned-members/domain/entities/banned_member_entity.dart';

abstract class BannedMembersRepository {
  Future<DataState<List<BannedMemberEntity>>> fetchBannedMembers();

  Future<DataState<void>> unbanMember(String memberId);
  Future<DataState<void>> deletePermanently(String memberId);
}
