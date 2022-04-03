import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:project_api/project_api.dart';

/// {@template projects_api}
/// A Flutter implementation of the [ProjectsApi] that uses local storage.
/// {@endtemplate}
class FirebaseProjectApi extends ProjectsApi {
  /// {@macro projects_api}
  FirebaseProjectApi();

  /// Firestore collection
  final projectCollection = FirebaseFirestore.instance.collection('projects');

  /// The key used for storing the projects locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kProjectsCollectionKey = '__projects_collection_key__';


  @override
  Future<void> saveProject(Project project) async {
    await projectCollection.add(project.toJson());
  }

  @override
  Stream<List<Project>> getProjects() {
    return projectCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Project.fromJson(doc.data())).toList();
    });
  }
}
