import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_column_builder_mixin.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_table_state_mixin.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/table/custom_table.dart';

/// AddMemberPage
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
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController..forward(),
      builder: (context, child) => SizedBox(
        height: animation.value,
        child: child,
      ),
      child: Card(
        elevation: 3,
        color: AppColors.secondaryColor[90],
        // color: Colors.transparent,
        margin: const AppPadding.smallOnlyPadding(bottom: true),
        child: Form(
          key: ref.read(addMemberProvider).formKey,
          child: CustomTable(
            headerRowHeight: 20,
            rowsPerPage: 1,
            showCheckboxColumn: false,
            source: ref.watch(addMemberTableProvider),
            columns: buildColumns(),
          ),
        ),
      ),
    );
  }
}
