part of 'router.dart';

final class _PageNotFound {
  _PageNotFound._();
  static Page<dynamic> Function(BuildContext, GoRouterState)? get page =>
      (context, state) {
        Log.error(state.error?.message);
        return MaterialPage<void>(
          child: Scaffold(
            body: Center(
              child: Column(
                spacing: SpacingSizes.large,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.a404Icon),
                  Text(
                    LocaleKeys.notFoundPage_pageNotFound.tr(),
                    style: context.textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () => context.go("/"),
                    child: Text(LocaleKeys.notFoundPage_goHome.tr()),
                  ),
                ],
              ),
            ),
          ),
        );
      };
}
