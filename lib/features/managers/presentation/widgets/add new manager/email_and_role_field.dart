part of 'add_manager_dialog.dart';

class _EmailAndRoleField extends StatelessWidget {
  const _EmailAndRoleField({
    required this.emailController,
    required this.roleController,
    required this.onAddNewRole,
  });
  final TextEditingController emailController;
  final TextEditingController roleController;
  final VoidCallback onAddNewRole;
  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      spacing: SpacingSizes.medium,
      children: [
        Flexible(
          child: EmailField(
            TextEditingController(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectRoleDropdown(roleController),
            TextButton(
              onPressed: onAddNewRole,
              child: Text(LocaleKeys.managersView_addNewRole.tr()),
            ),
          ],
        ),
      ],
    );
  }
}
