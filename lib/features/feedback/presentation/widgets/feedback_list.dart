import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/feedback_tile.dart';

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
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          if (index == feedbacks.length - 1) {
            // Fetch next feedbacks
            ref
                .read(feedbackViewModelProvider.notifier)
                .fetchNextFeedbacks(feedbacks.last.feedbackId);
          }
          return Padding(
            padding: const AppPadding.verticalSSymmetric(),
            child: FeedbackTile(feedback: feedbacks[index]),
          );
        },
      ),
    );
  }
}
