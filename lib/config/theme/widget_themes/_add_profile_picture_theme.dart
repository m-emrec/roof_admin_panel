part of "../app_theme.dart";

final class _AddProfilePictureTheme extends AddProfilePictureTheme {
  final BuildContext context;
  _AddProfilePictureTheme(this.context)
      : super(
          addProfilePictureLabelStyle:
              AppTextTheme(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
          circleBackgroundColor: AppColors.backgroundColor[60],
          shadows: const [
            BoxShadow(
              color: Color(0xF992BBA2),
              blurRadius: 3,
            ),
            BoxShadow(
              color: Color(0xD892BBA2),
              blurRadius: 6,
            ),
            BoxShadow(
              color: Color(0x7F92BBA2),
              blurRadius: 8,
            ),
            BoxShadow(
              color: Color(0x2692BBA2),
              blurRadius: 9,
            ),
            BoxShadow(
              color: Color(0x0592BBA2),
              blurRadius: 10,
            ),
          ],
          circleSize: const Size(128, 128),
        );
}
