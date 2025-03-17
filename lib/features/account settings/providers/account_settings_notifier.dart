import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/change_password_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_email_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_name_use_case.dart';

class AccountSettingsNotifier extends ChangeNotifier {
  AccountSettingsNotifier(
      {required ChangePasswordUseCase changePasswordUseCase,
      required UpdateEmailUseCase updateEmailUseCase,
      required UpdateNameUseCase updateNameUseCase})
      : _changePasswordUseCase = changePasswordUseCase,
        _updateEmailUseCase = updateEmailUseCase,
        _updateNameUseCase = updateNameUseCase;

  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateEmailUseCase _updateEmailUseCase;
  final UpdateNameUseCase _updateNameUseCase;

  Future<void> changePassword(String newPassword) async {
    await _changePasswordUseCase(newPassword);
    notifyListeners();
  }

  Future<void> updateEmail(String email) async {
    await _updateEmailUseCase(email);
    notifyListeners();
  }

  Future<void> updateName(String name) async {
    await _updateNameUseCase(name);
    notifyListeners();
  }
}
