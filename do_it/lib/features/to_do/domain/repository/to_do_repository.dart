import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';

abstract class ToDoRepository {
  Future<Either<Failure, UserProfileModel>> getUserProfile();
  Future<Either<Failure, List<UserProfileModel>>> getAllUsers();
  Future<Either<Failure, void>> createProject(ProjectModel projectModel, File? image);
  Future<Either<Failure, void>> createTask(TaskModel task);
  Future<Either<Failure, List<ProjectModel>>> getProjects();
  Future<Either<Failure, List<TaskModel>>> getTasks(String? projectId);
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>> getTasksStream(String? projectId);
}