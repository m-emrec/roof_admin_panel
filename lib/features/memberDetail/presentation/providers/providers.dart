import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/data/repositories/mebership_detail_repository_impl.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/edit_membership_details_use_case.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/membership_detail_notifier.dart';

final _repositoryProvider = Provider<MemberDetailRepository>((ref) {
  return MembershipDetailRepositoryImpl();
});

final _editMembershipDetailUseCaseProvider =
    Provider.autoDispose<EditMembershipDetailsUseCase>((ref) {
  return EditMembershipDetailsUseCase(
    ref.read(_repositoryProvider),
  );
});

final memberProvider = StateProvider.autoDispose<UserModel?>((ref) {
  return null;
});

final isEditingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final membershipDetailNotifierProvider =
    StateNotifierProvider<MembershipDetailNotifier, UserModel>((ref) {
  return MembershipDetailNotifier(
    ref.watch(memberProvider) as UserModel,
    editMembershipDetailsUseCase:
        ref.read(_editMembershipDetailUseCaseProvider),
  );
});
