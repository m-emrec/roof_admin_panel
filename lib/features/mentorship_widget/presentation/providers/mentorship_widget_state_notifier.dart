import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_members_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentat_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentor_for_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentors_for_mentat_use_case.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

/// [MentorshipWidgetStateNotifier] manages the state of the mentorship system UI.
/// It fetches relevant user data (members, mentors, or mentats) based on the user's role.
/// Uses [AsyncValue] to manage loading, success, and error states for the UI.
class MentorshipWidgetStateNotifier
    extends StateNotifier<AsyncValue<List<UserInfoModel>>> {
  MentorshipWidgetStateNotifier({
    required GetMembersForMentorUseCase getMembersForMentorUseCase,
    required GetMentatForMentorUseCase getMentatForMentorUseCase,
    required GetMentorsForMentatUseCase getMentorsForMentatUseCase,
    required GetMentorForMemberUseCase getMentorForMemberUseCase,
  })  : _getMembersForMentorUseCase = getMembersForMentorUseCase,
        _getMentatForMentorUseCase = getMentatForMentorUseCase,
        _getMentorsForMentatUseCase = getMentorsForMentatUseCase,
        _getMentorForMemberUseCase = getMentorForMemberUseCase,
        super(const AsyncLoading());

  final GetMembersForMentorUseCase _getMembersForMentorUseCase;
  final GetMentatForMentorUseCase _getMentatForMentorUseCase;
  final GetMentorsForMentatUseCase _getMentorsForMentatUseCase;
  final GetMentorForMemberUseCase _getMentorForMemberUseCase;

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
      await _mentor();
    } else if (_user?.role?.isMentat ?? false) {
      await _getMentorsForMentat();
    } else {
      await _getMentorForMember();
    }
  }

  /// Loads the mentor's members and mentat.
  /// Ensures the mentat appears at the top of the list for UI distinction.
  Future<void> _mentor() async {
    await _getMembersForMentor();

    final mentat = await _getMentatForMentor();
    if (mentat.uid.isEmpty && (state.valueOrNull?.isEmpty ?? true)) {
      state = const AsyncData([]);
      return;
    }
    state = AsyncData([mentat, ...state.valueOrNull ?? []]);
  }

  /// Fetches members for the current mentor and updates the state.
  /// Uses [DataState] handling for success and failure.
  Future<void> _getMembersForMentor() async {
    await _updateStateFromDataState(
      dataState: await _getMembersForMentorUseCase(_user?.members ?? []),
    );
  }

  /// Fetches the mentat assigned to the current mentor.
  /// Returns a [UserInfoModel] representation of the mentat.
  /// On failure, sets an error state to notify the UI.
  Future<UserInfoModel> _getMentatForMentor() async {
    var mentat = UserInfoModel(uid: "", name: "");

    DataState.handleDataStateBasedAction(
      await _getMentatForMentorUseCase(_user?.mentatId ?? ""),
      onSuccess: (data) {
        if (data.resultData != null) {
          mentat = UserInfoModel.fromEntity(data.resultData!);
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
    return mentat;
  }

  /// Fetches the mentor assigned to a member.
  /// Used when the current user has a member role.
  Future<void> _getMentorForMember() async {
    await _updateStateFromDataState(
      dataState: await _getMentorForMemberUseCase(_user?.mentorId ?? ""),
    );
  }

  /// Fetches all mentors assigned to the current mentat.
  /// Used when the current user has a mentat role.
  Future<void> _getMentorsForMentat() async {
    await _updateStateFromDataState(
      dataState: await _getMentorsForMentatUseCase(_user?.mentors ?? []),
    );
  }

  /// Generic method to update [state] based on the result of a [DataState].
  /// Converts the data into a list of [UserInfoModel]s for UI use.
  /// Handles error states with localized error messages.
  Future<void> _updateStateFromDataState<T>({
    required DataState<T> dataState,
  }) async {
    DataState.handleDataStateBasedAction(
      dataState,
      onSuccess: (data) {
        if (data.resultData == null) {
          state = const AsyncData([]);
          return;
        }
        state = AsyncData(
          data.resultData is List
              ? _convertList(
                  data.resultData! as List<UserInfoEntity?>,
                )
              : _convert(data.resultData as UserInfoEntity?),
        );
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

  /// Converts a list of nullable [UserInfoEntity] objects to non-nullable [UserInfoModel]s.
  List<UserInfoModel> _convertList(List<UserInfoEntity?> data) {
    return data.map((e) => UserInfoModel.fromEntity(e!)).toList();
  }

  /// Converts a single [UserInfoEntity] into a list containing one [UserInfoModel].
  /// Ensures the data type returned is consistent for the UI.
  List<UserInfoModel> _convert(UserInfoEntity? data) {
    return [
      UserInfoModel.fromEntity(
        data!,
      ),
    ];
  }
}
