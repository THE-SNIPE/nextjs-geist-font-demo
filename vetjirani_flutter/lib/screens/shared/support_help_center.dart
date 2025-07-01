import 'package:flutter/material.dart';

class SupportHelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support / Help Center'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Browse FAQs'),
            subtitle: Text('Find answers to common questions about our app and services.'),
            onTap: () {
              // TODO: Navigate to FAQs screen
            },
          ),
          Divider(),
          Text(
            'Contact Support',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact Support'),
            subtitle: Text('Get in touch with our support team for assistance.'),
            onTap: () {
              // TODO: Implement contact support (call, email, chat)
            },
          ),
          Divider(),
          Text(
            'Report an Issue',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text('Report an Issue'),
            subtitle: Text('Report any issues or bugs you encounter while using the app.'),
            onTap: () {
              // TODO: Navigate to issue reporting form
            },
          ),
        ],
      ),
    );
  }
}
