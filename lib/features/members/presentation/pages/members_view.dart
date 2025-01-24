import 'package:flutter/material.dart';
import 'package:roof_admin_panel/features/auth/data/services/auth_service.dart';

class MembersView extends StatefulWidget {
  const MembersView({super.key});

  @override
  State<MembersView> createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => AuthService().signOut(), child: Text('Sign Out')),
    );
  }
}
