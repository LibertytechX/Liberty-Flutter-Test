import 'dart:io';

import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';
import 'package:equatable/equatable.dart';

class CreateProject extends UseCase<void, CreateProjectParams> {
  final ToDoRepositoryImpl repository;

  CreateProject({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(CreateProjectParams params) async {
    return repository.createProject(params.project, params.image);
  }
}

class CreateProjectParams extends Equatable {
  final ProjectModel project;
  final File? image;

  CreateProjectParams({required this.project, this.image});

  @override
  List<Object?> get props => [project];
}