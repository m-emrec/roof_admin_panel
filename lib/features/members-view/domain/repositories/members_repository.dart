import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// Abstract class [MembersRepository] is responsible for providing the
/// required data from the data sources.
///
/// [fetchFirst20Members] is responsible for fetching the first 20 members.
///
/// [fetchNext20Members] is responsible for fetching the next 20 members.
///
/// [fetchTotalUsers] is responsible for fetching the total number of members.
///
/// [MembersRepository] is implemented in [MembersRepositoryImpl].
abstract class MembersRepository {
  /// Fetch the first 20 members.
  /// Returns [DataState<List<MemberModel>>]
  /// It is used to fetch the first 20 members from the data source.
  Future<DataState<List<MemberModel>>> fetchFirst20Users();

  /// Fetch the total number of members.
  /// Returns [DataState<int>]
  ///
  /// It is used to fetch the total number of members from the data source.
  Future<DataState<int>> fetchTotalUsers();

  /// Fetch the next 20 members.
  /// Returns [DataState<List<MemberModel>>]
  /// It is used to fetch the next 20 members from the data source when the load more is called.
  ///
  /// It requires the [lastUserId] of the last member fetched in the previous call.
  Future<DataState<List<MemberModel>>> fetchNext20Users(String lastUserId);
}
