import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String projectId,
    required String id,
    required String creator,
    required String name, 
    required String created, 
    required String end, 
    required List<UserProfileModel> staffs, 
    required List<String> tags, 
    required String description
  }) : super(
    projectId: projectId,
    creator: creator,
    id: id, 
    name: name, 
    created: created, 
    end: end, 
    staffs: staffs, 
    tags: tags, 
    description: description,
  );

  factory TaskModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return TaskModel(
      projectId: snapshot['projectId'],
      creator: snapshot['creator'],
      id: snapshot['id'],
      name: snapshot['name'], 
      created: snapshot['created'], 
      end: snapshot['end'], 
      staffs: List<Map<String, dynamic>>.from(snapshot['staffs']).map(
        (i) => UserProfileModel.fromSnapshot(i)
      ).toList(),
      tags: List<String>.from(snapshot['tags']), 
      description: snapshot['description']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'projectId': projectId,
      'creator': creator,
      'id': id,
      'name': name,
      'created': created,
      'end': end,
      'staffs': staffs.map((e) => e.toMap()).toList(),
      'tags': tags,
      'description': description
    };
  }
}