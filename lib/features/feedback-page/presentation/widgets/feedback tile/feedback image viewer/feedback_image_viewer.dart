part of '../feedback_tile.dart';

///
/// This widget is used to display the full image of the feedback image.
class _FeedbackImageViewer extends StatefulWidget {
  ///
  /// This widget is used to display the full image of the feedback image.
  const _FeedbackImageViewer({
    required this.imageUrls,
    required this.index,
  });
  final List<String> imageUrls;
  final int index;

  @override
  State<_FeedbackImageViewer> createState() => _FeedbackImageViewerState();
}

class _FeedbackImageViewerState extends State<_FeedbackImageViewer>
    with FeedImageViewerStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                for (final imageUrl in widget.imageUrls)
                  InteractiveViewer(
                    maxScale: 5,
                    child: Image.network(
                      imageUrl,
                    ),
                  ),
              ],
            ),
          ),
          _ImageViewerControllersRow(
            pageController: _pageController,
            duration: _duration,
            curve: _curve,
          ),
        ],
      ),
    );
  }
}
