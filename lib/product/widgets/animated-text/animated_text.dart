import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/animated-text/animated_text_State_mixin.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText(
    this.text, {
    super.key,
    this.style,
  });
  final String text;
  final TextStyle? style;
  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with AnimatedTextStateMixin {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: widgetKey,
      onExit: onExit,
      onEnter: onEnter,
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: isHovering ? null : boxWidth,
          child: Text(
            widget.text,
            style: widget.style,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
