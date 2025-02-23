import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';

///
class GetGuestsCountUseCase extends UseCase<DataState<int>, NoParams> {
  ///
  GetGuestsCountUseCase(this._repository);
  final GuestsRepository _repository;
  @override
  Future<DataState<int>> call(NoParams params) {
    return _repository.getGuestsCount();
  }
}
