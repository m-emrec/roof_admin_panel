import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class MentorMentatWidget extends StatelessWidget {
  const MentorMentatWidget({
    super.key,
    required this.user,
  });
  final UserInfoModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const AppBorderRadius.large(),
      hoverColor: AppColors.secondaryColor[10],
      onTap: () {},
      child: Padding(
        padding: const AppPadding.xxsmallOnlyPadding(right: true),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: SpacingSizes.extraSmall,
          children: [
            Avatar(
              imageUrl: user.imageUrl,
              radius: IconSizes.small.height,
            ),
            Text(
              user.name,
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.secondaryColor[90],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
