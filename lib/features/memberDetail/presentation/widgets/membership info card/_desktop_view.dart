part of 'membership_info_card.dart';

class _DesktopView extends StatelessWidget {
  const _DesktopView(this.member);
  final UserModel? member;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.extension<MembershipInfoCardThemeExtension>();
    return MembersDetailSectionCard(
      child: SizedBox(
        width: context.dynamicWidth(0.9),
        child: Padding(
          padding: theme?.padding ?? EdgeInsets.zero,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: SpacingSizes.medium,
            children: [
              AvatarNameRoleSection(member: member),
              SizedBox(
                height: context.dynamicHeight(0.1),
                child: VerticalDivider(
                  thickness: theme?.dividerTheme.thickness,
                  color: theme?.dividerTheme.color,
                ),
              ),
              _MembershipInfoSection(member: member),
            ],
          ),
        ),
      ),
    );
  }
}
