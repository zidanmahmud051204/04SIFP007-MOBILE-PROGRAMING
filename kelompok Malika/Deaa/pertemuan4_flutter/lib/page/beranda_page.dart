import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:pertemuan4_flutter/page/profile_page.dart'; // Pastikan path ini benar
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  // Variabel untuk navigasi (jika nanti dibutuhkan)
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Pertemuan 4"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Tombol Submit ---
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                SimpleAlertDialog.show(
                  context,
                  // Tidak pakai 'const' di sini karena library tidak mendukungnya
                  title: AlertTitleText("Apakah kamu yakin?"),
                  content: AlertContentText("Apakah kamu ingin menambahkan data"),
                  buttonsColor: Colors.green,
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(context); // Tutup dialog
                    CherryToast.success(
                      title: const Text("Berhasil menambahkan data!"),
                      inheritThemeColors: true,
                    ).show(context);
                  },
                );
              },
              child: _buildButton("Submit", Colors.green),
            ),

            // --- Tombol Hapus/Delete ---
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                SimpleAlertDialog.show(
                  context,
                  title: AlertTitleText("Apakah kamu yakin?"),
                  content: AlertContentText("Apakah kamu ingin menghapus data"),
                  buttonsColor: Colors.red,
                  onConfirmButtonPressed: (ctx) {
                    Navigator.pop(context); // Tutup dialog
                    CherryToast.success(
                      title: const Text("Berhasil menghapus data!"),
                      inheritThemeColors: true,
                    ).show(context);
                  },
                );
              },
              child: _buildButton("Delete", Colors.red),
            ),

            // --- Tombol Show Dialog (Standar) ---
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("AlertDialog"),
                    content: const Text("Ini Alert Dialog"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
              child: _buildButton("Show Dialog", Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi pembantu (Helper) untuk membuat tampilan tombol seragam
  Widget _buildButton(String label, Color color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}