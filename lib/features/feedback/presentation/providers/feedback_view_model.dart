import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/feedback/data/models/feedback_response_model.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_feedbacks_initial_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/fetch_next_feedbacks_use_case.dart';
import 'package:roof_admin_panel/features/feedback/domain/usecases/respond_feedback_use_case.dart';

/// FeedbackViewModel
class FeedbackViewModel extends StateNotifier<AsyncValue<List<FeedbackModel>>> {
  ///
  FeedbackViewModel({
    required FetchFeedbacksInitialUseCase fetchFeedbacksInitialUseCase,
    required FetchNextFeedbacksUseCase fetchNextFeedbacksUseCase,
    required RespondFeedbackUseCase respondFeedbackUseCase,
  })  : _fetchFeedbacksInitialUseCase = fetchFeedbacksInitialUseCase,
        _fetchNextFeedbacksUseCase = fetchNextFeedbacksUseCase,
        _respondFeedbackUseCase = respondFeedbackUseCase,
        super(
          const AsyncValue.loading(),
        ) {
    fetchFeedbacksInitial();
  }

  final FetchFeedbacksInitialUseCase _fetchFeedbacksInitialUseCase;
  final FetchNextFeedbacksUseCase _fetchNextFeedbacksUseCase;
  final RespondFeedbackUseCase _respondFeedbackUseCase;

  /// This method is used to respond to the feedback
  ///
  Future<void> respondFeedback(FeedbackResponseModel feedbackModel) async {
    DataState.handleDataStateBasedAction<void>(
      await _respondFeedbackUseCase(feedbackModel),
      onSuccess: (_) {
        state = AsyncValue.data(
          state.value
                  ?.map(
                    (e) => e.feedbackId == feedbackModel.feedbackId
                        ? e.copyWith(
                            response: feedbackModel.response,
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
  Future<void> fetchNextFeedbacks(String lastFeedbackId) async {
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

  /// Fetch the initial feedbacks
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
