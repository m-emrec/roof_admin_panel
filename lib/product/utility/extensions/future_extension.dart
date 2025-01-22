import 'package:flutter/material.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

/// An extension on the [Future] class that provides a method to show a loading indicator while the future is loading.
extension FutureExtension<T> on Future<T> {
  /// Shows a loading indicator while the future is loading.
  Future<T> showLoading({
    required BuildContext context,
  }) async {
    final result = await LoadingIndicator.show(context: context, future: this);
    return result;
  }
}
