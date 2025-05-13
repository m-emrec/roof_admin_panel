part of 'feedback_tile.dart';

class _FeedbackTileImagesRow extends StatelessWidget {
  const _FeedbackTileImagesRow({required this.feedback});
  final FeedbackModel feedback;

  Future<void> onTapImage(
    BuildContext context,
    List<String> imageUrls,
    int index,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return _FeedbackImageViewer(
          imageUrls: imageUrls,
          index: index,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < (feedback.imageUrls?.length ?? 0); i++)
          GestureDetector(
            onTap: () => onTapImage(context, feedback.imageUrls ?? [], i),
            child: Card(
              shape: context.feedbackTileThemeExtension?.imageShape,
              child: Image.network(
                feedback.imageUrls?[i] ?? "",
                fit: BoxFit.cover,
                width: context.feedbackTileThemeExtension?.imageSize.width,
                height: context.feedbackTileThemeExtension?.imageSize.height,
              ),
            ),
          ),
      ],
    );
  }
}
