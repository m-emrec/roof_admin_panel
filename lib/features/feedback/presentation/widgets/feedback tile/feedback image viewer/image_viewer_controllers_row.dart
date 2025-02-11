part of '../feedback_tile.dart';

/// A row of controllers that are used to navigate between the images in the
/// [FeedbackImageViewer].
class _ImageViewerControllersRow extends StatelessWidget {
  /// A row of controllers that are used to navigate between the images in the
  /// [FeedbackImageViewer].
  const _ImageViewerControllersRow({
    required PageController pageController,
    required Duration duration,
    required Curve curve,
  })  : _pageController = pageController,
        _duration = duration,
        _curve = curve;

  final PageController _pageController;
  final Duration _duration;
  final Curve _curve;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.backgroundColor[40] ?? Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: SpacingSizes.small,
        children: [
          IconButton(
            onPressed: () => _pageController.previousPage(
              duration: _duration,
              curve: _curve,
            ),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          CloseButton(
            onPressed: () => context.pop(),
          ),
          IconButton(
            onPressed: () => _pageController.nextPage(
              duration: _duration,
              curve: _curve,
            ),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
