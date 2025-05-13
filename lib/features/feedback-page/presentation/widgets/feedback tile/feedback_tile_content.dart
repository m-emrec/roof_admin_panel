part of 'feedback_tile.dart';

class _FeedbackTileContent extends StatefulWidget {
  const _FeedbackTileContent({
    required this.feedback,
  });

  final FeedbackModel feedback;

  @override
  State<_FeedbackTileContent> createState() => _FeedbackTileContentState();
}

class _FeedbackTileContentState extends State<_FeedbackTileContent> {
  bool isExpanded = false;
  late String content;
  final int maxLen = 1200;
  bool get isLongText => content.length > maxLen;
  bool get showFullText => isLongText && !isExpanded;
  @override
  void initState() {
    content = widget.feedback.content.trim();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: showFullText ? "${content.substring(0, 1200)}... " : content,
        children: isLongText
            ? [
                InlineTextButton(
                  context,
                  text: isExpanded
                      ? LocaleKeys.common_seeLess.tr()
                      : LocaleKeys.common_seeMore.tr(),
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ]
            : [],
      ),
      style: context.feedbackTileThemeExtension?.contentTextStyle,
    );
  }
}
