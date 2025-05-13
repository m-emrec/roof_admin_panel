import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/feedback-page/data/models/feedback_response_model.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/usecases/fetch_feedbacks_initial_use_case.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/usecases/fetch_next_feedbacks_use_case.dart';
import 'package:roof_admin_panel/features/feedback-page/domain/usecases/respond_feedback_use_case.dart';

/// FeedbackViewModel
class FeedbackViewModel extends StateNotifier<AsyncValue<List<FeedbackModel>>> {
  ///
  FeedbackViewModel({
    required FetchFeedbacksInitialUseCase fetchFeedbacksInitialUseCase,
    required FetchNextFeedbacksUseCase fetchNextFeedbacksUseCase,
    required RespondFeedbackUseCase respondFeedbackUseCase,
    required int feedbackCount,
  })  : _fetchFeedbacksInitialUseCase = fetchFeedbacksInitialUseCase,
        _fetchNextFeedbacksUseCase = fetchNextFeedbacksUseCase,
        _respondFeedbackUseCase = respondFeedbackUseCase,
        _feedbackCount = feedbackCount,
        super(
          const AsyncValue.loading(),
        ) {
    fetchFeedbacksInitial();
  }
  final int _feedbackCount;
  final FetchFeedbacksInitialUseCase _fetchFeedbacksInitialUseCase;
  final FetchNextFeedbacksUseCase _fetchNextFeedbacksUseCase;
  final RespondFeedbackUseCase _respondFeedbackUseCase;

  /// This method is used to respond to the feedback
  ///
  Future<void> respondToFeedback(FeedbackResponseModel response) async {
    DataState.handleDataStateBasedAction<void>(
      await _respondFeedbackUseCase(response),
      onSuccess: (_) {
        state = AsyncValue.data(
          state.value
                  ?.map(
                    (e) => e.feedbackId == response.feedbackId
                        ? e.copyWith(
                            response: response.response,
                          )
                        : e,
                  )
                  .toList() ??
              [],
        );
      },
      onFailure: (error) {
        state = AsyncValue.error(error?.errorMessage ?? '', StackTrace.current);
      },
    );
  }

  /// Fetch the next feedbacks
  ///
  /// It requires [String][lastFeedbackId] to fetch the next feedbacks
  Future<void> fetchNextFeedbacks(String lastFeedbackId) async {
    /// If the feedback count is equal to the length of the feedbacks
    /// this means that there are no more feedbacks to fetch
    /// so we return to avoid unnecessary API calls
    if (state.value?.length == _feedbackCount) {
      return;
    }

    DataState.handleDataStateBasedAction<List<FeedbackModel>>(
      await _fetchNextFeedbacksUseCase(lastFeedbackId),
      onSuccess: (result) {
        state = AsyncValue.data([
          ...state.value ?? [],
          ...result.resultData ?? [],
        ]);
      },
      onFailure: (error) {
        state = AsyncValue.error(error?.errorMessage ?? '', StackTrace.current);
      },
    );
  }

  ///
  /// This method is used to fetch the initial feedbacks
  /// It is called when the view model is initialized
  Future<void> fetchFeedbacksInitial() async {
    state = const AsyncValue.loading();
    DataState.handleDataStateBasedAction<List<FeedbackModel>>(
      await _fetchFeedbacksInitialUseCase(const NoParams()),
      onSuccess: (result) {
        state = AsyncValue.data(result.resultData ?? []);
      },
      onFailure: (error) {
        state = AsyncValue.error(error?.errorMessage ?? '', StackTrace.current);
      },
    );
  }
}
