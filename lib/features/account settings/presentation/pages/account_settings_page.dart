import 'package:core/extensions/media_query_extension.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/widgets/user%20card/user_card.dart';
import 'package:roof_admin_panel/product/widgets/title.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: SpacingSizes.medium,
      children: [
        TitleWidget(title: LocaleKeys.accountSettingView_pageTitle.tr()),
        const SizedBox(
          // width: context.dynamicWidth(0.6),
          child: UserCard(),
        ),
      ],
    );
  }
}
