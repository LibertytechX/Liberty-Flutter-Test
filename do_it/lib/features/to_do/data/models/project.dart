import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    required String id,
    required String creator,
    required String name, 
    required String created, 
    required String end, 
    required List<UserProfileModel> staffs, 
    required List<String> tags, 
    required String description,
    String? image
  }) : super(
    creator: creator,
    id: id, 
    name: name, 
    created: created, 
    end: end, 
    staffs: staffs, 
    tags: tags, 
    description: description,
    image: image
  );

  factory ProjectModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return ProjectModel(
      creator: snapshot['creator'],
      id: snapshot['id'],
      name: snapshot['name'], 
      created: snapshot['created'], 
      end: snapshot['end'], 
      staffs: List<Map<String, dynamic>>.from(snapshot['staffs']).map(
        (i) => UserProfileModel.fromSnapshot(i)
      ).toList(), 
      tags: List<String>.from(snapshot['tags']), 
      description: snapshot['description'],
      image: snapshot['image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creator': creator,
      'id': id,
      'name': name,
      'created': created,
      'end': end,
      'staffs': staffs.map((e) => e.toMap()).toList(),
      'tags': tags,
      'description': description,
      'image': image
    };
  }
}