import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/manager_info.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';
import 'package:roof_admin_panel/product/widgets/side%20bar/side_bar.dart';

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
        future: CurrentManager.init(),
        builder: (context, snapshot) {
          if (CurrentManager.instance.managerModel.uid.isEmpty) {
            return const _LoadingView();
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor[80],
            body: Row(
              children: [
                const SideBar(),
                Flexible(
                  child: Padding(
                    padding: const AppPadding.horizontalLSymmetric() +
                        const AppPadding.mediumOnlyPadding(top: true),
                    child: widget.child,
                  ),
                ),
              ],
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
