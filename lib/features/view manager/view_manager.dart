import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/side-bar/presentation/views/side_bar.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';
import 'package:roof_admin_panel/product/widgets/empty_box.dart';

/// This widget contains the side bar and the main view
///
/// It requires a [child] widget to be passed to it
///
/// It returns a [Scaffold] widget with a [Row] widget as its body
///
/// The [Row] widget contains the [SideBar] and the [child] widget
class ViewManager extends StatefulWidget {
  /// This widget contains the side bar and the main view
  ///
  /// It requires a [child] widget to be passed to it
  ///
  /// It returns a [Scaffold] widget with a [Row] widget as its body
  ///
  /// The [Row] widget contains the [SideBar] and the [child] widget
  const ViewManager({
    required this.child,
    super.key,
  });

  /// The child widget to be displayed in the main view
  final Widget child;

  @override
  State<ViewManager> createState() => _ViewManagerState();
}

class _ViewManagerState extends State<ViewManager> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: FutureBuilder(
        future: CurrentUser.init(),
        builder: (context, snapshot) {
          if (CurrentUser.instance.managerModelNotifier.value.uid.isEmpty) {
            return const _LoadingView();
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor[80],
            body: SizedBox(
              height: context.dynamicHeight(1),
              width: context.dynamicWidth(1),
              child: Row(
                children: [
                  // const SideBar(),
                  SideBar(),
                  Flexible(
                    child: Padding(
                      padding: const AppPadding.horizontalLSymmetric() +
                          const AppPadding.mediumOnlyPadding(top: true),
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return CustomSkeleton(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor[80],
        body: Row(
          children: [
            const SideBar(),
            Flexible(
              child: Padding(
                padding: const AppPadding.horizontalLSymmetric() +
                    const AppPadding.verticalMSymmetric(),
                child: const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
