import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/widgets/add%20user/date_selection_field.dart';

/// The [DateMembershipInfoField] class is a concrete implementation of
/// [BaseMembershipInfoField] for displaying and editing date-based membership
/// information (e.g., membership start or end date).
final class DateMembershipInfoField extends BaseMembershipInfoField<DateTime?> {
  /// A concrete implementation of [BaseMembershipInfoField] for handling date-based
  /// fields (e.g. membership start or end date).
  ///
  /// Uses a [DateField] widget for editable fields when a controller is provided.
  /// When `isEditable` is false or no controller is available, it renders nothing
  /// in edit mode.
  ///
  /// In view-only mode, the field value is formatted using the `formatDate()`
  /// extension and displayed as styled text.
  ///
  /// Use the `.notEditable` named constructor to define non-editable date fields
  /// (e.g. calculated durations).
  const DateMembershipInfoField({
    required super.label,
    required super.value,
    super.controller,
  }) : super(isEditable: true);

  /// Use the `.notEditable` named constructor to define non-editable date fields
  /// (e.g. calculated durations).
  const DateMembershipInfoField.notEditable({
    required super.label,
    required super.value,
    super.controller,
  }) : super(isEditable: false);
  @protected
  @override
  Widget editStateWidget(BuildContext context) {
    return Wrap(
      children: [
        Text(
          "$label: ",
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoLabelTextStyle,
        ),
        DateField(controller: controller!),
      ],
    );
  }

  @protected
  @override
  Widget widget(BuildContext context) {
    return Text(
      value?.formatDate(context) ?? " - ",
      style: context.theme
          .extension<MembershipInfoCardThemeExtension>()
          ?.membershipInfoValueTextStyle,
    );
  }
}
