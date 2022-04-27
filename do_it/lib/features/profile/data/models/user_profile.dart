import 'package:do_it/features/to_do/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required String id,
    required String name, 
    required String email, 
    required String phoneNumber, 
    required String? avatar
  }) : super(
    id: id,
    name: name, 
    email: email, 
    phoneNumber: phoneNumber, 
    avatar: avatar
  );

  factory UserProfileModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return UserProfileModel(
      id: snapshot['id'],
      name: snapshot['name'], 
      email: snapshot['email'], 
      phoneNumber: snapshot['phoneNumber'], 
      avatar: snapshot['avatar']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatar': avatar
    };
  }
}