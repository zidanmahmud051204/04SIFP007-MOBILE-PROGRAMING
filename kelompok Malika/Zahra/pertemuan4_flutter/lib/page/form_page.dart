import 'package:flutter/material.dart';
import 'package:pertemuan4_flutter/page/profile_model.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final summaryController = TextEditingController();
  final experienceController = TextEditingController();
  final educationController = TextEditingController();

  void submit() {
    if (summaryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Isi summary dulu yuk!")),
      );
      return;
    }

    final data = ProfileData(
      summary: summaryController.text,
      experience: experienceController.text,
      education: educationController.text,
    );

    Navigator.pop(context, data);
  }

  // Fungsi helper untuk membuat dekorasi TextField agar konsisten
  InputDecoration customInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[50],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2EF), // Warna abu-abu khas background LinkedIn
      appBar: AppBar(
        title: const Text("Edit Professional Profile"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Header simulasi profil
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 25),

            // Card untuk form agar terlihat clean
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informasi Dasar",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    // Input Summary
                    TextField(
                      controller: summaryController,
                      maxLines: 3,
                      decoration: customInputDecoration("Summary / Tentang Saya", Icons.person_outline),
                    ),
                    const SizedBox(height: 15),

                    // Input Experience
                    TextField(
                      controller: experienceController,
                      decoration: customInputDecoration("Pengalaman Kerja", Icons.work_outline),
                    ),
                    const SizedBox(height: 15),

                    // Input Education
                    TextField(
                      controller: educationController,
                      decoration: customInputDecoration("Pendidikan", Icons.school_outlined),
                    ),
                    const SizedBox(height: 25),

                    // Tombol Submit ala LinkedIn
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0A66C2), // Biru LinkedIn
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Simpan Profil",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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