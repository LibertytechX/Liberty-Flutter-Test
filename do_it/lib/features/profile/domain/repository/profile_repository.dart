import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileModel>> getUserProfile();
  Future<Either<Failure, List<UserProfileModel>>> getAllUsers();
  Future<Either<Failure, void>> updateUserProfile(
    String? name, 
    File? image, 
    UserProfileModel oldProfile
  );
  Future<Either<Failure, void>> logout();
}