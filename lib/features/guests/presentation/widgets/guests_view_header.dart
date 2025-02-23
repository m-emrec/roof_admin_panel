import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/add_guest_button.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/guest_count_text.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

/// A widget that displays the header of the guests view.
/// This widget is used in the [GuestsView] widget.
///
/// It consists of a [TitleWidget],the [GuestCountText] and an [AddGuestButton].
///
class GuestsTableHeader extends ConsumerWidget {
  /// A widget that displays the header of the guests view.
  /// This widget is used in the [GuestsView] widget.
  ///
  /// It consists of a [TitleWidget],the [GuestCountText] and an [AddGuestButton].
  ///
  const GuestsTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getGuestsCountProvider);
    return Row(
      spacing: SpacingSizes.medium,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          spacing: SpacingSizes.extraExtraSmall,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: LocaleKeys.guestsView_pageTitle.tr()),
            const GuestCountText(),
          ],
        ),
        const AddGuestButton(),
      ],
    );
  }
}
