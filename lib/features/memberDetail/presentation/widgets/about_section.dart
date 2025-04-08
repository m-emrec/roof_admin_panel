import 'package:core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/section_card.dart';
import 'package:roof_admin_panel/product/widgets/section%20widget/section_widget.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(membershipDetailNotifierProvider);
    return MembersDetailSectionCard(
      child: Section(
        title: LocaleKeys.memberDetailView_about.tr(),
        child: Text(
          member?.about ?? '',
          style: context.textTheme.bodyMedium,
        ),
      ),
    );
  }
}
