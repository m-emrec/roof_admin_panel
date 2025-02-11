/// FeedbackResponseEntity is a model class which is used to store the response of the feedback.
/// This entity needed for storing the feedback response.
class FeedbackResponseEntity {
  /// FeedbackResponseEntity is a model class which is used to store the response of the feedback.
  /// This entity needed for storing the feedback response.
  FeedbackResponseEntity({required this.response, required this.feedbackId});

  /// given response
  final String response;

  /// Id of the feedback to identify the feedback
  final String feedbackId;
}
