import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/data/models/feedback_response_model.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';
part 'feedback_response_dialog_utils.dart';

/// Shows a dialog to respond to the feedback.
class FeedbackResponseDialog extends ConsumerWidget {
  /// Shows a dialog to respond to the feedback.
  FeedbackResponseDialog(this.feedback, {super.key});

  ///
  final FeedbackModel feedback;

  final TextEditingController _responseController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAlertDialog(
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () => _FeedbackResponseDialogUtils.onTapSend(
            context,
            feedback,
            _responseController,
            _formKey,
            ref,
          ),
          child: Text(LocaleKeys.common_send.tr()),
        ),
      ],
      content: SizedBox(
        width: context.dynamicWidth(0.5),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: SpacingSizes.small,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                feedback.content,
                style: context.textTheme.titleMedium,
              ),
              CustomTextArea(
                controller: _responseController,
                validator: (value) => ValidatorMethods(text: value).emptyField,
                focusNode: FocusNode(),
                unfocusOnTapOutside: true,
                label: LocaleKeys.feedback_response.tr(),
                constraints: BoxConstraints(
                  maxHeight: context.dynamicHeight(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    ).makeSelectable();
  }
}
