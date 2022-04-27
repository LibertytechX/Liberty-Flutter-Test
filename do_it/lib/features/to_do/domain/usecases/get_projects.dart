import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';

class GetProjects extends UseCase<List<ProjectModel>, NoParams> {
  final ToDoRepositoryImpl repository;

  GetProjects({required this.repository});
  
  @override
  Future<Either<Failure, List<ProjectModel>>> call(NoParams params) async {
    return repository.getProjects();
  }
}