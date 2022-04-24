import 'package:do_it/core/error/failures.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/authentication/domain/usecases/create_account.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountPageProvider with ChangeNotifier {
  final CreateAccount createAccount;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  bool hidePassword = true;
  bool loading = false;

  CreateAccountPageProvider({required this.createAccount});

  void toggleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  initCreateAccount(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = CreateAccountParams(
      name: nameController.value.text, 
      email: emailController.value.text, 
      phoneNumber: phoneController.value.text, 
      password: passwordController.value.text
    );
    final response = await createAccount(params);
    response.fold(
      (l) {
        showToast((l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      },
      (r) {
        showToast('Account created successfully');
        loading = false;
        notifyListeners();
        Navigator.of(context).pushNamedAndRemoveUntil(
          RoutePaths.homePage,
          (route) => false
        );
      }, 
    );
  }
}