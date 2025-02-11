part of 'feedback_tile.dart';

/// This widget is used to display the title and content of the feedback.
class _FeedbackTitleAndContent extends StatelessWidget {
  const _FeedbackTitleAndContent({
    required this.feedback,
    required bool isExpanded,
  }) : _isExpanded = isExpanded;

  final FeedbackModel feedback;
  final bool _isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feedback.feedbackTitle?.name ?? "",
              style: context.textTheme.titleMedium,
            ),
            Text(
              feedback.createdAt.formatDate(context),
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
        Text(
          feedback.feedbackSubTitle?.name ?? "",
          style: context.textTheme.titleSmall,
        ),
        Visibility(
          visible: feedback.reportedUserId?.isNotEmpty ?? false,
          child: ReportedUser(reportedUserId: feedback.reportedUserId ?? ""),
        ),
        const EmptyBox.xSmallGap(),
        Text(
          feedback.content,
          maxLines: _isExpanded ? 10 : 3,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
