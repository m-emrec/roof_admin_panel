part of 'feedback_response_dialog.dart';

class _FeedbackResponseDialogUtils {
  static Future<void> onTapSend(
    BuildContext context,
    FeedbackModel feedback,
    TextEditingController responseController,
    GlobalKey<FormState> formKey,
    WidgetRef ref,
  ) async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(feedbackViewModelProvider.notifier)
          .respondFeedback(
            FeedbackResponseModel(
              response: responseController.text,
              feedbackId: feedback.feedbackId,
            ),
          )
          .showLoading(context: context)
          .then(
            (_) => _dispose(responseController, context),
          );
    }
  }

  static void _dispose(
    TextEditingController responseController,
    BuildContext context,
  ) {
    CustomAlertDialog.hideAlertDialog(context);
    responseController.dispose();
  }
}
