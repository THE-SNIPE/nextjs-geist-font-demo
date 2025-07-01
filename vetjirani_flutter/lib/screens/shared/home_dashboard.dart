import 'package:flutter/material.dart';
import 'package:vetjirani_flutter/providers/auth_provider.dart';
import 'package:vetjirani_flutter/screens/farmer/search_vet.dart';
import 'package:vetjirani_flutter/screens/farmer/my_appointments.dart';
import 'package:vetjirani_flutter/screens/farmer/emergency_sos.dart';
import 'package:vetjirani_flutter/screens/farmer/knowledge_hub.dart';
import 'package:vetjirani_flutter/screens/shared/notifications_screen.dart';
import 'package:vetjirani_flutter/screens/shared/profile_settings.dart';
import 'package:vetjirani_flutter/screens/vet/vet_dashboard.dart';

class HomeDashboard extends StatefulWidget {
  final UserRole role;

  const HomeDashboard({Key? key, required this.role}) : super(key: key);

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  int _selectedIndex = 0;

  late List<Widget> _farmerScreens;
  late List<Widget> _vetScreens;

  @override
  void initState() {
    super.initState();

    _farmerScreens = [
      SearchVetScreen(),
      MyAppointmentsScreen(),
      EmergencySOSScreen(),
      KnowledgeHubScreen(),
      ProfileSettingsScreen(),
    ];

    _vetScreens = [
      VetDashboardScreen(),
      MyAppointmentsScreen(), // Placeholder for vet appointment requests
      Container(), // Placeholder for chat screen
      Container(), // Placeholder for notifications or other
      ProfileSettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = widget.role == UserRole.Farmer ? _farmerScreens : _vetScreens;

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: widget.role == UserRole.Farmer
            ? const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
                BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'SOS'),
                BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Learn'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ]
            : const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Today'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
                BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
      ),
    );
  }
}
