import 'package:core/resources/use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

class GetFeedbackCountUseCase extends UseCase<int, NoParams> {
  GetFeedbackCountUseCase(this._repository);

  final FeedbackRepository _repository;
  @override
  Future<int> call(NoParams params) {
    return _repository.getFeedbackCount();
  }
}
