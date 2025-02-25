import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';
import 'package:roof_admin_panel/product/widgets/error_retry_card.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

part 'skeleton_builder.dart';
part 'skeletons.dart';

/// This widget builds a widget based on the state of an [AsyncValue].
///
/// It takes a [provider] of type [AsyncValue<T>] and a [data] function that
/// returns a widget when the state is [AsyncData]. It also takes an optional
/// [skeletonWidget] widget that is shown when the state is [AsyncLoading].
///
/// **Parameters**:
/// - [provider] : The provider of type [AsyncValue<T>].
/// - [data] : A function that returns a widget when the state is [AsyncData].
/// - [skeletonWidget] : A widget to put into the [CustomSkeleton] when the state is
/// [AsyncLoading].
/// If not provided, a [LoadingIndicator] will be shown.
///
/// - [showRefreshButton] : A bool to show the refresh button
/// Default is true
/// If set to false, the refresh button will not be shown
/// If set to true, the refresh button will be shown
/// and the [provider] will be refreshed when the button is clicked
///
/// - [skeletonType] : Type of the skeleton to show when the state is [AsyncLoading].
/// Default is [SkeletonType.list]
///
/// [SkeletonType.single] - Shows a single skeleton
/// When you want to display single item on the skeleton , use this type
///
/// [SkeletonType.list] - Shows a list of skeletons
/// When you want to display list of items on the skeleton , use this type
///
///
///
///
///
///
/// Example:
///
/// ```dart
/// AsyncDataBuilder(
///
///  provider: feedbackViewModelProvider,
///
/// data: (feedbacks) => FeedbackList(
///
/// feedbacks: feedbacks,
///
/// ),
///
/// skeleton: FeedbackTile(
///
/// feedback: FeedbackModel(
///
/// ````
/// It basically returns a
/// ```dart
/// ref.watch(provider).when(
/// data: data,
/// error: (error, stackTrace) {
/// return ErrorRetryCard(
/// errorMessage: error.toString(),
/// retry: () => ref.refresh(provider),
/// );
///
/// },
/// )
class AsyncDataBuilder<T> extends ConsumerWidget {
  /// This widget builds a widget based on the state of an [AsyncValue].
  ///
  /// It takes a [provider] of type [AsyncValue<T>] and a [data] function that
  /// returns a widget when the state is [AsyncData]. It also takes an optional
  /// [skeletonWidget] widget that is shown when the state is [AsyncLoading].
  ///
  /// **Parameters**:
  /// - [provider] : The provider of type [AsyncValue<T>].
  /// - [data] : A function that returns a widget when the state is [AsyncData].
  /// - [skeletonWidget] : A widget to put into the [CustomSkeleton] when the state is
  /// [AsyncLoading].
  /// If not provided, a [LoadingIndicator] will be shown.
  ///
  /// - [showRefreshButton] : A bool to show the refresh button
  /// Default is true
  /// If set to false, the refresh button will not be shown
  /// If set to true, the refresh button will be shown
  /// and the [provider] will be refreshed when the button is clicked
  ///
  /// - [skeletonType] : Type of the skeleton to show when the state is [AsyncLoading].
  /// Default is [SkeletonType.list]
  ///
  /// [SkeletonType.single] - Shows a single skeleton
  /// When you want to display single item on the skeleton , use this type
  ///
  /// [SkeletonType.list] - Shows a list of skeletons
  /// When you want to display list of items on the skeleton , use this type
  ///
  ///
  ///
  ///
  ///
  ///
  /// Example:
  ///
  /// ```dart
  /// AsyncDataBuilder(
  ///
  ///  provider: feedbackViewModelProvider,
  ///
  /// data: (feedbacks) => FeedbackList(
  ///
  /// feedbacks: feedbacks,
  ///
  /// ),
  ///
  /// skeleton: FeedbackTile(
  ///
  /// feedback: FeedbackModel(
  ///
  /// ````
  /// It basically returns a
  /// ```dart
  /// ref.watch(provider).when(
  /// data: data,
  /// error: (error, stackTrace) {
  /// return ErrorRetryCard(
  /// errorMessage: error.toString(),
  /// retry: () => ref.refresh(provider),
  /// );
  ///
  /// },
  /// )
  const AsyncDataBuilder({
    required this.provider,
    required this.data,
    this.showRefreshButton = true,
    super.key,
    this.skeletonWidget,
    this.skeletonType = SkeletonType.list,
  });

  /// The provider of type [AsyncValue<T>].
  /// This provider is watched to build the widget based on the state of the
  /// [AsyncValue].
  final ProviderBase<AsyncValue<T>> provider;

  /// A function that returns a widget when the state is [AsyncData].
  final Widget Function(T) data;

  /// A widget to put into the [CustomSkeleton] when the state is [AsyncLoading].
  final Widget? skeletonWidget;

  /// A bool to show the refresh button
  ///
  /// Default is true
  ///
  /// If set to false, the refresh button will not be shown
  ///
  /// If set to true, the refresh button will be shown
  /// and the [provider] will be refreshed when the button is clicked
  ///
  final bool showRefreshButton;

  /// Type of the skeleton to show when the state is [AsyncLoading].
  ///
  /// Default is [SkeletonType.list]
  final SkeletonType skeletonType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(provider).when(
          data: data,
          error: (error, stackTrace) {
            Log.error(error.toString());
            return showRefreshButton
                ? ErrorRetryCard(
                    errorMessage: error.toString(),
                    retry: () => ref.refresh(provider),
                  )
                : const SizedBox();
          },
          loading: () => _SkeletonFactory(
            skeletonWidget,
            skeletonType,
          ).create(),
        );
  }
}
