import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:message_test/firebaseMessagingAndroidChannel.dart';
import 'package:message_test/firebaseMessagingBackgroundTransition.dart';

import 'firebaseAuth.dart';
import 'firebaseMessageBackgroundHandler.dart';
import 'firebaseMessagingActiveHandler.dart';
import 'firebase_options.dart';
import 'my_application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("about to init firebase");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("initialized firebase");


  initializeBackgroundListener();
  initializeActiveListener();
  initializeBackgroundTransition();
  initializeLocalNotifications();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
      SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );

  runApp(const MyApplication());
}
