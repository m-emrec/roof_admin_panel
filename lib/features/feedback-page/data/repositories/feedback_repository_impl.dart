import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/feedback-page/data/datasources/feedback_data_service.dart';
import 'package:roof_admin_panel/features/feedback-page/data/models/feedback_response_model.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/entities/feedback_response_entity.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/repositories/feedback_repository.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// Implementation of [FeedbackRepository]
class FeedbackRepositoryImpl implements FeedbackRepository {
  /// Implementation of [FeedbackRepository]
  FeedbackRepositoryImpl(this._service);

  final FeedbackDataService _service;

  @override
  Future<DataState<List<FeedbackModel>>> fetchFeedbacksInitial() {
    return DataState.handleDataState(
      () async {
        final feedbacks = await _service.fetchFeedbacksInitial();
        return feedbacks.map(FeedbackModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<List<FeedbackModel>>> fetchNextFeedbacks(
    String lastFeedbackId,
  ) {
    return DataState.handleDataState(
      () async {
        final feedbacks = await _service.fetchNextFeedbacks(
          lastFeedbackId,
        );
        return feedbacks.map(FeedbackModel.fromJson).toList();
      },
    );
  }

  @override
  Future<DataState<void>> respondFeedback(
    FeedbackResponseEntity feedbackResponseEntity,
  ) {
    return DataState.handleDataState(
      () async {
        await _service.respondFeedback(
          FeedbackResponseModel.fromEntity(feedbackResponseEntity).toJson(),
        );
      },
    );
  }

  @override
  Future<int> getFeedbackCount() {
    return _service.getFeedbackCount();
  }

  @override
  Future<DataState<MemberModel>> fetchReportedUser(String phoneNumber) {
    return DataState.handleDataState(
      () async {
        final user = await _service.fetchReportedUser(phoneNumber);
        return MemberModel.fromJson(user);
      },
    );
  }

  @override
  Future<DataState<MemberModel>> fetchFeedbackOwner(String uid) {
    return DataState.handleDataState(
      () async {
        final user = await _service.fetchFeedbackOwner(uid);

        return MemberModel.fromJson(user ?? {});
      },
    );
  }
}
