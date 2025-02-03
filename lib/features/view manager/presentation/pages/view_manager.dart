import 'package:core/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';
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
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ViewManager> createState() => _ViewManagerState();
}

class _ViewManagerState extends State<ViewManager> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          Flexible(
            child: Padding(
              padding: const AppPadding.horizontalLSymmetric() +
                  const AppPadding.verticalMSymmetric(),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
