import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_column_builder_mixin.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_table_state_mixin.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';

/// This widget is used to display the add member table
/// It uses the [CustomTable] widget to display the data
///
///
class AddMemberTable extends ConsumerStatefulWidget {
  /// AddMemberPage constructor
  const AddMemberTable({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMemberTableState();
}

class _AddMemberTableState extends ConsumerState<AddMemberTable>
    with
        AddMemberTableStateMixin,
        AddMemberColumnBuilderMixin,
        SingleTickerProviderStateMixin {
  @override
  void initState() {
    initAnimation(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: ref.read(addMemberProvider).formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: slideTransition,
              child: SizedBox(
                height: heightAnimation.value,
                child: CustomTable(
                  headerRowHeight: 0,
                  rowsPerPage: 1,
                  showCheckboxColumn: false,
                  source: ref.watch(addMemberTableProvider),
                  columns: buildColumns,
                ),
              ),
            ),
            _TableDivider(animationController: animationController),
          ],
        ),
      ),
    );
  }
}

class _TableDivider extends StatelessWidget {
  const _TableDivider({
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedFractionallySizedBox(
      duration: animationController.duration ?? Duration.zero,
      widthFactor: animationController.value,
      child: Divider(
        height: 0,
        thickness: 2,
        color: AppColors.backgroundColor[20],
      ),
    );
  }
}
