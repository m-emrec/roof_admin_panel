import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/view/add_member.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/filter%20and%20sort/filter_and_sort_row.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/members_table.dart';
import 'package:roof_admin_panel/features/members/presentation/widgets/table/members_table_title.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';

/// This is the view that displays the members table and member related actions.
class MembersView extends ConsumerWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: SpacingSizes.extraSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const MembersTableTitle(),
        const FilterAndSortRow(),
        const AddMember(),
        AsyncDataBuilder(
          provider: membersViewModelProvider,
          data: (_) {
            ref.read(filterNotifierProvider);
            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const AppPadding.horizontalxsSymmetric() +
                          const AppPadding.verticalxsSymmetric(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const AppBorderRadius.medium(),
                          color: AppColors.backgroundColor[70],
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xF90D2511),
                              blurRadius: 3,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0xD80D2511),
                              blurRadius: 6,
                              offset: Offset(1, 0),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x7F0D2511),
                              blurRadius: 8,
                              offset: Offset(2, 0),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x260D2511),
                              blurRadius: 9,
                              offset: Offset(3, 0),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x050D2511),
                              blurRadius: 10,
                              offset: Offset(5, 0),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: MembersTable(),
                      ),
                    ),
                  ),
                ],
              ),
            );
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
    return CustomSkeleton(
      child: MembersTable(),
    );
  }
}
