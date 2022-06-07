import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //Menyiapkan collection mahasiswa
  final CollectionReference profile =
      FirebaseFirestore.instance.collection('profile');
  //Menyiapkan TextEditingController agar data dari textformfield dapat digunakan.
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  //Menyiapkan Key untuk form
  final _formKey = GlobalKey<FormState>();

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
          'TAMBAH ANGGOTA',
          style: TextStyle(
              fontFamily: "FontPoppins",
              fontWeight: FontWeight.w700,
              fontSize: 25,
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
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 00.06,
              vertical: MediaQuery.of(context).size.height * 00.03),
          //Membuat sebuah form agar dapat melakukan validasi untuk TextFormField
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nama'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _noController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'No'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'No Tidak Boleh Kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _umurController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Umur'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Umur Tidak Boleh Kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 109, 13, 13)),
                        onPressed: () {
                          //Melakukan validasi form sebelumnya ketika tombol ditekan, bila telah sesuai maka setState addMahasiswa
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              //Menyimpan data ke database
                              addProfile(context);
                            });
                          }
                        },
                        child: const Text('Tambah Data')),
                  )
                ],
              ))),
    );
  }

  Future addProfile(BuildContext context) async {
    //Menyiapkan referensi dokumen yang akan disimpan nanti
    DocumentReference docReference = profile.doc();

    //Menyimpan data ke dalam database
    docReference.set({
      'nama': _namaController.text.trim(),
      'no': _noController.text.trim(),
      'umur': _umurController.text.trim(),
      //Menyimpan ID berdasarkan docReference agar mudah saat pencarian data.
      'id': docReference.id
      //Jika set berhasil maka tampilkan sebuah Snack Bar setelah itu kembali ke halaman sebelumnya.
    }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil Berhasil Ditambahkan'))));
    Navigator.pop(context);
  }
}
