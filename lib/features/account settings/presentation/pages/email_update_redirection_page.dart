import 'package:core/resources/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:roof_admin_panel/config/route%20config/routes/account_settings_route.dart';
import 'package:roof_admin_panel/features/account%20settings/providers/providers.dart';
import 'package:roof_admin_panel/product/widgets/loading_indicator.dart';

class EmailUpdateRedirectionPage extends ConsumerWidget {
  const EmailUpdateRedirectionPage(this.uid, this.email, {super.key});
  final String uid;
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
              // Future.microtask(
              //   () => Future.delayed(
              //     Duration(seconds: 3),
              //     () => context.goNamed(AccountSettingsRoute().name),
              //   ),
              // );
              return Center(
                child:
                    Text('Email updated successfully redirecting... || $uid'),
              );
            } else {
              return Center(
                child:
                    Text('Email update failed ${snapshot.data?.errorMessage}'),
              );
            }
          }
          return const Center(
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }
}
