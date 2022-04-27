import 'dart:io';
import 'package:do_it/features/profile/data/models/user_profile.dart';

abstract class ProfileRemoteDataSource {
  /// Throws a [RemoteException] for all errors
  Future<UserProfileModel> getUserProfile();

  /// Throws a [RemoteException] for all errors
  Future<List<UserProfileModel>> getAllUsers();

  /// Throws a [RemoteException] for all errors
  Future<void> updateUserProfile(String? name, File? image, UserProfileModel oldProfile);

  /// Throws a [RemoteException] for all errors
  Future<void> logout();
}