import 'package:core/resources/data_state.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/entities/feedback_response_entity.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

/// An interface for the feedback repository
abstract class FeedbackRepository {
  /// Fetches the first 20 feedbacks from the server
  Future<DataState<List<FeedbackModel>>> fetchFeedbacksInitial();

  /// Fetches the next 20 feedbacks from the server
  Future<DataState<List<FeedbackModel>>> fetchNextFeedbacks(
    String lastFeedbackId,
  );

  /// Responds to a feedback
  Future<DataState<void>> respondFeedback(
    FeedbackResponseEntity feedbackResponseEntity,
  );

  /// Fetches the total number of feedbacks
  ///
  ///
  Future<int> getFeedbackCount();

  /// Fetches the reported user
  ///
  Future<DataState<MemberModel>> fetchReportedUser(String phoneNumber);

  /// Fetches the report owner
  Future<DataState<MemberModel>> fetchFeedbackOwner(String uid);
}
