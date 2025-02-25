part of 'async_data_builder.dart';

base class _BaseSkeleton {
  _BaseSkeleton(
    this.skeletonWidget,
  );

  /// The widget that will be shown when the state is [AsyncLoading].
  ///
  /// If not provided, a [LoadingIndicator] will be shown.
  ///
  /// If provided, the [skeletonWidget] will be shown inside a [CustomSkeleton].
  final Widget? skeletonWidget;

  /// Skeleton
  ///
  /// When you want to change the skeleton widget, you can override this method
  late final Widget skeleton =
      CustomSkeleton(child: skeletonWidget ?? const SizedBox());

  bool _shouldShowSkeleton() => skeletonWidget != null;

  Widget get buildSkeleton =>
      _shouldShowSkeleton() ? skeleton : const LoadingIndicator();
}

final class _SkeletonText extends _BaseSkeleton {
  _SkeletonText() : super(const Text("Loading..."));
}

final class _SkeletonSingle extends _BaseSkeleton {
  _SkeletonSingle(super.skeletonWidget);
}

final class _SkeletonList extends _BaseSkeleton {
  _SkeletonList(super.skeletonWidget);

  @override
  Widget get skeleton => Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, __) =>
              CustomSkeleton(child: skeletonWidget ?? const SizedBox()),
        ),
      );
}
