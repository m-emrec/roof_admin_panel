import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/features/membership-fees/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/async%20data%20builder/async_data_builder.dart';
import 'package:roof_admin_panel/product/widgets/custom_text_field.dart';

class FeeField extends ConsumerStatefulWidget {
  const FeeField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeeFieldState();
}

class _FeeFieldState extends ConsumerState<FeeField> {
  @override
  Widget build(BuildContext context) {
    return AsyncDataBuilder(
      provider: membershipFeesViewModelProvider,
      data: (p0) {
        ref.read(addMemberProvider).configureMembershipFee();
        return CustomTextField(
          controller: ref.watch(addMemberProvider).feeController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        );
      },
    );
  }
}
