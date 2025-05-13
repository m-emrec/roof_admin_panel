import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/selection_dialog_for_mentor.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';

mixin SelectionDialogForMentorStateMixin
    on ConsumerState<SelectionDialogForMentor> {
  late final TabController? tabController;

  /// Initializes the [TabController] with the current state of the [shouldFetchMentatsProvider].
  void initController(TickerProvider vsync) {
    tabController = TabController(
      initialIndex: ref.read(shouldFetchMentatsProvider.notifier).state ? 1 : 0,
      length: 2,
      vsync: vsync,
    );
    tabController?.addListener(_listenToTabController);
  }

  @override
  void dispose() {
    tabController?.removeListener(_listenToTabController);
    tabController?.dispose();

    super.dispose();
  }

  void _listenToTabController() {
    ///
    final currentUser = ref.read(selectionNotifierProvider) ?? widget.user;
    _onTabChanged();
    _initializeSelectionNotifierState(currentUser);
  }

  void _initializeSelectionNotifierState(MemberModel currentUser) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectionNotifierProvider.notifier).initializeState(currentUser);
    });
  }

  void _onTabChanged() {
    if (mounted) {
      if (tabController?.index == 0) {
        ref.read(shouldFetchMentatsProvider.notifier).state = false;
      } else {
        ref.read(shouldFetchMentatsProvider.notifier).state = true;
      }
    }
  }
}
