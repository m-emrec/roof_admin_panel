part of "select_users_grid_dialog.dart";

class _SelectUsersDialogErrorCard extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  const _SelectUsersDialogErrorCard({
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: AppColors.accentError,
        child: Padding(
          padding: const AppPadding.verticalSSymmetric() +
              const AppPadding.horizontalSSymmetric(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: SpacingSizes.small,
            children: [
              Icon(
                Icons.error,
                color: AppColors.accentError[80],
              ),
              Text(
                AppErrorText.errorMessageConverter(
                  errorMessage,
                ),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: AppColors.accentError[80],
                ),
              ),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(LocaleKeys.common_retry.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
