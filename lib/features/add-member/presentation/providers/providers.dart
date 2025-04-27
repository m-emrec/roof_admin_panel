import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/data/datasources/add_member_service.dart';
import 'package:roof_admin_panel/features/add-member/data/repositories/add_member_repository_impl.dart';
import 'package:roof_admin_panel/features/add-member/domain/repositories/add_member_repository.dart';
import 'package:roof_admin_panel/features/add-member/domain/usecases/add_new_member_use_case.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/add_member_view_model.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_table_source.dart';

final _addMemberServiceProvider = Provider<AddMemberService>((ref) {
  return AddMemberService();
});

final _repositoryProvider = Provider<AddMemberRepository>((ref) {
  return AddMemberRepositoryImpl(
    addMemberService: ref.read(_addMemberServiceProvider),
  );
});

final _addNewUserUseCaseProvider = Provider<AddNewMemberUseCase>((ref) {
  return AddNewMemberUseCase(
    addUserRepository: ref.read(_repositoryProvider),
  );
});

final shouldShowAddMemberTableProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});

final addMemberTableProvider =
    Provider.autoDispose<AddMemberTableSource>((ref) {
  return AddMemberTableSource(
    ref,
  );
});

/// AddMemberViewModel provider
final addMemberProvider = ChangeNotifierProvider<AddMemberViewModel>((ref) {
  return AddMemberViewModel(
    addNewUserUseCase: ref.read(_addNewUserUseCaseProvider),
  );
});
