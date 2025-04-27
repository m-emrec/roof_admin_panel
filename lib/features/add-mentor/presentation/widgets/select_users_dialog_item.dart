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

/// A widget that represents an item in the "Select Users" dialog.
///
/// This widget is used to display user data
/// within the dialog for selecting users.
///
/// - [data]: The user data to be displayed in the item.
/// - [role]: The role of the user, which determines the appearance and behavior of the item.
class SelectUsersDialogItem extends ConsumerWidget {
  /// Creates an instance of [SelectUsersDialogItem].
  ///
  const SelectUsersDialogItem(this.data, this.role, {super.key});

  /// [data] contains the details of the mentor being added.
  final AddMentorModel data;

  /// [role] is a list of roles associated with the user, where each role can be nullable.
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
