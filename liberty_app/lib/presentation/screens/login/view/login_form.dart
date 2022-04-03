import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

import 'package:liberty_app/presentation/screens/login/login.dart';

import '../../../../app/routes.dart';
import '../../register/view/register_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signUpHandler() {
      Navigator.of(context).push(RegisterScreen.route());
    }

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _EmailField(),
            const SizedBox(height: 30),
            const _PasswordField(),
            const _ForgotPasswordButton(),
            const SizedBox(height: 38),
            Row(children: const [
              Expanded(flex: 12, child: _SignInButton()),
              Expanded(flex: 1, child: SizedBox(height: 1)),
              _FingerPrintButton()
            ]),
            _NoAccountButton(signUpHandler: signUpHandler),
          ],
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<LoginCubit>().passwordChanged(password),
            errorText: state.password.invalid ? 'invalid password' : null,
          );
        });
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            key: const Key('loginForm_emailInput_textField'),
            onChanged: (email) =>
                context.read<LoginCubit>().emailChanged(email),
            decoration: InputDecoration(
              label: const Text('Email'),
              errorText: state.email.invalid ? 'invalid email' : null,
            ),
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    signInHandler(LoginState state) {
      // if (state.status.isValidated) {
      context.read<LoginCubit>().logInWithCredentials();
      // }
    }

    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const Center(child: CircularProgressIndicator())
              : ActionButton(
                  text: 'Sign in',
                  onPressed: () => signInHandler(state),
                );
        });
  }
}

class _FingerPrintButton extends StatelessWidget {
  const _FingerPrintButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 56,
      child: Material(
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.9, color: AppColors.primary),
            borderRadius: BorderRadius.circular(6)),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AssetsSvg.fingerPrintIcon(),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}

class _NoAccountButton extends StatelessWidget {
  const _NoAccountButton({Key? key, required this.signUpHandler})
      : super(key: key);
  final Function() signUpHandler;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don’t have an account?',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: signUpHandler,
            child: Text('Create Account',
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
