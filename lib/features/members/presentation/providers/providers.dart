import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/features/members/data/repositories/members_repository_impl.dart';
import 'package:roof_admin_panel/features/members/data/services/members_database_service.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_first_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_next_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/members_view_model.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_data_source.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

final _membersDataBaseServiceProvider = Provider<MembersDatabaseService>((ref) {
  return MembersDatabaseService();
});

final _membersRepositoryProvider = Provider<MembersRepository>((ref) {
  return MembersRepositoryImpl(
    membersDatabaseService: ref.read(_membersDataBaseServiceProvider),
  );
});

final _fetchNext20UserUseCaseProvider =
    Provider<FetchNext20UsersUseCase>((ref) {
  return FetchNext20UsersUseCase(
    repository: ref.read(_membersRepositoryProvider),
  );
});

final _fetchFirst20UsersUseCaseProvider =
    Provider<FetchFirst20UsersUseCase>((ref) {
  return FetchFirst20UsersUseCase(ref.read(_membersRepositoryProvider));
});

final totalMembersCountProvider = FutureProvider<int>((ref) async {
  return ref.read(_membersRepositoryProvider).fetchTotalUsers().then((value) {
    if (value is DataSuccess) {
      return value.resultData ?? 0;
    } else {
      return 0;
    }
  });
});

final membersTableSourceProvider = Provider<MembersTableDataSource>((ref) {
  return MembersTableDataSource(
    users: [],
    ref: ref,
  );
});

final membersViewModelProvider =
    StateNotifierProvider<MembersViewModel, AsyncValue<List<UserModel>?>>(
        (ref) {
  return MembersViewModel(
    ref.read(membersTableSourceProvider),
    ref.read(_fetchFirst20UsersUseCaseProvider),
    ref.read(_fetchNext20UserUseCaseProvider),
  );
});
