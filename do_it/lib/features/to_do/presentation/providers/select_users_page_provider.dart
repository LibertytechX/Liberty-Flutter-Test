import 'package:do_it/core/usecases/usecase.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/domain/usecases/get_all_users.dart';
import 'package:flutter/cupertino.dart';

class SelectUsersPageProvider with ChangeNotifier {
  final GetAllUsers getAllUsers;
  final List<UserProfileModel>? initSelection;
  List<UserProfileModel>? allUsers;
  List<UserProfileModel> selectedUsers = [];
  bool loading = false;

  SelectUsersPageProvider({required this.getAllUsers, this.initSelection}) {
    if (initSelection != null) {
      selectedUsers = initSelection!;
      notifyListeners();
    }
  }

  void initGetAllUsers() async {
    if (loading) return;
    
    loading = true;
    notifyListeners();
    
    final result = await getAllUsers(NoParams());
    result.fold(
      (l) {
        showToast('Failed to get users. Please try again');
        loading = false;
        notifyListeners();
      }, 
      (r) {
        allUsers = r;
        loading = false;
        notifyListeners();
      }
    );
  }

  void toggleUserSelection(UserProfileModel user) {
    if (selectedUsers.contains(user)) {
      selectedUsers.remove(user);
    } else {
      selectedUsers.add(user);
    }

    notifyListeners();
  }
}