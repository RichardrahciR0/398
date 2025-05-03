import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/map_page.dart';
import 'screens/task_page.dart';
import 'screens/settings_page.dart';
import 'screens/notifications_page.dart'; // ✅ Notifications page

void main() {
  runApp(OrefoxApp());
}

class OrefoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orefox Farm Planting App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF7F8F9),
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.5,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/map': (context) => MapPage(),
        '/tasks': (context) => TaskPage(),
        '/settings': (context) => SettingsPage(),
        '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}
