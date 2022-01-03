
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth? auth;

void initializeAuth(ValueSetter<User> foo) async{
  auth = FirebaseAuth.instance;

  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) async {
    if (user == null) {
      print('User is currently signed out!');
      print('going to try to sign in ');
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: "barry.allen@example.com",
            password: "SuperSecretPassword!"
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('User is signed in!');
      print('user is ' + user.uid);
      print('user is ' + user.email!);

      foo(user);

    }
  });
}