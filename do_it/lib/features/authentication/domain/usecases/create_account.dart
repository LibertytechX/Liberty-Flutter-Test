import 'package:do_it/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/features/authentication/data/models/create_account_info.dart';
import 'package:do_it/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:equatable/equatable.dart';

class CreateAccount extends UseCase<void, CreateAccountParams> {
  final AuthRepositoryImpl repository;

  CreateAccount({required this.repository});
  
  @override
  Future<Either<Failure, void>> call(CreateAccountParams params) async{
    return await repository.createAccount(CreateAccountInfoModel(
      name: params.name, 
      email: params.email, 
      phoneNumber: params.phoneNumber, 
      password: params.password
    ));
  }
}

class CreateAccountParams extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  CreateAccountParams({
    required this.name, 
    required this.email, 
    required this.phoneNumber, 
    required this.password
  });

  @override
  List<Object?> get props => [email];
}