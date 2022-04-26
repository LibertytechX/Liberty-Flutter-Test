import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';
import 'package:do_it/features/profile/data/repository/profile_repository_impl.dart';

class GetUserProfile extends UseCase<UserProfileModel, NoParams> {
  final ProfileRepositoryImpl repository;

  GetUserProfile({required this.repository});
  
  @override
  Future<Either<Failure, UserProfileModel>> call(NoParams params) async {
    return repository.getUserProfile();
  }
}