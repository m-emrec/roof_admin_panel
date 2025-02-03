import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add%20user/data/datasources/add_member_service.dart';
import 'package:roof_admin_panel/features/add%20user/data/repositories/add_member_repository_impl.dart';
import 'package:roof_admin_panel/features/add%20user/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_members_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/add_member_view_model.dart';

final _addMemberServiceProvider = Provider<AddMemberService>((ref) {
  return AddMemberService();
});

final _repositoryProvider = Provider<AddMemberRepository>((ref) {
  return AddMemberRepositoryImpl(
    addMemberService: ref.read(_addMemberServiceProvider),
  );
});

final _addNewUserUseCaseProvider = Provider<AddNewMemberUseCase>((ref) {
  return AddNewMemberUseCase(
    addUserRepository: ref.read(_repositoryProvider),
  );
});

final _fetchMembersWithoutMentorUseCaseProvider =
    Provider<FetchMembersWithoutMentorUseCase>((ref) {
  return FetchMembersWithoutMentorUseCase(
    ref.read(_repositoryProvider),
  );
});

final _fetchMentorsWithoutMentatUseCaseProvider =
    Provider<FetchMentorsWithoutMentatUseCase>((ref) {
  return FetchMentorsWithoutMentatUseCase(
    ref.read(_repositoryProvider),
  );
});

// final addMemberProvider =
//     StateNotifierProvider.autoDispose<AddMemberViewModel, UserModel?>((ref) {
//   return AddMemberViewModel(
//     addNewUserUseCase: ref.read(_addNewUserUseCaseProvider),
//     fetchMembersWithoutMentorUseCase:
//         ref.read(_fetchMembersWithoutMentorUseCaseProvider),
//     fetchMentorsWithoutMentatUseCase:
//         ref.read(_fetchMentorsWithoutMentatUseCaseProvider),
//   );
// });

final addMemberProvider =
    ChangeNotifierProvider.autoDispose<AddMemberViewModel>((ref) {
  return AddMemberViewModel(
    addNewUserUseCase: ref.read(_addNewUserUseCaseProvider),
    fetchMembersWithoutMentorUseCase:
        ref.read(_fetchMembersWithoutMentorUseCaseProvider),
    fetchMentorsWithoutMentatUseCase:
        ref.read(_fetchMentorsWithoutMentatUseCaseProvider),
  );
});
