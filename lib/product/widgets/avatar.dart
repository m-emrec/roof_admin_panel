import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// this is a widget that shows the avatar of the user.
///
/// It is a circle avatar with an image inside it.
///
///  **NOTE: Use this widget in Admin Panel , because [UserAvatar] widget does**
/// **not work properly in Admin Panel.**
class Avatar extends StatelessWidget {
  /// this is a widget that shows the avatar of the user.
  ///
  /// It is a circle avatar with an image inside it.
  const Avatar({
    required this.imageUrl,
    super.key,
    this.radius = 24,
    this.showShadow = true,
  });

  ///
  final String? imageUrl;

  ///
  final double? radius;

  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (radius ?? 24) * 2,
      height: (radius ?? 24) * 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: showShadow ? _boxShadow : null,
        border: Border.all(
          color: AppColors.secondaryColor[40] ?? Colors.transparent,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl ?? "",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(Assets.images.maleAvatar.path),
          filterQuality: FilterQuality.high,
          width: (radius ?? 24) * 2,
          height: (radius ?? 24) * 2,
          // webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
        ),
      ),
    );
  }

  static const List<BoxShadow> _boxShadow = [
    BoxShadow(
      color: Color(0xF992BBA2),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0xD892BBA2),
      blurRadius: 6,
    ),
    BoxShadow(
      color: Color(0x7F92BBA2),
      blurRadius: 8,
    ),
    BoxShadow(
      color: Color(0x2692BBA2),
      blurRadius: 9,
    ),
    BoxShadow(
      color: Color(0x0592BBA2),
      blurRadius: 10,
    ),
  ];
}
