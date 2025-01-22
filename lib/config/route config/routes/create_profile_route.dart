import 'package:roof_network/config/route%20config/routes/base_route_class.dart';
import 'package:roof_network/features/auth/presentation/screens/auth_barrel.dart';
import 'package:roof_network/features/create%20profile/presentation/screens/create_profile_screen.dart';

/// A  class that defines the create profile route.
final class CreateProfileRoute extends BaseRouteClass {
  /// A  class that defines the create profile route.
  factory CreateProfileRoute() => _instance;

  /// Constructor for the create profile route.
  CreateProfileRoute._internal();

  static final CreateProfileRoute _instance = CreateProfileRoute._internal();

  /// The create profile route.
  @override
  GoRoute get route => GoRoute(
        path: "/create-profile",
        name: "createProfile",
        builder: (context, state) => const CreateProfileScreen(),
      );
}
