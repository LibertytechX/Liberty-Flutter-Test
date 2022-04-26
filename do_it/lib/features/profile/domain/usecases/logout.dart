import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/profile/data/repository/profile_repository_impl.dart';

class Logout extends UseCase<void, NoParams> {
  final ProfileRepositoryImpl repository;

  Logout({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.logout();
  }
}