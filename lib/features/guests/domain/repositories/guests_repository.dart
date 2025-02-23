import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_entity.dart';

/// GuestsRepository is an abstract class that defines the methods
/// that must be implemented by the data layer.
abstract class GuestsRepository {
  /// Retrieves a list of guests from the data layer.
  /// Returns a list of [GuestEntity]s.
  ///
  Future<DataState<List<GuestEntity>>> getGuests();

  /// Adds a guest to the data layer.
  /// The [guest] parameter must not be null.
  Future<DataState<void>> addGuest(GuestEntity guest);

  /// Updates a guest in the data layer.
  /// The [guest] parameter must not be null.
  Future<DataState<void>> updateGuest(GuestEntity guest);

  /// Approves the given guests in the data layer.
  Future<DataState<void>> approveGuests(List<GuestEntity> guest);

  /// Deletes a guest from the data layer.
  Future<DataState<void>> deleteGuest(List<GuestEntity> guest);

  /// Retrieves the number of guests from the data layer.
  /// Returns the number of guests.
  Future<DataState<int>> getGuestsCount();
}
