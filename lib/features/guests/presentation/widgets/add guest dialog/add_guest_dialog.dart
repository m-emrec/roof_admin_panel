import 'package:core/utils/constants/constant_values.dart';
import 'package:core/utils/constants/enums/gender.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/custom_side_dialog.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/gender_drop_down.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/phone_field.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';
part 'add_guest_form.dart';
part 'add_guest_properties.dart';
part 'add_guest_dialog_state_mixin.dart';

/// An [AlertDialog] that is used to add a guest.
///
/// This dialog is used in the [AddGuestButton] widget.
///
class AddGuestDialog extends ConsumerStatefulWidget {
  /// An [AlertDialog] that is used to add a guest.
  ///
  /// This dialog is used in the [AddGuestButton] widget.
  ///
  const AddGuestDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGuestDialogState();
}

class _AddGuestDialogState extends ConsumerState<AddGuestDialog>
    with AddGuestDialogStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomRightSideDialog(
      actions: [
        TextButton(
          child: Text(LocaleKeys.common_cancel.tr()),
          onPressed: () => CustomRightSideDialog.hide(context),
        ),
        ElevatedButton(
          onPressed: onPressedAdd,
          child: Text(LocaleKeys.common_add.tr()),
        ),
      ],
      title: Text(LocaleKeys.guestsView_addGuest.tr()),
      content: const _AddGuestForm(),
    );
  }
}
