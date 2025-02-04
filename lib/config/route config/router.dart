import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/auth_change_notifier.dart';
import 'package:roof_admin_panel/config/route%20config/redirectors/authentication_based_redirect.dart';
import 'package:roof_admin_panel/config/route%20config/routes/initial_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/members_route/members_route.dart';
import 'package:roof_admin_panel/config/route%20config/routes/signin_route.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';

/// The AppRouter class is responsible for managing the application's routing.
/// It listens to authentication state changes and updates the
/// routes accordingly.
final class AppRouter {
  /// When the AppRouter is instantiated, it starts listening to authentication
  ///  state changes.
  AppRouter() {
    AuthService().authStateChanges.listen((user) {
      _authChangeNotifier.notify();
    });
  }

  /// Getter for the GoRouter instance.
  GoRouter get router => _router;

  /// An instance of AuthChangeNotifier to listen for authentication changes.
  static final AuthChangeNotifier _authChangeNotifier = AuthChangeNotifier();

  /// The GoRouter instance that defines the application's routes and their
  /// configurations.
  static final GoRouter _router = GoRouter(
    refreshListenable: _authChangeNotifier,
    redirect: AuthenticationBasedRedirector().redirect,
    initialLocation: InitialRoute().route.path,
    routes: [
      // //* Home Page
      InitialRoute().route,
      // HomeRoute().shell,
      MembersRoute().shell,
      // //* [SignIn] page
      SignInRoute().route,
    ],
  );
}
