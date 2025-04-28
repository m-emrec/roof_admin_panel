import 'package:core/core.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';

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
          TextButton.icon(
            onPressed: () {
              ref.read(shouldShowAddMemberTableProvider.notifier).state = false;
            },
            icon: const Icon(Icons.close),
            label: Text(
              LocaleKeys.common_close.tr(),
              style: context.textTheme.labelLarge,
            ),
          ),
          TextButton.icon(
            onPressed: () async {
              if (ref
                      .read(addMemberProvider)
                      .formKey
                      .currentState
                      ?.validate() ??
                  false) {
                await ref.read(addMemberProvider).addNewMember(context);
              }
            },
            icon: const Icon(Icons.check),
            label: Text(
              LocaleKeys.common_add.tr(),
              style: context.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
