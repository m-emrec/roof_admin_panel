part of 'filter_row.dart';

class _ResponseFilter extends ConsumerStatefulWidget {
  const _ResponseFilter(this.filter);
  final FeedbackResponseFilterTypes filter;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __StateFiltersState();
}

class __StateFiltersState extends ConsumerState<_ResponseFilter> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: ref.watch(responseFilterProvider) == widget.filter,
      label: Text(widget.filter.localizedString()),
      showCheckmark: false,
      onSelected: (_) =>
          ref.read(responseFilterProvider.notifier).state = widget.filter,
    );
  }
}
