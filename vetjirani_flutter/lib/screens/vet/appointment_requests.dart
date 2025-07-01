import 'package:flutter/material.dart';

class AppointmentRequestsScreen extends StatelessWidget {
  final List<Map<String, String>> todayRequests = [
    {'farmer': 'James', 'time': '10:00 AM'},
    {'farmer': 'Sarah', 'time': '11:30 AM'},
  ];

  final List<Map<String, String>> upcomingAppointments = [
    {'farmer': 'Aisha Hassan', 'time': '11:00 AM - 12:00 PM'},
    {'farmer': 'Juma Kamau', 'time': '12:00 PM - 1:00 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Requests'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Today', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...todayRequests.map((request) => ListTile(
                leading: CircleAvatar(child: Text(request['farmer']![0])),
                title: Text('Appointment with Farmer ${request['farmer']}'),
                subtitle: Text(request['time']!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () {
                        // TODO: Decline request
                      },
                      child: Text('Decline'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Accept request
                      },
                      child: Text('Accept'),
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Upcoming', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ...upcomingAppointments.map((appointment) => ListTile(
                leading: CircleAvatar(child: Text(appointment['farmer']![0])),
                title: Text('Appointment with Farmer ${appointment['farmer']}'),
                subtitle: Text(appointment['time']!),
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
              )),
        ],
      ),
    );
  }
}
