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
    with AddMemberTableStateMixin, AddMemberColumnBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Form(
        key: ref.read(addMemberProvider).formKey,
        child: CustomTable(
          rowsPerPage: 1,
          showCheckboxColumn: false,
          source: ref.watch(addMemberTableProvider),
          columns: buildColumns(),
        ),
      ),
    );
  }
}
