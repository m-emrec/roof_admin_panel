part of '../app_theme.dart';

final class _MembershipInfoCardTheme extends MembershipInfoCardThemeExtension {
  _MembershipInfoCardTheme(
    BuildContext context,
  ) : super(
          dividerTheme: DividerThemeData(
            color: AppColors.neutralGray500,
            thickness: 2,
          ),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor[60] ?? Colors.white,
          padding: const AppPadding.horizontalMSymmetric() +
              const AppPadding.verticalSSymmetric(),
          avatarRadius: IconSizes.xlarge.width,
          roleTextStyle: context.textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryColor[30],
            fontWeight: FontWeight.w800,
          ),
          membershipInfoLabelTextStyle: context.textTheme.labelLarge?.copyWith(
            color: AppColors.neutralGray500[80],
            fontWeight: FontWeight.w700,
          ),
          membershipInfoValueTextStyle: context.textTheme.labelLarge?.copyWith(
            color: AppColors.neutralGray900[50],
            fontWeight: FontWeight.w800,
          ),
        );
}
