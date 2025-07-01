import 'package:flutter/material.dart';

class VetDashboardScreen extends StatefulWidget {
  @override
  _VetDashboardScreenState createState() => _VetDashboardScreenState();
}

class _VetDashboardScreenState extends State<VetDashboardScreen> {
  bool _isOnline = false;

  final List<Map<String, String>> appointmentRequests = [
    {
      'farmerName': 'James',
      'time': '10:00 AM',
    },
    {
      'farmerName': 'Sarah',
      'time': '11:30 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Availability'),
              subtitle: Text(_isOnline ? 'Online - Available for appointments' : 'Offline'),
              value: _isOnline,
              onChanged: (value) {
                setState(() {
                  _isOnline = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Requests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: appointmentRequests.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final request = appointmentRequests[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(request['farmerName']![0]),
                    ),
                    title: Text('Appointment with Farmer ${request['farmerName']}'),
                    subtitle: Text(request['time']!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            // TODO: Decline appointment
                          },
                          child: Text('Decline'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Accept appointment
                          },
                          child: Text('Accept'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
