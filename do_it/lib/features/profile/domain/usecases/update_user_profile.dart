import 'dart:io';

import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/profile/data/repository/profile_repository_impl.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';
import 'package:equatable/equatable.dart';

class UpdateUserProfile extends UseCase<void, UpdateUserProfileParams> {
  final ProfileRepositoryImpl repository;

  UpdateUserProfile({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(UpdateUserProfileParams params) async {
    return repository.updateUserProfile(params.name, params.image, params.oldProfile);
  }
}

class UpdateUserProfileParams extends Equatable {
  final String? name;
  final File? image;
  final UserProfileModel oldProfile;

  UpdateUserProfileParams({this.name, this.image, required this.oldProfile});
  
  @override
  List<Object?> get props => [image, name];
}