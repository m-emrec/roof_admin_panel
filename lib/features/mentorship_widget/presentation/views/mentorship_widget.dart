import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/member-pop-%C4%B1list/mentor_pop_up_list.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/user_mentorship_info.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';
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

class MentorshipWidget extends ConsumerStatefulWidget {
  /// Creates a [MentorshipWidget] for the given [user].
  ///
  const MentorshipWidget(this.user, {super.key});

  /// The user whose mentorship data will be displayed.
  final UserModel user;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MentorshipWidgetState();
}

class _MentorshipWidgetState extends ConsumerState<MentorshipWidget> {
  late final List<Role?> roles;
  @override
  void initState() {
    roles = widget.user.role ?? [];

    /// - Initializes the mentorship state by assigning the given [UserModel] via [setUser].
    Future.microtask(
      () => ref
          .read(mentorshipStateNotifierProvider.notifier)
          .setUser(widget.user),
    );
    super.initState();
  }

  bool get shouldShowMentorshipList =>
      roles.isMentor == true || roles.isMentat == true;

  @override
  Widget build(BuildContext context) {
    return AsyncDataBuilder(
      provider: mentorshipStateNotifierProvider,
      data: (data) {
        if (roles.isEmpty) {
          return const SizedBox();
        }
        if (data.isEmpty) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.dynamicWidth(0.2)),
            child: _MentorshipWidgetEmptyState(roles: roles),
          );
        }
        if (shouldShowMentorshipList) {
          return MemberPopupList(
            users: data,
            role: roles,
          );
        } else {
          return UserMentorshipInfo(mentor: data.first);
        }
      },
    );
  }
}
