import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hpController = TextEditingController();

  List<Map<String, String>> dataList = [];
  bool isEdit = false;
  int indexEdit = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Pertemuan 4"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: hpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "No HP",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 15),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isEdit ? Colors.orange : Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                if (namaController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    hpController.text.isEmpty) {
                  CherryToast.warning(
                    title: Text("Semua field wajib diisi!"),
                  ).show(context);
                  return;
                }

                if (isEdit) {
                  setState(() {
                    dataList[indexEdit] = {
                      "nama": namaController.text,
                      "email": emailController.text,
                      "hp": hpController.text,
                    };
                    isEdit = false;
                    indexEdit = -1;
                    namaController.clear();
                    emailController.clear();
                    hpController.clear();
                  });
                  CherryToast.success(title: Text("Data berhasil diupdate!")).show(context);
                } else {
                  setState(() {
                    dataList.add({
                      "nama": namaController.text,
                      "email": emailController.text,
                      "hp": hpController.text,
                    });
                    namaController.clear();
                    emailController.clear();
                    hpController.clear();
                  });
                  CherryToast.success(title: Text("Data berhasil disimpan!")).show(context);
                }
              },
              child: Text(isEdit ? "Update" : "Simpan", style: TextStyle(color: Colors.white)),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Info"),
                    content: Text("Ini contoh dialog biasa"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Tutup"),
                      )
                    ],
                  ),
                );
              },
              child: Text("Show Dialog", style: TextStyle(color: Colors.white)),
            ),

            SizedBox(height: 15),

            Expanded(
              child: dataList.isEmpty
                  ? Center(child: Text("Belum ada data"))
                  : ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        final data = dataList[index];
                        return Card(
                          child: ListTile(
                            title: Text(data["nama"]!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email: ${data["email"]}"),
                                Text("No HP: ${data["hp"]}"),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.orange),
                                  onPressed: () {
                                    setState(() {
                                      namaController.text = data["nama"]!;
                                      emailController.text = data["email"]!;
                                      hpController.text = data["hp"]!;
                                      isEdit = true;
                                      indexEdit = index;
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Hapus Data"),
                                        content: Text("Yakin ingin hapus data?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text("Batal"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() => dataList.removeAt(index));
                                              CherryToast.success(title: Text("Data dihapus!")).show(context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Hapus"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}