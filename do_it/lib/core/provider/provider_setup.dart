import 'package:do_it/features/authentication/data/datasources/remote_data_source_impl.dart';
import 'package:do_it/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:do_it/features/authentication/domain/usecases/create_account.dart';
import 'package:do_it/features/authentication/domain/usecases/login.dart';
import 'package:do_it/features/to_do/data/datasources/remote_data_source_impl.dart';
import 'package:do_it/features/to_do/data/repository/to_do_repository_impl.dart';
import 'package:do_it/features/to_do/domain/usecases/create_project.dart';
import 'package:do_it/features/to_do/domain/usecases/create_task.dart';
import 'package:do_it/features/to_do/domain/usecases/get_all_users.dart';
import 'package:do_it/features/to_do/domain/usecases/get_projects.dart';
import 'package:do_it/features/to_do/domain/usecases/get_tasks.dart';
import 'package:do_it/features/to_do/domain/usecases/get_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: FirebaseFirestore.instance),
  Provider.value(value: FirebaseStorage.instance),
  Provider.value(value: FirebaseAuth.instance),
  Provider.value(value: FirebaseMessaging.instance)
];

List<SingleChildWidget> dependentServices = [
  // AUTHENTICATION FEATURE DEPENDENCIES
  ProxyProvider2<FirebaseAuth, FirebaseFirestore, AuthRemoteDataSourceImpl>(
    update: (context, firebaseAuth, firestore, authRemoteDataSource)
      => AuthRemoteDataSourceImpl(firebaseAuth: firebaseAuth, firestore: firestore)
  ),
  ProxyProvider<AuthRemoteDataSourceImpl, AuthRepositoryImpl>(
    update: (context, dataSource, repository)
      => AuthRepositoryImpl(dataSource: dataSource)
  ),
  ProxyProvider<AuthRepositoryImpl, CreateAccount>(
    update: (context, repository, getAppUserState)
      => CreateAccount(repository: repository)
  ),
  ProxyProvider<AuthRepositoryImpl, Login>(
    update: (context, repository, getAppUserState)
      => Login(repository: repository)
  ),

  // DASHBOARD FEATURE DEPENDENCIES
  ProxyProvider3<FirebaseAuth, FirebaseFirestore, FirebaseStorage, ToDoRemoteDataSourceImpl>(
    update: (context, firebaseAuth, firestore, storage, authRemoteDataSource)
      => ToDoRemoteDataSourceImpl(
        firebaseAuth: firebaseAuth, 
        firestore: firestore,
        storage: storage
      )
  ),
  ProxyProvider<ToDoRemoteDataSourceImpl, ToDoRepositoryImpl>(
    update: (context, dataSource, repository)
      => ToDoRepositoryImpl(dataSource: dataSource)
  ),
  ProxyProvider<ToDoRepositoryImpl, GetUserProfile>(
    update: (context, repository, getAppUserState)
      => GetUserProfile(repository: repository)
  ),
  ProxyProvider<ToDoRepositoryImpl, GetAllUsers>(
    update: (context, repository, getAppUserState)
      => GetAllUsers(repository: repository)
  ),
  ProxyProvider<ToDoRepositoryImpl, CreateProject>(
    update: (context, repository, getAppUserState)
      => CreateProject(repository: repository)
  ),
  ProxyProvider<ToDoRepositoryImpl, GetProjects>(
    update: (context, repository, getAppUserState)
      => GetProjects(repository: repository)
  ),
  ProxyProvider<ToDoRepositoryImpl, CreateTask>(
    update: (context, repository, getAppUserState)
      => CreateTask(repository: repository)
  ),
  ProxyProvider<ToDoRepositoryImpl, GetTasks>(
    update: (context, repository, getAppUserState)
      => GetTasks(repository: repository)
  ),
];