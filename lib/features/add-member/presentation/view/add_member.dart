import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/add_member_button.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/buttons_row.dart';
import 'package:roof_admin_panel/features/add-member/presentation/widgets/table/add_member_table.dart';

/// Add Member input row for quick user creation.
///
/// Fields (left to right):
/// - Member Number (text input)
/// - Name (text input)
/// - Country Code (dropdown, default TR +90)
/// - Phone Number (text input)
/// - Role (dropdown, default Üye)
/// - Gender (dropdown)
/// - Membership Start Date (date picker)
///
/// "Ekle" saves the input; "Kapat" cancels.
///
/// Minimalist layout: underline-only inputs for cleaner look.
/// Designed for efficient data entry by admins.
class AddMember extends ConsumerWidget {
  /// Constructor for [AddMember].
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
