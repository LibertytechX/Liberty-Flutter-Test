import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppModel with ChangeNotifier {
  final FirebaseMessaging firebaseMessaging;
  final FirebaseAuth firebaseAuth;
  final BuildContext context;

  AppModel({
    required this.firebaseMessaging,
    required this.firebaseAuth,
    required this.context
  }) {
    firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        navigatorKey.currentState!.pushNamedAndRemoveUntil(
          RoutePaths.authSelectionPage, 
          (route) => false
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/launcher_icon',
            ),
          )
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // showDialog(
        //   context: context,
        //   builder: (_) {
        //     return AlertDialog(
        //       title: Text(notification.title ?? ''),
        //       content: SingleChildScrollView(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [Text(notification.body ?? '')],
        //         ),
        //       ),
        //     );
        //   }
        // );
        if (navigatorKey.currentState != null && message.data['projectId'] != null) {
          navigatorKey.currentState!.pushNamed(
            RoutePaths.taskListPage,
            arguments: message.data['projectId']
          );
        }
      }
    });
  }
}