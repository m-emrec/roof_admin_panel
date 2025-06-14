import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/widgets/discount_dropdown.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/widgets/update_membership_fees_dialog.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

///
mixin UpdateMembershipFeesStateMixin
    on ConsumerState<UpdateMembershipFeesDialog> {
  final Map<String, TextEditingController> _feeControllers = {};
  final Map<String, TextEditingController> _discountControllers = {};

  ///
  final formKey = GlobalKey<FormState>();

  ///
  List<Widget> get discountDropdowns {
    return _discountControllers.entries.map((entry) {
      return DiscountDropdown(
        initialValue: int.parse(entry.value.text),
        title: LocaleKeys.membershipFeesView_discount.tr(
          gender: entry.key,
        ),
        controller: entry.value,
      );
    }).toList();
  }

  ///
  List<Widget> get textFields {
    return _feeControllers.entries.map((entry) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingSizes.medium,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${entry.key} ${LocaleKeys.common_date_month.tr()}",
            style: context.textTheme.labelLarge,
          ),
          Flexible(
            child: CustomTextField(
              controller: entry.value,
              label: entry.value.text,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (val) => ValidatorMethods(text: val).emptyField,
            ),
          ),
        ],
      );
    }).toList();
  }

  ///
  Future<void> updateMembershipFees() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(membershipFeesViewModelProvider.notifier)
          .updateMembershipFees(
            _feeControllers.map((key, value) => MapEntry(key, value.text)),
            _discountControllers.map(
              (key, value) => MapEntry(key, value.text),
            ),
          )
          .then(
            /// I check mounted in the [CustomAlertDialog]
            // ignore: use_build_context_synchronously
            (value) => CustomAlertDialog.hideAlertDialog<void>(context),
          )
          .showLoading(context: context);
    }
  }

  void _createFeeControllers() {
    ref
        .read(membershipFeesViewModelProvider)
        .value
        ?.rates
        .forEach((key, value) {
      _feeControllers[key] = TextEditingController(text: value.toString());
    });
  }

  void _createDiscountControllers() {
    ref
        .read(membershipFeesViewModelProvider)
        .value
        ?.discounts
        .forEach((key, value) {
      _discountControllers[key] = TextEditingController(text: value.toString());
    });
  }

  @override
  void initState() {
    _createFeeControllers();
    _createDiscountControllers();
    super.initState();
  }

  @override
  void dispose() {
    _feeControllers.forEach((key, value) {
      value.dispose();
    });
    _discountControllers.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }
}
