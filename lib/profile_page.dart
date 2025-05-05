import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'login_page.dart'; // Import the LoginPage for logout functionality
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;
  final Function(bool) toggleWifiDownload;
  final bool isWifiOnly;

  const ProfilePage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
    required this.toggleWifiDownload,
    required this.isWifiOnly,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section with Avatar and Edit button
              Center(
                child: CircleAvatar(
                  radius: screenWidth * 0.2, // Scalable avatar size
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.person, size: 80, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilePage()),
                    );
                  },
                  child: const Text('Edit Profile', style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 32),

              // Mimi Headline Section (Popular, Trending, Today)
              const Text('Mimi Headline', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListTile(
                title: const Text('Popular'),
                leading: const Icon(Icons.trending_up),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: const Text('Trending'),
                leading: const Icon(Icons.trending_flat),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: const Text('Today'),
                leading: const Icon(Icons.today),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 32),

              // Content Section (Favourite, Download)
              const Text('Content', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red),
                    const SizedBox(width: 10),
                    const Text('Favourite'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.download, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Text('Download'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(height: 32),

              // Preferences Section (Darkmode, Only Download via Wifi)
              const Text('Preferences', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.language, color: Colors.black),
                    const SizedBox(width: 10),
                    const Text('Language'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.brightness_6, color: Colors.black),
                    const SizedBox(width: 10),
                    const Text('Darkmode'),
                  ],
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: toggleTheme,
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    const Icon(Icons.wifi, color: Colors.black),
                    const SizedBox(width: 10),
                    const Text('Only Download via Wifi'),
                  ],
                ),
                trailing: Switch(
                  value: isWifiOnly,
                  onChanged: toggleWifiDownload,
                ),
              ),
              const SizedBox(height: 32),

              // Log Out Button
              Center(
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('darkMode');
                      prefs.remove('wifiOnly');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Log Out', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
