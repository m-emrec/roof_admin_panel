import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/data/datasources/membership_detail_service.dart';
import 'package:roof_admin_panel/features/memberDetail/data/repositories/mebership_detail_repository_impl.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/repositories/member_detail_repository.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/ban_member_use_case.dart';
import 'package:roof_admin_panel/features/memberDetail/domain/usecases/edit_membership_details_use_case.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/membership_detail_notifier.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/views/member_detail.dart'
    show MemberDetailDialog;
import 'package:roof_admin_panel/product/widgets/custom_toast.dart';

final _serviceProvider = Provider<MembershipDetailService>((ref) {
  return MembershipDetailService();
});

final _repositoryProvider = Provider<MemberDetailRepository>((ref) {
  return MembershipDetailRepositoryImpl(
    ref.read(_serviceProvider),
  );
});

final _editMembershipDetailUseCaseProvider =
    Provider.autoDispose<EditMembershipDetailsUseCase>((ref) {
  return EditMembershipDetailsUseCase(
    ref.read(_repositoryProvider),
  );
});

final _banMemberUseCaseProvider = Provider<BanMemberUseCase>((ref) {
  return BanMemberUseCase(
    ref.read(_repositoryProvider),
  );
});

/// This provider used to provide a boolean value to check if the
/// [MemberDetailDialog] is in edit mode or not.
/// It is used to store the edit mode value and it is disposed when the
/// [MemberDetailDialog] feature is disposed.
///
/// **Default** value is `false`.
final isEditingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final banMemberProvider =
    FutureProvider.autoDispose.family<void, UserModel?>((ref, user) async {
  await Toast.toastDataStateMessageWrapper(
    dataState:
        await ref.read(_banMemberUseCaseProvider).call(user ?? UserModel()),
    successMessage: 'Member banned successfully',
  );
});

/// Provider for the [MembershipDetailNotifier].
///
/// This is intentionally **not** an `autoDispose` provider because it is
/// required throughout the entire lifecycle of the [MemberDetailDialog].
///
/// If we used `StateNotifierProvider.autoDispose`, the notifier would be
/// disposed as soon as the edit state becomes inactive, making it unusable
/// when navigating back or re-entering the dialog.
///
/// Therefore, to ensure the state remains accessible during editing, we use
/// a standard `StateNotifierProvider`.
final membershipDetailNotifierProvider =
    StateNotifierProvider.autoDispose<MembershipDetailNotifier, UserModel?>(
        (ref) {
  return MembershipDetailNotifier(
    ref,
    editMembershipDetailsUseCase:
        ref.read(_editMembershipDetailUseCaseProvider),
  );
});
