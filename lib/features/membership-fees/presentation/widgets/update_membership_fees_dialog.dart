import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/widgets/update_membership_fees_state_mixin.dart';
import 'package:roof_admin_panel/product/widgets/app_text_button.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';

///
class UpdateMembershipFeesDialog extends ConsumerStatefulWidget {
  ///
  const UpdateMembershipFeesDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateMembershipFeesDialogState();
}

class _UpdateMembershipFeesDialogState
    extends ConsumerState<UpdateMembershipFeesDialog>
    with UpdateMembershipFeesStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog<void>.withCloseIcon(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SpacingSizes.medium,
          children: [
            ...textFields,
            Row(
              spacing: SpacingSizes.large,
              children: [
                ...discountDropdowns,
              ],
            ),
          ],
        ),
      ),
      actions: [
        AppTextButton(
          onPressed: () => CustomAlertDialog.hideAlertDialog<void>(context),
          title: LocaleKeys.common_cancel.tr(),
        ),
        AppTextButton(
          onPressed: updateMembershipFees,
          title: LocaleKeys.common_save.tr(),
        ),
      ],
    );
  }
}
