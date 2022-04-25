import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_it/core/constants/firebase_constants.dart';
import 'package:do_it/features/profile/data/datasources/remote_data_source.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ProfileRemoteDataSourceImpl({
    required this.firebaseAuth, 
    required this.firestore,
    required this.storage
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
}

File changeFilename(File file, String newFileName) {
  final path = file.path;
  final extension = p.extension(path);
  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var newPath = path.substring(0, lastSeparator + 1) + newFileName + extension;
  return file.renameSync(newPath);
}