import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';

abstract class ToDoRemoteDataSource {
  /// Throws a [RemoteException] for all errors
  Future<UserProfileModel> getUserProfile();

  /// Throws a [RemoteException] for all errors
  Future<List<UserProfileModel>> getAllUsers();

  /// Throws a [RemoteException] for all errors
  Future<void> createProject(ProjectModel project, File? image);

  /// Throws a [RemoteException] for all errors
  Future<void> createTask(TaskModel task);

  /// Throws a [RemoteException] for all errors
  Future<List<ProjectModel>> getProjects();

  /// Throws a [RemoteException] for all errors
  Future<List<TaskModel>> getTasks(String? projectId);

  /// Throws a [RemoteException] for all errors
  Stream<QuerySnapshot<Map<String, dynamic>>> getTasksStream(String? projectId);
}