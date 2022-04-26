import 'package:do_it/core/error/failures.dart';
import 'package:do_it/core/util/custom_change_notifier.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/to_do/data/models/task.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/usecases/create_task.dart';
import 'package:flutter/cupertino.dart';

class CreateTaskPageProvider with ChangeNotifier {
  final CreateTask createTask;
  final formKey = GlobalKey<FormState>();
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  List<String> tags = [];
  DateTime createdDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 1));
  List<UserProfileModel>? selectedUsers;
  bool loading = false;

  CreateTaskPageProvider({required this.createTask}) {
    createdDateController.text = '${createdDate.day}-${createdDate.month}-${createdDate.year}';
    endDateController.text = '${endDate.day}-${endDate.month}-${endDate.year}';
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

  void initCreateTask(BuildContext context, String projectId) async {
    if (loading) return;
    
    loading = true;
    notifyListeners();

    final params = CreateTaskParams(
      task: TaskModel(
        creator: '',
        id: '',
        created: createdDate.toIso8601String(),
        end: endDate.toIso8601String(),
        description: commentController.value.text,
        name: nameController.value.text,
        staffs: selectedUsers != null 
          ? selectedUsers!.map((user) => user.id).toList()
          : [],
        tags: tags,
        projectId: projectId
      )
    );
    final result = await createTask(params);
    result.fold(
      (l) {
        showToast((l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      }, 
      (r) {
        showToast('Task created successfully');
        loading = false;
        notifyListeners();
        Navigator.of(context).pop();
      }
    );
  }
}