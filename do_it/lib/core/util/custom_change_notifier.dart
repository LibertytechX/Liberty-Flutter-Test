import 'package:flutter/cupertino.dart';

class CustomChangeNotifier with ChangeNotifier {
  @override
  void notifyListeners() {
    print('notifylisteners called from custom');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      super.notifyListeners();
    });
  }
}