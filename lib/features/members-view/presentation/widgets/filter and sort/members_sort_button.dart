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
              AppIcon.small(
                Assets.icons.sortIcon,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
