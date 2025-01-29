import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/members/data/models/filter_m%C3%BCodel.dart';
import 'package:roof_admin_panel/features/members/domain/entities/table_names_enum.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/constants/constant_values.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
    return Material(
      child: Row(
        children: [
          Column(
            children: [
              RangeSlider(
                labels: RangeLabels(
                  _rangeValues.start.round().toString(),
                  _rangeValues.end.round().toString(),
                ),
                onChanged: (value) {
                  if (value == RangeValues(_minAge, _maxAge)) {
                    _isFilterApplied = false;
                  } else {
                    _isFilterApplied = true;
                  }
                  setState(() {
                    _rangeValues = value;
                  });
                },
                min: 18,
                max: 100,
                values: _rangeValues,
              ),
              Text(
                '${_rangeValues.start.round()} - ${_rangeValues.end.round()} Yaş Arası',
              ),
            ],
          ),
          Visibility(
            visible: _isFilterApplied,
            child: IconButton(
                onPressed: () {
                  ref
                      .read(filterNotifierProvider.notifier)
                      .addAgeFilter(_rangeValues.start, _rangeValues.end);
                },
                icon: Icon(Icons.check)),
          ),
        ],
      ),
    );
  }
}
