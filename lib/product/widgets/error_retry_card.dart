import 'package:core/config/localization/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorRetryCard extends StatelessWidget {
  const ErrorRetryCard({
    required this.errorMessage,
    this.retry,
  });
  final String errorMessage;
  final void Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            child: Text(errorMessage),
          ),
          ElevatedButton(
            onPressed: retry,
            child: Text(LocaleKeys.common_retry.tr()),
          ),
        ],
      ),
    );
  }
}
