part of 'membership_info_section.dart';

class MembershipInfoSectionTextField extends StatelessWidget {
  const MembershipInfoSectionTextField({
    required this.editStateLabel,
    required this.controller,
  });

  final String? editStateLabel;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const AppBorderRadius.small(),
      child: TextFormField(
        key: ValueKey(editStateLabel),
        style: context.theme
            .extension<MembershipInfoCardThemeExtension>()
            ?.membershipInfoValueTextStyle,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.backgroundColor,
          labelText: editStateLabel,
          errorStyle: context.textTheme.bodySmall?.copyWith(
            color: AppColors.accentError,
          ),
          constraints: BoxConstraints(
            maxHeight: 30,
            maxWidth: context.dynamicWidth(0.2),
          ),
          contentPadding:
              const AppPadding.smallOnlyPadding(bottom: true, left: true),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelStyle: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.membershipInfoLabelTextStyle,
        ),
        controller: controller,
      ),
    );
  }
}
