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
part 'mentorship_pop_menu_item.dart';

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

  /// The roles of the user displayed in MemberDetail.
  ///
  /// This list typically contains the role(s) associated with the user whose
  /// profile is being viewed in the MemberDetail section. It determines how
  /// labels and tooltips are localized and shown in the [MemberPopupList].
  final List<Role?> role;

  /// The list of users associated with the current mentor or mentat.
  ///
  /// For mentors, the first user is expected to be the mentat, followed by their members.
  /// For mentats, this list contains the mentors or members they are mentoring.
  /// Used to build both the mentat and member sections of the popup list.
  final List<UserInfoModel?> users;

  /// Returns the `mentat` for the current mentor, if available.
  ///
  /// This getter assumes the first item in the `users` list is the mentat
  /// when the role of the viewing user is [Role.mentor]. If no valid mentat
  /// exists (e.g. no `uid` is available), this will return `null`.
  ///
  /// Used in [MemberPopupList] to display a mentat at the top of the popup list.
  UserInfoModel? get mentat =>
      users.first?.uid.isNotEmpty ?? false ? users.first : null;

  /// Returns the list of members excluding the mentat.
  ///
  /// If the user is a mentor, the first item in the `users` list is assumed
  /// to be the mentat. This getter returns all other users as members.
  /// If there are no members beyond the mentat, an empty list is returned.
  List<UserInfoModel?> get members => users.length > 1 ? users.sublist(1) : [];

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
          // mentat
          _MentorshipPopupMenuItem.mentat(
            context,
            user: mentat,
            value: mentat?.uid,
          ),
          // title
          _label(),
          // members || mentors
          if (members.isEmpty)
            _MentorshipPopupMenuItem.member(
              context,
            ).emptyState(),
          ...members.map(
            (user) {
              return _MentorshipPopupMenuItem.member(
                context,
                user: user,
                value: user?.uid,
              );
            },
          ),
        ];
      },
      child: AvatarStackButton(
        members: users,
      ),
    );
  }

  PopupMenuItem<void> _label() {
    return PopupMenuItem<void>(
      enabled: false,
      child: Text(
        tr(
          role.isMentat
              ? LocaleKeys
                  .memberDetailView_membershipInfo_mentorshipMemberList_mentors
              : LocaleKeys
                  .memberDetailView_membershipInfo_mentorshipMemberList_members,
          args: [
            if (role.isMentat)
              Role.mentat.localizedText("")
            else
              Role.mentor.localizedText(""),
          ],
        ),
      ),
    );
  }
}
