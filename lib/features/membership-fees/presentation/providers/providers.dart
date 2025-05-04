import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/membership-fees/data/datasources/membership_fees_service.dart';
import 'package:roof_admin_panel/features/membership-fees/data/models/membership_fees.dart';
import 'package:roof_admin_panel/features/membership-fees/data/repositories/membership_fees_repository_impl.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/repositories/membership_fees_repository.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/usecases/get_membership_fees_use_case.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/usecases/update_membership_fees_use_case.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/membership_fees_view_model.dart';

final _serviceProvider = Provider<MembershipFeesService>((ref) {
  return MembershipFeesService();
});

final _repositoryProvider = Provider<MembershipFeesRepository>((ref) {
  return MembershipFeesRepositoryImpl(ref.read(_serviceProvider));
});

final _getMembershipFeesUseCaseProvider =
    Provider<GetMembershipFeesUseCase>((ref) {
  return GetMembershipFeesUseCase(ref.read(_repositoryProvider));
});

final _updateMembershipFeesUseCaseProvider =
    Provider<UpdateMembershipFeesUseCase>((ref) {
  return UpdateMembershipFeesUseCase(ref.read(_repositoryProvider));
});

final viewModelProvider =
    StateNotifierProvider<MembershipFeesViewModel, AsyncValue<MembershipFees>>(
        (ref) {
  return MembershipFeesViewModel(
    getMembershipFeesUseCase: ref.read(_getMembershipFeesUseCaseProvider),
    updateMembershipFeesUseCase: ref.read(_updateMembershipFeesUseCaseProvider),
  );
});

final isEditStateProvider = StateProvider<bool>((ref) {
  return true;
});
