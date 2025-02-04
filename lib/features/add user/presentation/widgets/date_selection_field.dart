import 'package:core/utils/constants/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';

class DateSelectionField extends StatelessWidget {
  const DateSelectionField(
      {required this.title, super.key, required this.controller});
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: title,
      required: true,
      child: ValidationWrapper(
        validator: (p0) => controller.text.isEmpty
            ? LocaleKeys.common_validationError_required.tr()
            : null,
        child: _DateField(controller),
      ),
    );
  }
}

class _DateField extends StatefulWidget {
  const _DateField(this.controller);
  final TextEditingController controller;
  @override
  State<_DateField> createState() => __DateFieldState();
}

class __DateFieldState extends State<_DateField> {
  DateTime? selectedDate;

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.calendarIcon),
        const SizedBox(width: 10),
        TextButton(
          onPressed: _selectDate,
          child: Text(
            selectedDate != null
                ? selectedDate?.formatDate(context) ?? ""
                : LocaleKeys.common_selectAll.tr(),
          ),
        ),
      ],
    );
  }
}
