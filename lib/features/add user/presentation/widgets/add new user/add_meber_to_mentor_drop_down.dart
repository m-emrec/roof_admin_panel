import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/core/constants/enums/roles.dart';
import 'package:roof_admin_panel/core/extensions/media_query_extension.dart';
import 'package:roof_admin_panel/core/utils/widgets/user_avatar.dart';
import 'package:roof_admin_panel/features/add%20user/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/models/user_model.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

class AddMemberToMentorDropDown extends ConsumerWidget {
  const AddMemberToMentorDropDown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRole =
        ref.watch(addMemberProvider.select((p) => p.user.role));
    return Visibility(
      visible: (selectedRole?.contains(Role.mentor) ?? false) ||
          (selectedRole?.contains(Role.mentat) ?? false),
      child: TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => A(selectedRole ?? []),
          );
        },
        child: const Text('Add Member'),
      ),
    );
  }
}

class A extends ConsumerStatefulWidget {
  const A(this.roles, {super.key});
  final List<Role?> roles;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AState();
}

class _AState extends ConsumerState<A> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.roles.contains(Role.mentor)
          ? ref.read(addMemberProvider.notifier).fetchMembersWithoutMentor()
          : ref.read(addMemberProvider.notifier).fetchMentorsWithoutMentat(),
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return SizedBox(
          width: context.dynamicWidth(0.5),
          height: context.dynamicHeight(0.5),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  UserAvatar(imageUrl: snapshot.data?[index].imageUrl ?? ''),
                  Text(
                    snapshot.data?[index].name ?? '',
                  ),
                  Text(
                    snapshot.data?[index].birthDate!.formatDate(context) ?? '',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
