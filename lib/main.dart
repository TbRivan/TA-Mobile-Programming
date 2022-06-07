import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_option.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'FontPoppins'),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                color: const Color.fromARGB(255, 109, 13, 13),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset('images/icon_sport.png'),
                          const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Username',
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                          ),
                          //Password TextField
                          const TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          fixedSize: const Size(30, 10),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Dashboard(),
                                            ));
                                      },
                                      child: const Text('Login',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      )
                    ],
                  ),
                )))));
  }
}
