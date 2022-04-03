import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:project_api/src/models/models.dart';
import 'package:uuid/uuid.dart';

part 'project.g.dart';

/// {@template project}
/// A single project item.
///
/// Contains a [name], [description] and [id], in addition to a [isCompleted]
/// flag.
///
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
///
/// [Project]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
@immutable
@JsonSerializable()
class Project extends Equatable {
  /// {@macro project}
  Project({
    String? id,
    required this.name,
    this.description = '',
    this.isCompleted = false,
    this.tags,
    this.staffs,
    this.owner,
    this.createdFrom,
    this.endOn,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  /// The unique identifier of the project.
  ///
  /// Cannot be empty.
  final String id;

  /// The title of the project.
  ///
  /// Note that the title may be empty.
  final String name;

  /// The description of the project.
  ///
  /// Defaults to an empty string.
  final String description;

  /// Owner Email
  final String? owner;

  /// Whether the project is completed.
  ///
  /// Defaults to `false`.
  final bool isCompleted;

  /// the created date of Project
  final DateTime? createdFrom;

  /// the end date of Project
  final DateTime? endOn;

  /// tags
  final List<String>? tags;

  /// staffs
  final List<String>? staffs;

  /// Returns a copy of this project with the given values updated.
  ///
  /// {@macro project}
  Project copyWith({
    String? id,
    String? name,
    String? description,
    String? owner,
    bool? isCompleted,
    List<String>? tags,
    List<String>? staffs,
    DateTime? createdFrom,
    DateTime? endOn,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      tags: tags ?? this.tags,
      staffs: staffs ?? this.staffs,
      createdFrom: createdFrom ?? this.createdFrom,
      endOn: endOn ?? this.endOn,
      owner: owner ?? this.owner,
    );
  }

  /// Deserializes the given [JsonMap] into a [Project].
  static Project fromJson(JsonMap json) => _$ProjectFromJson(json);

  /// Converts this [Project] into a [JsonMap].
  JsonMap toJson() => _$ProjectToJson(this);

  @override
  List<Object> get props => [id, name, description, isCompleted,owner!];
}
