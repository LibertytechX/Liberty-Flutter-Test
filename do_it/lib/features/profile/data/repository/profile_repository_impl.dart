import 'dart:io';

import 'package:do_it/core/error/exceptions.dart';
import 'package:do_it/core/util/error_to_message_mapper.dart';
import 'package:do_it/features/profile/data/datasources/remote_data_source_impl.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/features/profile/domain/repository/profile_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSourceImpl dataSource;

  ProfileRepositoryImpl({required this.dataSource});
  
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
  Future<Either<Failure, void>> updateUserProfile(
    String? name, 
    File? image,
    UserProfileModel oldProfile
  ) async {
    try {
      await dataSource.updateUserProfile(name, image, oldProfile);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception{
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await dataSource.logout();
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on RemoteException catch(e) {
      return Left(RemoteFailure(message: e.message));
    } on Exception{
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }
}