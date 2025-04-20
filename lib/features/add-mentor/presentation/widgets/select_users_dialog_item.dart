import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-mentor/data/models/add_mentor_model.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/animated_text_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class SelectUsersDialogItem extends ConsumerWidget {
  const SelectUsersDialogItem(this.data, this.role, {super.key});
  final AddMentorModel data;
  final List<Role?> role;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          ref.read(selectionNotifierProvider.notifier).select(data.uid),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: SpacingSizes.extraExtraSmall,
        children: [
          Badge(
            isLabelVisible: ref.watch(isSelectedProvider(data.uid)),
            offset: Offset.zero,
            child: Avatar(
              imageUrl: data.imageUrl,
              radius: 32,
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 128,
            ),
            child: Text(
              data.name,
              maxLines: 1,
              style: context.textTheme.labelLarge,
            ).animatedText,
          ),
          _memberCount(data.memberCount),
        ],
      ),
    );
  }

  Widget _memberCount(int? count) {
    if (!role.isMentat && !role.isMentor) {
      if (count == null) {
        return const Chip(
          label: Text("0"),
          shape: CircleBorder(),
        );
      }
      return Chip(
        label: Text("$count"),
        shape: const CircleBorder(),
      );
    }
    return const SizedBox();
  }
}
