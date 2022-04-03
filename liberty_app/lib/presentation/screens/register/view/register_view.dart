import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/screens/register/cubit/sign_up_cubit.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

import 'register_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const RegisterScreen());
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(backIcon: AssetsSvg.backArrowIos(), bodyWidgets: [
      const _PageTitle(),
      const SizedBox(height: 16),
      const _PageSubtitle(),
      const SizedBox(height: 50),
      BlocProvider<SignUpCubit>(
        create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
        child: const RegisterForm(),
      ),
      const _PrivacyPolicyButton(),
    ]);
  }
}

class _PrivacyPolicyButton extends StatelessWidget {
  const _PrivacyPolicyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Privacy policy',
          style: Theme.of(context).textTheme.caption?.copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }
}

class _PageSubtitle extends StatelessWidget {
  const _PageSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        text: 'Please fill the details below to \ncreate a ',
        style: Theme.of(context).textTheme.subtitle2,
        children: [
          TextSpan(
            text: 'DO-IT ',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: AppColors.primary),
          ),
          const TextSpan(text: 'account')
        ]));
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create \nAccount',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
