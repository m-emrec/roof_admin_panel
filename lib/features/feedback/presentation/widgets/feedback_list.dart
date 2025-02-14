import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/feedback_tile.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

/// FeedbackList
/// This is a list of feedbacks.
///
/// It is basically [FeedbackTile] wrapped in a ListView.
class FeedbackList extends ConsumerWidget {
  /// FeedbackList
  /// This is a list of feedbacks.
  ///
  /// It is basically [FeedbackTile] wrapped in a ListView.
  const FeedbackList({
    required this.feedbacks,
    super.key,
  });

  /// List of feedbacks to be displayed.
  final List<FeedbackModel> feedbacks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (feedbacks.isEmpty) {
      return Center(
        child: Text(LocaleKeys.feedback_noFeedbackForFilter.tr()),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const AppPadding.verticalSSymmetric(),
                child: FeedbackTile(feedback: feedbacks[index]),
              );
            },
          ),
        ),
        FutureBuilder(
          future: // Fetch next feedbacks
              ref
                  .read(feedbackViewModelProvider.notifier)
                  .fetchNextFeedbacks(feedbacks.last.feedbackId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingIndicator();
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
