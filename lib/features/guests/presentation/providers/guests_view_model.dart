import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/add_guest_use_case.dart';
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
  })  : _addGuestUseCase = addGuestUseCase,
        _getGuestsUseCase = getGuestsUseCase,
        _deleteGuestUseCase = deleteGuestUseCase,
        _updateGuestUseCase = updateGuestUseCase,
        super(
          const AsyncValue.loading(),
        ) {
    getGuests();
  }

  final AddGuestUseCase _addGuestUseCase;
  final GetGuestsUseCase _getGuestsUseCase;
  final DeleteGuestUseCase _deleteGuestUseCase;
  final UpdateGuestUseCase _updateGuestUseCase;

  /// A method to get the guests
  Future<void> getGuests() async {
    final result = await _getGuestsUseCase(const NoParams());
    DataState.handleDataStateBasedAction(
      result,
      onSuccess: (res) => state = AsyncData(
        res.resultData?.map(Guest.fromEntity).toList() ?? [],
      ),
      onFailure: (res) =>
          state = AsyncError(res?.errorMessage ?? "", StackTrace.current),
    );
  }

  /// A method to add a guest
  Future<void> addGuest(Guest guest) async {
    final result = await _addGuestUseCase(guest.toEntity());
    DataState.handleDataStateBasedAction(
      result,
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Log.error(res?.errorMessage),
    );
  }

  /// A method to delete a guest
  Future<void> deleteGuest(List<Guest> guests) async {
    final result =
        await _deleteGuestUseCase(guests.map((e) => e.toEntity()).toList());
    DataState.handleDataStateBasedAction(
      result,
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }

  // /// A method to update a guest
  // Future<void> updateGuest(List<Guest> guests) async {
  //   final result =
  //       await _updateGuestUseCase(guests.map((e) => e.toEntity()).toList());
  //   DataState.handleDataStateBasedAction(
  //     result,
  //     onSuccess: (res) {
  //       getGuests();
  //     },
  //     onFailure: (res) => Toast.showErrorToast(
  //       desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
  //     ),
  //   );
  // }

  /// A method to approve guests
  Future<void> approveGuests(List<Guest> guests) async {
    final updatedGuests =
        guests.map((e) => e.copyWith(role: [Role.approvedGuest])).toList();
    final result = await _updateGuestUseCase(
      updatedGuests.map((e) => e.toEntity()).toList(),
    );
    DataState.handleDataStateBasedAction(
      result,
      onSuccess: (res) {
        getGuests();
      },
      onFailure: (res) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(res?.errorMessage ?? ""),
      ),
    );
  }
}
