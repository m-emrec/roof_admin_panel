part of 'filter_and_sort_row.dart';

class _MembersFilterButton extends ConsumerWidget {
  const _MembersFilterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterChip(
      selected: ref.watch(filterNotifierProvider).isFilterApplied,
      onDeleted: ref.watch(filterNotifierProvider).isFilterApplied
          ? () => ref.read(filterNotifierProvider).clearFilters()
          : null,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      showCheckmark: false,
      onSelected: (_) => CustomAlertDialog.showAlertDialog(
        barrierDismissible: true,
        context: context,
        content: const FilterDialog(),
      ).whenComplete(
        // Revert unapplied filters when the dialog is closed.
        () => ref.read(filterNotifierProvider).revertUnappliedFilters(),
      ),
      label: SvgPicture.asset(
        Assets.icons.filterIcon,
        width: 16,
        height: 16,
      ),
    );
  }
}
