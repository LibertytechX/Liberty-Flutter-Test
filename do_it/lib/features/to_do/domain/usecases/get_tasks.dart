import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';
import 'package:equatable/equatable.dart';

class GetTasks extends UseCase<List<TaskModel>, GetTasksParams> {
  final ToDoRepositoryImpl repository;

  GetTasks({required this.repository});
  
  @override
  Future<Either<Failure, List<TaskModel>>> call(GetTasksParams params) async {
    return repository.getTasks(params.projectId);
  }
}

class GetTasksParams extends Equatable {
  final String? projectId;

  GetTasksParams({this.projectId});

  @override
  List<Object?> get props => [projectId];
}