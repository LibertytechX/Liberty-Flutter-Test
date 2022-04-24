import 'package:do_it/core/pages/home/home_screen.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/authentication/presentation/pages/auth_selection/auth_selection_page.dart';
import 'package:do_it/features/authentication/presentation/pages/create_account/create_account_page.dart';
import 'package:do_it/features/authentication/presentation/pages/login/login_page.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/presentation/pages/create_project/create_project_page.dart';
import 'package:do_it/features/to_do/presentation/pages/create_task/create_task_page.dart';
import 'package:do_it/features/to_do/presentation/pages/dashboard/dashboard_page.dart';
import 'package:do_it/features/to_do/presentation/pages/project_list/project_list_page.dart';
import 'package:do_it/features/to_do/presentation/pages/select_users/select_users_page.dart';
import 'package:do_it/features/to_do/presentation/pages/task_list/task_list_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.authSelectionPage:
        return MaterialPageRoute(builder: (_) => const AuthSelectionPage());
      case RoutePaths.createAccountPage:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      case RoutePaths.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case RoutePaths.dashboardPage:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case RoutePaths.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutePaths.createProjectPage:
        return MaterialPageRoute(builder: (_) => const CreateProjectPage());
      case RoutePaths.selectUsersPage:
        final arg = settings.arguments as List<UserProfileModel>?;
        return MaterialPageRoute(builder: (_) => SelectUsersPage(
          initSelection: arg
        ));
      case RoutePaths.projectListPage:
        return MaterialPageRoute(builder: (_) => const ProjectListPage());
      case RoutePaths.createTaskPage:
        final arg = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => CreateTaskPage(
          projectId: arg
        ));
      case RoutePaths.taskListPage:
        final arg = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => TaskListPage(
          projectId: arg
        ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}