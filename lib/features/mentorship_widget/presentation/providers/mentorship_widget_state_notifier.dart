import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/member_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentat_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_if_mentor_use_case.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

/// [MentorshipWidgetStateNotifier] manages the state of the mentorship system UI.
/// It fetches relevant user data (members, mentors, or mentats) based on the user's role.
/// Uses [AsyncValue] to manage loading, success, and error states for the UI.
class MentorshipWidgetStateNotifier
    extends StateNotifier<AsyncValue<UserInfoModel?>> {
  /// Constructor for [MentorshipWidgetStateNotifier].
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
  Future<void> _getIfMentor() async {
    await _emitStateFromDataState(
      _getIfMentorUseCase(
        memberIds: _user?.members ?? [],
        mentatId: _user?.mentatId ?? "",
      ),
      MentorInfo.fromEntity,
    );
  }

  /// Fetches the mentor assigned to a member.
  /// Used when the current user has a member role.
  Future<void> _getIfMember() async {
    await _emitStateFromDataState(
      _getIfMemberUseCase(_user?.mentorId ?? ""),
      MemberInfo.fromEntity,
    );
  }

  /// Fetches all mentors assigned to the current mentat.
  /// Used when the current user has a mentat role.
  Future<void> _getIfMentat() async {
    await _emitStateFromDataState(
      _getIfMentatUseCase(_user?.mentors ?? []),
      MentatInfo.fromEntity,
    );
  }

  /// Emits a state based on the provided [dataState].
  /// Uses the [fromEntity] function to convert the result data to a [UserInfoModel].
  Future<void> _emitStateFromDataState<T>(
    Future<DataState<T?>> dataState,
    UserInfoModel Function(T) fromEntity,
  ) async {
    DataState.handleDataStateBasedAction(
      await dataState,
      onSuccess: (data) => _emitSuccessState(
        data.resultData,
        fromEntity,
      ),
      onFailure: _emitErrorState,
    );
  }

  /// Emits a success state with the provided result data.
  /// Converts the result data to a [UserInfoModel] using the provided [fromEntity] function.
  /// If the result data is null, emits a success state with null data.
  /// If the result data is not null, emits a success state with the converted data.
  void _emitSuccessState<T>(
    T? resultData,
    UserInfoModel Function(T) fromEntity,
  ) {
    if (resultData != null) {
      state = AsyncData(
        fromEntity(resultData),
      );
    } else {
      state = const AsyncData(null);
    }
  }

  /// Emits an error state with a user-friendly error message.
  /// Uses [AppErrorText.errorMessageConverter] to convert the error message.
  /// The error message is derived from the [DataFailed] object.
  void _emitErrorState(DataFailed<dynamic>? fail) {
    state = AsyncError(
      AppErrorText.errorMessageConverter(
        fail?.errorMessage,
      ),
      StackTrace.current,
    );
  }
}
