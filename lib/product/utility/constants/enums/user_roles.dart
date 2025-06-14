import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

enum UserRoles {
  manager,
  user,
  editor,
  viewer,
  developer,
  ;

  static final Map<UserRoles, String> _locales = {
    UserRoles.manager: LocaleKeys.userRoles_manager.tr(),
    UserRoles.user: LocaleKeys.userRoles_user.tr(),
    UserRoles.editor: LocaleKeys.userRoles_editor.tr(),
    UserRoles.viewer: LocaleKeys.userRoles_viewer.tr(),
    UserRoles.developer: LocaleKeys.userRoles_developer.tr(),
  };

  String toLocale() {
    return _locales[this] ?? '';
  }

  static UserRoles? fromLocale(String locale) {
    return _locales.entries.firstWhere((entry) => entry.value == locale).key;
  }

  static UserRoles? fromString(String role) {
    return UserRoles.values.firstWhere((e) => e.name == role);
  }
}
