import 'dart:io';

import 'package:do_it/core/error/failures.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/util/custom_change_notifier.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/to_do/data/models/project.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/usecases/create_project.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class CreateProjectPageProvider with ChangeNotifier {
  final CreateProject createProject;
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> tags = [];
  DateTime createdDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));
  final formKey = GlobalKey<FormState>();
  List<UserProfileModel>? selectedUsers;
  XFile? pickedImage;
  bool loading = false;

  CreateProjectPageProvider({
    required this.createProject
  }) {
    createdDateController.text = '${createdDate.day}-${createdDate.month}-${createdDate.year}';
    endDateController.text = '${endDate.day}-${endDate.month}-${endDate.year}';
    notifyListeners();
  }

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

  void setSelectedUsers(List<UserProfileModel> users) {
    selectedUsers = users;
    notifyListeners();
  }

  void setCreatedDate(DateTime date) {
    createdDate = date;
    createdDateController.text = '${date.day}-${date.month}-${date.year}';
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    endDate = date;
    endDateController.text = '${date.day}-${date.month}-${date.year}';
    notifyListeners();
  }

  void initCreateProject(BuildContext context) async {
    if (loading) return;
    
    loading = true;
    notifyListeners();

    final params = CreateProjectParams(
      project: ProjectModel(
        id: 'id',
        creator: '',
        name: nameController.value.text,
        created: createdDate.toIso8601String(),
        end: endDate.toIso8601String(), 
        // staffs: selectedUsers != null 
        //   ? selectedUsers!.map((user) => user.id).toList()
        //   : [],
        staffs: selectedUsers!,
        tags: tags,
        description: descriptionController.value.text
      ),
      image: pickedImage != null ? File(pickedImage!.path) : null
    );

    final result = await createProject(params);
    result.fold(
      (l) {
        showToast((l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      }, 
      (r) {
        showToast('Project created successfully');
        loading = false;
        notifyListeners();
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.homePage,
          (_) => false
        );
      }
    );
  }
}