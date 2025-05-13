import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

///
class BanMemberUseCase extends UseCase<DataState<void>, MemberModel> {
  ///
  BanMemberUseCase(this._repository);
  final MemberDetailRepository _repository;
  @override
  Future<DataState<void>> call(MemberModel params) {
    return _repository.banMember(memberData: params);
  }
}
