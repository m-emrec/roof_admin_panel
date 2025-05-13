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
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/membership_detail_notifier.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/base_member_ship_info_field.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/date_membership_info_field.dart';
import 'package:roof_admin_panel/features/memberDetail/presentation/widgets/membership%20info%20card/membership%20info%20section/membership_info_fields/text_membership_info_field.dart';
import 'package:roof_admin_panel/product/utility/extensions/context_responsive_extension.dart';
import 'package:roof_admin_panel/product/utility/models/member_model.dart';
part '_member_ship_info.dart';
part '_membership_info_Section_text_field.dart';
part 'membership_info_fields/_membership_info_field_factory.dart';

/// A widget that displays the membership information in a card format.
class MembershipInfoSection extends ConsumerWidget {
  /// Used in the [MembershipInfoCard] to display the membership information
  /// in consistent layout.
  /// This widget is responsive and adapts to different screen sizes.
  ///
  /// It uses a [GridView] to display the membership information in a grid layout.
  ///
  /// It display membership related information eg. membership number, start date etc.
  ///
  ///
  const MembershipInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final member = ref.watch(membershipDetailNotifierProvider);
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

  final MemberModel? member;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount(context),
        crossAxisSpacing: SpacingSizes.extraSmall,
        mainAxisSpacing: SpacingSizes.medium,
        mainAxisExtent: mainAxisExtent(context),
      ),
      children: _MembershipInfoFieldFactory.factory(ref),
    );
  }

  int crossAxisCount(BuildContext context) =>
      context.responsiveSelector<int>(mobile: 1, desktop: 2, tablet: 1);

  double mainAxisExtent(BuildContext context) =>
      context.responsiveSelector<double>(
        mobile: SpacingSizes.small,
        desktop: SpacingSizes.small,
        tablet: SpacingSizes.large,
      );
}
