import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/guests/data/models/guest.dart';
import 'package:roof_admin_panel/features/guests/presentation/widgets/guest%20table/guests_table.dart';

class LoadingGuestsTable extends StatelessWidget {
  const LoadingGuestsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GuestsTable(
      guests: List.generate(
        5,
        (index) => Guest(name: 'Loading...', phoneNumber: 'Loading'),
      ),
    );
  }
}
