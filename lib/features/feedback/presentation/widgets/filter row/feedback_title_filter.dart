part of 'filter_row.dart';

/// Feedback title filter.
///
/// It is part of the [FilterRow] widget.
///
/// It is a [ConsumerWidget] that contains a [PopupMenuButton] widget
/// that contains the feedback titles as a list of [PopupMenuItem] widgets
///
class _FeedbackTitleFilter extends ConsumerWidget {
  const _FeedbackTitleFilter();

  List<PopupMenuItem<FeedbackTitlesEnum>> _buildPopupMenuItemList(
    WidgetRef ref,
  ) {
    return FeedbackTitlesEnum.values
        .map(
          (title) => PopupMenuItem(
            value: title,
            child: Text(title.name),
            onTap: () =>
                ref.read(feedbackTitleFilterProvider.notifier).state = title,
          ),
        )
        .toList();
  }

  Widget _showDeleteIcon(WidgetRef ref) {
    return ref.watch(feedbackTitleFilterProvider) != null
        ? const Icon(Icons.close)
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      itemBuilder: (_) => _buildPopupMenuItemList(ref),
      child: Chip(
        avatar: const Icon(Icons.filter_list),
        deleteIcon: _showDeleteIcon(ref),
        onDeleted: () =>
            ref.read(feedbackTitleFilterProvider.notifier).state = null,
        label: Text(
          ref.watch(feedbackTitleFilterProvider)?.name ??
              LocaleKeys.feedback_filter_typeFilter.tr(),
        ),
      ),
    );
  }
}
