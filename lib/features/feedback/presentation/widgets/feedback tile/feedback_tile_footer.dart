part of 'feedback_tile.dart';

class _FeedbackTileFooter extends StatelessWidget {
  const _FeedbackTileFooter({
    required this.feedback,
  });

  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () => CustomAlertDialog.showAlertDialog(
            context: context,
            content: FeedbackResponseDialog(feedback),
            barrierDismissible: true,
          ),
          child: Text(
            (feedback.response?.isEmpty ?? true)
                ? LocaleKeys.feedback_responseButtonLabel.tr()
                : LocaleKeys.feedback_responded.tr(),
          ),
        ),
      ],
    );
  }
}
