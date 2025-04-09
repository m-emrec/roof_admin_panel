import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/repositories/mentorship_widget_repository_impl.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list/mentor_pop_up_list.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/user_mentorship_info.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

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
        if (role.contains(Role.mentor) || role.contains(Role.mentat)) {
          if (data.isEmpty) {
            return const Text("No members found");
          }
          return MemberPopupList(
            members: data,
          );
        } else {
          if (data.isEmpty) {
            return const Text("No mentor found");
          }
          return UserMentorshipInfo(mentor: data.first);
        }
      },
    );
  }
}
