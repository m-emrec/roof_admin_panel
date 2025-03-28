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
          child: AppIcon.small(
            sortDirection == SortDirection.asc
                ? Assets.icons.sortAscIcon
                : Assets.icons.sortDescIcon,
          ),
        ),
      ),
    );
  }
}
