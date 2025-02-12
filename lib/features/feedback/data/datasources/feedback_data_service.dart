import 'package:core/core.dart';
import 'package:core/utils/constants/firebase/feedback_doc_enum.dart';

/// This class is used to interact with the firestore to get the feedbacks
class FeedbackDataService extends FirebaseUtils with FirestoreUtils {
  /// This method is used to get the count of feedbacks
  Future<int> getFeedbackCount() async {
    final feedbacks =
        await getCollectionRef(CollectionEnum.feedbacks).count().get();
    return feedbacks.count ?? 0;
  }

  /// Fetches the first 20 feedbacks from the firestore
  Future<List<Map<String, dynamic>>> fetchFeedbacksInitial() async {
    final feedbacks = await getCollectionRef(CollectionEnum.feedbacks)
        .orderBy(
          FeedbackDocEnum.createdAt.name,
          descending: true,
        )
        .limit(20)
        .get();

    return feedbacks.docs.map((doc) => doc.data()).toList();
  }

  /// Fetches the next 20 feedbacks from the firestore
  Future<List<Map<String, dynamic>>> fetchNextFeedbacks(
    String lastFeedbackId,
  ) async {
    final feedbacks = await getOrderedCollectionQuery(
      collection: CollectionEnum.feedbacks,
      field: FeedbackDocEnum.createdAt.name,
      descending: true,
    )
        .startAfterDocument(
          await getDocumentRef(
            collection: CollectionEnum.feedbacks,
            docId: lastFeedbackId,
          ).get(),
        )
        .limit(20)
        .get();

    return feedbacks.docs.map((doc) => doc.data()).toList();
  }

  /// It takes a map of feedbackResponse and updates the feedback
  /// document with the response
  Future<void> respondFeedback(Map<String, dynamic> feedbackResponse) async {
    await updateDocument(
      collection: CollectionEnum.feedbacks,
      docId: feedbackResponse[FeedbackDocEnum.feedbackId.name].toString(),
      data: {
        FeedbackDocEnum.response.name:
            feedbackResponse[FeedbackDocEnum.response.name],
      },
    );
  }

  /// This method used for fetching the reported user's data
  ///
  /// It takes the phoneNumber of the user and returns the user's data
  ///
  // ignore: unintended_html_in_doc_comment
  /// as a Map<String, dynamic>
  Future<Map<String, dynamic>> fetchReportedUser(String phoneNumber) async {
    final query = await getCollectionRef(CollectionEnum.users)
        .where(
          UserDocEnum.phoneNumber.name,
          isEqualTo: phoneNumber,
        )
        .get();
    return query.docs.first.data();
  }

  /// This method is used to fetch the feedback owner's data
  ///
  /// It takes the uid of the user and returns the user's data
  ///
  Future<Map<String, dynamic>?> fetchFeedbackOwner(String uid) async {
    final user = getDocumentRef(collection: CollectionEnum.users, docId: uid)
        .get()
        .then((value) => value.data());
    return user;
  }
}
