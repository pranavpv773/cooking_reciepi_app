import 'package:flutter/material.dart';
import 'package:food_reciepi/app/login/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text(
              'Logout',
            ),
            onTap: () => {context.read<LoginProvider>().logOut(context)},
          ),
        ],
      ),
    );
  }
}
