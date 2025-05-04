import 'package:core/resources/data_state.dart';
import 'package:core/resources/error_manager.dart';
import 'package:core/resources/use_case.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/membership-fees/data/models/membership_fees.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/usecases/get_membership_fees_use_case.dart';
import 'package:roof_admin_panel/features/membership-fees/domain/usecases/update_membership_fees_use_case.dart';

///
class MembershipFeesViewModel
    extends StateNotifier<AsyncValue<MembershipFees>> {
  /// Constructor
  MembershipFeesViewModel({
    required GetMembershipFeesUseCase getMembershipFeesUseCase,
    required UpdateMembershipFeesUseCase updateMembershipFeesUseCase,
  })  : _getMembershipFeesUseCase = getMembershipFeesUseCase,
        _updateMembershipFeesUseCase = updateMembershipFeesUseCase,
        super(const AsyncValue.loading()) {
    _getMembershipRates();
  }

  final GetMembershipFeesUseCase _getMembershipFeesUseCase;
  final UpdateMembershipFeesUseCase _updateMembershipFeesUseCase;
  Future<void> _getMembershipRates() async {
    DataState.handleDataStateBasedAction(
      await _getMembershipFeesUseCase(const NoParams()),
      onSuccess: (data) {
        if (data.resultData == null) {
          state = AsyncValue.error(
            LocaleKeys.errors_not_found.tr(),
            StackTrace.current,
          );
          return;
        }
        state = AsyncValue.data(MembershipFees.fromEntity(data.resultData!));
      },
      onFailure: (fail) => state = AsyncValue.error(
        AppErrorText.errorMessageConverter(fail?.errorMessage ?? ""),
        StackTrace.current,
      ),
    );
  }

  ///
  Future<void> updateMembershipFees(
    Map<String, String> rates,
    Map<String, String> discounts,
  ) async {
    final model = _createModel(rates, discounts);
    DataState.handleDataStateBasedAction(
      await _updateMembershipFeesUseCase(model),
      onSuccess: (_) => _getMembershipRates(),
      onFailure: (fail) => state = AsyncValue.error(
        AppErrorText.errorMessageConverter(fail?.errorMessage ?? ''),
        StackTrace.current,
      ),
    );
  }

  MembershipFees _createModel(
    Map<String, String> rates,
    Map<String, String> discounts,
  ) {
    return MembershipFees(
      rates: rates.map((key, value) => MapEntry(key, int.parse(value))),
      discounts: discounts.map((key, value) => MapEntry(key, int.parse(value))),
    );
  }
}
