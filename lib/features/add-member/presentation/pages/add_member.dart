import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_table.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/add_member_button.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/buttons_row.dart';

///
class AddMember extends ConsumerWidget {
  const AddMember({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AddMemberButton(),
            ButtonsRow(),
          ],
        ),
        Visibility(
          visible: ref.watch(shouldShowAddMemberTableProvider),
          child: const AddMemberTable(),
        ),
      ],
    );
  }
}
