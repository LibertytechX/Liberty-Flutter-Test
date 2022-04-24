import 'package:equatable/equatable.dart';

class CreateAccountInfo extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;

  CreateAccountInfo({
    required this.name, 
    required this.email, 
    required this.phoneNumber, 
    required this.password
  });

  @override
  List<Object?> get props => [email];
}