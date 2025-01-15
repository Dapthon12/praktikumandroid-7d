import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mahasiswa_controller.dart';
//import '../models/mahasiswa.dart';
import 'tambah_mahasiswa.dart';
import 'ubah_mahasiswa.dart';

class MahasiswaView extends StatelessWidget {
  final MahasiswaController controller = Get.put(MahasiswaController());
  MahasiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Mahasiswa"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.mahasiswaList.isEmpty) {
                return Center(child: Text("Tidak ada data mahasiswa"));
              }
              return ListView.builder(
                itemCount: controller.mahasiswaList.length,
                itemBuilder: (context, index) {
                  final mahasiswa = controller.mahasiswaList[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(mahasiswa.photo ??
                                'https://w7.pngwing.com/pngs/358/81/png-transparent-computer-icons-graduation-ceremony-college-student-financial-aid-graduated-people-logo-graduation-ceremony.png'), // Ganti dengan URL foto
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mahasiswa.nama,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text("NPM: ${mahasiswa.npm}"),
                                Text("Email: ${mahasiswa.email}"),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(() =>
                                  EditMahasiswaView(mahasiswa: mahasiswa));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteMahasiswa(mahasiswa.id!);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() =>
                  TambahMahasiswaView()); // Navigasi ke halaman tambah mahasiswa
            },
            child: Text("Tambah Mahasiswa"),
          ),
        ],
      ),
    );
  }
}
