import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_first_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_next_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

class MembersViewModel extends StateNotifier<AsyncValue<List<UserModel>?>> {
  MembersViewModel(
    MembersTableDataSource membersTableDataSource,
    FetchFirst20UsersUseCase fetchFirst20UsersUseCase,
    FetchNext20UsersUseCase fetchNext20UsersUseCase,
  )   : _fetchFirst20UsersUseCase = fetchFirst20UsersUseCase,
        _fetchNext20UsersUseCase = fetchNext20UsersUseCase,
        _membersTableDataSource = membersTableDataSource,
        super(
          const AsyncLoading(),
        ) {
    fetchFirst20Users();
  }
  final MembersTableDataSource _membersTableDataSource;
  final FetchFirst20UsersUseCase _fetchFirst20UsersUseCase;
  final FetchNext20UsersUseCase _fetchNext20UsersUseCase;

  Future<void> fetchFirst20Users() async {
    state = const AsyncLoading();
    final result = await _fetchFirst20UsersUseCase(NoParams());
    if (result is DataSuccess) {
      // result.resultData?.sort(
      //   (a, b) => int.parse(a.memberNumber ?? "  ")
      //       .compareTo(int.parse(b.memberNumber ?? "")),
      // );
      state = AsyncData(result.resultData);

      _membersTableDataSource.buildDataGridRows(result.resultData!);
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }

  Future<void> fetchNext20Users(String lastUserId) async {
    final result = await _fetchNext20UsersUseCase(lastUserId);
    if (result is DataSuccess) {
      // result.resultData?.sort(
      //   (a, b) => int.parse(a.memberNumber ?? "  ")
      //       .compareTo(int.parse(b.memberNumber ?? "")),
      // );
      state = AsyncData([...state.value!, ...result.resultData!]);
      // Log.debug(state);
      // _membersTableDataSource.buildDataGridRows(state!);
    } else if (result is DataFailed) {
      Toast.showErrorToast(desc: result.errorMessage);
    }
  }
}
