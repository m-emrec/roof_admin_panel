import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_first_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_next_20_users_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

/// This is the view model that provides the members data to the view.
/// It fetches the data from the use case and provides it to the view.
class MembersViewModel extends StateNotifier<AsyncValue<List<UserModel>?>> {
  /// This is the view model that provides the members data to the view.
  /// It fetches the data from the use case and provides it to the view.
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
    final result = await _fetchFirst20UsersUseCase(const NoParams());
    if (result is DataSuccess) {
      state = AsyncData(result.resultData);
      // users = state.value;
      // _membersTableDataSource.generateUserDataGridRows(result.resultData!);
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }

  /// This method fetches the next 20 users from the use case.
  /// It updates the state based on the result.
  /// [lastUserId] is the id of the last user in the current list.
  ///
  /// This method is called when the user scrolls to the end of the list.
  Future<void> fetchNext20Users(String lastUserId) async {
    final result = await _fetchNext20UsersUseCase(lastUserId);
    if (result is DataSuccess) {
      state = AsyncData([...state.value!, ...result.resultData!]);
      // users = state.value;
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }
}
