// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';

import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';

class GetGuestsUseCase extends UseCase<DataState<List<GuestEntity>>, NoParams> {
  final GuestsRepository _repository;
  GetGuestsUseCase(
    this._repository,
  );
  @override
  Future<DataState<List<GuestEntity>>> call(NoParams params) {
    return _repository.getGuests();
  }
}
