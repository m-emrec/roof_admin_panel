import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/enums/feedback_titles_enum.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/domain/entities/feedback_filter_types.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
part 'response_filter.dart';
part 'feedback_title_filter.dart';

/// This on is the filter row that contains the filter chips
///
/// It is wrapped with a [Wrap] widget to make it responsive
/// It contains a [Row] widget that contains the response filter chips
/// and a [Column] widget that contains the title filter chip
class FilterRow extends StatelessWidget {
  /// This on is the filter row that contains the filter chips
  ///
  /// It is wrapped with a [Wrap] widget to make it responsive
  /// It contains a [Row] widget that contains the response filter chips
  /// and a [Column] widget that contains the title filter chip
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.spaceBetween,
        runSpacing: SpacingSizes.extraSmall,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: SpacingSizes.extraSmall,
              children: FeedbackResponseFilterTypes.values
                  .map(
                    _ResponseFilter.new,
                  )
                  .toList(),
            ),
          ),
          const _FeedbackTitleFilter(),
        ],
      ),
    );
  }
}
