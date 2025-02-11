import 'package:core/core.dart';
import 'package:core/utils/models/feedback_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20response%20dialog/feedback_response_dialog.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/feedback_owner.dart';
import 'package:roof_admin_panel/features/feedback/presentation/widgets/feedback%20tile/reported_user.dart';
import 'package:roof_admin_panel/product/utility/extensions/date_time_extensions.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/empty_box.dart';
part 'feedback_title_and_content.dart';
part 'feedback_tile_images.dart';
part 'feedback image viewer/feedback_image_viewer.dart';
part 'feedback image viewer/feed_image_viewer_state_mixin.dart';
part 'feedback image viewer/image_viewer_controllers_row.dart';

/// This tile displays the feedback details like the feedback content,
/// feedback images, feedback date, and the response button.
class FeedbackTile extends StatefulWidget {
  /// This tile displays the feedback details like the feedback content,
  /// feedback images, feedback date, and the response button.
  const FeedbackTile({required this.feedback, super.key});

  /// The feedback model
  final FeedbackModel feedback;

  @override
  State<FeedbackTile> createState() => _FeedbackTileState();
}

class _FeedbackTileState extends State<FeedbackTile> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => setState(() {
        _isExpanded = !_isExpanded;
      }),
      title: _FeedbackTitleAndContent(
        feedback: widget.feedback,
        isExpanded: _isExpanded,
      ),
      isThreeLine: true,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FeedbackOwner(widget.feedback.userId ?? ""),
          ListTile(
            contentPadding: EdgeInsets.zero,
            trailing: OutlinedButton(
              onPressed: () => CustomAlertDialog.showAlertDialog(
                context: context,
                content: FeedbackResponseDialog(widget.feedback),
                barrierDismissible: true,
              ),
              child: Text(
                (widget.feedback.response?.isEmpty ?? true)
                    ? LocaleKeys.feedback_responseButtonLabel.tr()
                    : LocaleKeys.feedback_responded.tr(),
              ),
            ),
            subtitle: _FeedbackTileImagesRow(feedback: widget.feedback)
                .makeSelectable(),
          ),
        ],
      ),
    ).makeSelectable();
  }
}
