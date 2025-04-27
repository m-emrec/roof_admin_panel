import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';

///
class BanMemberUseCase extends UseCase<DataState<void>, UserModel> {
  ///
  BanMemberUseCase(this._repository);
  final MemberDetailRepository _repository;
  @override
  Future<DataState<void>> call(UserModel params) {
    return _repository.banMember(memberData: params);
  }
}
