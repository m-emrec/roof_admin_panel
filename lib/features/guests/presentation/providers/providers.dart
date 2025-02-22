import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/guests/data/datasources/guests_database_service.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/data/repositories/guests_repository_impl.dart';
import 'package:roof_admin_panel/features/guests/domain/entities/guest_table_names.dart';
import 'package:roof_admin_panel/features/guests/domain/repositories/guests_repository.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/add_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/delete_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/get_guests_use_case.dart';
import 'package:roof_admin_panel/features/guests/domain/usecases/update_guest_use_case.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/guests_view_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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

/// Provider that provides the selected guests.
///
/// This provider is used to store the selected guests in the table.
///
/// This provider is used in the [GuestTableActionsRow] widget.
///
final selectedGuestsProvider = StateProvider<List<Guest>>((ref) {
  return [];
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
  );
});
