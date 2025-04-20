import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/data/datasources/add_mentor_service.dart';
import 'package:roof_admin_panel/features/add-mentor/data/models/add_mentor_model.dart';
import 'package:roof_admin_panel/features/add-mentor/data/repositories/add_mentor_repository_impl.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/repositories/add_mentor_repository.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_member_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentats_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentors_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/add_mentor_users_list_notifier.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/selection_notifier.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

final _serviceProvider = Provider.autoDispose<AddMentorService>((ref) {
  return AddMentorService();
});

final _repositoryProvider = Provider.autoDispose<AddMentorRepository>((ref) {
  return AddMentorRepositoryImpl(ref.read(_serviceProvider));
});

final _fetchMentorsUseCaseProvider =
    Provider.autoDispose<FetchMentorsUseCase>((ref) {
  return FetchMentorsUseCase(
    ref.read(_repositoryProvider),
  );
});

final _fetchMentorsWithoutMentatUseCaseProvider =
    Provider.autoDispose<FetchMentorsWithoutMentatUseCase>((ref) {
  return FetchMentorsWithoutMentatUseCase(
    ref.read(_repositoryProvider),
  );
});

final _fetchMembersWithoutMentorUseCaseProvider =
    Provider.autoDispose<FetchMembersWithoutMentorUseCase>((ref) {
  return FetchMembersWithoutMentorUseCase(
    ref.read(_repositoryProvider),
  );
});

final _fetchMentatsUseCaseProvider =
    Provider.autoDispose<FetchMentatsUseCase>((ref) {
  return FetchMentatsUseCase(
    ref.read(_repositoryProvider),
  );
});

final shouldFetchMentatsProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

/// This provider is used to fetch the list of users for the add mentor dialog.
/// It uses the [AddMentorUserListNotifier] to manage the state of the list.
final addMentorUsersNotifierProvider = StateNotifierProvider.autoDispose.family<
    AddMentorUserListNotifier,
    AsyncValue<List<AddMentorModel>>,
    List<Role?>>((ref, role) {
  return AddMentorUserListNotifier(
    shouldFetchMentatsProvider: ref.watch(shouldFetchMentatsProvider),
    fetchMentorsUseCase: ref.read(_fetchMentorsUseCaseProvider),
    fetchMentorsWithoutMentatUseCase:
        ref.read(_fetchMentorsWithoutMentatUseCaseProvider),
    fetchMembersWithoutMentorUseCase:
        ref.read(_fetchMembersWithoutMentorUseCaseProvider),
    fetchMentatsUseCase: ref.read(_fetchMentatsUseCaseProvider),
  )..setRole(role);
});

/// This provider is used to manage the selection of users in the add mentor
/// dialog.
/// It uses the [SelectionNotifier] to handle the selection state.
final selectionNotifierProvider =
    StateNotifierProvider<SelectionNotifier, UserModel?>((ref) {
  return SelectionNotifier(
    ref.watch(shouldFetchMentatsProvider),
  );
});

/// This provider is used to determine if a user is selected based on their UID.
/// It uses the [selectionNotifierProvider] to check the selection state.
final isSelectedProvider =
    StateProvider.autoDispose.family<bool, String>((ref, uid) {
  final state = ref.watch(selectionNotifierProvider);
  if (state == null) return false;

  final roles = state.role;

  if (roles?.isMentat ?? false) {
    return state.mentors != null && state.mentors!.contains(uid);
  } else if (roles?.isMentor ?? false) {
    if (ref.watch(shouldFetchMentatsProvider)) {
      // Log.debug("Mentat: ${state.mentatId}");
      return state.mentatId != null && state.mentatId == uid;
    }
    // Log.debug("Mentor: ${state.members}");
    return state.members != null && state.members!.contains(uid);
  } else {
    /// This is the case for a member or admin
    return state.mentorId != null && state.mentorId == uid;
  }
});
