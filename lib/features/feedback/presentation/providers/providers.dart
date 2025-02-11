import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/feedback/data/datasources/feedback_data_service.dart';
import 'package:roof_admin_panel/features/feedback/data/repositories/feedback_repository_impl.dart';
import 'package:roof_admin_panel/features/feedback/domain/repositories/feedback_repository.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_feedback_owner_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_feedbacks_initial_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_next_feedbacks_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_reported_user_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/get_feedback_count_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/respond_feedback_use_case.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/feedback_view_model.dart';

final _feedbackDataServiceProvider = Provider<FeedbackDataService>((ref) {
  return FeedbackDataService();
});

final _feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  return FeedbackRepositoryImpl(ref.read(_feedbackDataServiceProvider));
});

final _fetchFeedbacksInitialUseCaseProvider =
    Provider<FetchFeedbacksInitialUseCase>((ref) {
  return FetchFeedbacksInitialUseCase(ref.read(_feedbackRepositoryProvider));
});

final _fetchNextFeedbacksUseCaseProvider =
    Provider<FetchNextFeedbacksUseCase>((ref) {
  return FetchNextFeedbacksUseCase(ref.read(_feedbackRepositoryProvider));
});

final _respondFeedbackUseCaseProvider = Provider<RespondFeedbackUseCase>((ref) {
  return RespondFeedbackUseCase(ref.read(_feedbackRepositoryProvider));
});

final _getFeedbackCountUseCaseProvider =
    Provider<GetFeedbackCountUseCase>((ref) {
  return GetFeedbackCountUseCase(ref.read(_feedbackRepositoryProvider));
});

final _fetchReportedUserUseCaseProvider =
    Provider<FetchReportedUserUseCase>((ref) {
  return FetchReportedUserUseCase(
    repository: ref.read(_feedbackRepositoryProvider),
  );
});

final _fetchFeedbackOwnerUseCaseProvider =
    Provider<FetchFeedbackOwnerUseCase>((ref) {
  return FetchFeedbackOwnerUseCase(
    repository: ref.read(_feedbackRepositoryProvider),
  );
});

/// [feedbackOwnerProvider] the user data of the feedback owner
///
/// It takes a [String] uid and returns a [UserModel]
final feedbackOwnerProvider =
    FutureProvider.family<UserModel, String>((ref, uid) async {
  final dataState =
      await ref.read(_fetchFeedbackOwnerUseCaseProvider).call(uid);
  if (dataState is DataSuccess) return dataState.resultData ?? UserModel();
  return UserModel();
});

/// [reportedUserProvider] provides the user data of the reported user
///
/// It takes a [String] phoneNumber and returns a [UserModel]
final reportedUserProvider =
    FutureProvider.family<UserModel, String>((ref, phoneNumber) async {
  final dataState =
      await ref.read(_fetchReportedUserUseCaseProvider).call(phoneNumber);
  if (dataState is DataSuccess) return dataState.resultData ?? UserModel();
  return UserModel();
});

/// [feedbackCountProvider] provides the total count of feedbacks
final feedbackCountProvider = FutureProvider<int>((ref) async {
  return ref.read(_getFeedbackCountUseCaseProvider).call(const NoParams());
});

/// [feedbackViewModelProvider] provides the feedbacks
///
/// returns a list of [FeedbackModel] as a [AsyncValue]
final feedbackViewModelProvider =
    StateNotifierProvider<FeedbackViewModel, AsyncValue<List<FeedbackModel>>>(
        (ref) {
  return FeedbackViewModel(
    fetchFeedbacksInitialUseCase:
        ref.read(_fetchFeedbacksInitialUseCaseProvider),
    fetchNextFeedbacksUseCase: ref.read(_fetchNextFeedbacksUseCaseProvider),
    respondFeedbackUseCase: ref.read(_respondFeedbackUseCaseProvider),
  );
});
