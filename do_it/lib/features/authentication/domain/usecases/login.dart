import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:equatable/equatable.dart';

class Login extends UseCase<void, LoginParams> {
  final AuthRepositoryImpl repository;

  Login({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(LoginParams params) async{
    return await repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({
    required this.email, 
    required this.password
  });

  @override
  List<Object?> get props => [email];
}