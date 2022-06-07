import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spar_application/listdata.dart';
import 'dashboard.dart';
import 'settings.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          'PROFILE',
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
      body: Stack(
        children: [
          Center(
            child: Column(children: <Widget>[
              const Padding(padding: EdgeInsets.only(bottom: 15.0)),
              const CircleAvatar(
                  radius: 50, backgroundImage: AssetImage('images/Unpak.png')),
              const Text(
                'Ilkom-O-19',
                style: TextStyle(
                    fontFamily: "FontPoppins",
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 109, 13, 13),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Row(
                    children: const <Widget>[
                      Text(
                        "No Whatsapp",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Spacer(
                        flex: 8,
                      ),
                      Text("081210903429",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      Spacer(
                        flex: 1,
                      ),
                      Icon(
                        Icons.copy,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  )),
              divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 109, 13, 13)),
                child: Row(children: const <Widget>[
                  Text(
                    "Lokasi Sekitar",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(
                    flex: 8,
                  ),
                  Text("Bogor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
              divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 109, 13, 13)),
                child: Row(children: const <Widget>[
                  Text(
                    "Rentang umur tim",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Spacer(
                    flex: 8,
                  ),
                  Text("21-23 Thn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ]),
              ),
              divider(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 109, 13, 13),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(children: <Widget>[
                  const Spacer(
                    flex: 8,
                  ),
                  const Text(
                    "Lihat / Tambahkan Anggota    ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.list),
                    color: Colors.white,
                    iconSize: 25,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, top: 20.0, right: 20.0, bottom: 10.0),
                child: const Text(
                  'Olahraga yang Diminati',
                  style: TextStyle(
                    fontFamily: "FontPoppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              divider2(),
              Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                      left: 40.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      pilihlapangan('Futsal'),
                      const SizedBox(width: 5),
                      pilihlapangan('Sepak Bola'),
                      const SizedBox(width: 5),
                      pilihlapangan('Badminton')
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(
                    left: 10.0, top: 20.0, right: 20.0, bottom: 10.0),
                child: const Text(
                  'Hari luang untuk Sparing',
                  style: TextStyle(
                    fontFamily: "FontPoppins",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              divider2(),
              Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                      left: 40.0, top: 10.0, right: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      pilihlapangan('Jumat'),
                      const SizedBox(width: 5),
                      pilihlapangan('Sabtu'),
                      const SizedBox(width: 5),
                      pilihlapangan('Minggu')
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 180, bottom: 0),
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
            ]),
          ),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Search',
        child: Icon(Icons.search),
        backgroundColor: Color.fromARGB(255, 109, 13, 13),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Divider divider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 40,
      endIndent: 40,
      color: Colors.white,
    );
  }
}

Divider divider2() {
  return const Divider(
    height: 0,
    thickness: 2,
    indent: 40,
    endIndent: 40,
    color: Color.fromARGB(255, 109, 13, 13),
  );
}

Container pilihlapangan(String text) {
  return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color.fromARGB(255, 109, 13, 13),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "FontPoppins",
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )),
      ));
}
