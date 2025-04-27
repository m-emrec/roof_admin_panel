import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/enums/roles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/avatar_stack_button.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/show_click_mouse_cursor_on_widget_extension.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';
part 'mentorship_pop_menu_item.dart';
part 'strategies/mentor_popup_content_strategy.dart';
part 'strategies/mentat_popup_content_strategy.dart';
part 'strategies/mentorship_popup_content_strategy.dart';

///
class MentorshipPopupList extends StatelessWidget {
  ///
  /// Creates a [MentorshipPopupList] widget.
  ///
  const MentorshipPopupList({
    required this.user,
    super.key,
  });

  ///
  final AbstractUserInfo user;

  ///
  MentorshipPopupContentStrategy get popupContentStrategy =>
      MentorshipPopupContentStrategy.of(user);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: popupContentStrategy.toolTip,
      itemBuilder: popupContentStrategy.itemBuilder,
      child: AvatarStackButton(
        user: user,
      ),
    );
  }
}
