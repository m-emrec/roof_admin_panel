import 'package:core/resources/data_state.dart';
import 'package:roof_admin_panel/features/account%20settings/domain/entities/password_enitiy.dart';

abstract class AccountSettingsRepository {
  Future<DataState<void>> changePassword(
    PasswordEntity passwordEntity,
  );

  Future<DataState<void>> updateEmail(String email);

  Future<DataState<void>> updateName(String name);

  Future<DataState<void>> updateProfilePicture(String profilePicture);
}
