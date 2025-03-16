import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/theme/theme_extensions/user_card_theme_extension.dart';
import 'package:roof_admin_panel/product/utility/current_manager.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        // name
        Text(
          CurrentManager.instance.managerModel.name,
          style:
              context.theme.extension<UserCardThemeExtension>()?.nameTextStyle,
        ),
        // email
        Text(
          CurrentManager.instance.managerModel.email,
          style:
              context.theme.extension<UserCardThemeExtension>()?.emailTextStyle,
        ),
        // role
        Text(
          CurrentManager.instance.managerModel.role.name,
          style:
              context.theme.extension<UserCardThemeExtension>()?.roleTextStyle,
        ),
      ],
    );
  }
}
