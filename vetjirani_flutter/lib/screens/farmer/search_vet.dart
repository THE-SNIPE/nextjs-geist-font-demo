import 'package:flutter/material.dart';

class SearchVetScreen extends StatefulWidget {
  @override
  _SearchVetScreenState createState() => _SearchVetScreenState();
}

class _SearchVetScreenState extends State<SearchVetScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedDistance = '100 km';
  String _selectedSpecialty = 'All';
  String _selectedAvailability = 'All';

  final List<String> specialties = ['All', 'Livestock', 'Poultry', 'Equine', 'Companion Animals'];
  final List<String> availabilities = ['All', 'Available Now', 'Bookable'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Vet'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for vets',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // TODO: Implement real-time search filtering
              },
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  // TODO: Replace with real vet list filtered by search and filters
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Dr. Kamau Mwangi'),
                    subtitle: Text('Livestock Specialist - 5 years experience'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to Vet Profile View
                    },
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Dr. Imani Otieno'),
                    subtitle: Text('Poultry Specialist - 3 years experience'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Navigate to Vet Profile View
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String tempDistance = _selectedDistance;
        String tempSpecialty = _selectedSpecialty;
        String tempAvailability = _selectedAvailability;

        return AlertDialog(
          title: Text('Filter Vets'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Distance'),
                Slider(
                  value: double.parse(tempDistance.split(' ')[0]),
                  min: 0,
                  max: 100,
                  divisions: 20,
                  label: tempDistance,
                  onChanged: (value) {
                    setState(() {
                      tempDistance = '${value.round()} km';
                    });
                  },
                ),
                SizedBox(height: 16),
                Text('Specialty'),
                Wrap(
                  spacing: 8,
                  children: specialties.map((spec) {
                    return ChoiceChip(
                      label: Text(spec),
                      selected: tempSpecialty == spec,
                      onSelected: (selected) {
                        setState(() {
                          tempSpecialty = spec;
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text('Availability'),
                Wrap(
                  spacing: 8,
                  children: availabilities.map((avail) {
                    return ChoiceChip(
                      label: Text(avail),
                      selected: tempAvailability == avail,
                      onSelected: (selected) {
                        setState(() {
                          tempAvailability = avail;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDistance = tempDistance;
                  _selectedSpecialty = tempSpecialty;
                  _selectedAvailability = tempAvailability;
                });
                Navigator.of(context).pop();
              },
              child: Text('Apply Filters'),
            ),
          ],
        );
      },
    );
  }
}
