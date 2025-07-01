import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetjirani_flutter/providers/auth_provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile & Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            subtitle: Text('Manage your profile'),
            onTap: () {
              // TODO: Navigate to profile edit screen
            },
          ),
          ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Support'),
            subtitle: Text('Get help with the app'),
            onTap: () {
              // TODO: Navigate to support/help center screen
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Change Role'),
            subtitle: Text('Switch between Farmer and Vet'),
            onTap: () {
              // TODO: Implement role switching
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () async {
              await authProvider.signOut();
            },
          ),
        ],
      ),
    );
  }
}
