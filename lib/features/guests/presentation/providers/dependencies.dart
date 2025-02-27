part of 'providers.dart';

final _serviceProvider = Provider<GuestsDatabaseService>((ref) {
  return GuestsDatabaseService();
});

final _repositoryProvider = Provider<GuestsRepository>((ref) {
  return GuestsRepositoryImpl(databaseService: ref.read(_serviceProvider));
});

final _addGuestUseCaseProvider = Provider<AddGuestUseCase>((ref) {
  return AddGuestUseCase(ref.read(_repositoryProvider));
});

final _getGuestsUseCaseProvider = Provider<GetGuestsUseCase>((ref) {
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
