import 'package:flutter/material.dart';

class ManageReviewsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Aisha Hassan',
      'time': '2 weeks ago',
      'rating': 5,
      'comment': 'Dr. Mwangi was incredibly helpful and patient with my questions about my cow\'s health. I highly recommend him!',
      'likes': 15,
      'dislikes': 2,
    },
    {
      'name': 'David Kamau',
      'time': '1 month ago',
      'rating': 4,
      'comment': 'The consultation was good, but I felt the diagnosis could have been more detailed. Overall, a positive experience.',
      'likes': 8,
      'dislikes': 1,
    },
    {
      'name': 'Fatima Ali',
      'time': '2 months ago',
      'rating': 5,
      'comment': 'Excellent service! Dr. Mwangi responded quickly to my emergency and provided clear instructions. My goat is recovering well.',
      'likes': 20,
      'dislikes': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Reviews'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Average Rating: 4.8',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildRatingBar(),
          SizedBox(height: 16),
          ...reviews.map((review) => _buildReviewTile(review)).toList(),
        ],
      ),
    );
  }

  Widget _buildRatingBar() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < 4 ? Icons.star : Icons.star_half,
          color: Colors.amber,
          size: 32,
        );
      }),
    );
  }

  Widget _buildReviewTile(Map<String, dynamic> review) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text(review['name'][0]),
              ),
              title: Text(review['name']),
              subtitle: Text(review['time']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Icon(
                    index < review['rating'] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
            ),
            SizedBox(height: 8),
            Text(review['comment']),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.thumb_up, size: 20),
                SizedBox(width: 4),
                Text('${review['likes']}'),
                SizedBox(width: 16),
                Icon(Icons.thumb_down, size: 20),
                SizedBox(width: 4),
                Text('${review['dislikes']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
