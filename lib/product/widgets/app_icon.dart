import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../product/utility/constants/icon_sizes.dart';

/// A reusable widget that renders an SVG icon with predefined or custom sizes.
/// Use the named constructors for quick access to standard icon sizes from [IconSizes].
class AppIcon extends StatelessWidget {
  ///
  const AppIcon(
    this.iconPath, {
    super.key,
    this.size,
    this.fit = BoxFit.contain,
  });

  /// xxxlarge icon
  /// Size: 128x128
  const AppIcon.xxxlarge(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.xxxlarge;

  /// xxlarge icon
  /// Size: 64x64
  const AppIcon.xxlarge(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.xxlarge;

  /// xlarge icon
  /// Size: 48x48
  const AppIcon.xlarge(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.xlarge;

  ///
  /// large icon
  /// Size: 32x32
  const AppIcon.large(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.large;

  ///
  /// medium icon
  /// Size: 24x24
  const AppIcon.medium(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.medium;

  ///
  /// small icon
  /// Size: 16x16
  /// Default icon size
  const AppIcon.small(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.small;

  ///
  /// xSmall icon
  /// Size: 8x8
  const AppIcon.xsmall(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.xsmall;

  ///
  /// xxSmall icon
  /// Size: 4x4
  const AppIcon.xxsmall(this.iconPath, {super.key, this.fit = BoxFit.contain})
      : size = IconSizes.xxsmall;

  ///
  final String iconPath;

  ///
  final BoxFit fit;

  ///
  final Size? size;

  bool get _isSvg => iconPath.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return _isSvg
        ? SvgPicture.asset(
            iconPath,
            width: size?.width,
            height: size?.height,
            fit: fit,
          )
        : Image.asset(
            iconPath,
            width: size?.width,
            height: size?.height,
            fit: fit,
          );
  }
}
