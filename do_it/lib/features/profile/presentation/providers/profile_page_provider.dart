import 'dart:io';

import 'package:do_it/core/error/failures.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/profile/data/models/user_profile.dart';
import 'package:do_it/features/profile/domain/usecases/get_user_profile.dart';
import 'package:do_it/features/profile/domain/usecases/logout.dart';
import 'package:do_it/features/profile/domain/usecases/update_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageProvider with ChangeNotifier {
  final UpdateUserProfile updateUserProfile;
  final GetUserProfile getUserProfile;
  final Logout logout;
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile? pickedImage;

  UserProfileModel? userProfile;
  bool loading = false;

  ProfilePageProvider({
    required this.updateUserProfile, 
    required this.getUserProfile,
    required this.logout
  });

  void pickImage(ImageSource source) async {
    pickedImage = await imagePicker.pickImage(
      source: source
    );

    notifyListeners();
  }

  void clearImage() {
    pickedImage = null;
    notifyListeners();
  }

  void initGetUserProfile() async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final result = await getUserProfile(NoParams());
    result.fold(
      (l) {
        loading = false;
        showToast((l as RemoteFailure).message);
        notifyListeners();
      }, 
      (r) {
        loading = false;
        userProfile = r;
        nameController.text = r.name;
        notifyListeners();
      }
    );
  }

  void initUpdateUserProfile(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = UpdateUserProfileParams(
      image: pickedImage != null ? File(pickedImage!.path) : null,
      name: nameController.value.text != userProfile!.name 
        ? nameController.value.text : null
    );
    final result = await updateUserProfile(params);
    result.fold(
      (l) {
        loading = false;
        showToast((l as RemoteFailure).message);
        notifyListeners();
      }, 
      (r) {
        loading = false;
        showToast('Profile updated successfully');
        notifyListeners();
        Navigator.of(context).pushReplacementNamed(
          RoutePaths.homePage
        );
      }
    );
  }

  void initLogout(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    
    final result = await logout(NoParams());
    result.fold(
      (l) {
        loading = false;
        showToast((l as RemoteFailure).message);
        notifyListeners();
      }, 
      (r) {
        loading = false;
        notifyListeners();
        // Navigator.of(context).pushReplacementNamed(
        //   RoutePaths.homePage
        // );
      }
    );
  }

  void refresh() {
    notifyListeners();
  }
}