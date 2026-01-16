import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🔵 PROFILE HEADER
          Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // 👤 PROFILE IMAGE
          const CircleAvatar(radius: 45, backgroundColor: Colors.grey),

          const SizedBox(height: 30),

          // 📄 PROFILE FIELDS (UI ONLY)
          _profileField('Full Name'),
          _profileField('Mobile Number'),
          _profileField('Email ID'),

          const SizedBox(height: 20),

          const Text(
            'Education & Qualification',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          _profileField('Degree'),
          _profileField('Specialization'),
          _profileField('Experience'),
        ],
      ),
    );
  }

  static Widget _profileField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Container(
        height: 45,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(hint),
      ),
    );
  }
}
