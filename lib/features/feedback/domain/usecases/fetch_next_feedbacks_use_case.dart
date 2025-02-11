import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

class FetchNextFeedbacksUseCase
    extends UseCase<DataState<List<FeedbackModel>>, String> {
  final FeedbackRepository repository;

  FetchNextFeedbacksUseCase(this.repository);

  @override
  Future<DataState<List<FeedbackModel>>> call(String params) {
    return repository.fetchNextFeedbacks(params);
  }
}
