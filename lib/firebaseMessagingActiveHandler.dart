import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebaseMessagingAndroidChannel.dart';


Future<void> showNotification(String title,String body) async {
  print('hit some stuff here !!!???');
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('your channel id', 'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker');
  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin!.show(
      0, 'plain title', 'plain body', platformChannelSpecifics,
      payload: 'item x');
}

void initializeActiveListener() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('received a notificatino while activer ');
    print(message.notification!.title);
    await showNotification(message.notification!.title!, message.notification!.body!);

});
}