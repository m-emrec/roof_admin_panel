import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback-page/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/theme_extensions_extesntion.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';
import 'package:roof_admin_panel/product/widgets/custom_skeleton.dart';

/// Shows the reported user info if the reportedUserId is not empty
class ReportedUser extends ConsumerWidget {
  /// Shows the reported user info if the reportedUserId is not empty
  const ReportedUser({
    required this.reportedUserId,
    super.key,
  });

  ///
  final String reportedUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(reportedUserProvider(reportedUserId)).when(
          data: (user) {
            return Row(
              children: [
                Avatar(
                  showShadow: false,
                  imageUrl: user.imageUrl,
                  radius: context.feedbackTileThemeExtension?.userImageRadius,
                ),
                TextButton(
                  child: Text(user.name ?? ""),
                  onPressed: () {},
                ),
              ],
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: context.textTheme.bodySmall,
            );
          },
          loading: () => const CustomSkeleton(child: Text("Loading")),
        );
  }
}
