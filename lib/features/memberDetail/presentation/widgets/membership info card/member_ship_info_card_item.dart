part of 'membership_info_card.dart';

///
class _MembershipInfoCardItem extends StatelessWidget {
  /// Used in the [MembershipInfoCard] to display the membership information
  /// in consistent layout.
  ///
  ///
  const _MembershipInfoCardItem({
    required this.label,
    this.value,
  });

  /// The label of the membership information
  final String label;

  /// The value of the membership information
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingSizes.extraSmall,
      children: [
        Text(
          "$label:",
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoLabelTextStyle,
        ),
        Text(
          value ?? '',
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoValueTextStyle,
        ),
      ],
    );
  }
}
