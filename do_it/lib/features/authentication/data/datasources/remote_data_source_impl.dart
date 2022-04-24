import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_it/core/constants/firebase_constants.dart';
import 'package:do_it/features/authentication/data/datasources/remote_data_source.dart';
import 'package:do_it/features/authentication/data/models/create_account_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firestore, required this.firebaseAuth});
  
  @override
  Future<void> createAccount(CreateAccountInfoModel userInfo) async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userInfo.email, 
        password: userInfo.password
      );

      final userCollection = firestore.collection(FirestoreCollections.user);
      await userCollection.doc(credential.user!.uid).set(
        userInfo.toMap()..removeWhere((key, value) => key == 'password')
      );
    }
  }

  @override
  Future<void> login(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}