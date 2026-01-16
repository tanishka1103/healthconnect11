import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔵 TOP BLUE CURVE
            Container(
              height: 160,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF4AAFFF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: const Text(
                "HealthConnect",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 🟦 TITLE
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF007BFF),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Log in to your account",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // 📧 EMAIL
            _inputField("Email"),

            const SizedBox(height: 15),

            // 🔒 PASSWORD
            _inputField("Password", isPassword: true),

            // 🔗 FORGOT PASSWORD
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // 🔵 LOGIN BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF007BFF),
                padding: const EdgeInsets.symmetric(
                  horizontal: 80,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 25),

            // ➖ OR SIGN IN WITH
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(child: Divider(indent: 40, endIndent: 10)),
                Text("Or sign in with"),
                Expanded(child: Divider(indent: 10, endIndent: 40)),
              ],
            ),

            const SizedBox(height: 20),

            // 🌐 SOCIAL ICONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.g_mobiledata),
                _socialIcon(Icons.facebook),
                _socialIcon(Icons.apple),
              ],
            ),

            const SizedBox(height: 30),

            // 🟦 BOTTOM CURVE
            Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF4AAFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 INPUT FIELD WIDGET
  static Widget _inputField(String hint, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFF00A3FF),
          hintStyle: const TextStyle(color: Colors.white),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  // 🔹 SOCIAL ICON
  static Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: Icon(icon, size: 28),
      ),
    );
  }
}
