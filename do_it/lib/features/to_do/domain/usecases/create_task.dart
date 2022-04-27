import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';
import 'package:equatable/equatable.dart';

class CreateTask extends UseCase<void, CreateTaskParams> {
  final ToDoRepositoryImpl repository;

  CreateTask({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(CreateTaskParams params) async {
    return repository.createTask(params.task);
  }
}

class CreateTaskParams extends Equatable {
  final TaskModel task;

  CreateTaskParams({required this.task});

  @override
  List<Object?> get props => [task];
}