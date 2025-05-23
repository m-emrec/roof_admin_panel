import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/add_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/approve_guests_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/delete_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/get_guests_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/update_guest_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

/// GuestsViewModel
class GuestsViewModel extends StateNotifier<AsyncValue<List<Guest>>> {
  /// GuestsViewModel
  GuestsViewModel({
    required AddGuestUseCase addGuestUseCase,
    required GetGuestsUseCase getGuestsUseCase,
    required DeleteGuestUseCase deleteGuestUseCase,
    required UpdateGuestUseCase updateGuestUseCase,
    required ApproveGuestsUseCase approveGuestsUseCase,
  })  : _addGuestUseCase = addGuestUseCase,
        _approveGuestsUseCase = approveGuestsUseCase,
        _getGuestsUseCase = getGuestsUseCase,
        _deleteGuestUseCase = deleteGuestUseCase,
        _updateGuestUseCase = updateGuestUseCase,
        super(
          const AsyncValue.loading(),
        ) {
    getGuests();
  }

  final ApproveGuestsUseCase _approveGuestsUseCase;
  final AddGuestUseCase _addGuestUseCase;
  final GetGuestsUseCase _getGuestsUseCase;
  final DeleteGuestUseCase _deleteGuestUseCase;
  final UpdateGuestUseCase _updateGuestUseCase;

  /// A method to get the guests
  Future<void> getGuests() async {
    DataState.handleDataStateBasedAction(
      await _getGuestsUseCase(const NoParams()),
      onSuccess: (res) =>
          _updateState(res.resultData?.map(Guest.fromEntity).toList() ?? []),
      onFailure: (res) =>
          state = AsyncError(res?.errorMessage ?? "", StackTrace.current),
    );
  }

  /// A method to add a guest
  Future<void> addGuest(Guest guest) async {
    DataState.handleDataStateBasedAction(
      await _addGuestUseCase(guest.toEntity()),
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Log.error(res?.errorMessage),
    );
  }

  /// A method to delete a guest
  Future<void> deleteGuest(List<Guest> guests) async {
    DataState.handleDataStateBasedAction(
      await _deleteGuestUseCase(guests.map((e) => e.toEntity()).toList()),
      onSuccess: (res) {
        for (final guest in guests) {
          _updateState(
            state.value?.where((e) => e.id != guest.id).toList() ?? [],
          );
        }
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }

  /// A method to increase the joined event count
  Future<void> increaseJoinedEventCount(Guest guest) async {
    final updatedGuest =
        guest.copyWith(joinedEventCount: (guest.joinedEventCount ?? 0) + 1);
    DataState.handleDataStateBasedAction(
      await _updateGuestUseCase(updatedGuest.toEntity()),
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }

  /// A method to decrease the joined event count
  Future<void> decreaseJoinedEventCount(Guest guest) async {
    final updatedGuest = guest.copyWith(
      joinedEventCount: (guest.joinedEventCount ?? 0) == 0
          ? 0
          : (guest.joinedEventCount ?? 0) - 1,
    );
    DataState.handleDataStateBasedAction(
      await _updateGuestUseCase(updatedGuest.toEntity()),
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }

  /// A method to approve guests
  Future<void> approveGuests(List<Guest> guests) async {
    DataState.handleDataStateBasedAction(
      await _approveGuestsUseCase(
        guests.map((e) => e.toEntity()).toList(),
      ),
      onSuccess: (res) {
        for (final guest in guests) {
          _updateState(
            state.value
                    ?.map(
                      (e) => e.id == guest.id
                          ? e.copyWith(role: [Role.approvedGuest])
                          : e,
                    )
                    .toList() ??
                [],
          );
        }
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }

  void _updateState(List<Guest> updatedData) {
    state = AsyncData(updatedData);
  }
}
