import 'package:core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/feedback/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/skeleton.dart';

class FeedbackOwner extends ConsumerWidget {
  const FeedbackOwner(this.feedbackOwnerId, {super.key});
  final String feedbackOwnerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: feedbackOwnerId.isNotEmpty,
      child: ref.watch(feedbackOwnerProvider(feedbackOwnerId)).when(
            data: (user) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.feedback_reportedBy.tr(),
                    style: context.textTheme.labelLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundImage: (user.imageUrl?.isNotEmpty ?? false)
                            ? NetworkImage(user.imageUrl ?? "")
                            : null,
                        radius: 16,
                      ),
                      TextButton(
                        child: Text(user.name ?? ""),
                        onPressed: () {},
                      ),
                    ],
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
          ),
    );
  }
}
