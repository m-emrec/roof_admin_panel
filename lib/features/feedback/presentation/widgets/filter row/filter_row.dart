import 'package:core/core.dart';
import 'package:core/utils/constants/enums/feedback_titles_enum.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_filter_types.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
part 'response_filter.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: SpacingSizes.extraSmall,
          children: FeedbackResponseFilterTypes.values
              .map(
                _ResponseFilter.new,
              )
              .toList(),
        ),
        const _FeedbackTitleFilter(),
      ],
    );
  }
}

class _FeedbackTitleFilter extends ConsumerWidget {
  const _FeedbackTitleFilter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Text(
        //   LocaleKeys.feedback_filter_typeFilter.tr(),
        // ),
        PopupMenuButton(
          itemBuilder: (_) => FeedbackTitlesEnum.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                  onTap: () {
                    ref.read(titleFilterProvider.notifier).state = e;
                  },
                ),
              )
              .toList(),
          child: Chip(
            avatar: const Icon(Icons.filter_list),
            deleteIcon: ref.watch(titleFilterProvider) != null
                ? const Icon(Icons.close)
                : const SizedBox(),
            onDeleted: () =>
                ref.read(titleFilterProvider.notifier).state = null,
            label: Text(
              ref.watch(titleFilterProvider)?.name ??
                  LocaleKeys.feedback_filter_typeFilter.tr(),
            ),
          ),
        ),
        // Visibility(
        //   visible: ref.watch(selectedFeedbackTitleProvider) != null,
        //   child: CloseButton(
        //     onPressed: () {
        //       ref.read(selectedFeedbackTitleProvider.notifier).state = null;
        //     },
        //   ),
        // ),
      ],
    );
  }
}
