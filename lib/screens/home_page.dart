import 'package:flutter/material.dart';
import 'request_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,

        // 🔹 MENU ICON
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }

              if (value == 'logout') {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'profile', child: Text('Profile')),
              PopupMenuItem(value: 'logout', child: Text('Logout')),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          // 🗺️ MAP PLACEHOLDER
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: const Center(child: Text("Map will come here later")),
            ),
          ),

          // 🔘 REQUESTS & HISTORY BUTTONS
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RequestPage(),
                        ),
                      );
                    },
                    child: const Text("Requests"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ),
                      );
                    },
                    child: const Text("History"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
