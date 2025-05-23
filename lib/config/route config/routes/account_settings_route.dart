import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/route%20config/routes/base_route_class.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/pages/account_settings_page.dart';

final class AccountSettingsRoute extends BaseRouteClass {
  @override
  String get name => "AccountSettings";
  @override
  String get title => LocaleKeys.accountSettingView_pageTitle.tr();
  @override
  Widget Function(BuildContext context, GoRouterState state) get pageBuilder =>
      (context, state) => const AccountSettingsPage();

  @override
  String get path => "/hesap-ayarlari";
}
