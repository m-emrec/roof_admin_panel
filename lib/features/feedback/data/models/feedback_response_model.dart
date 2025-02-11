import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_response_entity.dart';

class FeedbackResponseModel extends FeedbackResponseEntity {
  FeedbackResponseModel({
    required super.response,
    required super.feedbackId,
  });

  factory FeedbackResponseModel.fromEntity(FeedbackResponseEntity entity) {
    return FeedbackResponseModel(
      response: entity.response,
      feedbackId: entity.feedbackId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'feedbackId': feedbackId,
    };
  }

  FeedbackResponseEntity toEntity() {
    return FeedbackResponseEntity(
      response: response,
      feedbackId: feedbackId,
    );
  }
}
