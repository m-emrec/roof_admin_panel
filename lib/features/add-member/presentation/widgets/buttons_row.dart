import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';

class ButtonsRow extends ConsumerWidget {
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(shouldShowAddMemberTableProvider),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          TextButton.icon(
            onPressed: () {
              ref.read(shouldShowAddMemberTableProvider.notifier).state = false;
            },
            icon: const Icon(Icons.close),
            label: Text(
              'Close',
              style: context.textTheme.labelLarge,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(addMemberProvider).addNewMember();
            },
            icon: const Icon(Icons.check),
            label: Text(
              'Add',
              style: context.textTheme.labelLarge,
            ),
          ),
        ],
      ).fadeAnimation(
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
