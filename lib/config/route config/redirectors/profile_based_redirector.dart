import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_network/config/route%20config/route_redirector.dart';
import 'package:roof_network/config/route%20config/routes/create_profile_route.dart';
import 'package:roof_network/config/route%20config/routes/profile/_edit_profile_route.dart';
import 'package:roof_network/config/route%20config/routes/profile/feedback/_feed_back_route.dart';
import 'package:roof_network/config/route%20config/routes/profile/feedback/_feedback_history_route.dart';
import 'package:roof_network/config/route%20config/routes/profile/profile_route.dart';
import 'package:roof_network/core/services/user_service.dart';

/// If the user has completed their profile, redirect to the profile page.
/// Otherwise, redirect to the create profile page.
final class ProfileBasedRedirector implements BaseRouteRedirector {
  /// Singleton instance of the [ProfileBasedRedirector].
  factory ProfileBasedRedirector() => _instance;
  ProfileBasedRedirector._internal();

  static final ProfileBasedRedirector _instance =
      ProfileBasedRedirector._internal();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final hasProfile = await UserService().hasProfile();
    final isEditProfilePath = state.fullPath ==
        ProfileRoute().route.path + EditProfileRoute().route.path;
    final isFeedbackPath = state.fullPath ==
        ProfileRoute().route.path + FeedbackRoute().route.path;
    final isFeedbackHistoryPath = state.fullPath ==
        ProfileRoute().route.path +
            FeedbackRoute().route.path +
            FeedbackHistoryRoute().route.path;

    if (hasProfile) {
      if (isEditProfilePath || isFeedbackPath || isFeedbackHistoryPath) {
        return null;
      } else {
        return state.namedLocation(ProfileRoute().route.name ?? "");
      }
    } else {
      return state.namedLocation(CreateProfileRoute().route.name ?? "");
    }
  }
}
