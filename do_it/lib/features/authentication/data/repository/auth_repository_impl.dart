import 'package:do_it/core/util/error_to_message_mapper.dart';
import 'package:do_it/features/authentication/data/datasources/remote_data_source_impl.dart';
import 'package:do_it/features/authentication/data/models/create_account_info.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/features/authentication/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl dataSource;

  AuthRepositoryImpl({required this.dataSource});
  
  @override
  Future<Either<Failure, void>> createAccount(CreateAccountInfoModel userInfo) async {
    try {
      await dataSource.createAccount(userInfo);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }

  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      await dataSource.login(email, password);
      return Right(null);
    } on FirebaseAuthException catch(e) {
      return Left(RemoteFailure(message: getFirebaseErrorMessageFromCode(e.code)));
    } on Exception {
      return Left(RemoteFailure(message: 'An error occurred. Please try again'));
    }
  }
}