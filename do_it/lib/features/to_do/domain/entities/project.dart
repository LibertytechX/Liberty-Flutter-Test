import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String creator;
  final String id;
  final String name;
  final String created;
  final String end;
  final List<String> staffs;
  final List<String> tags;
  final String description;
  final String? image;

  Project({
    required this.creator,
    required this.id,
    required this.name, 
    required this.created, 
    required this.end, 
    required this.staffs, 
    required this.tags, 
    required this.description,
    this.image
  });

  @override
  List<Object?> get props => [id];
}