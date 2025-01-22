import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/utility/constants/spacing_sizes.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_title.dart';

/// A widget that displays a section with a title and a child widget.
class Section extends StatelessWidget {
  /// A widget that displays a section.
  /// It is a [Column] widget that contains a [SectionTitle] and a child widget.
  ///
  /// The [Section] requires a [title] and a [child] widget.
  ///
  /// The [crossAxisAlignment] parameter is used to align the children.
  ///
  /// The [required] parameter is used to indicate if the section is required.
  ///```dart
  /// Section(
  ///  title: 'Title',// required
  /// child: ChildWidget(), // required
  /// crossAxisAlignment: CrossAxisAlignment.center,/// optional default is CrossAxisAlignment.start
  /// required: true, // optional default is false
  /// )
  ///```
  const Section({
    required this.title,
    required this.child,
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.required = false,
  });

  /// Indicates if the section is required.
  /// If true, the title will be displayed with an asterisk.
  /// Defaults to false.
  final bool required;

  /// The title of the section.
  /// It is displayed at the top of the section.
  /// It is **required**.
  final String title;

  /// The child widget of the section.
  /// It is displayed below the title.
  /// It is **required**.
  final Widget child;

  /// The alignment of the children.
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SpacingSizes.extraSmall,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        SectionTitle(
          required ? '$title *' : title,
        ),
        child,
      ],
    );
  }
}
