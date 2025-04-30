import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/banned-members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/icon_sizes.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class BannedMembersView extends ConsumerWidget {
  const BannedMembersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncDataBuilder(
      provider: bannedMembersViewModelProvider,
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final member = data[index];
          return ListTile(
            leading: Avatar(
              imageUrl: member.imageUrl,
              radius: IconSizes.small.height,
            ),
            title: Text(member.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(member.phoneNumber),
                Text(member.bannedDate?.formatDate(context) ?? ""),
              ],
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.undo_rounded),
              onPressed: () {
                ref
                    .read(bannedMembersViewModelProvider.notifier)
                    .unbanMember(member.uid ?? "");
              },
            ),
          );
        },
      ),
    );
  }
}
