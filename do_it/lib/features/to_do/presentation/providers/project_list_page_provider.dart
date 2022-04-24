import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/domain/usecases/get_projects.dart';
import 'package:flutter/cupertino.dart';

class ProjectListPageProvider with ChangeNotifier {
  final GetProjects getProjects;
  List<ProjectModel>? projects;

  bool loading = false;

  ProjectListPageProvider({required this.getProjects});

  void initGetProjects() async {
    if (loading) return;

    loading = true;
    notifyListeners();

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
}