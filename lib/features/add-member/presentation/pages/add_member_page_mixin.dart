import 'package:core/core.dart';
import 'package:core/resources/data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/features/add-member/presentation/pages/add_member_page.dart';
import 'package:roof_admin_panel/features/add-member/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';

/// This mixin is used to add the required controllers and form key to the AddMemberPage
mixin AddMemberPageMixin on ConsumerState<AddMemberTable> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    ref.read(addMemberProvider).init(context);

    super.didChangeDependencies();
  }

  /// This function is called when the save button is pressed.
  Future<void> onTapSaveButton(WidgetRef ref) async {
    if (ref.read(addMemberProvider).formKey.currentState?.validate() ?? false) {
      await ref
          .read(addMemberProvider)
          .addNewMember()
          .showLoading(context: context)
          .then((value) {
        if (mounted && value is DataSuccess) {
          context.pop(value.resultData);
        }
      });
    }
  }

  @override
  void deactivate() {
    ref.invalidate(addMemberProvider);

    super.deactivate();
  }
}
