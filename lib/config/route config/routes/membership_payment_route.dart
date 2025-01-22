// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// /// The membership payment route.
// final class MembershipPaymentRoute extends BaseRouteClass {
//   /// The membership payment route.

//   factory MembershipPaymentRoute() => _instance;

//   /// The membership payment route.

//   MembershipPaymentRoute._internal();
//   static final MembershipPaymentRoute _instance =
//       MembershipPaymentRoute._internal();

//   /// The membership payment route.

//   /// The membership payment route.
//   @override
//   GoRoute get route => GoRoute(
//         path: "/membership-payment",
//         name: "membershipPayment",
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
//           body: const Center(
//             child: Text("Membership Payment Screen"),
//           ),
//         ),
//       );
// }
