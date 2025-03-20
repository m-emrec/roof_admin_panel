import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/account%20settings/data/datasources/account_settings_database_service.dart';
import 'package:roof_admin_panel/features/account%20settings/data/repositories/account_settings_repository_impl.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/repositories/account_settings_repository.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/change_password_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_email_on_fire_store_after_verification.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_email_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_name_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/usecases/update_profile_picture_use_case.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/providers/account_settings_notifier.dart';

final _serviceProvider = Provider<AccountSettingsDatabaseService>((ref) {
  return AccountSettingsDatabaseService();
});

final _accountSettingsRepositoryProvider =
    Provider<AccountSettingsRepository>((ref) {
  return AccountSettingsRepositoryImpl(ref.read(_serviceProvider));
});

final _changePasswordUseCaseProvider = Provider<ChangePasswordUseCase>((ref) {
  return ChangePasswordUseCase(ref.read(_accountSettingsRepositoryProvider));
});

final _updateEmailUseCaseProvider = Provider<UpdateEmailUseCase>((ref) {
  return UpdateEmailUseCase(ref.read(_accountSettingsRepositoryProvider));
});

final _updateNameUseCaseProvider = Provider<UpdateNameUseCase>((ref) {
  return UpdateNameUseCase(ref.read(_accountSettingsRepositoryProvider));
});

final _changeProfilePictureUseCaseProvider =
    Provider<UpdateProfilePictureUseCase>((ref) {
  return UpdateProfilePictureUseCase(
      ref.read(_accountSettingsRepositoryProvider));
});
final _updateEmailOnFireStoreAfterVerificationUseCaseProvider =
    Provider<UpdateEmailOnFireStoreAfterVerificationUseCase>((ref) {
  return UpdateEmailOnFireStoreAfterVerificationUseCase(
      ref.read(_accountSettingsRepositoryProvider));
});

final accountSettingsNotifierProvider =
    ChangeNotifierProvider<AccountSettingsNotifier>((ref) {
  return AccountSettingsNotifier(
    changePasswordUseCase: ref.read(_changePasswordUseCaseProvider),
    updateEmailUseCase: ref.read(_updateEmailUseCaseProvider),
    updateNameUseCase: ref.read(_updateNameUseCaseProvider),
    updateEmailOnFireStoreAfterVerification:
        ref.read(_updateEmailOnFireStoreAfterVerificationUseCaseProvider),
    updateProfilePictureUseCase: ref.read(_changeProfilePictureUseCaseProvider),
  );
});
