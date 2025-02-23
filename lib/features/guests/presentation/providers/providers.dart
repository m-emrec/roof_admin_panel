import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/datasources/guests_database_service.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/data/repositories/guests_repository_impl.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/add_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/approve_guests_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/delete_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/get_guests_count_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/get_guests_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/update_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/guests_view_model.dart';

final _serviceProvider = Provider<GuestsDatabaseService>((ref) {
  return GuestsDatabaseService();
});

final _repositoryProvider = Provider<GuestsRepository>((ref) {
  return GuestsRepositoryImpl(databaseService: ref.read(_serviceProvider));
});

final _addGuestUseCaseProvider = Provider<AddGuestUseCase>((ref) {
  return AddGuestUseCase(ref.read(_repositoryProvider));
});

final _getGuestsUJseCaseProvider = Provider<GetGuestsUseCase>((ref) {
  return GetGuestsUseCase(ref.read(_repositoryProvider));
});

final _deleteGuestUseCaseProvider = Provider<DeleteGuestUseCase>((ref) {
  return DeleteGuestUseCase(ref.read(_repositoryProvider));
});

final _updateGuestUseCaseProvider = Provider<UpdateGuestUseCase>((ref) {
  return UpdateGuestUseCase(ref.read(_repositoryProvider));
});

final _approveGuestsUseCaseProvider = Provider<ApproveGuestsUseCase>((ref) {
  return ApproveGuestsUseCase(ref.read(_repositoryProvider));
});

final _getGuestsCountUseCaseProvider = Provider<GetGuestsCountUseCase>((ref) {
  return GetGuestsCountUseCase(ref.read(_repositoryProvider));
});

/// Provider that provides the selected guests.
///
/// This provider is used to store the selected guests in the table.
///
/// This provider is used in the [GuestTableActionsRow] widget.
///
final selectedGuestsProvider = StateProvider<List<Guest>>((ref) {
  return [];
});

/// Provider that provides the number of guests.
///
final getGuestsCountProvider = FutureProvider<AsyncValue<int>>((ref) async {
  final getGuestsCountUseCase = ref.read(_getGuestsCountUseCaseProvider);

  final result = await getGuestsCountUseCase(const NoParams());
  if (result is DataSuccess) {
    return AsyncValue.data(result.resultData ?? 0);
  } else {
    return AsyncValue.error(result.errorMessage ?? "", StackTrace.current);
  }
});

/// Provider that provides the [GuestsViewModel].
///
final guestsViewModelProvider =
    StateNotifierProvider<GuestsViewModel, AsyncValue<List<Guest>>>((ref) {
  return GuestsViewModel(
    addGuestUseCase: ref.read(_addGuestUseCaseProvider),
    getGuestsUseCase: ref.read(_getGuestsUJseCaseProvider),
    deleteGuestUseCase: ref.read(_deleteGuestUseCaseProvider),
    updateGuestUseCase: ref.read(_updateGuestUseCaseProvider),
    approveGuestsUseCase: ref.read(_approveGuestsUseCaseProvider),
  );
});
