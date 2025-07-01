import 'package:flutter/material.dart';

class MyAppointmentsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> upcomingAppointments = [
    {
      'title': 'Cattle Checkup',
      'time': '10:00 AM - 11:00 AM',
      'status': 'Pending',
    },
    {
      'title': 'Goat Vaccination',
      'time': '11:30 AM - 12:30 PM',
      'status': 'Confirmed',
    },
  ];

  final List<Map<String, dynamic>> pastAppointments = [
    {
      'title': 'Sheep Surgery',
      'time': 'July 10, 2024',
      'status': 'Completed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Appointments'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAppointmentList(upcomingAppointments, true),
            _buildAppointmentList(pastAppointments, false),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentList(List<Map<String, dynamic>> appointments, bool isUpcoming) {
    return ListView.separated(
      itemCount: appointments.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(appointment['title']),
          subtitle: Text(appointment['time']),
          trailing: isUpcoming
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (appointment['status'] == 'Pending')
                      TextButton(
                        onPressed: () {
                          // TODO: Implement cancel functionality
                        },
                        child: Text('Cancel'),
                      ),
                    if (appointment['status'] == 'Confirmed')
                      TextButton(
                        onPressed: () {
                          // TODO: Implement reschedule functionality
                        },
                        child: Text('Reschedule'),
                      ),
                  ],
                )
              : Text(appointment['status']),
        );
      },
    );
  }
}
