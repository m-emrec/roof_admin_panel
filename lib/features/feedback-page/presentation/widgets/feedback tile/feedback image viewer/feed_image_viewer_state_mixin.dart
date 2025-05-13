part of '../feedback_tile.dart';

/// A mixin written on top of the state of the [FeedbackImageViewer] widget.
///
/// This mixin contains the [PageController] and some other properties that are
/// used to control the page view of the images.
///
mixin FeedImageViewerStateMixin on State<_FeedbackImageViewer> {
  late final PageController _pageController;
  final Curve _curve = Curves.easeInOut;
  final Duration _duration = const Duration(milliseconds: 300);
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
