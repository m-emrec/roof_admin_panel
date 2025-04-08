import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_section.dart';

/// The [TextMembershipInfoField] class is a concrete implementation of
/// [BaseMembershipInfoField] for displaying and editing simple text-based
/// membership data (e.g., member number, role).
final class TextMembershipInfoField extends BaseMembershipInfoField<String> {
  /// A concrete implementation of [BaseMembershipInfoField] for displaying and
  /// editing simple text-based membership data (e.g. member number,).
  ///
  /// This class supports both editable and read-only configurations via
  /// the default and `.notEditable` named constructors.
  ///
  /// When in editing mode and `isEditable` is true, it renders a
  /// [MembershipInfoSectionTextField].
  /// if `isEditable` is false, it will render an empty [SizedBox] and it will
  /// be not shown in the UI.
  ///
  /// Otherwise, it shows a styled [Text] widget.
  ///
  ///
  TextMembershipInfoField({
    required super.label,
    required super.value,
    super.controller,
  }) : super(isEditable: true);

  /// A named constructor for creating a non-editable version of the
  /// [TextMembershipInfoField].
  /// This constructor sets `isEditable` to false, making the field
  /// read-only.
  /// It will render an empty [SizedBox] when in `isEditing`set to true
  /// and it will be not shown in the UI.
  TextMembershipInfoField.notEditable({
    required super.label,
    required super.value,
    super.controller,
  }) : super(isEditable: false);

  @protected
  @override
  Widget editStateWidget(BuildContext context) {
    return MembershipInfoSectionTextField(
      editStateLabel: label,
      controller: controller,
    );
  }

  @override
  @protected
  Widget widget(BuildContext? context) {
    if (context == null) {
      return const SizedBox();
    }
    return Text(
      value,
      style: context.theme
          .extension<MembershipInfoCardThemeExtension>()
          ?.membershipInfoValueTextStyle,
    );
  }
}
