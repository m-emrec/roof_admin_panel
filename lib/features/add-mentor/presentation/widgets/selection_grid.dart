import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/add-mentor/data/models/add_mentor_model.dart';
import 'package:roof_admin_panel/features/add-mentor/presentation/widgets/select_users_dialog_item.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';

class SelectionGrid extends StatelessWidget {
  const SelectionGrid({
    required this.user,
    required this.data,
    super.key,
  });

  final UserModel user;
  final List<AddMentorModel> data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 128,
        mainAxisExtent: 128,
        mainAxisSpacing: SpacingSizes.small,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return SelectUsersDialogItem(
          data[index],
          user.role ?? [],
        ).scaleAnimation();
      },
    );
  }
}
