import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/border_radiuses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';

class BannedMembersInfo extends StatefulWidget {
  const BannedMembersInfo({
    super.key,
  });

  @override
  State<BannedMembersInfo> createState() => _BannedMembersInfoState();
}

class _BannedMembersInfoState extends State<BannedMembersInfo> {
  bool _isHovering = false;

  Widget get infoWidget {
    if (_isHovering) {
      return ListTile(
        tileColor: AppColors.secondaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.small(),
        ),
        title: Text(
          LocaleKeys.bannedMemberView_info.tr(),
          style: context.textTheme.labelLarge?.copyWith(
            color: AppColors.neutralGray500[0],
          ),
        ),
      );
    } else {
      /// I used [InkWell] here to make the icon tappable.
      /// Because in mobile, hovering is not possible.
      /// So, I used [InkWell] to make the icon tappable.
      return InkWell(
        onTap: () {
          setState(() {
            _isHovering = !_isHovering;
          });
          Future.delayed(const Duration(seconds: 3), () {
            setState(() {
              _isHovering = false;
            });
          });
        },
        child: Icon(
          Icons.info_outline_rounded,
          color: AppColors.secondaryColor[50]?.withValues(alpha: 0.5),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          _isHovering = true;
        }),
        onExit: (event) => setState(() {
          _isHovering = false;
        }),
        child: infoWidget,
      ),
    );
  }
}
