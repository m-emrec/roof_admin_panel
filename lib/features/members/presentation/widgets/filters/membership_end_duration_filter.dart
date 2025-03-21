import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/members/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';

class MembershipEndDurationFilter extends ConsumerStatefulWidget {
  const MembershipEndDurationFilter({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MembershipEndDurationFilterState();
}

class _MembershipEndDurationFilterState
    extends ConsumerState<MembershipEndDurationFilter> {
  DateTimeRange? _pickedDate;

  Future<void> _showDatePicker() async {
    final firstDate = DateTime.now().subtract(const Duration(days: 365));
    final lastDate = DateTime.now().add(const Duration(days: 365));
    _setPickedDate(
      await showDateRangePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: (context, child) => child ?? const SizedBox(),
      ),
    );
  }

  void _setPickedDate(DateTimeRange? pickedDate) {
    _pickedDate = pickedDate;
    if (_pickedDate != null) {
      setState(() {});
      ref
          .read(filterNotifierProvider.notifier)
          .addMembershipEndDurationFilter(_pickedDate!);
    }
  }

  void _clearDate() {
    _pickedDate = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: _showDatePicker,
      icon: SvgPicture.asset(Assets.icons.calendarIcon),
      label: _pickedDate != null
          ? _PickedDateText(
              _pickedDate,
              _clearDate,
            )
          : Text(
              LocaleKeys.membersView_filters_memberShipEndDurationFilterLabel
                  .tr(),
            ),
    );
  }
}

class _PickedDateText extends StatelessWidget {
  const _PickedDateText(this._pickedDate, this._clearDate);
  final VoidCallback _clearDate;
  final DateTimeRange? _pickedDate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: InkWell(
        onTap: _clearDate,
        child: const Icon(Icons.clear),
      ),
      title: Text.rich(
        TextSpan(
          text:
              '${_pickedDate!.start.formatDate(context)} - ${_pickedDate!.end.formatDate(context)} ',
          style: context.textTheme.labelMedium,
          children: [
            TextSpan(
              text: LocaleKeys.membersView_filters_memberShipEndDurationFilter
                  .tr(),
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
