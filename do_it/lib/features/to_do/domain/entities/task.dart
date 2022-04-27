import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String projectId;
  final String creator;
  final String id;
  final String name;
  final String created;
  final String end;
  final List<UserProfileModel> staffs;
  final List<String> tags;
  final String description;

  Task({
    required this.projectId,
    required this.creator,
    required this.id,
    required this.name, 
    required this.created, 
    required this.end, 
    required this.staffs, 
    required this.tags, 
    required this.description
  });

  @override
  List<Object?> get props => [id];
}