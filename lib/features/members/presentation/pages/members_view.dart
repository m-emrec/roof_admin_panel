import 'package:core/core.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter_and_sort_row.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/members_table_title.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// This is the view that displays the members table and member related actions.
class MembersView extends ConsumerStatefulWidget {
  /// This is the view that displays the members table and member related actions.
  const MembersView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MembersViewState();
}

class _MembersViewState extends ConsumerState<MembersView> {
  @override
  void didChangeDependencies() {
    // ref.read(membersTableSourceProvider).addFilter(MemberTableNames.age.name,
    //     FilterCondition(type: FilterType.equals, value: "test"));
    // ref.read(membersTableSourceProvider).notifyListeners();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingSizes.extraSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MembersTableTitle(),
        const FilterAndSortRow(),
        AsyncDataBuilder(
          provider: membersViewModelProvider,
          data: (_) {
            ref.read(filterNotifierProvider);
            return const Expanded(child: MembersTable());
          },
          skeletonWidget: const _LoadingView(),
          skeletonType: SkeletonType.single,
        ),
      ],
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const CustomSkeleton(
      child: Expanded(
        child: MembersTable(),
      ),
    );
  }
}
