import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vetjirani_flutter/screens/shared/login_screen.dart';
import 'package:vetjirani_flutter/screens/shared/home_dashboard.dart';
import 'package:vetjirani_flutter/screens/shared/profile_settings.dart';
import 'package:vetjirani_flutter/screens/farmer/search_vet.dart';
import 'package:vetjirani_flutter/screens/vet/vet_verification.dart';
import 'package:vetjirani_flutter/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VetJiraniApp());
}

class VetJiraniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        title: 'VetJirani',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
        ),
        home: AuthWrapper(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          // Add localization delegates here for bilingual support
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('sw', ''),
        ],
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (!authProvider.isLoggedIn) {
      return LoginScreen();
    }

    // Role-based navigation
    if (authProvider.userRole == UserRole.Farmer) {
      return HomeDashboard(role: UserRole.Farmer);
    } else if (authProvider.userRole == UserRole.Vet) {
      return HomeDashboard(role: UserRole.Vet);
    } else {
      // Default fallback
      return LoginScreen();
    }
  }
}
