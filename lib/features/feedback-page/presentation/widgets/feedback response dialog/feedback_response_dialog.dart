import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback-page/data/models/feedback_response_model.dart';
import 'package:roof_admin_panel/features/feedback-page/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
part 'feedback_response_dialog_utils.dart';

/// Shows a dialog to respond to the feedback.
class FeedbackResponseDialog extends ConsumerStatefulWidget {
  /// Shows a dialog to respond to the feedback.
  const FeedbackResponseDialog(this.feedback, {super.key});

  ///
  final FeedbackModel feedback;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FeedbackResponseDialogState();
}

class _FeedbackResponseDialogState extends ConsumerState<FeedbackResponseDialog>
    with _FeedbackResponseDialogUtils {
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog<void>.withCloseIcon(
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: onTapSend,
          child: Text(LocaleKeys.common_send.tr()),
        ),
      ],
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.dynamicWidth(0.5),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SpacingSizes.small,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.feedback.content,
                  style: context.textTheme.titleMedium,
                ),
                Visibility(
                  visible: widget.feedback.response == null ||
                      widget.feedback.response!.isEmpty,
                  child: CustomTextArea(
                    controller: responseController,
                    validator: (value) =>
                        ValidatorMethods(text: value).emptyField,
                    focusNode: FocusNode(),
                    unfocusOnTapOutside: true,
                    label: LocaleKeys.feedback_response.tr(),
                    constraints: BoxConstraints(
                      maxHeight: context.dynamicHeight(0.3),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.feedback.response != null &&
                      widget.feedback.response!.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.feedback_response.tr(),
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        widget.feedback.response ?? "",
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).makeSelectable();
  }
}
