import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/feedback_tile.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback_list.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/filter%20row/filter_row.dart';
import 'package:roof_admin_panel/product/widgets/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

/// FeedbackView
/// This is the main view of the feedback feature.
class FeedbackView extends ConsumerWidget {
  /// FeedbackView
  /// This is the main view of the feedback feature.
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingSizes.medium,
      children: [
        /// Title
        TitleWidget(
          title: LocaleKeys.feedback_pageTitle.tr(),
        ),

        const FilterRow(),

        AsyncDataBuilder(
          provider: feedbackViewModelProvider,
          data: (feedbacks) {
            return Expanded(
              child: FeedbackList(
                feedbacks: ref.watch(feedbackFilterProvider),
              ),
            );
          },
          skeleton: FeedbackTile(
            feedback: FeedbackModel(
              feedbackId: "1",
              content:
                  "lorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit ametlorem ipsum dolor sit amet",
              createdAt: DateTime.now(),
              imageUrls: [
                "https://picsum.photos/200/300",
                "https://picsum.photos/200/300",
              ],
            ),
          ),
        ),
      ],
    );
  }
}
