import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/managers/presentation/widgets/manager%20tile/manager_tile.dart';
import 'package:roof_admin_panel/product/utility/models/manager_model.dart';

class ManagersList extends StatelessWidget {
  const ManagersList(
    this.managers,
  );
  final List<ManagerModel> managers;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...managers.map(
          ManagerTile.new,
        ),
      ],
    );
  }
}
