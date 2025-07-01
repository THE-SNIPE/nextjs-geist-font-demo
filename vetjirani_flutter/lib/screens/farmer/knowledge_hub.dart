import 'package:flutter/material.dart';

class KnowledgeHubScreen extends StatelessWidget {
  final List<Map<String, String>> diseases = [
    {'title': 'Cattle Diseases', 'image': 'assets/images/cattle_disease.jpg'},
    {'title': 'Pig Diseases', 'image': 'assets/images/pig_disease.jpg'},
    {'title': 'Poultry Diseases', 'image': 'assets/images/poultry_disease.jpg'},
  ];

  final List<Map<String, String>> tips = [
    {'title': 'Cattle Tips', 'image': 'assets/images/cattle_tips.jpg'},
    {'title': 'Pig Tips', 'image': 'assets/images/pig_tips.jpg'},
    {'title': 'Poultry Tips', 'image': 'assets/images/poultry_tips.jpg'},
  ];

  final List<Map<String, String>> videos = [
    {'title': 'Cattle Videos', 'image': 'assets/images/cattle_video.jpg'},
    {'title': 'Pig Videos', 'image': 'assets/images/pig_video.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Knowledge Hub'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Diseases', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildHorizontalList(diseases),
          SizedBox(height: 16),
          Text('Tips', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildHorizontalList(tips),
          SizedBox(height: 16),
          Text('Videos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildHorizontalList(videos),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement offline content download
            },
            icon: Icon(Icons.download),
            label: Text('Download Content'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalList(List<Map<String, String>> items) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            children: [
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(item['title']!, style: TextStyle(fontSize: 14)),
            ],
          );
        },
      ),
    );
  }
}
