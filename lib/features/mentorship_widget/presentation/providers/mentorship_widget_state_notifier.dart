import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/member_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/user_info_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentat_use_case.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

/// [MentorshipWidgetStateNotifier] manages the state of the mentorship system UI.
/// It fetches relevant user data (members, mentors, or mentats) based on the user's role.
/// Uses [AsyncValue] to manage loading, success, and error states for the UI.
class MentorshipWidgetStateNotifier
    extends StateNotifier<AsyncValue<UserInfoModel?>> {
  MentorshipWidgetStateNotifier({
    required GetIfMentorUseCase getMembersForMentorUseCase,
    required GetIfMentatUseCase getMentorsForMentatUseCase,
    required GetIfMemberUseCase getMentorForMemberUseCase,
  })  : _getIfMentorUseCase = getMembersForMentorUseCase,
        _getIfMentatUseCase = getMentorsForMentatUseCase,
        _getIfMemberUseCase = getMentorForMemberUseCase,
        super(const AsyncLoading());

  final GetIfMentorUseCase _getIfMentorUseCase;

  final GetIfMentatUseCase _getIfMentatUseCase;
  final GetIfMemberUseCase _getIfMemberUseCase;

  UserModel? _user;

  /// Sets the current user and initializes the state accordingly.
  /// Determines the user's role and triggers the appropriate data fetch logic.
  void setUser(UserModel? user) {
    _user = user;
    _init();
  }

  /// Determines the role of the user and triggers the corresponding data fetch:
  /// - Mentor: fetch members and mentat.
  /// - Mentat: fetch all assigned mentors.
  /// - Member: fetch the assigned mentor.
  Future<void> _init() async {
    if (_user == null) {
      state = AsyncError("User is null", StackTrace.current);
      return;
    }

    if (_user?.role?.isMentor ?? false) {
      await _getIfMentor();
    } else if (_user?.role?.isMentat ?? false) {
      await _getIfMentat();
    } else {
      await _getIfMember();
    }
  }

  /// Loads the mentor's members and mentat.
  /// Ensures the mentat appears at the top of the list for UI distinction.
  Future<void> _getIfMentor() async {
    DataState.handleDataStateBasedAction(
      await _getIfMentorUseCase(
        memberIds: _user?.members ?? [],
        mentatId: _user?.mentatId ?? "",
      ),
      onSuccess: (data) {
        if (data.resultData != null) {
          state = AsyncData(MentorInfo.fromEntity(entity: data.resultData!));
        } else {
          state = const AsyncData(null);
        }
      },
      onFailure: (fail) {
        state = AsyncError(
          AppErrorText.errorMessageConverter(
            fail?.errorMessage,
          ),
          StackTrace.current,
        );
      },
    );
  }

  /// Fetches the mentor assigned to a member.
  /// Used when the current user has a member role.
  Future<void> _getIfMember() async {
    DataState.handleDataStateBasedAction(
      await _getIfMemberUseCase(_user?.mentorId ?? ""),
      onSuccess: (data) {
        if (data.resultData != null) {
          state = AsyncData(
            MemberInfo.fromEntity(data.resultData!),
          );
        } else {
          state = const AsyncData(null);
        }
      },
      onFailure: (fail) {
        state = AsyncError(
          AppErrorText.errorMessageConverter(
            fail?.errorMessage,
          ),
          StackTrace.current,
        );
      },
    );
  }

  /// Fetches all mentors assigned to the current mentat.
  /// Used when the current user has a mentat role.
  Future<void> _getIfMentat() async {
    DataState.handleDataStateBasedAction(
      await _getIfMentatUseCase(_user?.mentors ?? []),
      onSuccess: (data) {
        if (data.resultData != null) {
          state = AsyncData(
            MentatInfo.fromEntity(data.resultData!),
          );
        } else {
          state = const AsyncData(null);
        }
      },
      onFailure: (fail) {
        state = AsyncError(
          AppErrorText.errorMessageConverter(
            fail?.errorMessage,
          ),
          StackTrace.current,
        );
      },
    );
  }
}
