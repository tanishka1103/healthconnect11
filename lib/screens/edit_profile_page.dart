import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String fullName;
  final String mobile;
  final String email;
  final String degree;
  final String experience;

  const EditProfilePage({
    super.key,
    required this.fullName,
    required this.mobile,
    required this.email,
    required this.degree,
    required this.experience,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController degreeController;
  late TextEditingController experienceController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.fullName);
    mobileController = TextEditingController(text: widget.mobile);
    emailController = TextEditingController(text: widget.email);
    degreeController = TextEditingController(text: widget.degree);
    experienceController = TextEditingController(text: widget.experience);
  }

  InputDecoration fieldDecoration(String label) {
    return InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      filled: true,
      fillColor: const Color(0xffF1F5F9),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xff2196F3),
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF7FA),
      body: Column(
        children: [
          // 🔵 HEADER
          Container(
            height: 115,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xff2196F3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 48, left: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // 🧾 FORM CARD
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: fieldDecoration("Full Name"),
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: fieldDecoration("Mobile Number"),
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: fieldDecoration("Email ID"),
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: degreeController,
                          decoration: fieldDecoration("Degree"),
                        ),
                        const SizedBox(height: 18),

                        TextFormField(
                          controller: experienceController,
                          decoration: fieldDecoration("Experience"),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // 💾 SAVE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff007BFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 3,
                      ),
                      onPressed: () {
                        Navigator.pop(context, {
                          "fullName": nameController.text,
                          "mobile": mobileController.text,
                          "email": emailController.text,
                          "degree": degreeController.text,
                          "experience": experienceController.text,
                        });
                      },
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
