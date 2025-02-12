import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/feedback_tile_theme_extension.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20response%20dialog/feedback_response_dialog.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/feedback_owner.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/reported_user.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/extensions/theme_extensions_extesntion.dart';
import 'package:roof_admin_panel/product/widgets/buttons/inline_text_button.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
part 'feedback_tile_content.dart';
part 'feedback_tile_images.dart';
part 'feedback image viewer/feedback_image_viewer.dart';
part 'feedback image viewer/feed_image_viewer_state_mixin.dart';
part 'feedback image viewer/image_viewer_controllers_row.dart';
part 'feedback_tile_footer.dart';
part 'feedback_tile_header.dart';

/// This tile displays the feedback details like the feedback content,
/// feedback images, feedback date, and the response button.
class FeedbackTile extends StatelessWidget {
  /// This tile displays the feedback details like the feedback content,
  /// feedback images, feedback date, and the response button.
  const FeedbackTile({required this.feedback, super.key});

  /// The feedback model
  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.feedbackTileThemeExtension?.gapBetweenContentAndFooter ??
          SpacingSizes.small,
      children: [
        Column(
          spacing:
              context.feedbackTileThemeExtension?.gapBetweenHeaderAndContent ??
                  SpacingSizes.small,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FeedbackTileHeader(feedback: feedback),
            _FeedbackTileContent(
              feedback: feedback,
            ),
          ],
        ),
        _FeedbackTileFooter(feedback: feedback),
      ],
    );
  }
}
