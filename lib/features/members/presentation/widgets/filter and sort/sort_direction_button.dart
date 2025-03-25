part of "filter_and_sort_row.dart";

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
