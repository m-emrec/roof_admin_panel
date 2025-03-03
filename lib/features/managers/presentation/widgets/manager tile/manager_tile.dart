import 'package:core/extensions/context_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';
import 'package:roof_admin_panel/product/widgets/avatar.dart';
part 'manager_tile_title.dart';
part 'manager_tile_trailing.dart';

class ManagerTile extends StatelessWidget {
  const ManagerTile(
    this.manager,
  );
  final ManagerModel manager;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const Border(bottom: BorderSide()),
      leading: Avatar(
        imageUrl: manager.imageUrl,
        radius: 16,
      ),
      title: _ManagerTileTitle(manager),
      subtitle: Text(manager.email),
      trailing: const _ManagerTileTrailing(),
    );
  }
}
