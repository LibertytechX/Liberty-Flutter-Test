import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}