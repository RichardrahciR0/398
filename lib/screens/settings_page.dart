import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F9),
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.green[700],
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, size: 60),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          _buildSection("Mimi Headline", [
            _buildListItem(context, "Popular"),
            _buildListItem(context, "Trending"),
            _buildListItem(context, "Today"),
          ]),

          _buildSection("Content", [
            _buildListItem(context, "Favourite", icon: Icons.favorite_border),
            _buildListItem(context, "Download", icon: Icons.download),
          ]),

          _buildSection("Preferences", [
            _buildListItem(context, "Language", icon: Icons.language),
            _buildListItem(context, "Darkmode", icon: Icons.dark_mode),
            _buildListItem(context, "Only Download via Wifi", icon: Icons.wifi),
          ]),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logging out...")),
                );
              },
              child: const Text("Log out"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[400],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Changes saved!")),
                );
              },
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildListItem(BuildContext context, String text, {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tapped on $text")),
        );
      },
    );
  }
}
