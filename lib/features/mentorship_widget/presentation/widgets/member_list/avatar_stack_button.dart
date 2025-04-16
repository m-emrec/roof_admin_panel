import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/pop-up-listr/mentorship_pop_up_list.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

/// A widget that displays a horizontal stack of member avatars with an optional count indicator.
///
/// [MentorshipPopupList] is used as the clickable trigger for the [MentorshipPopupList] popup menu.
/// It visually summarizes a group of users (e.g., mentats or mentors) using their profile pictures
/// in a compact, overlapping layout.
///
/// - Displays up to 5 profile avatars.
/// - If more than 5 members exist, a `+X` badge is shown to indicate how many members are in total.
/// - Designed to fit into a small horizontal space, with a smooth stacked arrangement.
///
/// ### Example:
/// ```dart
/// [MemberPopupList](members: myUserList);
/// ```
///
/// ### Visual Layout:
/// ```dart
/// ┌────────────────────────┐
/// |👤][👤][👤][👤][👤][+6] |
/// └────────────────────────┘
///
/// ```
///
/// Typically used in mentor or mentat UIs to represent assigned members at a glance.
///
/// See also:
/// - [MentorshipPopupList]: The parent widget that wraps this button in a popup menu.
/// - [Avatar]: Used for rendering each member's profile image.
class AvatarStackButton extends StatelessWidget {
  ///
  /// Creates a [AvatarStackButton] widget.
  ///
  const AvatarStackButton({
    required this.user,
    super.key,
  });

  /// The list of members to display.
  final AbstractUserInfo? user;

  /// The maximum number of members to display in the button.
  /// This is a constant value that determines how many avatars will be shown
  /// in the horizontal stack.
  /// If the list exceeds this number, it will be capped at this value.
  /// This is used to ensure that the button does not become too wide.
  int get _maxMembers => 5;

  MentatInfo get _mentat => user as MentatInfo;
  MentorInfo get _mentor => user as MentorInfo;

  /// The number of members to display on the button.
  /// If the list exceeds [_maxMembers], it will be capped at that number.
  /// Otherwise, it returns the actual length of the list.
  ///
  /// This is used to determine how many avatars to show in the horizontal stack.
  int get length =>
      _members.length > _maxMembers ? _maxMembers : _members.length;

  List<UserInfoModel?> get _members {
    if (isMentat) {
      return _mentat.mentors;
    } else {
      return _mentor.members;
    }
  }

  /// A boolean value indicating whether the user is a mentat.
  /// This is used to determine the type of user and adjust the UI accordingly.
  bool get isMentat => user is MentatInfo;

  /// The height of the button and avatars.
  /// This is a fixed value that determines the vertical size of the button.
  double get _height => 32;

  /// The width of each avatar in the stack.
  double get _width => 24;

  double get _avatarRadius => _width / 2;

  /// The total width of the button, calculated based on the number of members
  /// and the overlap ratio.
  /// This is used to ensure that the button fits all avatars and the `+X` badge.
  double get _buttonWidth =>
      _width / _avatarOverlapRatio * length + (_width + _avatarRadius);

  /// The ratio of avatar overlap in the stack.
  /// This determines how much each avatar overlaps with the next one.
  /// A higher value means more overlap.
  ///
  /// ?? *`I found this value by trial and error, but it seems to work well for
  /// the design.`*
  double get _avatarOverlapRatio => 2.5;

  double _userAvatarOffset(int index) => index * _width / _avatarOverlapRatio;

  double get _totalCountAvatarOffset =>
      _userAvatarOffset(length) + _avatarRadius / 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _buttonWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!isMentat && _mentor.mentat?.uid != null) _mentatAvatar(),
          ..._members.getRange(0, length).map(_memberAvatar),
          _totalCountAvatar(context),
        ],
      ),
    );
  }

  Positioned _totalCountAvatar(BuildContext context) {
    return Positioned(
      left: _totalCountAvatarOffset,
      child: CircleAvatar(
        backgroundColor: AppColors.secondaryColor[40],
        radius: _avatarRadius,
        child: Text(
          "${_members.length}",
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.secondaryColor[90],
          ),
        ),
      ),
    );
  }

  Positioned _memberAvatar(UserInfoModel? e) {
    return Positioned(
      left: _userAvatarOffset(_members.indexOf(e) + 1),
      child: Avatar(
        imageUrl: e?.imageUrl,
        radius: _avatarRadius,
      ),
    );
  }

  Positioned _mentatAvatar() {
    return Positioned(
      left: _userAvatarOffset(0),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        child: Avatar(
          imageUrl: _mentor.mentat?.imageUrl,
          radius: _avatarRadius,
        ),
      ),
    );
  }
}
