import 'dart:io';

import 'package:dio/dio.dart';
import 'package:do_it/core/error/exceptions.dart';
import 'package:do_it/core/util/error_to_message_mapper.dart';
import 'package:do_it/features/to_do/data/datasources/remote_data_source_impl.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/features/to_do/domain/repository/to_do_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  final ToDoRemoteDataSourceImpl dataSource;

  ToDoRepositoryImpl({required this.dataSource});
  
  @override
  Future<Either<Failure, UserProfileModel>> getUserProfile() async {
    try {
      final userProfile = await dataSource.getUserProfile();
      return Right(userProfile);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, List<UserProfileModel>>> getAllUsers() async {
    try {
      final users = await dataSource.getAllUsers();
      return Right(users);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception{
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, void>> createProject(ProjectModel projectModel, File? image) async {
    try {
      await dataSource.createProject(projectModel, image);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception catch(e) {
      print(e);
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, List<ProjectModel>>> getProjects() async {
    try {
      final result = await dataSource.getProjects();
      return Right(result);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, void>> createTask(TaskModel task) async {
    try {
      await dataSource.createTask(task);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on DioError catch(e) {
      print(e.requestOptions.uri);
      print(e.requestOptions.data);
      print(e.response!.statusCode);
      print(e.response!.statusMessage);
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    } on Exception catch(e) {
      print(e);
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks(String? projectId) async {
    try {
      final result = await dataSource.getTasks(projectId);
      return Right(result);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }
}