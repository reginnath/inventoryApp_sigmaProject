import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(title: Text('Theme')), 
          ListTile(title: Text('Export Destination')),
          ListTile(title: Text('Account Settings')),
          ListTile(title: Text('Notifications')),
          ListTile(title: Text('Log out')),
        ],
      ),
    );
  }
}
