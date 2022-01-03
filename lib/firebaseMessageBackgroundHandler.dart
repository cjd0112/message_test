

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:message_test/firebaseMessagingActiveHandler.dart';

import 'firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print("Handling a background message: ${message.messageId}");

  print("body is - ${message.notification!.body}");

  print("title is - ${message.notification!.title}");


    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


    print('hit some stuff hhacky !!!here !!!???');
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, message.notification!.title!, message.notification!.body!, platformChannelSpecifics,
        payload: 'item x');
}

void initializeBackgroundListener()
{
  print("initializing firebase background message handler");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}
