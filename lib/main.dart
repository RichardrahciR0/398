import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  bool _isWifiOnly = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('darkMode') ?? false;
      _isWifiOnly = prefs.getBool('wifiOnly') ?? false; // Load saved WiFi setting
    });
  }

  _toggleTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    setState(() {
      _isDarkMode = value;
    });
  }

  _toggleWifiDownload(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('wifiOnly', value);
    setState(() {
      _isWifiOnly = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      home: ProfilePage(
        toggleTheme: _toggleTheme,
        isDarkMode: _isDarkMode,
        toggleWifiDownload: _toggleWifiDownload,
        isWifiOnly: _isWifiOnly,
      ),
    );
  }
}
