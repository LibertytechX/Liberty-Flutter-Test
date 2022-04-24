import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class AppModel with ChangeNotifier {
  final FirebaseMessaging firebaseMessaging;

  AppModel({required this.firebaseMessaging}) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}