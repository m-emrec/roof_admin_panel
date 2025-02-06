import 'package:core/resources/data_state.dart';
import 'package:core/resources/use_case.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/sidebar/data/datasources/side_base_database_service.dart';
import 'package:roof_admin_panel/features/sidebar/data/repositories/side_bar_repository_impl.dart';
import 'package:roof_admin_panel/features/sidebar/domain/repositories/side_bar_repositoyry.dart';
import 'package:roof_admin_panel/features/sidebar/domain/usecases/get_user_use_case.dart';

final _databaseServiceProvider = Provider<SideBarDatabaseService>((ref) {
  return SideBarDatabaseService();
});

final _repositoryProvider = Provider<SideBarRepositoyry>((ref) {
  return SideBarRepositoryImpl(
      databaseService: ref.read(_databaseServiceProvider));
});

final _getUserUseCaseProvider = Provider<GetUserUseCase>((ref) {
  return GetUserUseCase(ref.read(_repositoryProvider));
});

final sideBarUserProvider = FutureProvider<UserModel?>((ref) async {
  final dataState = await ref.read(_getUserUseCaseProvider)(const NoParams());

  return DataState.handleDataStateBasedAction(
    dataState,
    onSuccess: () => dataState.resultData,
    onFailure: () => null,
  );
});
