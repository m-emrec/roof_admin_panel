part of 'filter_and_sort_row.dart';

class _SortLabel extends StatelessWidget {
  const _SortLabel(
    this.ref,
  );
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: ref.watch(isSortAppliedProvider),
      child: Padding(
        padding: const AppPadding.xxsmallOnlyPadding(right: true),
        child: Text(
          ref.watch(isSortAppliedProvider)
              ? SortBy.fromTableColumnName(
                  ref
                      .watch(membersTableSourceProvider)
                      .sortedColumns
                      .first
                      .name,
                )
              : '',
        ),
      ),
    );
  }
}
