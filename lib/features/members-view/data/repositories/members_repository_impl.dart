import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/members-view/data/services/members_database_service.dart';
import 'package:roof_admin_panel/features/members-view/domain/repositories/members_repository.dart';

/// [MembersRepositoryImpl] is a concrete implementation of [MembersRepository]
/// which is responsible for fetching users from the database.
class MembersRepositoryImpl extends MembersRepository {
  /// [MembersRepositoryImpl] is a concrete implementation of [MembersRepository]
  /// which is responsible for fetching users from the database.
  MembersRepositoryImpl({
    required this.membersDatabaseService,
  });

  /// [membersDatabaseService] is an instance of [MembersDatabaseService] which is
  /// responsible for communicating with the database.
  final MembersDatabaseService membersDatabaseService;

  @override
  Future<DataState<List<UserModel>>> fetchFirst20Users() async {
    return DataState.handleDataState(() async {
      final users = await membersDatabaseService.fetchFirst20Users();
      return users.map(UserModel.fromJson).toList();
    });
  }

  @override
  Future<DataState<List<UserModel>>> fetchNext20Users(String lastUserId) {
    return DataState.handleDataState(() async {
      final users = await membersDatabaseService.fetchNext20Users(lastUserId);
      return users.map(UserModel.fromJson).toList();
    });
  }

  @override
  Future<DataState<int>> fetchTotalUsers() {
    return DataState.handleDataState(() async {
      return membersDatabaseService.fetchTotalUsersCount();
    });
  }
}
