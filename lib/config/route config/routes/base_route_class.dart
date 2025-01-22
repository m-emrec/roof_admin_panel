import 'package:go_router/go_router.dart';

/// A base class for all routes in the application.
/// This class defines the basic structure of a route.
/// All routes in the application should extend this class.
/// This class is used to create a GoRoute instance for each route.
abstract class BaseRouteClass {
  /// A base class for all routes in the application.
  /// This class defines the basic structure of a route.
  /// All routes in the application should extend this class.
  /// This class is used to create a GoRoute instance for each route.
  const BaseRouteClass();

  /// The route for the class.
  GoRoute get route;
}
