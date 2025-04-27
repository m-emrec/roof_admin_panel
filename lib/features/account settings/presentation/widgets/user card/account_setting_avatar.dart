import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/account_setting_avatar_state_mixin.dart';
import 'package:roof_admin_panel/product/utility/constants/gen/assets.gen.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';
import 'package:roof_admin_panel/product/widgets/app_icon.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';

class AccountSettingAvatar extends ConsumerStatefulWidget {
  const AccountSettingAvatar({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AccountSettingAvatarState();
}

class _AccountSettingAvatarState extends ConsumerState<AccountSettingAvatar>
    with AccountSettingAvatarStateMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      hoverColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Profile Picture
          ValueListenableBuilder(
            valueListenable: CurrentUser.instance.managerModelNotifier,
            builder: (context, value, child) => Avatar(
              imageUrl: value.imageUrl,
              radius: avatarRadius,
            ),
            // child: ,
          ),
          // Edit Profile Picture Overlay
          AnimatedOpacity(
            duration: animationDuration,
            opacity: isHovered ? 1 : 0,
            child: Container(
              width: avatarRadius * 2,
              height: avatarRadius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundColor.withValues(alpha: 0.3),
              ),
              child: Column(
                spacing: SpacingSizes.extraExtraSmall,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcon.small(
                    Assets.icons.editImageIcon,
                  ),
                  Text(
                    LocaleKeys.accountSettingView_changeProfilePicture.tr(),
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
