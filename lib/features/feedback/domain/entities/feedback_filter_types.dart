import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum FeedbackResponseFilterTypes {
  all,
  responded,
  notResponded,
  ;

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
