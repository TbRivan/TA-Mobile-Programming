import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spar_application/addprofile.dart';
import 'package:spar_application/dataprofile.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference profile =
      FirebaseFirestore.instance.collection('profile');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        title: const Text(
          'ANGGOTA',
          style: TextStyle(
              fontFamily: "FontPoppins",
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Color.fromARGB(255, 109, 13, 13)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      //StreamBuilder digunakan untuk menerima data yang akan ikut diperbarui bila terjadi perubahan pada data.
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
              //Mengambil data dari collection profile dengan urutan kelas menurun disimpan dalam sebuah snapshot.
              stream: profile.orderBy('umur', descending: true).snapshots(),
              builder: (context, snapshot) {
                //Mengecek apakah koneksi snapshot sedang aktif atau tidak
                if (snapshot.connectionState == ConnectionState.active) {
                  //Mengecek apakah snapshot memiliki data atau kosong
                  if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                    //Jika data kosong tampilkan tulisan data kosong
                    return const Center(
                      child: Text('Data Kosong'),
                    );
                    //Jika snapshot memiliki data maka ubah bentuk map dari snapshot ke dalam sebuah widget list
                  } else {
                    return ListView(
                        children: snapshot.data!.docs
                            .map((e) => dataProfile(
                                umur: e['umur'],
                                nama: e['nama'],
                                no: e['no'],
                                id: e['id']))
                            .toList());
                  }
                  //Selain koneksi aktif maka tampilkan sebuah tampilan loading
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          Container(
            margin: const EdgeInsets.only(top: 725, bottom: 0),
            height: 30,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ));
                  },
                  tooltip: "Beranda",
                  iconSize: 30,
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ));
                  },
                  tooltip: "Settings",
                  iconSize: 28,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
      //Button untuk menambahkan data baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddData()));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 109, 13, 13),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //Widget list yang digunakan untuk menampilkan data dari snapshot streambuilder
  Widget dataProfile({String? umur, String? nama, String? no, String? id}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 109, 13, 13),
        child: Text(umur!),
      ),
      title: Text(nama!),
      subtitle: Text(no!),
      //Ketika ListTile ditekan pindah ke halaman lain untuk update / hapus data profile tersebut
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DataProfile(id!)),
        );
      },
    );
  }
}
