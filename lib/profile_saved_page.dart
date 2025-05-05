import 'package:flutter/material.dart';

class ProfileSavedPage extends StatelessWidget {
  const ProfileSavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Saved')),
      body: const Center(child: Text('Your profile has been saved!')),
    );
  }
}
