import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? avatar;

  UserProfile({
    required this.id,
    required this.name, 
    required this.email, 
    required this.phoneNumber, 
    required this.avatar
  });

  @override
  List<Object?> get props => [id];
}