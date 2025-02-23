part of 'async_data_builder.dart';

/// This widget is used to show a skeleton when the state is [AsyncLoading].
///
/// This widget used to show a skeleton based on the [SkeletonType].
///
/// If the [SkeletonType] is [single], it will show [_SkeletonSingle].
///
/// If the [SkeletonType] is [list], it will show [_SkeletonList].
///
/// It is used in the [AsyncDataBuilder] widget.
///
final class _Skeleton {
  _Skeleton._();
  static Widget build(Widget skeleton, SkeletonType skeletonType) {
    switch (skeletonType) {
      case SkeletonType.single:
        return _SkeletonSingle.build(skeleton);
      case SkeletonType.list:
        return _SkeletonList.build(skeleton);
    }
  }
}

final class _SkeletonSingle {
  _SkeletonSingle._();
  static Widget build(Widget skeleton) {
    return CustomSkeleton(child: skeleton);
  }
}

final class _SkeletonList {
  _SkeletonList._();
  static Widget build(Widget skeleton) {
    return Expanded(
      child: ListView(
        children: [
          ...List.generate(
            5,
            (_) => CustomSkeleton(
              child: skeleton,
            ),
          ),
        ],
      ),
    );
  }
}

/// The type of skeleton to show when the state is [AsyncLoading].
///
/// [single] - Shows a single skeleton
///
/// [list] - Shows a list of skeletons
enum SkeletonType {
  /// [single] - Shows a single skeleton
  ///
  /// When you want to display single item on the skeleton , use this type
  single,

  /// [list] - Shows a list of skeletons
  ///
  /// When you want to display list of items on the skeleton , use this type
  list,
}
