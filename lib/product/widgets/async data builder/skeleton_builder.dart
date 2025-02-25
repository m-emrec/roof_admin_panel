part of 'async_data_builder.dart';

///
/// This widget used to show a skeleton based on the [SkeletonType].
///
/// If the [SkeletonType] is [single], it will show [_SkeletonSingle].
///
/// If the [SkeletonType] is [list], it will show [_SkeletonList].
///
/// If the [SkeletonType] is [text], it will show [_SkeletonText].
///
/// It is used in the [AsyncDataBuilder] widget.
///
final class _SkeletonFactory {
  _SkeletonFactory(
    this.child,
    this.skeletonType,
  );

  final Widget? child;

  final SkeletonType skeletonType;

  Widget create() {
    switch (skeletonType) {
      case SkeletonType.single:
        return _SkeletonSingle(child).buildSkeleton;
      case SkeletonType.list:
        return _SkeletonList(child).buildSkeleton;
      case SkeletonType.text:
        return _SkeletonText().buildSkeleton;
    }
  }
}
