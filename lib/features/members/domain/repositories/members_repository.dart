import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';

/// Abstract class [MembersRepository] is responsible for providing the
/// required data from the data sources.
///
/// [fetchFirst20Members] is responsible for fetching the first 20 members.
///
/// [fetchNext20Members] is responsible for fetching the next 20 members.
///
/// [addMember] is responsible for adding a new member.
///
/// [MembersRepository] is implemented in [MembersRepositoryImpl].
abstract class MembersRepository {
  /// Fetch the first 20 members.
  /// Returns [DataState<List<UserModel>>]
  /// It is used to fetch the first 20 members from the data source.
  Future<DataState<List<UserModel>>> fetchFirst20Users();

  /// Fetch the total number of members.
  /// Returns [DataState<int>]
  ///
  /// It is used to fetch the total number of members from the data source.
  Future<DataState<int>> fetchTotalUsers();

  /// Fetch the next 20 members.
  /// Returns [DataState<List<UserModel>>]
  /// It is used to fetch the next 20 members from the data source when the load more is called.
  ///
  /// It requires the [lastUserId] of the last member fetched in the previous call.
  Future<DataState<List<UserModel>>> fetchNext20Users(String lastUserId);

  /// Add a new member.
  // Future<DataState<void>> addUser(UserModel userModel);
}
