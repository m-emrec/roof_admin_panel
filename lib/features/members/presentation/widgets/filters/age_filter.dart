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
  bool _isFilterApplied = false;

  @override
  void initState() {
    // if (ref
    //     .read(filterConditionsListProviderProvider)
    //     .any((element) => element.columnName == TableNamesEnum.age)) {
    //   final ageFilters = ref
    //       .read(filterConditionsListProviderProvider)
    //       .where((element) => element.columnName == TableNamesEnum.age);
    //   final minAge = ageFilters
    //       .firstWhere((element) =>
    //           element.condition.type == FilterType.greaterThanOrEqual)
    //       .condition
    //       .value;

    //   final maxAge = ageFilters
    //       .firstWhere(
    //           (element) => element.condition.type == FilterType.lessThanOrEqual)
    //       .condition
    //       .value;

    //   _rangeValues = RangeValues(
    //       ConstantValues.getAge(DateTime.parse(minAge.toString())).toDouble() +
    //           1,
    //       ConstantValues.getAge(DateTime.parse(maxAge.toString())).toDouble() +
    //           1);
    //   ;
    // } else {
    // }
    _rangeValues = RangeValues(_minAge, _maxAge);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: RangeSlider(
            onChangeEnd: (value) =>
                ref.read(filterNotifierProvider.notifier).addAgeFilter(value),
            divisions: _maxAge.round() - _minAge.round(),
            labels: RangeLabels(
              _rangeValues.start.round().toString(),
              _rangeValues.end.round().toString(),
            ),
            onChanged: (value) {
              if (value == const RangeValues(_minAge, _maxAge)) {
                _isFilterApplied = false;
              } else {
                _isFilterApplied = true;
              }
              setState(() {
                _rangeValues = value;
              });
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

        // Visibility(
        //   visible: _isFilterApplied,
        //   child: IconButton(
        //     onPressed: () {
        //       ref
        //           .read(filterNotifierProvider.notifier)
        //           .addAgeFilter(_rangeValues.start, _rangeValues.end);
        //     },
        //     icon: const Icon(Icons.check),
        //   ),
        // ),
      ],
    );
  }
}
