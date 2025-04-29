import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_title.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _TitleSection(
          rangeValues: _rangeValues,
          defaultRangeValues: _defaultRangeValues,
        ),

        /// age filter slider
        _Slider(
          maxAge: _maxAge,
          minAge: _minAge,
          rangeValues: _rangeValues,
          defaultRangeValues: _defaultRangeValues,
        ),
      ],
    );
  }
}

class _Slider extends ConsumerWidget {
  const _Slider({
    required double maxAge,
    required double minAge,
    required RangeValues rangeValues,
    required RangeValues defaultRangeValues,
  })  : _maxAge = maxAge,
        _minAge = minAge,
        _rangeValues = rangeValues,
        _defaultRangeValues = defaultRangeValues;

  final double _maxAge;
  final double _minAge;
  final RangeValues _rangeValues;
  final RangeValues _defaultRangeValues;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              if (value == _defaultRangeValues) {
                ref
                    .read(filterNotifierProvider)
                    .removeFilter(MemberTableNames.age);
              } else {
                ref
                    .read(filterNotifierProvider)
                    .addFilter(MemberTableNames.age, value);
              }
            },
            min: _minAge,
            max: _maxAge,
            values: _rangeValues,
          ),
        ),
      ],
    );
  }
}

class _TitleSection extends ConsumerWidget {
  const _TitleSection({
    required RangeValues rangeValues,
    required RangeValues defaultRangeValues,
  })  : _rangeValues = rangeValues,
        _defaultRangeValues = defaultRangeValues;

  final RangeValues _rangeValues;
  final RangeValues _defaultRangeValues;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: SpacingSizes.extraSmall,
      children: [
        /// age filter text
        SectionTitle(LocaleKeys.membersView_filters_ageFilterLabel.tr()),
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
            onTap: () => ref
                .read(filterNotifierProvider.notifier)
                .removeFilter(MemberTableNames.age),
            child: Text(
              LocaleKeys.common_clear.tr(),
              style: context.textTheme.labelMedium?.copyWith(
                color: AppColors.accentError[50],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
