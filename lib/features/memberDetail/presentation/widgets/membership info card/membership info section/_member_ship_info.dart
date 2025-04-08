part of 'membership_info_section.dart';

///
class _MembershipInfo extends ConsumerWidget {
  /// Used in the [MembershipInfoSection] to display the membership information
  /// in consistent layout.
  ///
  ///
  const _MembershipInfo(
    this.field,
  );

  final BaseMembershipInfoField<dynamic> field;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);
    return Wrap(
      spacing: SpacingSizes.extraExtraSmall,
      runSpacing: SpacingSizes.extraExtraSmall,
      children: [
        if (!isEditing)
          Text(
            "${field.label}:",
            style: context.theme
                .extension<MembershipInfoCardThemeExtension>()
                ?.membershipInfoLabelTextStyle,
          ),
        field.build(context, isEditing: isEditing),
      ],
    );
  }
}
