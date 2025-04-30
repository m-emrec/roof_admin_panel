import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/banned-members/domain/entities/banned_member_entity.dart';
import 'package:roof_admin_panel/features/banned-members/domain/repositories/banned_members_repository.dart';

///
class FetchBannedMembersUseCase
    extends UseCase<DataState<List<BannedMemberEntity>>, NoParams> {
  ///
  FetchBannedMembersUseCase(this._repository);
  final BannedMembersRepository _repository;
  @override
  Future<DataState<List<BannedMemberEntity>>> call(NoParams params) {
    return _repository.fetchBannedMembers();
  }
}
