import 'package:roof_admin_panel/product/utility/constants/enums/permissions.dart';

///
// ignore_for_file: public_member_api_docs

class AddManagerEntity {
  /// [AddManagerEntity] class is used to hold the data of the manager to be added.
  AddManagerEntity({
    required this.name,
    required this.email,
    required this.role,
    this.permissions,
  });

  final String name;
  final String email;
  final String role;
  final List<Permissions>? permissions;
}
