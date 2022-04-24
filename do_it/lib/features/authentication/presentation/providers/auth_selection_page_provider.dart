import 'package:do_it/core/router/route_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthSelectionPageProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  bool initRan = false;

  AuthSelectionPageProvider({required this.firebaseAuth});

  void init(BuildContext context) {
    initRan = true;
    if (firebaseAuth.currentUser != null) {
      print(firebaseAuth.currentUser == null);
      print(firebaseAuth.currentUser!.email);
      Navigator.of(context).pushNamed(
        RoutePaths.homePage
      );
    }
  }
}