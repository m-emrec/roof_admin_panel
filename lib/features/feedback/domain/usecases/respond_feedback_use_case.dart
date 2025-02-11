// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';

import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_response_entity.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';

class RespondFeedbackUseCase
    extends UseCase<DataState<void>, FeedbackResponseEntity> {
  final FeedbackRepository repository;
  RespondFeedbackUseCase(
    this.repository,
  );

  @override
  Future<DataState<void>> call(FeedbackResponseEntity params) {
    return repository.respondFeedback(params);
  }
}
