import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/add_profile_picture_theme.dart';

/// A container for the profile image.
///
/// It has a circular shape and a shadow.
///
/// The size of the container is defined by the [AddProfilePictureTheme]
/// extension theme.
///
/// The child widget is the profile image itself.
class ProfileImageContainer extends StatelessWidget {
  /// A container for the profile image.
  ///
  /// It has a circular shape and a shadow.
  ///
  /// The size of the container is defined by the [AddProfilePictureTheme]
  /// extension theme.
  ///
  /// The child widget is the profile image itself.
  const ProfileImageContainer(this.child, {super.key});

  /// The child widget is the profile image itself.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<AddProfilePictureTheme>();
    return Container(
      clipBehavior: Clip.antiAlias,
      height: theme?.circleSize?.height,
      width: theme?.circleSize?.width,
      decoration: BoxDecoration(
        boxShadow: theme?.shadows,
        shape: BoxShape.circle,
        color: theme?.circleBackgroundColor,
      ),
      child: child,
    );
  }
}
