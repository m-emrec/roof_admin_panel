import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members-view/presentation/enums/table_names_enum.dart';
import 'package:roof_admin_panel/features/members-view/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class MembershipEndDurationFilter extends ConsumerWidget {
  MembershipEndDurationFilter({super.key});
  DateTimeRange? _pickedDate;

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final firstDate = DateTime.now().subtract(const Duration(days: 365));
    final lastDate = DateTime.now().add(const Duration(days: 365));
    _setPickedDate(
      await showDateRangePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) => child ?? const SizedBox(),
      ),
      ref,
    );
  }

  void _setPickedDate(DateTimeRange? pickedDate, WidgetRef ref) {
    _pickedDate = pickedDate;
    if (_pickedDate != null) {
      ref
          .read(filterNotifierProvider)
          .addFilter(MemberTableNames.membershipEndDate, _pickedDate);
    }
  }

  void _clearDate(WidgetRef ref) {
    ref
        .read(filterNotifierProvider)
        .removeFilter(MemberTableNames.membershipEndDate);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _pickedDate = ref.watch(filterNotifierProvider).membershipEndDurationFilter;
    return Section(
      title:
          LocaleKeys.membersView_filters_memberShipEndDurationFilterLabel.tr(),
      child: ListTile(
        shape: const StadiumBorder(),
        trailing: Visibility(
          visible: _pickedDate != null,
          child: InkWell(
            onTap: () => _clearDate(ref),
            child: Icon(
              Icons.clear,
              color: AppColors.accentError[50],
            ),
          ),
        ),
        leading: AppIcon.small(Assets.icons.calendarIcon),
        onTap: () => _showDatePicker(context, ref),
        title: _pickedDate != null
            ? _PickedDateText(_pickedDate)
            : Text(
                LocaleKeys.common_date_select.tr(),
                style: context.textTheme.labelMedium,
              ),
      ),
    );
  }
}

class _PickedDateText extends StatelessWidget {
  const _PickedDateText(
    this._pickedDate,
  );
  final DateTimeRange? _pickedDate;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
            '${_pickedDate!.start.formatDate(context)} - ${_pickedDate!.end.formatDate(context)} ',
        style: context.textTheme.labelMedium,
        children: [
          TextSpan(
            text:
                LocaleKeys.membersView_filters_memberShipEndDurationFilter.tr(),
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
