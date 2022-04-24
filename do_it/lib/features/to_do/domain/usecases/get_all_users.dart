import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';

class GetAllUsers extends UseCase<List<UserProfileModel>, NoParams> {
  final ToDoRepositoryImpl repository;

  GetAllUsers({required this.repository});
  
  @override
  Future<Either<Failure, List<UserProfileModel>>> call(NoParams params) async {
    return repository.getAllUsers();
  }
}