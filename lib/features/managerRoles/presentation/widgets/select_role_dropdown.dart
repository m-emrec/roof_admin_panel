import 'package:core/extensions/context_extension.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:core/utils/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/managerRoles/presentation/providers/manager_roles_providers.dart';
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
  void _onChanged(dynamic value, List<ManagerRoleModel> data) {
    selectedRole = data.firstWhere((element) => element.name == value);
    widget.roleController.text = selectedRole?.id ?? "";
    setState(() {});
  }

  void _setInitialValue(List<ManagerRoleModel> data) {
    selectedRole = data.first;
    widget.roleController.text = selectedRole?.id ?? "";
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
              items: data.map((e) => e.name).toList(),
              initialValue: data.first.name,
              onChanged: (value) => _onChanged(value, data),
            );
          },
        ),
        Tooltip(
          triggerMode: TooltipTriggerMode.tap,
          textStyle: context.textTheme.labelLarge,
          message:
              selectedRole?.permissions.map((e) => e.toLocale()).join("\n") ??
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
