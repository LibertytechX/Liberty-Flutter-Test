// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String?,
      name: json['title'] as String,
      description: json['description'] as String? ?? '',
      isCompleted: json['owner'] as bool? ?? false,
      tags: json['tags'] as List<String>,
      staffs: json['staffs'] as List<String> ?? [],
      createdFrom: json['createdFrom'] as DateTime,
      endOn: json['endOn'] as DateTime?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'tags': instance.tags,
      'staffs': instance.staffs,
      'createdFrom': instance.createdFrom,
      'endOn': instance.endOn,
    };
