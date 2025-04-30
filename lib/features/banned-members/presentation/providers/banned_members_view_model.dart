import 'package:core/resources/data_state.dart';
import 'package:core/resources/error_manager.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/banned-members/data/models/banned_member_model.dart';
import 'package:roof_admin_panel/features/banned-members/domain/usecases/fetch_banned_members_use_case.dart';
import 'package:roof_admin_panel/features/banned-members/domain/usecases/unban_member_use_case.dart';

class BannedMembersViewModel
    extends StateNotifier<AsyncValue<List<BannedMemberModel>>> {
  BannedMembersViewModel(this._fetchBannedMembersUseCase, this._unbanUseCase)
      : super(const AsyncLoading()) {
    fetchBannedMembers();
  }

  final UnbanUseCase _unbanUseCase;
  final FetchBannedMembersUseCase _fetchBannedMembersUseCase;

  Future<void> fetchBannedMembers() async {
    state = const AsyncLoading();
    DataState.handleDataStateBasedAction(
      await _fetchBannedMembersUseCase(const NoParams()),
      onSuccess: (data) {
        final models = data.resultData?.map((e) {
          return BannedMemberModel.fromEntity(e);
        }).toList();
        state = AsyncData(models ?? []);
      },
      onFailure: (error) => state = AsyncError(
        AppErrorText.errorMessageConverter(error?.errorMessage),
        StackTrace.current,
      ),
    );
  }

  Future<void> unbanMember(String memberId) async {
    state = const AsyncLoading();
    Log.debug('Unban member with ID: $memberId');
    DataState.handleDataStateBasedAction(
      await _unbanUseCase(memberId),
      onSuccess: (data) {
        fetchBannedMembers();
      },
      onFailure: (error) => state = AsyncError(
        AppErrorText.errorMessageConverter(error?.errorMessage),
        StackTrace.current,
      ),
    );
  }
}
