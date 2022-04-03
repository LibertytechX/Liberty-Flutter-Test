import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberty_app/presentation/screens/login/login.dart';
import 'package:liberty_app/presentation/screens/login/view/login_form.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';
import 'package:liberty_app/app/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  static route() =>
      MaterialPageRoute<void>(builder: (_) => const LoginScreen());

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(backIcon: AssetsSvg.backArrowIos(), bodyWidgets: [
      const SizedBox(height: 59),
      const AppLogo(),
      const SizedBox(height: 20),
      const _PageTitle(),
      const SizedBox(height: 50),
      BlocProvider(
        create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
        child: const LoginForm(),
      ),
    ]);
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome Back !',
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(color: AppColors.black),
      ),
    );
  }
}
