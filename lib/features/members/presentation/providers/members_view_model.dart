import 'package:core/resources/data_state.dart';
import 'package:core/resources/error_manager.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_first_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_next_20_users_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

///
class MembersViewModel extends StateNotifier<AsyncValue<List<UserModel>?>> {
  /// [MembersViewModel] is a StateNotifier responsible for managing the state of the members list.
  ///
  /// It communicates with use cases to fetch user data and provides it to the UI as [AsyncValue].
  /// Initially, it fetches the first 20 users when the view model is created. It also supports
  /// pagination by fetching the next 20 users when requested.
  ///
  /// This class handles both success and failure states using [DataState], and displays error
  /// messages through a custom toast widget if necessary.
  ///
  /// Use this ViewModel to:
  /// - Fetch the first 20 users
  /// - Fetch the next 20 users based on the last user ID
  /// - Maintain and update the members list in the UI
  MembersViewModel(
    FetchFirst20UsersUseCase fetchFirst20UsersUseCase,
    FetchNext20UsersUseCase fetchNext20UsersUseCase,
  )   : _fetchFirst20UsersUseCase = fetchFirst20UsersUseCase,
        _fetchNext20UsersUseCase = fetchNext20UsersUseCase,
        super(
          const AsyncLoading(),
        ) {
    // initially call the fetchFirst20Users
    fetchFirst20Users();
  }
  final FetchFirst20UsersUseCase _fetchFirst20UsersUseCase;
  final FetchNext20UsersUseCase _fetchNext20UsersUseCase;

  /// This is the list of users that is displayed
  /// Purpose of this list is to store the users data.
  /// When the user apply filters or sort the data, state will be updated
  /// but this list will remain the same.
  ///
  /// When the user clears the filters or sort, this list will be used to
  /// display the original data.
  // List<UserModel>? users;

  /// This method fetches the first 20 users from the use case.
  /// It updates the state based on the result.
  Future<void> fetchFirst20Users() async {
    state = const AsyncLoading();
    DataState.handleDataStateBasedAction(
      await _fetchFirst20UsersUseCase(const NoParams()),
      onSuccess: (result) => state = AsyncData(result.resultData),
      onFailure: (result) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(result?.errorMessage ?? ""),
      ),
    );
  }

  /// This method fetches the next 20 users from the use case.
  /// It updates the state based on the result.
  /// [lastUserId] is the id of the last user in the current list.
  ///
  /// This method is called when the user scrolls to the end of the list.
  Future<void> fetchNext20Users(String lastUserId) async {
    DataState.handleDataStateBasedAction(
      await _fetchNext20UsersUseCase(lastUserId),
      onSuccess: (result) =>
          state = AsyncData([...state.value!, ...result.resultData!]),
      onFailure: (result) => Toast.showErrorToast(
        desc: AppErrorText.errorMessageConverter(result?.errorMessage ?? ""),
      ),
    );
  }
}
