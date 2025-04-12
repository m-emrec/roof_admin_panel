import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/mentor_pop_up_list.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/user_mentorship_info.dart';
import 'package:roof_admin_panel/product/utility/extensions/role_extension.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

///
class MentorshipWidget extends ConsumerStatefulWidget {
  const MentorshipWidget(this.member, {super.key});
  final UserModel member;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MentorshipWidgetState();
}

class _MentorshipWidgetState extends ConsumerState<MentorshipWidget> {
  @override
  void initState() {
    Future.microtask(
      () => ref
          .read(mentorshipStateNotifierProvider.notifier)
          .setUser(widget.member),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final role = widget.member.role;
    return AsyncDataBuilder(
      provider: mentorshipStateNotifierProvider,
      data: (data) {
        if (role == null) {
          return const SizedBox();
        }
        if (role.isMentor || role.isMentat) {
          if (data.isEmpty) {
            return Text(
              tr(
                role.isMentor
                    ? LocaleKeys
                        .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMembersForMEntor
                    : LocaleKeys
                        .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_notMentorsForMentat,
              ),
            );
          }
          return MemberPopupList(
            users: data,
            role: role,
          );
        } else {
          if (data.isEmpty) {
            return Text(
              LocaleKeys
                  .memberDetailView_membershipInfo_mentorshipMemberList_emptyState_noMentorForMember
                  .tr(),
            );
          }
          return UserMentorshipInfo(mentor: data.first);
        }
      },
    );
  }
}
