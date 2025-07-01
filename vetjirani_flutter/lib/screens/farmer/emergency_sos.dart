import 'package:flutter/material.dart';

class EmergencySOSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Alert'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Alerting nearby vets',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Expanded(
              child: Image.asset(
                'assets/images/map_placeholder.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Your location has been shared with nearby vets. They will contact you shortly.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement cancel alert functionality
              },
              child: Text('Cancel Alert'),
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
