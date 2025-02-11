import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_response_entity.dart';

/// This model is used for storing the given response of the feedback.
class FeedbackResponseModel extends FeedbackResponseEntity {
  /// This model is used for storing the given response of the feedback.

  FeedbackResponseModel({
    required super.response,
    required super.feedbackId,
  });

  /// A factory method to convert [FeedbackResponseEntity] into
  /// [FeedbackResponseModel]
  factory FeedbackResponseModel.fromEntity(FeedbackResponseEntity entity) {
    return FeedbackResponseModel(
      response: entity.response,
      feedbackId: entity.feedbackId,
    );
  }

  /// A method to convert [FeedbackResponseModel] into [Map<String, dynamic>]
  Map<String, dynamic> toJson() {
    return {
      'response': response,
      'feedbackId': feedbackId,
    };
  }

  /// A method to convert [FeedbackResponseModel] into [FeedbackResponseEntity]
  FeedbackResponseEntity toEntity() {
    return FeedbackResponseEntity(
      response: response,
      feedbackId: feedbackId,
    );
  }
}
