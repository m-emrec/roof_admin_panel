import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

class FetchFeedbackOwnerUseCase extends UseCase<DataState<UserModel>, String> {
  final FeedbackRepository repository;
  FetchFeedbackOwnerUseCase({
    required this.repository,
  });
  @override
  Future<DataState<UserModel>> call(String params) {
    return repository.fetchFeedbackOwner(params);
  }
}
