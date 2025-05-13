import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/repositories/mentorship_widget_repository_impl.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/repositories/mentorship_widget_repository.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentat_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/mentorship_widget_state_notifier.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

final _serviceProvider = Provider.autoDispose<MentorshipWidgetService>((ref) {
  return MentorshipWidgetService();
});

final _mentorshipWidgetRepositoryProvider =
    Provider<MentorshipWidgetRepository>((ref) {
  return MentorshipWidgetRepositoryImpl(ref.read(_serviceProvider));
});

final _getIfMentorUseCaseProvider = Provider<GetIfMentorUseCase>((ref) {
  return GetIfMentorUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final _getIfMemberUseCaseProvider = Provider<GetIfMemberUseCase>((ref) {
  return GetIfMemberUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

final _getIfMentatProvider = Provider<GetIfMentatUseCase>((ref) {
  return GetIfMentatUseCase(
    ref.read(_mentorshipWidgetRepositoryProvider),
  );
});

/// A provider that exposes the [MentorshipWidgetStateNotifier] as a state notifier
/// for managing the state of mentorship-related data.
final mentorshipStateNotifierProvider = StateNotifierProvider.family<
    MentorshipWidgetStateNotifier,
    AsyncValue<AbstractUserInfo?>,
    MemberModel>((ref, user) {
  return MentorshipWidgetStateNotifier(
    getMembersForMentorUseCase: ref.read(_getIfMentorUseCaseProvider),
    getMentorsForMentatUseCase: ref.read(_getIfMentatProvider),
    getMentorForMemberUseCase: ref.read(_getIfMemberUseCaseProvider),
  )..setUser(user);
});
