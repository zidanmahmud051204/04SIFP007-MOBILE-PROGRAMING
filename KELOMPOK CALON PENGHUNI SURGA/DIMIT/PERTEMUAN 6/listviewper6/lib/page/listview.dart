import 'package:flutter/material.dart';
import 'package:per4/page/detail.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  final List<Map<String, String>> pertemuan = const [
    {
      "judul": "Pertemuan 1",
      "sub": "Pengenalan Android",
      "materi": """Android adalah sistem operasi berbasis Linux yang dikembangkan oleh Google untuk perangkat mobile.

📌 Topik yang dipelajari:
- Sejarah dan perkembangan Android
- Arsitektur Android (Linux Kernel, Libraries, Android Runtime, Application Framework, Applications)
- Versi-versi Android dari Cupcake hingga terbaru
- Pengenalan Android Studio sebagai IDE utama
- Struktur project Flutter/Android
- Menjalankan emulator dan device fisik

💡 Fakta Menarik:
Android pertama kali dirilis pada tahun 2008 dan kini menjadi OS mobile paling populer di dunia dengan pangsa pasar lebih dari 70%."""
    },
    {
      "judul": "Pertemuan 2",
      "sub": "Widget & Button",
      "materi": """Widget adalah elemen dasar dalam Flutter. Semua tampilan di Flutter adalah widget.

📌 Topik yang dipelajari:
- Perbedaan StatelessWidget dan StatefulWidget
- Widget dasar: Text, Image, Icon, Container, Row, Column
- Jenis-jenis Button: ElevatedButton, TextButton, OutlinedButton, IconButton
- Styling widget dengan decoration dan padding
- Menggunakan setState untuk update UI
- Layout dengan Expanded dan Flexible

💡 Tips:
Gunakan StatelessWidget jika tampilan tidak berubah, dan StatefulWidget jika ada interaksi yang mengubah tampilan."""
    },
    {
      "judul": "Pertemuan 3",
      "sub": "Activity & Intent",
      "materi": """Navigasi antar halaman di Flutter menggunakan Navigator, mirip konsep Activity & Intent di Android native.

📌 Topik yang dipelajari:
- Konsep Navigator dan Route di Flutter
- Navigator.push() untuk berpindah halaman
- Navigator.pop() untuk kembali ke halaman sebelumnya
- Mengirim data antar halaman (passing arguments)
- Named Routes dengan MaterialApp routes
- PageRouteBuilder untuk animasi transisi kustom

💡 Contoh:
Navigator.push(context, MaterialPageRoute(builder: (context) => HalamanBaru()));"""
    },
    {
      "judul": "Pertemuan 4",
      "sub": "Toast & AlertDialog",
      "materi": """Toast dan AlertDialog digunakan untuk memberikan notifikasi atau konfirmasi kepada pengguna.

📌 Topik yang dipelajari:
- Menampilkan Toast menggunakan package cherry_toast / fluttertoast
- Jenis CherryToast: success, warning, error, info
- AlertDialog untuk konfirmasi aksi penting
- showDialog() dan Navigator.pop() untuk menutup dialog
- SimpleDialog untuk pilihan ganda
- SnackBar sebagai alternatif notifikasi bawaan Flutter

💡 Best Practice:
Gunakan AlertDialog untuk aksi yang tidak bisa dibatalkan (seperti hapus data), dan Toast untuk notifikasi ringan."""
    },
    {
      "judul": "Pertemuan 5",
      "sub": "ListView",
      "materi": """ListView digunakan untuk menampilkan daftar data yang bisa di-scroll secara vertikal maupun horizontal.

📌 Topik yang dipelajari:
- ListView biasa vs ListView.builder
- ListView.builder untuk data dinamis (efisien untuk data banyak)
- ListTile sebagai item standar dalam list
- Card widget untuk tampilan yang lebih menarik
- Menambah, mengedit, dan menghapus item dari list
- RefreshIndicator untuk pull-to-refresh

💡 Tips:
Selalu gunakan ListView.builder jika jumlah data tidak diketahui atau banyak, karena hanya me-render item yang terlihat di layar."""
    },
    {
      "judul": "Pertemuan 6",
      "sub": "Checkbox",
      "materi": """Checkbox adalah widget input yang memungkinkan pengguna memilih satu atau lebih opsi.

📌 Topik yang dipelajari:
- Widget Checkbox dasar dan cara penggunaannya
- CheckboxListTile untuk tampilan lebih lengkap
- Menyimpan state checkbox dengan StatefulWidget
- Checkbox dalam ListView (checklist dinamis)
- Switch sebagai alternatif Checkbox
- Validasi minimal satu checkbox harus dipilih

💡 Contoh Penggunaan:
Form persetujuan syarat & ketentuan, filter kategori, to-do list, dan pemilihan multiple item."""
    },
    {
      "judul": "Pertemuan 7",
      "sub": "Radio Button",
      "materi": """Radio Button digunakan ketika pengguna hanya boleh memilih SATU pilihan dari beberapa opsi yang tersedia.

📌 Topik yang dipelajari:
- Widget Radio dan groupValue
- RadioListTile untuk tampilan lengkap dengan label
- Perbedaan Radio vs Checkbox (single vs multiple selection)
- Menggunakan enum sebagai nilai Radio
- Menampilkan hasil pilihan Radio
- Radio dalam form dengan validasi

💡 Perbedaan utama:
- Checkbox → bisa pilih banyak
- Radio Button → hanya bisa pilih satu dalam satu grup""",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Pertemuan 5"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: pertemuan.length,
        itemBuilder: (context, index) {
          final item = pertemuan[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Icon(Icons.list, color: Colors.grey),
              title: Text(
                item["judul"]!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(item["sub"]!),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPertemuan(
                      judul: item["judul"]!,
                      sub: item["sub"]!,
                      materi: item["materi"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}