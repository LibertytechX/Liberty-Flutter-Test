import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageProvider extends ChangeNotifier {
  final Future<SharedPreferences> sharedPreferences;
  final pageController = PageController();
  int currentIndex = 0;
  bool initRan = false;

  HomePageProvider({required this.sharedPreferences});

  void setCurrentIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
        currentIndex = index;
        pageController.animateToPage(
          index, 
          duration: const Duration(milliseconds: 500), 
          curve: Curves.easeInOut
        );
        break;
      default:
        currentIndex = index;
    }

    notifyListeners();
  }
}