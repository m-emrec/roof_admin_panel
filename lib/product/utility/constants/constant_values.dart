// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// A class that holds constant values used throughout the application.
class ConstantValues {
  ConstantValues._();

  /// The timeout duration for Firebase phone authentication.
  ///
  /// This is set to 120 seconds.
  static const Duration FIREBASE_PHONE_AUTH_TIMEOUT = Duration(seconds: 120);

  /// The phone code for Turkey.
  static const String PHONE_CODE = "+90";

  /// The maximum number of images that can be uploaded on the feedback screen.
  ///
  /// This is set to 3.
  static const int MAX_IMAGE_FEEDBACK_COUNT = 3;

  /// Warning threshold for membership end date.
  /// If the membership end date is less than this value, a warning will be displayed.
  /// This is set to 14 days.
  ///
  static const int MEMBERSHIP_EXPIRE_WARNING_THRESHOLD = 14;

  /// The minimum length of the feedback content.
  ///
  /// **This is set to 50**.
  ///
  /// The user must enter at least 50 characters.
  /// This is to ensure that the feedback is detailed and informative.
  static const int MIN_FEEDBACK_LENGTH = 50;

  /// The maximum length of the feedback content.
  ///
  /// **This is set to 1000**.
  ///
  /// The user must enter at most 1000 characters.
  /// This is to ensure that the feedback is not too long.
  static const int MAX_FEEDBACK_LENGTH = 1000;

  /// membershipWarning method checks if the membership end date is less than the warning threshold.
  ///
  /// If the difference between the current date and the membership end date is less than the threshold,
  /// it returns true.
  static bool isMembershipExpiringSoon(DateTime date) {
    final now = DateTime.now();

    final diff = date.difference(now).inDays;

    return diff < MEMBERSHIP_EXPIRE_WARNING_THRESHOLD;
  }

  /// getAge method calculates the age of the user based on the birth date.
  static int getAge(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      return age - 1;
    }

    return age;
  }

  /// DateTime formatter for the application.
  /// Formats the date in the format " dd MMM yyyy".
  /// Locale is set to the current locale of the application.
  ///  **Example Output**: `01 Jan 2022`.
  static String formattedDate(BuildContext context, DateTime date) {
    return DateFormat.yMMMd(
      context.locale.toString(),
    ).format(date);
  }
}
