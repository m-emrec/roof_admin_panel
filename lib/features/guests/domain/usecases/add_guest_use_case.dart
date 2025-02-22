import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';

/// Adds a guest to the data layer.
class AddGuestUseCase extends UseCase<DataState<void>, GuestEntity> {
  /// Adds a guest to the data layer.
  AddGuestUseCase(this._repository);
  final GuestsRepository _repository;
  @override
  Future<DataState<void>> call(GuestEntity params) {
    return _repository.addGuest(params);
  }
}
