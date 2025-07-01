import 'package:flutter/material.dart';

class VetMessagesScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'farmer': 'Farmer John', 'status': "I'm on my way"},
    {'farmer': 'Farmer James', 'status': "I'm on my way"},
    {'farmer': 'Farmer David', 'status': "I'm on my way"},
    {'farmer': 'Farmer Michael', 'status': "I'm on my way"},
    {'farmer': 'Farmer Robert', 'status': "I'm on my way"},
    {'farmer': 'Farmer William', 'status': "I'm on my way"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(message['farmer']![0]),
            ),
            title: Text(message['farmer']!),
            subtitle: Text(message['status']!),
            onTap: () {
              // TODO: Navigate to chat detail screen
            },
          );
        },
      ),
    );
  }
}
