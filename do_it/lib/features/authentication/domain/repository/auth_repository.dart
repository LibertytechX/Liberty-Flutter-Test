import 'package:dartz/dartz.dart';
import 'package:do_it/core/error/failures.dart';
import 'package:do_it/features/authentication/data/models/create_account_info.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> createAccount(CreateAccountInfoModel userInfo);
  Future<Either<Failure, void>> login(String email, String password);
}