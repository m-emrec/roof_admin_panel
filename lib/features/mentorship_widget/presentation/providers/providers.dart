import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/repositories/mentorship_widget_repository_impl.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_members_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentat_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentor_for_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentors_for_mentat_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/mentorship_widget_state_notifier.dart';

final _serviceProvider = Provider.autoDispose<MentorshipWidgetService>((ref) {
  return MentorshipWidgetService();
});

final _mentorshipWidgetRepositoryProvider =
    Provider.autoDispose<MentorshipWidgetRepository>((ref) {
  return MentorshipWidgetRepositoryImpl(ref.read(_serviceProvider));
});

final _getMembersForMentorUseCaseProvider =
    Provider<GetMembersForMentorUseCase>((ref) {
  return GetMembersForMentorUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final _getMentatForMentorUseCaseProvider =
    Provider<GetMentatForMentorUseCase>((ref) {
  return GetMentatForMentorUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final _getMentorForMemberUseCaseProvider =
    Provider<GetMentorForMemberUseCase>((ref) {
  return GetMentorForMemberUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final _getMentorsForMentatProvider =
    Provider<GetMentorsForMentatUseCase>((ref) {
  return GetMentorsForMentatUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final mentorshipStateNotifierProvider = StateNotifierProvider<
    MentorshipWidgetStateNotifier, AsyncValue<List<UserInfoModel>>>((ref) {
  return MentorshipWidgetStateNotifier(
    getMembersForMentorUseCase: ref.read(_getMembersForMentorUseCaseProvider),
    getMentatForMentorUseCase: ref.read(_getMentatForMentorUseCaseProvider),
    getMentorsForMentatUseCase: ref.read(_getMentorsForMentatProvider),
    getMentorForMemberUseCase: ref.read(_getMentorForMemberUseCaseProvider),
  );
});
