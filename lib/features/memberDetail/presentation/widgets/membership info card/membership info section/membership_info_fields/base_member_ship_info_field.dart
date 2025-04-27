import 'package:flutter/material.dart';

/// The [BaseMembershipField] abstract class defines a common interface for
/// displaying and editing various types of membership-related information
/// (e.g., text, date).
///
/// This class encapsulates shared properties such as:
/// - `label`: A human-readable title for the field
/// - `value`: The current value of the field (generic type `T`)
/// - `controller`: An optional controller for editable fields
/// - `isEditable`: A flag indicating whether the field can be modified
///
/// Subclasses must implement the [build] method, which renders the field
/// based on whether the UI is in editing mode or view-only mode.

abstract base class BaseMembershipField<T> {
  /// Constructor for the [BaseMembershipField] class.
  /// It initializes the `label`, `value`, `controller`, and `isEditable` properties.
  /// The `isEditable` property defaults to `true`, indicating that the field
  /// is editable unless specified otherwise.
  const BaseMembershipField({
    required this.label,
    required this.value,
    required this.controller,
    this.isEditable = true,
  });

  /// The label of the membership information field.
  /// This is a human-readable title that describes the field's purpose.
  /// For example, "Membership Number", "Start Date", etc.
  final String label;

  /// The current value of the membership information field.
  /// This is a generic type `T`, allowing for flexibility in the type of data
  /// that can be stored (e.g., String for text, DateTime for dates).
  /// For example, a member's number, start date, etc.
  final T value;

  /// An optional [TextEditingController] for managing the text input
  /// when the field is in editing mode. This is useful for text-based fields
  /// where user input is required.
  /// For example, a controller for a text field that allows the user to
  /// edit their membership number.
  final TextEditingController? controller;

  /// A boolean flag indicating whether the field is editable.
  /// This property determines if the field can be modified by the user.
  /// If `true`, the field is editable; if `false`, it is read-only.
  /// For example, a field that displays calculated values or information
  /// that should not be modified by the user.
  final bool isEditable;

  /// The [build] method is responsible for rendering the field based on the
  /// current state (editing or view-only).
  /// It takes a [BuildContext] and a boolean `isEditing` flag as parameters.
  /// The `isEditing` flag indicates whether the UI is currently in editing mode.
  /// The method returns a [Widget] that represents the field in its current state.
  Widget build(BuildContext context, {required bool isEditing}) =>
      _buildEditingField(
        editWidget: editStateWidget(context),
        widget: widget(context),
        isEditing: isEditing,
      );

  /// The [editStateWidget] method must be implemented by subclasses to
  /// provide the widget that will be displayed when the field is in editing
  /// mode. This widget should be tailored to the specific type of data being
  /// edited (e.g., text input, date picker).
  ///
  ///  ### !!! This method should not be called directly;
  ///     it is intended to be
  ///     overridden by subclasses to provide the appropriate widget for
  ///     displaying the field's value.
  ///
  @protected
  Widget editStateWidget(BuildContext context);

  /// The [widget] method must be implemented by subclasses to provide the
  /// widget that will be displayed when the field is in view mode.
  ///
  /// ### !!! This method should not be called directly;
  ///     it is intended to be
  ///     overridden by subclasses to provide the appropriate widget for
  ///     displaying the field's value.
  ///
  @protected
  Widget widget(BuildContext context);

  /// The [_buildEditingField] method is a helper function that determines
  /// which widget to display based on the `isEditing` flag.
  /// If `isEditing` is true and `isEditable` is also true, it displays the
  /// `editWidget`. If `isEditing` is false, it displays the `widget`.
  /// If `isEditing` is true and `isEditable` is false, it returns an empty
  /// [SizedBox], effectively hiding the field in the UI.
  Widget _buildEditingField({
    required Widget editWidget,
    required Widget widget,
    required bool isEditing,
  }) {
    return isEditing
        ? isEditable
            ? editWidget
            : const SizedBox()
        : widget;
  }
}
