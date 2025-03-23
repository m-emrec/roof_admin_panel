import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';

class MembersAgeFilter extends ConsumerWidget {
  MembersAgeFilter({super.key});
  static const double _minAge = 18;
  static const double _maxAge = 70;
  late RangeValues _rangeValues;

  final _defaultRangeValues = const RangeValues(_minAge, _maxAge);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _rangeValues =
        ref.watch(filterNotifierProvider).ageFilter ?? _defaultRangeValues;
    return Row(
      spacing: SpacingSizes.extraExtraSmall,
      children: [
        /// age filter slider
        Flexible(
          child: RangeSlider(
            divisions: _maxAge.round() - _minAge.round(),
            labels: RangeLabels(
              _rangeValues.start.round().toString(),
              _rangeValues.end.round().toString(),
            ),
            onChanged: (value) {
              if (value == _defaultRangeValues) {
                ref.read(filterNotifierProvider).removeAgeFilter();
              } else {
                ref.read(filterNotifierProvider).addAgeFilter(value);
              }
            },
            min: _minAge,
            max: _maxAge,
            values: _rangeValues,
          ),
        ),

        /// age filter text
        Text.rich(
          TextSpan(
            text:
                '${_rangeValues.start.round()} - ${_rangeValues.end.round()} ',
            style: context.textTheme.labelMedium,
            children: [
              TextSpan(
                text: LocaleKeys.membersView_filters_ageFilter.tr(),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),

        /// clear age filter
        Visibility(
          visible: _rangeValues != _defaultRangeValues,
          child: InkWell(
            onTap: () =>
                ref.read(filterNotifierProvider.notifier).removeAgeFilter(),
            child: const Icon(
              Icons.clear,
            ),
          ),
        ),
      ],
    );
  }
}
