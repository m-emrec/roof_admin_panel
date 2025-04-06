import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class NameAndRoleSection extends ConsumerWidget {
  const NameAndRoleSection({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(memberProvider.select((m) => m?.name));
    final role = ref.watch(memberProvider.select((m) => m?.role));
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TitleWidget(
          title: name ?? '',
        ),
        Text(
          role?.map((e) => e?.localizedText("")).join(" | ") ?? '',
          style: context.theme
              .extension<MembershipInfoCardThemeExtension>()
              ?.roleTextStyle,
        ),
      ],
    );
  }
}
