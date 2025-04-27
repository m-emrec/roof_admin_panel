import 'package:core/utils/constants/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';
import 'package:roof_admin_panel/product/widgets/validation_wrapper.dart';

/// This is a date selection field
///
/// It takes :
///
/// 1. [title] : The title of the field
/// 2. [controller] : The controller to control the text field
class DateSelectionField extends StatelessWidget {
  /// This is a date selection field
  ///
  /// It takes :
  ///
  /// 1. [title] : The title of the field
  /// 2. [controller] : The controller to control the text field
  const DateSelectionField({
    required this.title,
    required this.controller,
    super.key,
  });

  /// The title of the field
  final String title;

  /// The [TextEditingController] to control the text field
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
        child: DateField(controller: controller),
      ),
    );
  }
}

class DateField extends StatefulWidget {
  const DateField({
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? selectedDate;

  /// This method will open a date picker dialog
  ///
  /// It will set the selected date to the selected date
  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      // membership start date can't be a future date
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
  void initState() {
    if (widget.controller.text.isNotEmpty) {
      selectedDate = DateTime.parse(widget.controller.text);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
      ),
      onPressed: _selectDate,
      icon: AppIcon(Assets.icons.calendarIcon),
      label: Text(
        selectedDate != null
            ? selectedDate?.formatDate(context) ?? ""
            : LocaleKeys.common_date_select.tr(),
      ),
    );
  }
}
