import 'package:flutter/material.dart';

class VetProfileViewScreen extends StatelessWidget {
  final String vetName;
  final String vetSpecialization;
  final int yearsExperience;
  final String about;
  final List<String> services;
  final String availability;
  final String fees;

  const VetProfileViewScreen({
    Key? key,
    required this.vetName,
    required this.vetSpecialization,
    required this.yearsExperience,
    required this.about,
    required this.services,
    required this.availability,
    required this.fees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 16),
            Text(
              vetName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              vetSpecialization,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            Text(
              '$yearsExperience years of experience',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(about),
            SizedBox(height: 16),
            Text(
              'Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...services.map((service) => ListTile(
                  leading: Icon(Icons.check),
                  title: Text(service),
                )),
            SizedBox(height: 16),
            Text(
              'Availability',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(availability),
            SizedBox(height: 16),
            Text(
              'Fees',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(fees),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to Book Appointment screen
              },
              child: Text('Book Appointment'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
