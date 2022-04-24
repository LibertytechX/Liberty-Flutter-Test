import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/domain/usecases/get_tasks.dart';
import 'package:flutter/cupertino.dart';

class TaskListPageProvider with ChangeNotifier {
  final GetTasks getTasks;
  List<TaskModel>? tasks;

  bool loading = false;

  TaskListPageProvider({required this.getTasks});

  void initGetTasks(String? projectId) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = GetTasksParams(projectId: projectId);
    final result = await getTasks(params);
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
}