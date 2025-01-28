import 'package:roof_admin_panel/core/resources/data_state.dart';
import 'package:roof_admin_panel/core/resources/use_case.dart';
import 'package:roof_admin_panel/features/members/domain/repositories/members_repository.dart';

/// [FetchTotalUsersCountUseCase] is a use case responsible for fetching the total number of members.
class FetchTotalUsersCountUseCase extends UseCase<DataState<int>, NoParams> {
  /// [FetchTotalUsersCountUseCase] is a use case responsible for fetching the total number of members.

  FetchTotalUsersCountUseCase({
    required this.repository,
  });

  ///
  final MembersRepository repository;

  @override
  Future<DataState<int>> call(NoParams params) {
    return repository.fetchTotalUsers();
  }
}
