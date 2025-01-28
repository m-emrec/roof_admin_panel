import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_title.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';
import 'package:roof_admin_panel/product/utility/logger/logger.dart';

class MembersView extends ConsumerStatefulWidget {
  const MembersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MembersViewState();
}

class _MembersViewState extends ConsumerState<MembersView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(membersViewModelProvider).when(
      data: (users) {
        return Column(
          spacing: SpacingSizes.extraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MembersTableTitle(),
            Row(
              spacing: SpacingSizes.medium,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Assets.icons.filterIcon,
                ),
                SvgPicture.asset(
                  Assets.icons.sortIcon,
                ),
              ],
            ),
            Expanded(
              child: MembersTable(members: users ?? []),
            ),
          ],
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        Log.error(error.toString());
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
