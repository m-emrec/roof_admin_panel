import 'package:core/core.dart';
import 'package:roof_admin_panel/features/guests/data/datasources/guests_database_service.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';

/// A concrete implementation of [GuestsRepository].
/// It uses [GuestsDatabaseService] to interact with the data layer.
class GuestsRepositoryImpl implements GuestsRepository {
  /// A concrete implementation of [GuestsRepository].
  GuestsRepositoryImpl({required GuestsDatabaseService databaseService})
      : _service = databaseService;

  final GuestsDatabaseService _service;
  @override
  Future<DataState<void>> addGuest(GuestEntity guest) {
    final guestWithID = Guest.fromEntity(guest)
        .copyWith(id: IDGenerator.generateId(guest.phoneNumber ?? ''));
    return DataState.handleDataState(
      () => _service.addGuest(guestWithID.toJson()),
    );
  }

  @override
  Future<DataState<void>> deleteGuest(List<GuestEntity> guests) {
    final guestsModel = guests.map(Guest.fromEntity).toList();

    return DataState.handleDataState(
      () => _service.deleteGuest(guestsModel.map((e) => e.toJson()).toList()),
    );
  }

  @override
  Future<DataState<List<Guest>>> getGuests() {
    return DataState.handleDataState(
      () async {
        final guests = await _service.getGuests();
        return guests.map(Guest.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<void>> updateGuest(List<GuestEntity> guests) {
    final guestsModel = guests.map(Guest.fromEntity).toList();

    return DataState.handleDataState(
      () => _service.updateGuest(guestsModel.map((e) => e.toJson()).toList()),
    );
  }
}
