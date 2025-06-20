import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managerRoles/presentation/providers/manager_roles_providers.dart';
import 'package:roof_admin_panel/product/utility/constants/enums/user_roles.dart';
import 'package:roof_admin_panel/product/utility/models/manager_role_model.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';

///
class SelectRoleDropdown extends ConsumerStatefulWidget {
  ///
  const SelectRoleDropdown(this.roleController, {super.key});

  ///
  final TextEditingController roleController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectRoleDropdownState();
}

class _SelectRoleDropdownState extends ConsumerState<SelectRoleDropdown> {
  ManagerRoleModel? selectedRole;
  UserRoles? initialRole;
  void _onChanged(String value, List<ManagerRoleModel> data) {
    selectedRole = data
        .firstWhere((element) => element.name == UserRoles.fromLocale(value));
    widget.roleController.text = selectedRole?.name?.name ?? "";
    setState(() {});
  }

  bool _a(List<ManagerRoleModel> data) {
    if (widget.roleController.text.isNotEmpty) {
      initialRole = data
          .firstWhere(
              (element) => element.name?.name == widget.roleController.text)
          .name;
      return false;
    }
    initialRole = data.first.name;
    return true;
  }

  void _setInitialValue(List<ManagerRoleModel> data) {
    _a(data);
    if (_a(data)) {
      selectedRole = data.first;
      widget.roleController.text = selectedRole?.name?.name ?? "";
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: SpacingSizes.extraExtraSmall,
      children: [
        AsyncDataBuilder(
          provider: getManagerRolesProvider,
          data: (data) {
            if (selectedRole == null) {
              _setInitialValue(data);
            }
            return CustomDropDownButton(
              items: data.map((e) => e.name?.toLocale()).toList(),
              initialValue: initialRole?.toLocale(),
              onChanged: (value) => _onChanged(value.toString(), data),
            );
          },
        ),
        Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          textStyle: context.textTheme.labelLarge,
          message:
              selectedRole?.permissions?.map((e) => e.toLocale()).join("\n") ??
                  "",
          child: Icon(
            Icons.help,
            size: 16,
            color: AppColors.secondaryColor[90]?.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
