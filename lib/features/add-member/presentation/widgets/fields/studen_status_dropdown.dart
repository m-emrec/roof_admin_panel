import 'package:core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';

class StudentStatusDropdown extends ConsumerStatefulWidget {
  const StudentStatusDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentStatusDropdownState();
}

class _StudentStatusDropdownState extends ConsumerState<StudentStatusDropdown> {
  bool isStudent = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isStudent,
          onChanged: (onChanged) {
            isStudent = onChanged ?? false;
            ref.read(addMemberProvider).isStudent.text = isStudent.toString();
            setState(() {});
          },
        ),
        Text(
          "Öğrenci",
          style: context.textTheme.labelMedium,
        ),
      ],
    );
  }
}
