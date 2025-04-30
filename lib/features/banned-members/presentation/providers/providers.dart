import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/banned-members/data/datasources/banned_members_Service.dart';
import 'package:roof_admin_panel/features/banned-members/data/models/banned_member_model.dart';
import 'package:roof_admin_panel/features/banned-members/data/repositories/banned_members_repo_impl.dart';
import 'package:roof_admin_panel/features/banned-members/domain/repositories/banned_members_repository.dart';
import 'package:roof_admin_panel/features/banned-members/domain/usecases/fetch_banned_members_use_case.dart';
import 'package:roof_admin_panel/features/banned-members/domain/usecases/unban_member_use_case.dart';
import 'package:roof_admin_panel/features/banned-members/presentation/providers/banned_members_view_model.dart';

final _serviceProvider = Provider<BannedMembersService>((ref) {
  return BannedMembersService();
});

final _repositoryProvider = Provider<BannedMembersRepository>((ref) {
  return BannedMembersRepoImpl(
    ref.read(_serviceProvider),
  );
});

final _fetchBannedMembersUseCaseProvider =
    Provider<FetchBannedMembersUseCase>((ref) {
  return FetchBannedMembersUseCase(
    ref.read(_repositoryProvider),
  );
});

final _unbanUseCaseProvider = Provider<UnbanUseCase>((ref) {
  return UnbanUseCase(
    ref.read(_repositoryProvider),
  );
});

/// Banned members view model provider
/// This provider is responsible for managing the state of the banned members
final bannedMembersViewModelProvider = StateNotifierProvider<
    BannedMembersViewModel, AsyncValue<List<BannedMemberModel>>>((ref) {
  return BannedMembersViewModel(
    ref.read(
      _fetchBannedMembersUseCaseProvider,
    ),
    ref.read(_unbanUseCaseProvider),
  );
});
