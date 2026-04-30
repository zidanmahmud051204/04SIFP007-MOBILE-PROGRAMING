import 'package:flutter/material.dart';
import 'package:pertemuan4_flutter/page/form_page.dart';
import 'package:pertemuan4_flutter/page/profile_model.dart'; 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variabel State untuk menampung data dari Form
  String summary = "Belum ada summary";
  String experience = "Belum ada pengalaman";
  String education = "Belum ada pendidikan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // Header Image & Profile Picture menggunakan Assets
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    // Menggunakan gambar dari folder assets
                    image: AssetImage('assets/header.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                
                child: Container(
                  width: double.infinity,
                  height: 200,
                  alignment: const Alignment(0.0, 2.5),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 64, // Border tipis warna putih
                    child: CircleAvatar(
                      // Menggunakan gambar profil dari folder assets
                      backgroundImage: AssetImage('assets/profile2.jpeg'),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // --- BAGIAN IDENTITAS ---
              const Text(
                "zamadeyalran",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Jakarta, Indonesia",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter Software Engineer",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              
              const SizedBox(height: 25),

              // Bagian Data Dinamis (Hasil Input Form)
              _buildInfoSection("Summary", summary),
              _buildInfoSection("Experience", experience),
              _buildInfoSection("Education", education),

              const SizedBox(height: 10),

              // Statistics Card
              Card(
                elevation: 2,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn("Project", "16"),
                      _buildStatColumn("Followers", "2308"),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Tombol Edit Profile
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPage(),
                        ),
                      );

                      // Update state jika ada data yang dikirim balik dari FormPage
                      if (result != null && result is ProfileData) {
                        setState(() {
                          summary = result.summary;
                          experience = result.experience;
                          education = result.education;
                        });
                      }
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      "Edit Profile",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk bagian Informasi
  Widget _buildInfoSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const Divider(height: 20),
        ],
      ),
    );
  }

  // Widget Helper untuk kolom statistik
  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          count,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}