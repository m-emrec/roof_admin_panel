import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/about_and_personal_info.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership_info_card.dart';
import 'package:roof_admin_panel/product/utility/extensions/animation_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
import 'package:roof_admin_panel/product/widgets/custom_alert_dialog.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

class MemberDetailDialog extends ConsumerStatefulWidget {
  ///
  const MemberDetailDialog({
    required this.member,
    super.key,
  });

  ///
  final MemberModel? member;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MemberDetailDialogState();
}

class _MemberDetailDialogState extends ConsumerState<MemberDetailDialog> {
  @override
  void initState() {
    Future.microtask(
      () => ref
          .read(membershipDetailNotifierProvider.notifier)
          .initializeState(widget.member),
    );
    super.initState();
  }

  @override
  void deactivate() {
    ref.invalidate(membershipDetailNotifierProvider);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog<void>.withCloseIcon(
      content: SizedBox(
        width: context.dynamicWidth(0.9),
        height: context.dynamicHeight(0.9),
        child: ref.watch(membershipDetailNotifierProvider) != null
            ? const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MembershipInfoCard(),
                    AboutAndPersonalInfo(),
                  ],
                ),
              ).fadeAnimation()
            : const LoadingIndicator(),
      ).makeSelectable(),
      actions: const [],
    );
  }
}
