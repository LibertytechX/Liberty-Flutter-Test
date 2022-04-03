
import 'package:project_api/src/models/models.dart';

/// {@template projects_api}
/// The interface for an API that provides access to a list of projects.
/// {@endtemplate}
abstract class ProjectsApi {
  /// {@macro projects_api}
  const ProjectsApi();

  /// Provides a [Stream] of all projects.
  Stream<List<Project>> getProjects();

  /// Saves a [project].
  ///
  /// If a [project] with the same id already exists, it will be replaced.
  Future<void> saveProject(Project project);
}

/// Error thrown when a [Project] with a given id is not found.
class ProjectNotFoundException implements Exception {}
