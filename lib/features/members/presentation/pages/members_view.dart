import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/logger/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter_and_sort_row.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_title.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

/// This is the view that displays the members table and member related actions.
class MembersView extends ConsumerStatefulWidget {
  /// This is the view that displays the members table and member related actions.
  const MembersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MembersViewState();
}

class _MembersViewState extends ConsumerState<MembersView> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(membersViewModelProvider).when(
      data: (users) {
        return Column(
          spacing: SpacingSizes.extraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MembersTableTitle(),
            const FilterAndSortRow(),
            Expanded(
              child: MembersTable(members: users ?? []),
            ),
          ],
        );
      },
      loading: () {
        return const Center(
          child: LoadingIndicator(),
        );
      },
      error: (error, stackTrace) {
        Log.error(error.toString());
        return Center(
          child: Column(
            children: [
              Card(
                child: Text(error.toString()),
              ),
              ElevatedButton(
                onPressed: () => ref.refresh(membersViewModelProvider),
                child: Text(LocaleKeys.common_retry.tr()),
              ),
            ],
          ),
        );
      },
    );
  }
}
