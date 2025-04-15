import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/member_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

/// A widget that displays the user's mentorship counterpart (either their mentor or mentat) in a compact row.
///
/// `UserMentorshipInfo` is designed to show the related user's avatar and name based on the role of the current user:
/// - If the current user is a **member** or **admin**, it shows their **mentor**.
/// - If the current user is a **mentor**, it shows their assigned **mentat**.
///
/// This widget is typically used in mentorship-related UIs to provide a quick visual reference to the user's
/// direct counterpart in the mentoring relationship.
///
/// The widget includes:
/// - A circular avatar using the [Avatar] widget.
/// - The user's name styled with the current theme.
/// - Tap feedback and hover behavior for interactivity.
///
/// ### Example usage:
/// ```dart
/// UserMentorshipInfo(user: counterpartUser);
/// ```
///
/// ### Visual layout:
/// ```dart
/// ┌────────────────────────┐
/// [👤] John Doe
/// └────────────────────────┘
/// ```
///
/// See also:
/// - [Avatar]: The widget used to render the user's profile image.
class UserMentorshipInfo extends StatelessWidget {
  /// Creates a [UserMentorshipInfo] widget.
  ///
  const UserMentorshipInfo({
    required this.user,
    super.key,
  });

  /// The user whose information is displayed.
  final MemberInfo user;
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
              imageUrl: user.mentor?.imageUrl,
              radius: 12,
            ),
            Text(
              user.mentor?.name ?? "",
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColors.secondaryColor[90],
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
