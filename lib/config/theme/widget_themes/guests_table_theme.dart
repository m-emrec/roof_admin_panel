part of './../app_theme.dart';

final class _GuestsTableTheme {
  _GuestsTableTheme._();

  static GuestsTableThemeExtension theme(BuildContext context) =>
      GuestsTableThemeExtension(
        joinedEventCountButtonStyle: _joinedEventCountButtonStyle(),
        approveButtonStyle: _approveButtonStyle(context),
        removeButtonStyle: _removeButtonStyle(context),
      );

  static ButtonStyle? _joinedEventCountButtonStyle() {
    return _IconButtonTheme.iconButtonTheme.style?.copyWith(
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      foregroundColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return _IconButtonTheme.iconButtonTheme.style?.foregroundColor
                  ?.resolve({WidgetState.disabled}) ??
              Colors.black;
        }
        return _IconButtonTheme.iconButtonTheme.style?.foregroundColor
                ?.resolve({}) ??
            Colors.black;
      }),
      backgroundColor: WidgetStateColor.resolveWith((states) {
        return Colors.transparent;
      }),
    );
  }

  static ButtonStyle? _approveButtonStyle(BuildContext context) =>
      _TextButtonTheme.textButtonTheme(context).style?.copyWith(
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return AppColors.primaryColor[70] ?? Colors.grey;
        }),
      );
  static ButtonStyle? _removeButtonStyle(BuildContext context) =>
      _TextButtonTheme.textButtonTheme(context).style?.copyWith(
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return AppColors.accentError[70] ?? Colors.grey;
        }),
      );
}
