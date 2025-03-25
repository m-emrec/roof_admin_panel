import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/data/repositories/members_repository_impl.dart';
import 'package:roof_admin_panel/features/members/data/services/members_database_service.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_first_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_next_20_users_use_case.dart';
import 'package:roof_admin_panel/features/members/domain/usecases/fetch_total_users_count_use_case.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/sort_type_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/models/filter_model.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/filter_notifier.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/members_view_model.dart';
import 'package:roof_admin_panel/features/members/presentation/strategies/filter%20strategies/filter_strategy.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/data_source/members_table_data_source.dart';

final _dummyUsers = [
  UserModel(
    name: 'John Doe',
    phoneNumber: '1234567890',
    membershipEndDate: DateTime.now(),
    role: [Role.admin],
    birthDate: DateTime.now(),
    memberNumber: '123456',
  ),
  UserModel(
    name: 'John Doe',
    phoneNumber: '1234567890',
    membershipEndDate: DateTime.now(),
    role: [Role.admin],
    birthDate: DateTime.now(),
    memberNumber: '123456',
  ),
  UserModel(
    name: 'John Doe',
    phoneNumber: '1234567890',
    membershipEndDate: DateTime.now(),
    role: [Role.admin],
    birthDate: DateTime.now(),
    memberNumber: '123456',
  ),
  UserModel(
    name: 'John Doe',
    phoneNumber: '1234567890',
    membershipEndDate: DateTime.now(),
    role: [Role.admin],
    birthDate: DateTime.now(),
    memberNumber: '123456',
  ),
];

/// This provider is used to provide the [MembersDatabaseService] instance.
final _membersDataBaseServiceProvider = Provider<MembersDatabaseService>((ref) {
  return MembersDatabaseService();
});

final _membersRepositoryProvider = Provider<MembersRepository>((ref) {
  return MembersRepositoryImpl(
    membersDatabaseService: ref.read(_membersDataBaseServiceProvider),
  );
});

/////// UseCase providers
final _fetchTotalUsersCountUseCaseProvider =
    Provider<FetchTotalUsersCountUseCase>((ref) {
  return FetchTotalUsersCountUseCase(
    repository: ref.read(_membersRepositoryProvider),
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

/// Providers

/// This provider is used to get the total number of members in the database.
final totalMembersCountProvider = FutureProvider<int>((ref) async {
  return ref
      .read(_fetchTotalUsersCountUseCaseProvider)
      .call(const NoParams())
      .then((value) {
    if (value is DataSuccess) {
      return value.resultData ?? 0;
    } else {
      return 0;
    }
  });
});

/// This provider is used to provide the list of filter conditions for the given column.

/// This provider is used to provide the [MembersTableDataSource] instance.
final membersTableSourceProvider = Provider<MembersTableDataSource>((ref) {
  return MembersTableDataSource(
    users: _dummyUsers,
    ref: ref,
  );
});

/// I use this provider to notify the UI about the sort status.
/// It was needed to show the sort direction icon.
///
/// And I could not do it with [membersTableSourceProvider] because there is no
/// way to notify the UI about the sort status, it can only notify
/// the [MembersTableDataSource].
///
final isSortAppliedProvider = StateProvider<bool>((ref) {
  return false;
});

/// This provider is used to provide the sort direction.
///
///
final sortDirectionProvider = StateProvider<SortDirection>((ref) {
  return SortDirection.desc;
});

/// This provider is used to provide the [MembersViewModel] instance.
final membersViewModelProvider =
    StateNotifierProvider<MembersViewModel, AsyncValue<List<UserModel>?>>(
        (ref) {
  return MembersViewModel(
    ref.read(_fetchFirst20UsersUseCaseProvider),
    ref.read(_fetchNext20UserUseCaseProvider),
  );
});

/// This provider is used to provide the [MembersFilterNotifier] instance.
final filterNotifierProvider =
    ChangeNotifierProvider<MembersFilterNotifier>((ref) {
  return MembersFilterNotifier(
    ref.watch(membersViewModelProvider).value ?? [],
    ref.read(membersTableSourceProvider),
  );
});
