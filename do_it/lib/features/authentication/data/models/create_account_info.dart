import 'package:do_it/features/authentication/domain/entities/create_account_info.dart';

class CreateAccountInfoModel extends CreateAccountInfo {
  CreateAccountInfoModel({
    required String name, 
    required String email, 
    required String phoneNumber, 
    required String password
  }) : super(
    name: name, 
    email: email, 
    phoneNumber: phoneNumber, 
    password: password
  );

  factory CreateAccountInfoModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return CreateAccountInfoModel(
      name: snapshot['name'], 
      email: snapshot['email'], 
      phoneNumber: snapshot['phoneNumber'], 
      password: snapshot['password']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password
    };
  }
}