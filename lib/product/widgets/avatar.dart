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
    this.radius,
  });

  ///
  final String? imageUrl;

  ///
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        radius: radius ?? 24,
        backgroundImage: (imageUrl?.isNotEmpty ?? false)
            ? NetworkImage(imageUrl ?? "")
            : null,
        child: Image.network(
          imageUrl ?? "",
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(Assets.images.maleAvatar.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
