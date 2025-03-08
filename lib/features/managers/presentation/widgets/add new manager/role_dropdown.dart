part of 'add_manager_dialog.dart';

class _RoleDropdown extends ConsumerWidget {
  const _RoleDropdown(this.roleController);
  final TextEditingController roleController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomDropDownButton(
      items: [
        "Owner",
        "Editor",
        "Viewer",
      ],
      initialValue: "Editor",
      onChanged: (value) {
        roleController.text = value.toString();
      },
    );
  }
}
