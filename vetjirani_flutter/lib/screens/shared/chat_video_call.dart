import 'package:flutter/material.dart';

class ChatVideoCallScreen extends StatefulWidget {
  @override
  _ChatVideoCallScreenState createState() => _ChatVideoCallScreenState();
}

class _ChatVideoCallScreenState extends State<ChatVideoCallScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'vet',
      'text': 'Hello, how can I assist you with your livestock today?',
      'time': '10:00 AM',
    },
    {
      'sender': 'farmer',
      'text': 'My cow has been lethargic and not eating well.',
      'time': '10:02 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat / Video Call'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              // TODO: Implement video call functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                final isVet = message['sender'] == 'vet';
                return Align(
                  alignment: isVet ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isVet ? Colors.grey[300] : Colors.blue[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message['text']),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    // TODO: Implement image attachment
                  },
                ),
                IconButton(
                  icon: Icon(Icons.videocam),
                  onPressed: () {
                    // TODO: Implement video attachment
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none,
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'sender': 'farmer',
        'text': text.trim(),
        'time': TimeOfDay.now().format(context),
      });
      _messageController.clear();
    });
  }
}
