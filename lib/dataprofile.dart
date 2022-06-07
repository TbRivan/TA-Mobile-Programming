import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataProfile extends StatefulWidget {
  final String id;
  const DataProfile(this.id, {Key? key}) : super(key: key);

  @override
  State<DataProfile> createState() => _DataProfileState();
}

class _DataProfileState extends State<DataProfile> {
  //Menyiapkan collection profile
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
            'EDIT ANGGOTA',
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
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 00.06,
              vertical: MediaQuery.of(context).size.height * 00.03),
          child: getProfile(),
        ));
  }

  //Mengambil data dari database menggunakan FutureBuilder sehingga tampilan data tidak akan langsung berubah saat data pada di database diperbarui
  FutureBuilder<DocumentSnapshot<Object?>> getProfile() {
    return FutureBuilder(
      //Mengambil data daru document berdasarkan id yang diperoleh pada halaman home lalu disimpan dalam snapshot
      future: profile.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //Dilakukan try and catch
        try {
          //Bila snapshot memiliki data maka kita isikan data tersebut ke dalam masing-masing controller
          if (snapshot.hasData) {
            _namaController.text = snapshot.data!['nama'].toString();
            _noController.text = snapshot.data!['no'].toString();
            _umurController.text = snapshot.data!['umur'].toString();
            //Build widget dataProfile.
            return dataProfile(context);
          }
        } catch (e) {
          debugPrint(e.toString());
        }
        //Kembalikan tampilan loading jika terjadi sesuatu di luar dugaan.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget dataProfile(BuildContext context) {
    return Form(
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
                  return 'Kelas Tidak Boleh Kosong';
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
                  return 'Kelas Tidak Boleh Kosong';
                } else {
                  return null;
                }
              },
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 109, 13, 13)),
                onPressed: () {
                  //Melakukan validasi form sebelumnya ketika tombol ditekan, bila telah sesuai maka setState updateProfile
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      //Memperbarui data ke database
                      updateProfile(context);
                    });
                  }
                },
                child: const Text('Perbarui Data')),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.black),
                onPressed: () {
                  //Tampilkan dialog untuk verifikasi apakah benar data akan dihapus dengan AlertDialog
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Center(
                                child: Text('Konfirmasi Hapus Data')),
                            content: Text(
                                'Yakin ingin menghapus Profile Bernama ' +
                                    _namaController.text.trim()),
                            actions: [
                              //Bila tombol Ya ditekan maka jalankan deleteProfile
                              TextButton(
                                  onPressed: () => deleteProfile(context),
                                  child: const Text('Ya')),
                              //Bila tombol Tidak  ditekan maka pop AlertDialog
                              TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, "Tidak"),
                                  child: const Text('Tidak')),
                            ],
                          ));
                },
                child: const Text('Hapus Data')),
          )
        ],
      ),
    );
  }

  Future updateProfile(BuildContext context) async {
    //Menyiapkan referensi dokumen yang akan diperbarui
    DocumentReference docReference = profile.doc(widget.id);

    //Memperbarui data ke dalam database
    docReference.update({
      'nama': _namaController.text.trim(),
      'no': _noController.text.trim(),
      'umur': _umurController.text.trim(),
      //Jika update berhasil maka tampilkan sebuah Snack Bar setelah itu kembali ke halaman sebelumnya.
    }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile Berhasil Diperbarui'))));
    Navigator.pop(context);
  }

  Future deleteProfile(BuildContext context) async {
    //Hapus dokumen berdasarkan id yang didapat pada halaman Home, bila data berhasil dihapus maka tampilkan sebuah Snack Bar
    profile.doc(widget.id).delete().then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Data Mahasiswa Berhasil Diperbarui'))));
    //Pop dilakukan dua kali
    //1. AlertDialog
    //2. Halaman DataMahasiswa
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
