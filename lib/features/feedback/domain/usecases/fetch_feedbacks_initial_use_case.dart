import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

/// A use case to fetch last feedbacks
class FetchFeedbacksInitialUseCase
    extends UseCase<DataState<List<FeedbackModel>>, NoParams> {
  /// A use case to fetch last feedbacks
  FetchFeedbacksInitialUseCase(
    this._repository,
  );
  final FeedbackRepository _repository;

  @override
  Future<DataState<List<FeedbackModel>>> call(NoParams params) {
    return _repository.fetchFeedbacksInitial();
  }
}
