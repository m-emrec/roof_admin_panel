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

  /// DateTime formatter for the application.
  /// Formats the date in the format " dd MMM yyyy".
  /// Locale is set to the current locale of the application.
  ///  **Example Output**: `01 Jan 2022`.
  static String formattedDate(BuildContext context, DateTime date) {
    return DateFormat.yMMMd(
      context.locale.toString(),
    ).format(date);
  }

  static const List<Map<String, dynamic>> phoneCodes = [
    {"countryCode": "AF", "phoneCode": "+93"},
    {"countryCode": "AL", "phoneCode": "+355"},
    {"countryCode": "DZ", "phoneCode": "+213"},
    {"countryCode": "AD", "phoneCode": "+376"},
    {"countryCode": "AO", "phoneCode": "+244"},
    {"countryCode": "AR", "phoneCode": "+54"},
    {"countryCode": "AM", "phoneCode": "+374"},
    {"countryCode": "AU", "phoneCode": "+61"},
    {"countryCode": "AT", "phoneCode": "+43"},
    {"countryCode": "AZ", "phoneCode": "+994"},
    {"countryCode": "BH", "phoneCode": "+973"},
    {"countryCode": "BD", "phoneCode": "+880"},
    {"countryCode": "BY", "phoneCode": "+375"},
    {"countryCode": "BE", "phoneCode": "+32"},
    {"countryCode": "BZ", "phoneCode": "+501"},
    {"countryCode": "BJ", "phoneCode": "+229"},
    {"countryCode": "BT", "phoneCode": "+975"},
    {"countryCode": "BO", "phoneCode": "+591"},
    {"countryCode": "BA", "phoneCode": "+387"},
    {"countryCode": "BW", "phoneCode": "+267"},
    {"countryCode": "BR", "phoneCode": "+55"},
    {"countryCode": "BN", "phoneCode": "+673"},
    {"countryCode": "BG", "phoneCode": "+359"},
    {"countryCode": "BF", "phoneCode": "+226"},
    {"countryCode": "BI", "phoneCode": "+257"},
    {"countryCode": "KH", "phoneCode": "+855"},
    {"countryCode": "CM", "phoneCode": "+237"},
    {"countryCode": "CA", "phoneCode": "+1"},
    {"countryCode": "CV", "phoneCode": "+238"},
    {"countryCode": "TD", "phoneCode": "+235"},
    {"countryCode": "CL", "phoneCode": "+56"},
    {"countryCode": "CN", "phoneCode": "+86"},
    {"countryCode": "CO", "phoneCode": "+57"},
    {"countryCode": "KM", "phoneCode": "+269"},
    {"countryCode": "CR", "phoneCode": "+506"},
    {"countryCode": "HR", "phoneCode": "+385"},
    {"countryCode": "CU", "phoneCode": "+53"},
    {"countryCode": "CY", "phoneCode": "+357"},
    {"countryCode": "CZ", "phoneCode": "+420"},
    {"countryCode": "DK", "phoneCode": "+45"},
    {"countryCode": "EG", "phoneCode": "+20"},
    {"countryCode": "FR", "phoneCode": "+33"},
    {"countryCode": "DE", "phoneCode": "+49"},
    {"countryCode": "GR", "phoneCode": "+30"},
    {"countryCode": "IN", "phoneCode": "+91"},
    {"countryCode": "ID", "phoneCode": "+62"},
    {"countryCode": "IR", "phoneCode": "+98"},
    {"countryCode": "IQ", "phoneCode": "+964"},
    {"countryCode": "IE", "phoneCode": "+353"},
    {"countryCode": "IL", "phoneCode": "+972"},
    {"countryCode": "IT", "phoneCode": "+39"},
    {"countryCode": "JP", "phoneCode": "+81"},
    {"countryCode": "JO", "phoneCode": "+962"},
    {"countryCode": "KZ", "phoneCode": "+7"},
    {"countryCode": "KE", "phoneCode": "+254"},
    {"countryCode": "KW", "phoneCode": "+965"},
    {"countryCode": "LB", "phoneCode": "+961"},
    {"countryCode": "LY", "phoneCode": "+218"},
    {"countryCode": "LU", "phoneCode": "+352"},
    {"countryCode": "MY", "phoneCode": "+60"},
    {"countryCode": "MX", "phoneCode": "+52"},
    {"countryCode": "MA", "phoneCode": "+212"},
    {"countryCode": "NP", "phoneCode": "+977"},
    {"countryCode": "NL", "phoneCode": "+31"},
    {"countryCode": "NZ", "phoneCode": "+64"},
    {"countryCode": "NG", "phoneCode": "+234"},
    {"countryCode": "PK", "phoneCode": "+92"},
    {"countryCode": "PH", "phoneCode": "+63"},
    {"countryCode": "PL", "phoneCode": "+48"},
    {"countryCode": "PT", "phoneCode": "+351"},
    {"countryCode": "QA", "phoneCode": "+974"},
    {"countryCode": "RO", "phoneCode": "+40"},
    {"countryCode": "RU", "phoneCode": "+7"},
    {"countryCode": "SA", "phoneCode": "+966"},
    {"countryCode": "ZA", "phoneCode": "+27"},
    {"countryCode": "ES", "phoneCode": "+34"},
    {"countryCode": "SE", "phoneCode": "+46"},
    {"countryCode": "CH", "phoneCode": "+41"},
    {"countryCode": "TR", "phoneCode": "+90"},
    {"countryCode": "UA", "phoneCode": "+380"},
    {"countryCode": "AE", "phoneCode": "+971"},
    {"countryCode": "GB", "phoneCode": "+44"},
    {"countryCode": "US", "phoneCode": "+1"},
    {"countryCode": "VN", "phoneCode": "+84"}
  ];
}
