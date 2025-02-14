part of 'feedback_response_dialog.dart';

mixin _FeedbackResponseDialogUtils on ConsumerState<FeedbackResponseDialog> {
  final TextEditingController responseController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> onTapSend() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(feedbackViewModelProvider.notifier)
          .respondToFeedback(
            FeedbackResponseModel(
              response: responseController.text,
              feedbackId: widget.feedback.feedbackId,
            ),
          )
          .showLoading(context: context)
          .then((_) {
        CustomAlertDialog.hideAlertDialog(context);
      });
    }
  }

  @override
  void dispose() {
    responseController.dispose();
    super.dispose();
  }
}
