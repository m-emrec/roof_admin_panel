// import 'package:go_router/go_router.dart';
// import 'package:roof_network/config/route%20config/routes/base_route_class.dart';
// import 'package:roof_network/config/route%20config/routes/profile/feedback/_feedback_history_route.dart';
// import 'package:roof_network/features/feedback/presentation/pages/feed_back_screen.dart';

// /// The feedback route.
// ///
// /// This route is used to navigate to the feedback screen.
// /// It is a child route of the profile route.
// final class FeedbackRoute extends BaseRouteClass {
//   /// The feedback route.
//   ///
//   /// This route is used to navigate to the feedback screen.
//   /// It is a child route of the profile route.
//   factory FeedbackRoute() => _instance;
//   FeedbackRoute._internal();

//   static final FeedbackRoute _instance = FeedbackRoute._internal();

//   @override
//   GoRoute get route => GoRoute(
//         path: "/feedback",
//         name: "feedback",
//         builder: (context, state) => const FeedbackScreen(),
//         routes: [
//           FeedbackHistoryRoute().route,
//         ],
//       );
// }
