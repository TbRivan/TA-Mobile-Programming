import 'package:flutter/material.dart';
import 'profile.dart';
import 'settings.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
          'SPAR',
          style: TextStyle(
              fontFamily: "FontPoppins",
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Color.fromARGB(255, 109, 13, 13)),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.account_circle, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          // ignore: sized_box_for_whitespace
          child: Container(
        height: 800,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                margin:
                    const EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 109, 13, 13),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Cari lawan disekitar untuk latih tanding Tim mu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "FontPoppins",
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Pilih Lokasi',
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(style: BorderStyle.none),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ])),
            Container(
                margin:
                    const EdgeInsets.only(left: 50.0, top: 30.0, right: 50.0),
                child: Row(
                  children: const <Widget>[
                    Text(
                      "Pilih Olahraga",
                      style: TextStyle(
                          fontFamily: "FontPoppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    Spacer(
                      flex: 8,
                    ),
                    Text(
                      "Lihat Semua",
                      style: TextStyle(
                          fontFamily: "FontPoppins",
                          fontSize: 10,
                          fontWeight: FontWeight.w700),
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )),
            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  sport('Sepak Bola', 'images/bola.jpg'),
                  const SizedBox(width: 20),
                  sport('Futsal', 'images/futsal.jpeg'),
                  const SizedBox(width: 20),
                  sport('Basket', 'images/basket.jpg'),
                  const SizedBox(width: 20),
                  sport('Badminton', 'images/badminton.jpg'),
                ],
              ),
            ),
            Container(
                height: 200,
                margin:
                    const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Cari Lapangan untuk di Booking Di sekitar Anda',
                      style: TextStyle(
                          fontFamily: "FontPoppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                        height: 40,
                        margin: const EdgeInsets.only(
                            left: 10.0, top: 10.0, right: 20.0, bottom: 10.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 109, 13, 13),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text("Futsal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "FontPoppins",
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      )),
                                )),
                            const SizedBox(width: 5),
                            pilihlapangan('Sepak Bola'),
                            const SizedBox(width: 5),
                            pilihlapangan('Basket'),
                            const SizedBox(width: 5),
                            pilihlapangan('Badminton'),
                          ],
                        )),
                    // ignore: sized_box_for_whitespace
                    Container(
                        height: 90,
                        child:
                            ListView(scrollDirection: Axis.vertical, children: [
                          divider(2),
                          lapangan('Sejahtera', '2,7 Km'),
                          divider(1),
                          lapangan('Rulet', '3,2 Km'),
                          divider(1),
                          lapangan('Galaxy', '5,9 Km'),
                          divider(1),
                          lapangan('Keke Futsal', '7,5 Km'),
                          divider(1),
                          lapangan('Internation Futsal', '8,2 Km'),
                        ]))
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 35, bottom: 20),
              height: 50,
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
                    onPressed: () {},
                    tooltip: "Beranda",
                    iconSize: 30,
                    color: const Color.fromARGB(255, 109, 13, 13),
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
      )),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Search',
        child: Icon(Icons.search),
        backgroundColor: Color.fromARGB(255, 109, 13, 13),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Divider divider(double p) {
    return Divider(
      height: 0,
      thickness: p,
      indent: 10,
      endIndent: 20,
      color: const Color.fromARGB(255, 109, 13, 13),
    );
  }

  Container lapangan(String text1, text2) {
    return Container(
        margin: const EdgeInsets.only(
            left: 10.0, top: 5.0, right: 20.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            Text(text1,
                style: const TextStyle(
                  fontFamily: "FontPoppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
            const Spacer(flex: 8),
            Text(text2,
                style: const TextStyle(
                  fontFamily: "FontPoppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
            const Icon(Icons.location_on)
          ],
        ));
  }

  Container pilihlapangan(String text) {
    return Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
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

  Container sport(String text, image) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(
            color: const Color.fromARGB(255, 109, 13, 13),
            width: 2,
          )),
      child: Column(
        children: [
          Image.asset(image, fit: BoxFit.cover, width: 200, height: 150),
          Text(text,
              style: const TextStyle(
                  fontFamily: "FontPoppins",
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
