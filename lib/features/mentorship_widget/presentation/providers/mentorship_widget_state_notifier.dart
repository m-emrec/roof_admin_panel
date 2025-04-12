import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/entities/mentor_entity.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_members_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentat_for_mentor_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentor_for_member_use_case.dart';
import 'package:roof_admin_panel/features/mentorship_widget/domain/usecases/get_mentors_for_mentat_use_case.dart';

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

  void setUser(UserModel? user) {
    _user = user;
    _init();
  }

  Future<void> _init() async {
    // Log.debug(_user);
    if (_user == null) {
      state = AsyncError("User is null", StackTrace.current);
      return;
    }

    if (_user?.role?.contains(Role.mentor) ?? false) {
      // await _getMembersForMentor();
      await _mentor();

      /// TODO : MEntat
    } else if (_user?.role?.contains(Role.mentat) ?? false) {
      await _getMentorsForMentat();
    } else if ((_user?.role?.contains(Role.member) ?? false) ||
        (_user?.role?.contains(Role.admin) ?? false)) {
      await _getMentorForMember();
    }
  }

  Future<void> _mentor() async {
    UserInfoModel mentat = UserInfoModel(uid: "", name: "");
    DataState.handleDataStateBasedAction(
      await _getMentatForMentorUseCase(_user?.mentatId ?? ""),
      onSuccess: (data) {
        if (data.resultData == null) {
          mentat = UserInfoModel(uid: "", name: "");
        } else {
          mentat = UserInfoModel.fromEntity(data.resultData!);
        }
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );

    DataState.handleDataStateBasedAction(
      await _getMembersForMentorUseCase(_user?.members ?? []),
      onSuccess: (data) {
        state = AsyncData(
          _convertList(
            data,
          ),
        );
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );

    state = AsyncData(
      [
        mentat,
        ...state.value ?? [],
      ],
    );
  }

  Future<void> _getMembersForMentor() async {
    DataState.handleDataStateBasedAction(
      await _getMembersForMentorUseCase(_user?.members ?? []),
      onSuccess: (data) {
        state = AsyncData(
          _convertList(
            data,
          ),
        );
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );
  }

  Future<void> _getMentorForMember() async {
    DataState.handleDataStateBasedAction(
      await _getMentorForMemberUseCase(_user?.mentorId ?? ""),
      onSuccess: (data) {
        state = AsyncData(
          _convert(
            data,
          ),
        );
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );
  }

  Future<void> _getMentatForMentor() async {
    DataState.handleDataStateBasedAction(
      await _getMentatForMentorUseCase(_user?.mentatId ?? ""),
      onSuccess: (data) {
        state = AsyncData(
          _convert(
            data,
          ),
        );
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );
  }

  Future<void> _getMentorsForMentat() async {
    DataState.handleDataStateBasedAction(
      await _getMentorsForMentatUseCase(_user?.mentors ?? []),
      onSuccess: (data) {
        state = AsyncData(
          _convertList(
            data,
          ),
        );
      },
      onFailure: (fail) {
        state = AsyncError(
          fail?.errorMessage ?? "Something went wrong",
          StackTrace.current,
        );
      },
    );
  }

  List<UserInfoModel> _convertList(DataSuccess<List<UserInfoEntity?>> data) {
    if (data.resultData == null) {
      return const [];
    }
    return data.resultData!.map((e) => UserInfoModel.fromEntity(e!)).toList();
  }

  List<UserInfoModel> _convert(DataSuccess<UserInfoEntity?> data) {
    if (data.resultData == null) {
      return const [];
    }
    return [
      UserInfoModel.fromEntity(
        data.resultData!,
      ),
    ];
  }
}
