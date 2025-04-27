import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/animated-text/animated_text.dart';

extension AnimatedTextExtension on Text {
  AnimatedText get animatedText {
    return AnimatedText(
      data ?? "",
      style: style,
    );
  }
}
