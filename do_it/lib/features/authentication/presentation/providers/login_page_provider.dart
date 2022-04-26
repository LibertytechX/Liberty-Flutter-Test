import 'package:do_it/core/error/failures.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/util/custom_change_notifier.dart';
import 'package:do_it/core/util/visual_alerts.dart';
import 'package:do_it/features/authentication/domain/usecases/login.dart';
import 'package:flutter/cupertino.dart';

class LoginPageProvider with ChangeNotifier {
  final Login login;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool loading = false;

  LoginPageProvider({required this.login});

  void toggleHidePassword() {
    hidePassword = !hidePassword;
    notifyListeners();
  }

  void initLogin(BuildContext context) async {
    if (loading) return;

    loading = true;
    notifyListeners();

    final params = LoginParams(
      email: emailController.value.text,
      password: passwordController.value.text
    );
    final result = await login(params);
    result.fold(
      (l) {
        showToast((l as RemoteFailure).message);
        loading = false;
        notifyListeners();
      },
      (r) {
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