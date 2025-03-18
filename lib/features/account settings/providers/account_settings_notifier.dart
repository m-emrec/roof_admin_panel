// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/data/models/update_email_model.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/change_password_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_email_on_fire_store_after_verification.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_email_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_name_use_case.dart';
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

class AccountSettingsNotifier extends ChangeNotifier {
  AccountSettingsNotifier({
    required ChangePasswordUseCase changePasswordUseCase,
    required UpdateEmailUseCase updateEmailUseCase,
    required UpdateEmailOnFireStoreAfterVerificationUseCase
        updateEmailOnFireStoreAfterVerification,
    required UpdateNameUseCase updateNameUseCase,
  })  : _changePasswordUseCase = changePasswordUseCase,
        _updateEmailUseCase = updateEmailUseCase,
        _updateNameUseCase = updateNameUseCase,
        _updateEmailOnFireStoreAfterVerification =
            updateEmailOnFireStoreAfterVerification;

  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateEmailUseCase _updateEmailUseCase;
  final UpdateNameUseCase _updateNameUseCase;
  final UpdateEmailOnFireStoreAfterVerificationUseCase
      _updateEmailOnFireStoreAfterVerification;

  Future<void> changePassword(String newPassword) async {
    await Toast.toastDataStateMessageWrapper(
      dataState: await _changePasswordUseCase(newPassword),
      successMessage: LocaleKeys.accountSettingView_changePasswordSuccess.tr(),
    );
    notifyListeners();
  }

  Future<void> updateEmail(String email) async {
    await Toast.toastDataStateMessageWrapper(
      dataState: await _updateEmailUseCase(email),
      successMessage: LocaleKeys.accountSettingView_changeEmailSuccess.tr(),
    );

    notifyListeners();
  }

  Future<void> updateName(String name) async {
    await Toast.toastDataStateMessageWrapper(
      dataState: await _updateNameUseCase(name),
      successMessage: LocaleKeys.accountSettingView_changeNameSuccess.tr(),
    );
    notifyListeners();
  }

  Future<DataState<void>> updateEmailOnFireStoreAfterVerification(
    String uid,
    String email,
  ) async {
    final dataState = await _updateEmailOnFireStoreAfterVerification(
      UpdateEmailModel(email: email, uid: uid),
    );
    unawaited(
      Toast.toastDataStateMessageWrapper(
        dataState: dataState,
        successMessage: LocaleKeys.accountSettingView_changeEmailSuccess.tr(),
      ),
    );
    return dataState;
  }
}
