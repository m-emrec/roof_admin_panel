part of 'feedback_tile.dart';

class _FeedbackTileHeader extends StatelessWidget {
  const _FeedbackTileHeader({
    required this.feedback,
  });

  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedback.feedbackTitle?.name ?? "",
              style: context.textTheme.titleMedium,
            ),
            Text(
              feedback.feedbackSubTitle?.name ?? "",
              style: context.textTheme.titleSmall,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              feedback.createdAt.formatDate(context),
              style: context.textTheme.bodySmall,
            ),
            Visibility(
              visible: feedback.reportedUserId?.isNotEmpty ?? false,
              child: ReportedUser(
                reportedUserId: feedback.reportedUserId ?? "",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
