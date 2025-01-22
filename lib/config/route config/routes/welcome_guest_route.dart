// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:roof_network/config/route%20config/routes/base_route_class.dart';
// import 'package:roof_network/features/auth/data/service/auth_service.dart';

// /// The welcome guest route.
// final class WelcomeGuestRoute extends BaseRouteClass {
//   /// The welcome guest route.
//   factory WelcomeGuestRoute() => _instance;
//   WelcomeGuestRoute._internal();

//   static final WelcomeGuestRoute _instance = WelcomeGuestRoute._internal();

//   /// The welcome guest route.
//   @override
//   GoRoute get route => GoRoute(
//         path: "/welcome-guest",
//         name: "welcomeGuest",
//         builder: (context, state) => Scaffold(
//           appBar: AppBar(
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.logout),
//                 onPressed: () {
//                   AuthService().signOut();
//                 },
//               ),
//             ],
//           ),
//           body: Center(
//             child: Text("Welcome Guest Screen"),
//           ),
//         ),
//       );
// }
