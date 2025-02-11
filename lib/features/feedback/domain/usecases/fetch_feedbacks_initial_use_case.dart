import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

class FetchFeedbacksInitialUseCase
    extends UseCase<DataState<List<FeedbackModel>>, NoParams> {
  final FeedbackRepository repository;

  FetchFeedbacksInitialUseCase(this.repository);

  @override
  Future<DataState<List<FeedbackModel>>> call(NoParams params) {
    return repository.fetchFeedbacksInitial();
  }
}
