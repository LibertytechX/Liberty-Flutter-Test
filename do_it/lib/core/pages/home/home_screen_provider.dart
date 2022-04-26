import 'package:do_it/core/util/custom_change_notifier.dart';
import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  final pageController = PageController();
  int currentIndex = 0;
  bool initRan = false;

  HomePageProvider();

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