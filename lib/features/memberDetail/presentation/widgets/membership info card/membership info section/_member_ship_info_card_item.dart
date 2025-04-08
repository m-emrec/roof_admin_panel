part of 'membership_info_section.dart';

///
class _MembershipInfoCardItem<T> extends ConsumerWidget {
  /// Used in the [MembershipInfoCard] to display the membership information
  /// in consistent layout.
  ///
  ///
  const _MembershipInfoCardItem({
    required this.label,
    required this.value,
    required this.field,
    this.controller,
  });

  final MembershipInfoField<dynamic> field;

  /// The label of the membership information
  final String label;
  final T value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return Wrap(
      spacing: SpacingSizes.extraExtraSmall,
      runSpacing: SpacingSizes.extraExtraSmall,
      children: [
        if (!isEditing)
          Text(
            "$label:",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoLabelTextStyle,
          ),
        field.build(context, isEditing: isEditing),
      ],
    );
  }
}
