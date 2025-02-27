part of './../app_theme.dart';

final class _GuestsTableTheme {
  _GuestsTableTheme._();

  static GuestsTableThemeExtension theme() => GuestsTableThemeExtension(
        joinedEventCountButtonStyle: _joinedEventCountButtonStyle(),
        approveButtonStyle: _approveButtonStyle(),
        removeButtonStyle: _removeButtonStyle(),
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

  static ButtonStyle? _approveButtonStyle() =>
      _TextButtonTheme.textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return AppColors.primaryColor[70] ?? Colors.grey;
        }),
      );
  static ButtonStyle? _removeButtonStyle() =>
      _TextButtonTheme.textButtonTheme.style?.copyWith(
        foregroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return AppColors.accentError[70] ?? Colors.grey;
        }),
      );
}
