import 'package:core/extensions/context_extension.dart';
import 'package:core/extensions/media_query_extension.dart';
import 'package:core/resources/data_state.dart';
import 'package:core/utils/constants/app_colors.dart';
import 'package:core/utils/constants/app_paddings.dart';
import 'package:core/utils/constants/spacing_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/main-shell-route/main_shell_route.dart';
import 'package:roof_admin_panel/features/account%20settings/presentation/providers/providers.dart';
import 'package:roof_admin_panel/product/utility/extensions/make_selectable_extension.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

///
class EmailUpdateRedirectionPage extends ConsumerWidget {
  /// This page is used to update the email of the user in
  /// the firestore after the email is verified
  /// It takes the uid and email as parameters
  /// It uses the accountSettingsNotifierProvider to update the email
  const EmailUpdateRedirectionPage(this.uid, this.email, {super.key});

  ///
  final String uid;

  ///
  final String email;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: ref
            .read(accountSettingsNotifierProvider.notifier)
            .updateEmailOnFireStoreAfterVerification(uid, email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data is DataSuccess) {
              context.goNamed(const MainShellRoute().name);
              return Center(
                child:
                    Text('Email updated successfully redirecting... || $uid'),
              );
            } else {
              return _Error(snapshot.data?.errorMessage ?? "");
            }
          }
          return const _Loading();
        },
      ),
    );
  }
}

/// This will be shown when the email update is failed
class _Error extends StatelessWidget {
  const _Error(this.errorMessage);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.dynamicWidth(0.6),
        ),
        child: Card(
          elevation: 0,
          color: AppColors.accentError[10],
          child: Padding(
            padding: const AppPadding.horizontalLSymmetric() +
                const AppPadding.verticalLSymmetric(),
            child: Column(
              spacing: SpacingSizes.large,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Email update failed !',
                  style: context.textTheme.titleLarge,
                ),
                Text(errorMessage).makeSelectable(),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.home_rounded,
                    color: AppColors.backgroundColor,
                  ),
                  onPressed: () {
                    context.goNamed(const MainShellRoute().name);
                  },
                  label: const Text('Go Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: SpacingSizes.large,
      children: [
        Text(
          'Updating email...',
          style: context.textTheme.titleLarge,
        ),
        Text(
          "You will be redirected to the login page after the email is updated",
          style: context.textTheme.labelLarge,
        ),
        const LoadingIndicator(),
      ],
    );
  }
}
