import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

/// This enum is used to filter the feedbacks based on the response state
/// [all] - All feedbacks
/// [responded] - Feedbacks that are responded
/// [notResponded] - Feedbacks that are not responded
enum FeedbackResponseFilterTypes {
  /// All feedbacks
  all,

  /// Feedbacks that are responded
  responded,

  /// Feedbacks that are not responded
  notResponded,
  ;

  /// This method returns the localized text of the [FeedbackResponseFilterTypes] enum
  String localizedString() {
    switch (this) {
      case FeedbackResponseFilterTypes.all:
        return LocaleKeys.feedback_filter_stateFilter_all.tr();
      case FeedbackResponseFilterTypes.responded:
        return LocaleKeys.feedback_filter_stateFilter_responded.tr();
      case FeedbackResponseFilterTypes.notResponded:
        return LocaleKeys.feedback_filter_stateFilter_notResponded.tr();
    }
  }
}
