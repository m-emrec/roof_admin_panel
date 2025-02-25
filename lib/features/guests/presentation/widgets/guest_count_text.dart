import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/guests/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/skeleton_type.dart';

/// A widget that displays the number of guests.
/// This widget is used in the [GuestsTableHeader] widget.
///
/// This widget uses the [getGuestsCountProvider] provider to get the number
/// of guests.
///
class GuestCountText extends ConsumerWidget {
  /// A widget that displays the number of guests.
  /// This widget is used in the [GuestsTableHeader] widget.
  ///
  /// This widget uses the [getGuestsCountProvider] provider to get the number
  /// of guests.
  ///
  const GuestCountText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncDataBuilder(
      provider: getGuestsCountProvider,
      skeletonType: SkeletonType.text,
      data: (count) {
        return Text(
          LocaleKeys.guestsView_guestCount.tr(
            args: [count.value.toString()],
          ),
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.darkTextColors[30],
          ),
        );
      },
    );
  }
}
