import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roof_admin_panel/product/widgets/animated-text/animated_text.dart';

mixin AnimatedTextStateMixin on State<AnimatedText> {
  late final ScrollController scrollController;
  bool isHovering = false;
  final widgetKey = GlobalKey();
  double? boxWidth;
  final Duration _toStartDuration = Duration(milliseconds: 1000);
  final Duration _toEndDuration = Duration(seconds: 2);
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_listener);
    _getBoxWidth();
    super.initState();
  }

  void _getBoxWidth() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        boxWidth = box.size.width;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_listener)
      ..dispose();
    widgetKey.currentState?.dispose();
    super.dispose();
  }

  void _listener() {
    if (scrollController.position.pixels == _getTextWidth) {
      _animateToStart();
    } else if (scrollController.position.pixels == 0 && isHovering) {
      _scrollToEnd();
    }
  }

  double get _getTextWidth {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width;
  }

  void onExit(PointerExitEvent _) {
    _jumpToStart();
    _setHoverState(false);
  }

  void onEnter(PointerEnterEvent _) {
    if (boxWidth == null) return;
    if (boxWidth! < _getTextWidth) {
      _setHoverState(true);
      _scrollToEnd();
    }
  }

  void _jumpToStart() {
    scrollController.jumpTo(0);
  }

  void _animateToStart() {
    scrollController.animateTo(
      0,
      duration: _toStartDuration,
      curve: Curves.easeIn,
    );
  }

  void _scrollToEnd() {
    scrollController.animateTo(
      _getTextWidth,
      duration: _toEndDuration,
      curve: Curves.easeIn,
    );
  }

  void _setHoverState(bool value) {
    isHovering = value;
    setState(() {});
  }
}
