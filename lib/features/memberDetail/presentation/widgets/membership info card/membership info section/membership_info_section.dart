import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/models/user_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/membership_info_card_theme_extension.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/member_ship_info_field.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
part '_member_ship_info_card_item.dart';
part '_membership_info_Section_text_field.dart';
part 'membership_card_item_factory.dart';

class MembershipInfoSection extends ConsumerWidget {
  const MembershipInfoSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(memberProvider);
    return context.responsiveSelector<Widget>(
      mobile: _MembershipInfoGrid(
        member: member,
      ),
      desktop: Flexible(
        child: _MembershipInfoGrid(
          member: member,
        ),
      ),
    );
  }
}

class _MembershipInfoGrid extends ConsumerWidget {
  const _MembershipInfoGrid({
    required this.member,
  });

  final UserModel? member;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crossAxisCount =
        context.responsiveSelector<int>(mobile: 1, desktop: 2, tablet: 1);
    final mainAxisExtent = context.responsiveSelector<double>(
      mobile: SpacingSizes.small,
      desktop: SpacingSizes.small,
      tablet: SpacingSizes.large,
    );
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: SpacingSizes.extraSmall,
        mainAxisSpacing: SpacingSizes.medium,
        mainAxisExtent: mainAxisExtent,
      ),
      children: _MembershipCardItemFactory.factory(ref),
    );
  }
}
