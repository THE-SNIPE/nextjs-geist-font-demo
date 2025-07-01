import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Emergency Response',
      'subtitle': 'Dr. Mwangi has responded to your emergency request.',
    },
    {
      'title': 'Appointment Confirmation',
      'subtitle': 'Your appointment with Dr. Kamau is confirmed for tomorrow.',
    },
    {
      'title': 'App Update',
      'subtitle': 'New update available with improved features and bug fixes.',
    },
    {
      'title': 'Emergency Response',
      'subtitle': 'Dr. Wanjiku has responded to your emergency request.',
    },
    {
      'title': 'Appointment Confirmation',
      'subtitle': 'Your appointment with Dr. Otieno is confirmed for tomorrow.',
    },
    {
      'title': 'App Update',
      'subtitle': 'New update available with improved features and bug fixes.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notification['title']!),
            subtitle: Text(notification['subtitle']!),
            onTap: () {
              // TODO: Handle notification tap
            },
          );
        },
      ),
    );
  }
}
