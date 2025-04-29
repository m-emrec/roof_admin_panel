import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannedMembersView extends ConsumerWidget {
  const BannedMembersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Text(
          'Banned Members View',
        ),
      ),
    );
  }
}
