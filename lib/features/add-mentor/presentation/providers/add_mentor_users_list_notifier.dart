import 'package:core/resources/data_state.dart';
import 'package:core/resources/error_manager.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/data/models/add_mentor_model.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/entities/user_entity.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_member_without_mentor_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentats_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentors_use_case.dart';
import 'package:roof_admin_panel/features/add-mentor/domain/usecases/fetch_mentors_without_mentat_use_case.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';

class AddMentorUserListNotifier
    extends StateNotifier<AsyncValue<List<AddMentorModel>>> {
  AddMentorUserListNotifier({
    required FetchMentorsUseCase fetchMentorsUseCase,
    required FetchMentorsWithoutMentatUseCase fetchMentorsWithoutMentatUseCase,
    required FetchMembersWithoutMentorUseCase fetchMembersWithoutMentorUseCase,
    required FetchMentatsUseCase fetchMentatsUseCase,
  })  : _fetchMentorsUseCase = fetchMentorsUseCase,
        _fetchMentorsWithoutMentatUseCase = fetchMentorsWithoutMentatUseCase,
        _fetchMembersWithoutMentorUseCase = fetchMembersWithoutMentorUseCase,
        _fetchMentatsUseCase = fetchMentatsUseCase,
        super(const AsyncLoading());

  final FetchMentorsUseCase _fetchMentorsUseCase;
  final FetchMentorsWithoutMentatUseCase _fetchMentorsWithoutMentatUseCase;
  final FetchMembersWithoutMentorUseCase _fetchMembersWithoutMentorUseCase;
  final FetchMentatsUseCase _fetchMentatsUseCase;

  List<Role?> _role = [];
  void setRole(List<Role?> role) {
    _role = role;
    fetch();
  }

  Future<void> fetch() async {
    state = const AsyncLoading();

    if (_role.isEmpty) {
      state = AsyncError("No role provided", StackTrace.current);
      return;
    } else if (_role.isMentat) {
      await _fetchMentorsWithoutMentat();
    } else if (_role.isMentor) {
      await _fetchMembersWithoutMentor();
    } else {
      await _fetchMentors();
    }
  }

  Future<void> _fetchMentors() async =>
      _setState(await _fetchMentorsUseCase(const NoParams()));

  Future<void> _fetchMentorsWithoutMentat() async =>
      _setState(await _fetchMentorsWithoutMentatUseCase(const NoParams()));
  Future<void> _fetchMembersWithoutMentor() async =>
      _setState(await _fetchMembersWithoutMentorUseCase(const NoParams()));
  Future<void> _fetchMentats() async =>
      _setState(await _fetchMentatsUseCase(const NoParams()));

  Future<void> _setState(DataState<List<AddMentorEntity>> dataState) async {
    DataState.handleDataStateBasedAction(
      dataState,
      onSuccess: (success) => {
        if (success.resultData != null)
          state = AsyncData(
            success.resultData?.map(AddMentorModel.fromEntity).toList() ?? [],
          ),
      },
      onFailure: (fail) {
        state = AsyncError(
          AppErrorText.errorMessageConverter(fail?.errorMessage ?? ""),
          StackTrace.current,
        );
      },
    );
  }
}
