import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum SortDirection {
  asc,
  desc,
  ;

  String get toLocale {
    switch (this) {
      case asc:
        return LocaleKeys.membersView_sort_ascending.tr();
      case desc:
        return LocaleKeys.membersView_sort_descending.tr();
    }
  }
}
