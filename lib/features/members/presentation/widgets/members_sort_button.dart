part of 'filter_and_sort_row.dart';

class _MembersSortButton extends ConsumerWidget {
  const _MembersSortButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSortApplied = ref.watch(isSortAppliedProvider);
    return Row(
      children: [
        const _SortDirectionButton(),
        FilterChip(
          selected: isSortApplied,
          onSelected: (_) async {
            await showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(0, 0, -1, 0),
              items: SortBy.values.map((sort) {
                return PopupMenuItem(
                  value: sort,
                  onTap: () => ref.read(membersTableSourceProvider).sort(
                        sortBy: sort,
                        ref: ref,
                      ),
                  child: Text(sort.toLocale),
                );
              }).toList(),
            );
          },
          onDeleted: ref.watch(isSortAppliedProvider)
              ? () => ref.read(membersTableSourceProvider).sort(ref: ref)
              : null,
          showCheckmark: false,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SortLabel(ref),
              SvgPicture.asset(
                Assets.icons.sortIcon,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SortDirectionButton extends ConsumerWidget {
  const _SortDirectionButton();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortDirection = ref.watch(sortDirectionProvider);

    return Visibility(
      visible: ref.watch(isSortAppliedProvider),
      child: Tooltip(
        message: sortDirection.toLocale,
        child: InkWell(
          onTap: () {
            ref.read(membersTableSourceProvider).changeSortDirection(ref);
          },
          child: Icon(
            sortDirection == SortDirection.asc
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            size: 16,
          ),
        ),
      ),
    );
  }
}

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
