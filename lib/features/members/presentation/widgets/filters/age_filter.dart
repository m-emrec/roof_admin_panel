import 'package:core/core.dart';
import 'package:core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';

class AgeFilter extends ConsumerStatefulWidget {
  const AgeFilter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeFilterState();
}

class _AgeFilterState extends ConsumerState<AgeFilter> {
  static const double _minAge = 18;
  static const double _maxAge = 100;
  late RangeValues _rangeValues;

  @override
  Widget build(BuildContext context) {
    _rangeValues = ref.watch(filterNotifierProvider).ageFilter ??
        const RangeValues(_minAge, _maxAge);
    return Row(
      children: [
        Flexible(
          child: RangeSlider(
            divisions: _maxAge.round() - _minAge.round(),
            labels: RangeLabels(
              _rangeValues.start.round().toString(),
              _rangeValues.end.round().toString(),
            ),
            onChanged: (value) {
              if (value == const RangeValues(_minAge, _maxAge)) {
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
        Visibility(
          visible: _rangeValues != const RangeValues(_minAge, _maxAge),
          child: InkWell(
            onTap: () {
              ref.read(filterNotifierProvider.notifier).removeAgeFilter();
            },
            child: const Icon(
              Icons.clear,
            ),
          ),
        ),
      ],
    );
  }
}
