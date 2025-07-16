import 'package:flutter/material.dart';
import 'package:kolepto/screens/main%20screens/generator_page.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:provider/provider.dart';
import 'package:kolepto/provider/navigation_state.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          10.vSpace,
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            subtitle: const Text(
              'Edit your profile',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to profile edit screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              final navState =
                  Provider.of<NavigationState>(context, listen: false);
              navState.setIndex(6); // This will update the selected index
            },
          ),
          const Divider(height: 32),
          const Text(
            'Notifications',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            secondary: const Icon(Icons.notifications),
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (val) {
              setState(() {
                _notificationsEnabled = val;
              });
            },
          ),
          const Divider(height: 32),
          const Text(
            'Appearance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (val) {
              setState(() {
                _darkModeEnabled = val;
              });
            },
          ),
          const Divider(height: 32),
          const Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About App'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Kolepto',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 Kolepto',
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                        'Kolepto helps you manage your collections easily.'),
                  ),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Open privacy policy
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Handle logout
              },
            ),
          ),
        ],
      ),
    );
  }
}
