import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/usecases/get_projects.dart';
import 'package:do_it/features/to_do/domain/usecases/get_tasks.dart';
import 'package:do_it/features/to_do/domain/usecases/get_user_profile.dart';
import 'package:flutter/cupertino.dart';

class DashboardPageProvider with ChangeNotifier {
  final GetUserProfile getUserProfile;
  final GetProjects getProjects;
  final GetTasks getTasks;
  UserProfileModel? userProfile;
  List<ProjectModel>? projects;
  List<TaskModel>? tasks;

  bool initRan = false;
  bool loading = false;

  DashboardPageProvider({
    required this.getUserProfile,
    required this.getProjects,
    required this.getTasks
  });

  void init(BuildContext context) async {
    if (loading || initRan) return;

    loading = true;
    initRan = true;

    final result = await getUserProfile(NoParams());
    result.fold(
      (l) {
        loading = false;
        notifyListeners();
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.authSelectionPage, 
          (route) => false
        );
      }, 
      (r) {
        userProfile = r;
        loading = false;
        notifyListeners();
      }
    );
  }

  void initGetProjects() async {
    if (loading) return;

    loading = true;

    final result = await getProjects(NoParams());
    result.fold(
      (l) {
        loading = false;
        notifyListeners();
      }, 
      (r) {
        projects = r;
        loading = false;
        notifyListeners();
      }
    );
  }
  
  void initGetTasks() async {
    if (loading) return;

    loading = true;

    final result = await getTasks(GetTasksParams());
    result.fold(
      (l) {
        loading = false;
        notifyListeners();
      }, 
      (r) {
        tasks = r;
        loading = false;
        notifyListeners();
      }
    );
  }

  List<TaskModel> getOverdueTasks() {
    if (tasks == null) return [];

    final now = DateTime.now();
    return tasks!.where((task) {
      final end = DateTime.parse(task.end);
      return end.difference(now) > Duration(seconds: 1);
    }).toList();
  }
}