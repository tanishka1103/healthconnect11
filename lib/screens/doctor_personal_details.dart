import 'package:flutter/material.dart';
import 'home_page.dart';

class DoctorPersonalDetails extends StatefulWidget {
  const DoctorPersonalDetails({super.key});

  @override
  State<DoctorPersonalDetails> createState() => _DoctorPersonalDetailsState();
}

class _DoctorPersonalDetailsState extends State<DoctorPersonalDetails> {
  final _formKey = GlobalKey<FormState>();

  // 🔹 Reusable TextFormField Widget
  Widget textField(
    String hint, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return "This field is required";
              }
              return null;
            },
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 HEADER WITH BACK ARROW
            Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff6EC6FF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 30, left: 8, right: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Doctor Personal Details",
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

            // 🔹 FORM
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 BASIC INFORMATION
                    sectionTitle("Basic Information"),
                    textField("Full Name"),
                    textField(
                      "Mobile Number",
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mobile number required";
                        }
                        if (value.length != 10) {
                          return "Enter valid 10-digit number";
                        }
                        return null;
                      },
                    ),
                    textField(
                      "Email ID",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required";
                        }
                        if (!value.contains("@")) {
                          return "Enter valid email";
                        }
                        return null;
                      },
                    ),

                    // ✅ LICENSE FIELD
                    textField("License Number"),

                    // 🔹 EDUCATION & QUALIFICATION
                    sectionTitle("Education & Qualification"),
                    textField("Degree"),
                    textField("Experience"),

                    // 🔹 AVAILABILITY
                    sectionTitle("Availability"),
                    textField("Week (Mon-Sat)"),
                    textField("Time Slot"),

                    // 🔹 SERVICES WITH CHARGES
                    sectionTitle("Services With Charges"),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Service name required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Service Name",
                              border: InputBorder.none,
                            ),
                          ),
                          const Divider(),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Charges required";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Charges (₹)",
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔵 SAVE BUTTON
                    Center(
                      child: SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              );
                            }
                          },
                          child: const Text("Save"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
