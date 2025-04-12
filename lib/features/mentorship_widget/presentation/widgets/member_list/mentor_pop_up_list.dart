import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/avatar_stack_button.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
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
    required this.users,
    required this.role,
    super.key,
  });
  final List<Role?> role;
  final List<UserInfoModel?> users;

  UserInfoModel? get mentat =>
      users.first?.uid.isNotEmpty ?? false ? users.first : null;

  List<UserInfoModel?> get members => users.sublist(1);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: LocaleKeys
          .memberDetailView_membershipInfo_mentorshipMemberList_seeList
          .tr(
        args: [
          if (role.isMentat)
            Role.mentor.localizedText("")
          else
            Role.member.localizedText(""),
        ],
      ),
      itemBuilder: (context) {
        return [
          if (mentat != null)
            PopupMenuItem(
              value: mentat?.uid,
              child: _Tile.mentat(
                user: mentat,
              ),
            )
          else
            PopupMenuItem<void>(
              enabled: false,
              child: Text(
                LocaleKeys
                    .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentatForMentor
                    .tr(),
              ),
            ),
          PopupMenuItem<void>(
            enabled: false,
            child: Text(
              LocaleKeys
                  .memberDetailView_membershipInfo_mentorshipMemberList_members
                  .tr(),
            ),
          ),
          ...members.map(
            (user) {
              return PopupMenuItem(
                value: user?.uid,
                child: _Tile.member(
                  user: user,
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

class _Tile extends StatelessWidget {
  _Tile.member({
    this.user,
  })  : tileColor = null,
        textColor = AppColors.secondaryColor[30],
        shape = null,
        trailing = null;
  _Tile.mentat({
    this.user,
  })  : tileColor = AppColors.secondaryColor[30],
        textColor = AppColors.secondaryColor[90],
        shape = const StadiumBorder(),
        trailing = Role.mentat.localizedText("");

  final UserInfoModel? user;

  final Color? tileColor;
  final Color? textColor;
  final ShapeBorder? shape;
  final String? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: shape,
      tileColor: tileColor,
      title: Text(
        user?.name ?? " - ",
        style: context.textTheme.labelLarge?.copyWith(
          color: textColor,
        ),
      ),
      trailing: trailing != null
          ? Padding(
              padding: const AppPadding.smallOnlyPadding(right: true),
              child: Text(
                trailing ?? "",
                style: context.textTheme.labelSmall?.copyWith(
                  color: textColor,
                ),
              ),
            )
          : null,
      leading: Avatar(
        imageUrl: user?.imageUrl,
        radius: IconSizes.small.height,
        showShadow: false,
      ).showClickMouseCursorOnWidget(),
    );
  }
}
