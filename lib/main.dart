import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/enums/locale_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/route%20config/router.dart';
import 'package:roof_admin_panel/config/theme/app_theme.dart';
import 'package:roof_admin_panel/firebase_options.dart';
import 'package:toastification/toastification.dart';

part 'product/init/core_init.dart';
part 'product/init/localization_init.dart';

void main() async {
  await _CoreInit().init();

  runApp(
    EasyLocalization(
      supportedLocales: _LocalizationInit.supportedLocales,
      path: _LocalizationInit.path,
      fallbackLocale: _LocalizationInit.fallbackLocale,
      child: const ProviderScope(
        child: RoofApp(),
      ),
    ),
  );
}

///
class RoofApp extends StatelessWidget {
  ///
  const RoofApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme().lightTheme,
      ),
    );
  }
}
