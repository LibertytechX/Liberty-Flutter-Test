import 'dart:io';
import 'package:dio/dio.dart';
import 'package:do_it/core/constants/api.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_it/core/constants/firebase_constants.dart';
import 'package:do_it/core/error/exceptions.dart';
import 'package:do_it/features/to_do/data/datasources/remote_data_source.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ToDoRemoteDataSourceImpl extends ToDoRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final Dio httpClient;

  ToDoRemoteDataSourceImpl({
    required this.firebaseAuth, 
    required this.firestore,
    required this.storage,
    required this.httpClient
  });
  
  @override
  Future<UserProfileModel> getUserProfile() async {
    if (firebaseAuth.currentUser == null) {
      throw Exception('Unauthorized');
    }

    final user = firebaseAuth.currentUser!;
    final userCollection = firestore.collection(FirestoreCollections.user);
    // final userDoc = await userCollection.where('email', isEqualTo: user.email!).get();
    final userDoc = await userCollection.doc(user.uid).get();
    if (userDoc.exists) {
      return UserProfileModel.fromSnapshot({
        'id': user.uid,
        ...userDoc.data()!
      });
    }

    if (firebaseAuth.currentUser != null) {
      firebaseAuth.signOut();
    }
    
    throw Exception('User not found');
  }

  @override
  Future<List<UserProfileModel>> getAllUsers() async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('Unauthorized');

    final userCollection = firestore.collection(FirestoreCollections.user);
    final users = await userCollection.where('__name__', isNotEqualTo: user.uid).get();
    return users.docs.map((user) => UserProfileModel.fromSnapshot({
      'id': user.id,
      ...user.data()
    })).toList();
  }

  @override
  Future<void> createProject(ProjectModel project, File? image) async {
    final user = firebaseAuth.currentUser;
    final projectCollection = firestore.collection(FirestoreCollections.project);
    final snapshot = await projectCollection.where('name', isEqualTo: project.name).get();
    if (snapshot.docs.isNotEmpty) {
      throw RemoteException(
        message: 'Project already exists. Please chose another project name'
      );
    }
    
    final ref = projectCollection.doc();
    if (image != null) {
      final uploadTask = storage.ref('projects/${ref.id}/').putFile(changeFilename(image, 'image'));
      uploadTask.catchError((error) {
        throw RemoteException(
          message: 'An error occurred while uploading image. Please try again'
        );
      });
      final taskSnapshot = await uploadTask.whenComplete(() => null);
      final downloadUrl = await taskSnapshot.ref.getDownloadURL();
      await ref.set({
        ...project.toMap()..removeWhere((key, value) => key == 'id' || key == 'image'),
        'image': downloadUrl,
        'creator': user!.uid
      });
      
      return;
    }

    await ref.set({
      ...project.toMap()..removeWhere((key, value) => key == 'id'),
      'creator': user!.uid
    });
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('Unauthorized');

    final projectCollection = firestore.collection(FirestoreCollections.project);
    final projectsSnapshot = await projectCollection
      .get();
    final projects = projectsSnapshot.docs.map((project) => ProjectModel.fromSnapshot({
      'id': project.id,
      ...project.data()
    })).toList();
    
    return projects;
    // return projects.where((project) {
    //   return project.creator == user.uid
    //     || project.staffs.where((staff) => staff.id == user.uid).isNotEmpty;
    // }).toList();
  }

  @override
  Future<void> createTask(TaskModel task) async {
    final user = firebaseAuth.currentUser;
    final taskCollection = firestore.collection(FirestoreCollections.task);
    final ref = taskCollection.doc();
    final userCollection = firestore.collection(FirestoreCollections.user);
    final userProfileRef = await userCollection.doc(user!.uid).get();
    final userProfile = UserProfileModel.fromSnapshot({
      ...userProfileRef.data()!,
      'id': user.uid
    });
    final endDate = DateTime.parse(task.end);
    
    await ref.set({
      ...task.toMap()..removeWhere((key, value) => key == 'id'),
      'creator': user.uid
    });

    final result = await httpClient.post(
      APIEndpoints.scheduleMessage,
      data: {
        'contacts': [userProfile.phoneNumber],
        'message': 'Hello ${userProfile.name}. You have not completed a task titled "${task.name}", set to expire today.',
        'priority_route': false,
        'campaign_name': 'DO IT',
        'sender_id': 'Liberty',
        'send_date':'${endDate.day}-${endDate.month}-${endDate.year} 08:00' // sends a message at 8am of the end date
      }
    );

    if (result.statusCode != 200 && result.statusCode != 201) {
      await ref.delete();
      throw Exception('An error occurred. Please try again');
    }
  }

  @override
  Future<List<TaskModel>> getTasks(String? projectId) async {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('Unauthorized');

    final taskCollection = firestore.collection(FirestoreCollections.task);
    QuerySnapshot<Map<String, dynamic>> tasks;
    if (projectId != null) {
      tasks = await taskCollection
        .where('projectId', isEqualTo: projectId)
        .get();
    } else {
      tasks = await taskCollection.get();
    }

    return tasks.docs.map((task) => TaskModel.fromSnapshot({
      'id': task.id,
      ...task.data()
    })).toList();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getTasksStream(String? projectId) {
    final user = firebaseAuth.currentUser;
    if (user == null) throw Exception('Unauthorized');

    final taskCollection = firestore.collection(FirestoreCollections.task);
    QuerySnapshot<Map<String, dynamic>> tasks;
    if (projectId != null) {
      return taskCollection
        .where('projectId', isEqualTo: projectId)
        .snapshots();
    } else {
      return taskCollection.snapshots();
    }
  }
}

File changeFilename(File file, String newFileName) {
  final path = file.path;
  final extension = p.extension(path);
  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var newPath = path.substring(0, lastSeparator + 1) + newFileName + extension;
  return file.renameSync(newPath);
}