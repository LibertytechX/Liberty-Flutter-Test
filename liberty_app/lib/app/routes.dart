import 'package:flutter/material.dart';
import 'package:liberty_app/presentation/screens/onboard/onboard.dart';

import '../presentation/screens/home/home.dart';
import '../presentation/screens/login/login.dart';
import 'bloc/app_bloc.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/';

  static const onboard = 'onboard';

  static const register = 'register';

  static const login = 'login';

  static const projects = 'projects';

  static const tasks = 'tasks';

  static const addTask = 'addTask';

  static const addProject = 'add project';

  static List<Page> onGenerateAppViewPages(
      AppStatus state, List<Page<dynamic>> pages) {
    switch (state) {
      case AppStatus.authenticated:
        return [HomeScreen.page()];
      case AppStatus.unauthenticated:
        return [LoginScreen.page()];
      case AppStatus.pure:
        return [OnboardPage.page()];
    }
  }
}
