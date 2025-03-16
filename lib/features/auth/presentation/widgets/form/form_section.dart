import 'package:core/extensions/media_query_extension.dart';
import 'package:core/resources/data_state.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roof_admin_panel/config/localization/lang/locale_keys.g.dart';
import 'package:roof_admin_panel/features/auth/data/models/auth_model.dart';
import 'package:roof_admin_panel/features/auth/presentation/providers/provider.dart';
import 'package:roof_admin_panel/features/auth/presentation/widgets/form/form_utils.dart';
import 'package:roof_admin_panel/product/utility/extensions/form_submit_on_key_enter_extension.dart';
import 'package:roof_admin_panel/product/utility/extensions/future_extension.dart';
import 'package:roof_admin_panel/product/utility/validator/validator_methods.dart';
import 'package:roof_admin_panel/product/widgets/buttons/buttons_import.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/email_field.dart';
import 'package:roof_admin_panel/product/widgets/text%20fields/password_field.dart';
part 'sign_in_form.dart';
part 'sign_in_form_mixin.dart';
part 'forgot_password_form.dart';

///
class FormSection extends ConsumerStatefulWidget {
  ///
  const FormSection({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSectionState();
}

class _FormSectionState extends ConsumerState<FormSection> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: FormUtils().formKey,
      child: SizedBox(
        width: context.dynamicWidth(0.4) > 500.0
            ? 500.0 // This value is arbitrary.I find it suitable for the design.
            : context.dynamicWidth(0.4),
        child: PageView(
          controller: FormUtils().pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _SignInForm(),
            _ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
