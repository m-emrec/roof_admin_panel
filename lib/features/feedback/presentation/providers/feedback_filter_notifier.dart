import 'package:core/utils/constants/enums/feedback_titles_enum.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_filter_types.dart';

class FeedbackFilterNotifier extends StateNotifier<List<FeedbackModel>> {
  FeedbackFilterNotifier({
    required List<FeedbackModel> feedbacks,
    required FeedbackResponseFilterTypes responseFilter,
    required FeedbackTitlesEnum? titleFilter,
  })  : _feedbacks = feedbacks,
        _titleFilter = titleFilter,
        _responseFilter = responseFilter,
        super(feedbacks) {
    _applyFilter();
  }

  final FeedbackResponseFilterTypes _responseFilter;
  final FeedbackTitlesEnum? _titleFilter;

  final List<FeedbackModel> _feedbacks;

  void _applyFilter() {
    state = _filterFeedbacksByResponse();
    state = _filterByTitle();
  }

  List<FeedbackModel> _filterByTitle() {
    if (_titleFilter == null) {
      // state = _feedbacks;
      return state;
    }
    final filtered = state
        .where((element) => element.feedbackTitle == _titleFilter)
        .toList();
    return filtered;
  }

  List<FeedbackModel> _filterFeedbacksByResponse() {
    switch (_responseFilter) {
      case FeedbackResponseFilterTypes.all:
        return _filterByResponseAll();
      case FeedbackResponseFilterTypes.responded:
        return _filterByResponseResponded();
      case FeedbackResponseFilterTypes.notResponded:
        return _filterByResponseNotResponded();
    }
  }

  List<FeedbackModel> _filterByResponseAll() {
    return _feedbacks;
  }

  List<FeedbackModel> _filterByResponseResponded() {
    return _feedbacks.where((element) => element.response != null).toList();
  }

  List<FeedbackModel> _filterByResponseNotResponded() {
    return _feedbacks.where((element) => element.response == null).toList();
  }
}
