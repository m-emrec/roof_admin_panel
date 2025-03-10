part of 'add_manager_dialog.dart';

class _EmailAndRoleField extends StatelessWidget {
  const _EmailAndRoleField({
    required this.emailController,
    required this.roleController,
  });
  final TextEditingController emailController;
  final TextEditingController roleController;
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
        SelectRoleDropdown(roleController),
      ],
    );
  }
}
