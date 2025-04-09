import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/avatar_stack_button.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/show_click_mouse_cursor_on_widget_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

/// A widget that displays a compact group of user avatars and opens a detailed popup list on click.
///
/// `MemberList` is typically used to show the members related to a mentor or mentat
/// in a visual and interactive way. It consists of two main parts:
///
/// 1. **Avatar Stack Button** ([AvatarStackButton]):
///    - Displays up to 5 overlapping avatars.
///    - If there are more members than visible avatars, shows a `+X` badge (e.g. `+6`).
///
/// 2. **Popup Menu:**
///    - Triggered when the avatar stack is clicked.
///    - Opens a vertical list showing each member's name and profile image in a clean layout.
///    - Styled to feel like a native dropdown with avatars and names aligned for easy scanning.
///
/// ### Example usage:
/// ```dart
/// MemberList(members: myMemberList);
/// ```
///
/// ### Visual result:
/// ```dart
/// [👤][👤][👤][👤][👤][+6] ← clickable → Popup opens:
/// ┌───────────────────────┐
/// │ 👤  xxxxxxxxx         │
/// │ 👤  xxxxxxxxxxxxx     │
/// │ 👤  xxxxxxxxxxxxx     │
/// │ 👤  xxxxxxxxxxxxx     │
/// │ 👤  xxxxxxxxxxxxx     │
/// │ 👤  xxxxxxxxxxxxx     │
/// └───────────────────────┘
/// ```
///
/// See also:
/// - [AvatarStackButton]: Displays the clickable avatar stack.
/// - [Avatar]: Custom widget for rendering user profile images.
class MemberPopupList extends StatelessWidget {
  ///
  /// Creates a [MemberPopupList] widget.
  ///
  const MemberPopupList({
    required this.members,
    super.key,
  });
  final List<UserInfoModel?> members;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "Show member list",
      itemBuilder: (context) {
        return [
          /// TODO: PopupMenuItem(child: Mentat),
          /// TODO: PopupMenuItem(enabled: false, child: SearchBar()),
          ...members.map(
            (e) {
              return PopupMenuItem(
                value: e,
                child: ListTile(
                  title: Text(
                    e?.name ?? " - ",
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.secondaryColor[30],
                    ),
                  ),
                  leading: Avatar(
                    imageUrl: e?.imageUrl,
                    radius: IconSizes.small.height,
                    showShadow: false,
                  ).showClickMouseCursorOnWidget(),
                ),
              );
            },
          ),
        ];
      },
      child: AvatarStackButton(
        members: members,
      ),
    );
  }
}
