import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';

///
class DeleteGuestUseCase extends UseCase<DataState<void>, List<GuestEntity>> {
  ///
  DeleteGuestUseCase(this._repository);
  final GuestsRepository _repository;
  @override
  Future<DataState<void>> call(List<GuestEntity> params) {
    return _repository.deleteGuest(params);
  }
}
