// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:roof_network/config/route%20config/redirectors/profile_based_redirector.dart';
// import 'package:roof_network/config/route%20config/route_redirector.dart';
// import 'package:roof_network/config/route%20config/routes/membership_payment_route.dart';
// import 'package:roof_network/config/route%20config/routes/welcome_guest_route.dart';
// import 'package:roof_network/core/constants/enums/roles.dart';
// import 'package:roof_network/core/services/user_service.dart';
// import 'package:roof_network/features/auth/data/service/auth_service.dart';

// /// Checks the user's role and determines the appropriate route.
// final class RoleBasedRedirector implements BaseRouteRedirector {
//   /// Singleton instance of the [RoleBasedRedirector].
//   factory RoleBasedRedirector() => _instance;
//   RoleBasedRedirector._internal();

//   static final RoleBasedRedirector _instance = RoleBasedRedirector._internal();

//   @override
//   FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
//     // await authenticationBasedRedirect(context, state);
//     final roles = await UserService()
//         .getCurrentUserRole(AuthService().currentUser?.phoneNumber ?? "")
//         ?.then(
//           (value) => value?.map((e) => e.toRole()).toList(),
//         );

//     if (roles?.contains(Role.guest) ?? false) {
//       return state.namedLocation(WelcomeGuestRoute().route.name ?? "");
//     }
//     if (roles?.contains(Role.approvedGuest) ?? false) {
//       return state.namedLocation(MembershipPaymentRoute().route.name ?? "");
//     } else {
//       return ProfileBasedRedirector().redirect(context, state);
//     }
//   }
// }
