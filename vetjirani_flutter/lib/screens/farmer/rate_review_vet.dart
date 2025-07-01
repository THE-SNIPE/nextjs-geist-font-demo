import 'package:flutter/material.dart';

class RateReviewVetScreen extends StatefulWidget {
  @override
  _RateReviewVetScreenState createState() => _RateReviewVetScreenState();
}

class _RateReviewVetScreenState extends State<RateReviewVetScreen> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  Widget _buildStar(int index) {
    if (index < _rating) {
      return IconButton(
        icon: Icon(Icons.star, color: Colors.amber),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    } else {
      return IconButton(
        icon: Icon(Icons.star_border),
        onPressed: () {
          setState(() {
            _rating = index + 1;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate your consultation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 16),
            Text(
              'Dr. James Mwangi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Veterinarian',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),
            Text('How was your consultation?', style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => _buildStar(index)),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Leave a comment',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Submit rating and review
              },
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
