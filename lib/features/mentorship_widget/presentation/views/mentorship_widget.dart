import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/datasources/mentorship_widget_service.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/models/user_info_model.dart';
import 'package:roof_admin_panel/features/mentorship_widget/data/repositories/mentorship_widget_repository_impl.dart';
import 'package:roof_admin_panel/features/mentorship_widget/presentation/widgets/member_list.dart';

class MentorshipWidget extends StatelessWidget {
  const MentorshipWidget(this.member, {super.key});
  final UserModel member;
  @override
  Widget build(BuildContext context) {
    final role = member.role;
    return a(role ?? []);
  }

  Widget a(List<Role?> role) {
    if (role.contains(Role.mentor) || role.contains(Role.mentat)) {
      final _mentorshipWidgetService = MentorshipWidgetService();
      final repo = MentorshipWidgetRepositoryImpl(_mentorshipWidgetService);
      final _mentorship = repo.getMembers(member.members ?? []);
      return FutureBuilder(
        future: _mentorship,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            if (snapshot.data?.resultData == null) {
              return Text(
                "No members found",
                style: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.accentError[30],
                ),
              );
            }
            return MemberList(
              members: snapshot.data!.resultData!.map((e) {
                return UserInfoModel.fromEntity(e!);
              }).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else {
      return const Text("There should be mentor or mentat here");
    }
  }
}
