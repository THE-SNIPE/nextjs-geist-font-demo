import 'package:flutter/material.dart';

class VetVerificationScreen extends StatefulWidget {
  @override
  _VetVerificationScreenState createState() => _VetVerificationScreenState();
}

class _VetVerificationScreenState extends State<VetVerificationScreen> {
  String? _medicalIdPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vet Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Upload your Medical ID',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Please upload a clear photo of your Medical ID for verification. Ensure all details are visible.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement file picker for Medical ID upload
              },
              icon: Icon(Icons.upload_file),
              label: Text(_medicalIdPath == null ? 'Upload your Medical ID' : 'Change Medical ID'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            if (_medicalIdPath != null) ...[
              SizedBox(height: 16),
              Text('Selected file: $_medicalIdPath'),
            ],
            Spacer(),
            ElevatedButton(
              onPressed: _medicalIdPath != null
                  ? () {
                      // TODO: Submit Medical ID for verification
                    }
                  : null,
              child: Text('Submit'),
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
