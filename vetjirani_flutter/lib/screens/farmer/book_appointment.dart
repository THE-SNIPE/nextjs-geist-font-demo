import 'package:flutter/material.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? _selectedService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _veterinarian = 'Dr. Imani';

  final List<String> _services = [
    'General Checkup',
    'Vaccination',
    'Emergency Care',
    'Surgery',
    'Consultation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Select Service',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ..._services.map((service) {
              return RadioListTile<String>(
                title: Text(service),
                value: service,
                groupValue: _selectedService,
                onChanged: (value) {
                  setState(() {
                    _selectedService = value;
                  });
                },
              );
            }).toList(),
            SizedBox(height: 16),
            Text(
              'Preferred Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(_selectedDate == null
                  ? 'Select Date'
                  : '${_selectedDate!.toLocal()}'.split(' ')[0]),
              trailing: Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            ListTile(
              title: Text(_selectedTime == null
                  ? 'Select Time'
                  : _selectedTime!.format(context)),
              trailing: Icon(Icons.access_time),
              onTap: _pickTime,
            ),
            SizedBox(height: 16),
            Text(
              'Confirm Booking Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Service'),
              subtitle: Text(_selectedService ?? 'Not selected'),
            ),
            ListTile(
              title: Text('Date'),
              subtitle: Text(_selectedDate == null
                  ? 'Not selected'
                  : '${_selectedDate!.toLocal()}'.split(' ')[0]),
            ),
            ListTile(
              title: Text('Time'),
              subtitle: Text(_selectedTime == null
                  ? 'Not selected'
                  : _selectedTime!.format(context)),
            ),
            ListTile(
              title: Text('Veterinarian'),
              subtitle: Text(_veterinarian),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _selectedService != null &&
                      _selectedDate != null &&
                      _selectedTime != null
                  ? () {
                      // TODO: Confirm booking and handle payment status
                    }
                  : null,
              child: Text('Confirm Booking'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
