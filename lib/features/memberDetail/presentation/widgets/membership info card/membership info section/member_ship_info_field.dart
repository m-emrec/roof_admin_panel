import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_section.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';

abstract class MembershipInfoField<T> {
  String get label;
  T get value;
  TextEditingController? get controller;
  bool get isEditable;
  Widget build(BuildContext context, bool isEditing);
}

class TextMembershipInfoField implements MembershipInfoField<String> {
  TextMembershipInfoField({
    required this.label,
    required this.value,
    this.controller,
  }) : isEditable = true;

  /// TODO: ADD comments and commit
  TextMembershipInfoField.notEditable({
    required this.label,
    required this.value,
    this.controller,
  }) : isEditable = false;
  @override
  final bool isEditable;
  @override
  final String label;
  @override
  final String value;
  @override
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, bool isEditing) {
    return isEditing
        ? isEditable
            ? MembershipInfoSectionTextField(
                editStateLabel: label,
                controller: controller,
              )
            : const SizedBox()
        : Text(
            value,
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoValueTextStyle,
          );
  }
}

class DateMembershipInfoField implements MembershipInfoField<DateTime?> {
  const DateMembershipInfoField({
    required this.label,
    required this.value,
    this.controller,
  }) : isEditable = true;
  const DateMembershipInfoField.notEditable({
    required this.label,
    required this.value,
    this.controller,
  }) : isEditable = false;

  @override
  final String label;
  @override
  final DateTime? value;
  @override
  final TextEditingController? controller;
  @override
  final bool isEditable;
  @override
  Widget build(BuildContext context, bool isEditing) {
    return isEditing
        ? isEditable && controller != null
            ? Wrap(
                children: [
                  Text(
                    "$label: ",
                    style: context.theme
                        .extension<MembershipInfoCardThemeExtension>()
                        ?.membershipInfoLabelTextStyle,
                  ),
                  DateField(controller: controller!),
                ],
              )
            : const SizedBox()
        : Text(
            value?.formatDate(context) ?? " - ",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoValueTextStyle,
          );
  }
}
