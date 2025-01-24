// import 'package:go_router/go_router.dart';
// import 'package:roof_network/config/route%20config/redirectors/role_based_redirector.dart';
// import 'package:roof_network/config/route%20config/routes/base_route_class.dart';
// import 'package:roof_network/config/route%20config/routes/profile/_edit_profile_route.dart';
// import 'package:roof_network/config/route%20config/routes/profile/feedback/_feed_back_route.dart';
// import 'package:roof_network/features/profile/presentation/pages/profile_screen.dart';

// /// The profile route.
// final class ProfileRoute extends BaseRouteClass {
//   /// The profile route.
//   factory ProfileRoute() => _instance;
//   ProfileRoute._internal();

//   /// The profile route.
//   static final ProfileRoute _instance = ProfileRoute._internal();

//   /// The profile route.
//   /// This route is only accessible to authenticated users.
//   /// If the user is not authenticated, they will be redirected to the sign-in page.
//   /// If the user is authenticated, they will be redirected to appropriate route
//   /// depending on their role.
//   @override
//   GoRoute get route => GoRoute(
//         path: "/profile",
//         name: "profile",
//         redirect: RoleBasedRedirector().redirect,
//         builder: (context, state) {
//           return const ProfileScreen();
//         },
//         routes: [
//           EditProfileRoute().route,
//           FeedbackRoute().route,
//         ],
//       );
// }
