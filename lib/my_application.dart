
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'firebaseAuth.dart';
import 'login_screen.dart';
import 'my_home_page.dart';

class MyApplication extends StatefulWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApplication();

}

class _MyApplication extends State<MyApplication>
{

  User? _user;

  @override
  void initState() {
    super.initState();
    initializeAuth((User user){
      setState((){_user = user;});

    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Message Test App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: _user == null?LoginScreen():MyHomePage(title: "We are logged in"),
    );
  }
}
