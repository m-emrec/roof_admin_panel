import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marquee/marquee.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/base_user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/member_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentat_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/mentor_info.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/pop-up-listr/mentorship_pop_up_list.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/user_mentorship_info.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
part "../widgets/mentorship_widget_empty_state.dart";

/// A widget that displays mentorship-related information for a given [UserModel].
///
/// Depending on the role of the user (`mentor`, `mentat`, or `member`), this widget shows:
/// - A list of mentored users if the user is a mentor or mentat.
/// - The assigned mentor's information if the user is a regular member.
/// - An empty state message if there is no mentorship data available.
///
/// This widget:
/// - Uses [AsyncDataBuilder] to handle loading, success, and error states.
/// - Retrieves mentorship data via [mentorshipStateNotifierProvider].
/// - Initializes the mentorship state by setting the provided user in [initState].
///
/// Example usage:
/// ```dart
/// MentorshipWidget(user);
/// ```
///
/// The UI and behavior are adjusted dynamically based on the user's role.

class MentorshipWidget extends ConsumerWidget {
  /// Creates a [MentorshipWidget] for the given [user].
  ///
  const MentorshipWidget(this.user, {super.key});

  /// The user whose mentorship data will be displayed.
  final UserModel user;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roles = user.role ?? [];

    return AsyncDataBuilder(
      provider: mentorshipStateNotifierProvider(user),
      data: (data) {
        if (roles.isEmpty) {
          return const SizedBox();
        }
        if (data == null) {
          return _MentorshipWidgetEmptyState(roles: roles);
        }
        if (_shouldShowMentorshipList(data)) {
          return MentorshipPopupList(
            user: data,
          );
        } else {
          return UserMentorshipInfo(user: data as MemberInfo);
        }
      },
    );
  }

  bool _shouldShowMentorshipList(AbstractUserInfo data) {
    if (data is MentorInfo || data is MentatInfo) return true;
    return false;
  }
}
