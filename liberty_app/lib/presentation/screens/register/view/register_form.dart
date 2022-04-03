import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:liberty_app/presentation/screens/register/cubit/sign_up_cubit.dart';

import '../../../widget/widgets.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
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
            const _NameField(),
            const SizedBox(height: 30),
            const _EmailField(),
            const SizedBox(height: 30),
            const _PhoneField(),
            const SizedBox(height: 30),
            const _PasswordField(),
            const SizedBox(height: 10),
            Text(
              'Password must be at least 8 characters',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 38),
            const _SingUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return TextFormField(
            key: const Key('signUpForm_emailInput_textField'),
            onChanged: (email) =>
                context.read<SignUpCubit>().emailChanged(email),
            decoration: InputDecoration(
              label: const Text('Email'),
              errorText: state.email.invalid ? 'invalid email' : null,
            ),
            keyboardType: TextInputType.emailAddress,
          );
        });
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordField(
            onChanged: (password) =>
                context.read<SignUpCubit>().passwordChanged(password),
            errorText: state.password.invalid ? 'invalid password' : null,
          );
        });
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 56,
    //   child: TextFormField(
    //     decoration: InputDecoration(
    //       label: const Text('Mobile Number'),
    //       suffix: CountryCodePicker(
    //         padding: const EdgeInsets.only(top: 20),
    //         flagWidth: 30,
    //         flagDecoration:
    //         BoxDecoration(borderRadius: BorderRadius.circular(4)),
    //         onChanged: print,
    //         initialSelection: 'ng',
    //         favorite: const ['NG'],
    //         showCountryOnly: false,
    //         showOnlyCountryWhenClosed: false,
    //         alignLeft: false,
    //         hideMainText: true,
    //       ),
    //     ),
    //     keyboardType: TextInputType.phone,
    //   ),
    // );
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return SizedBox(
            height: 56,
            child: TextFormField(
              key: const Key('signUpForm_phoneInput_textField'),
              onChanged: (phone) {
                print(phone);
                context.read<SignUpCubit>().phoneChanged(phone);
              },
              decoration: InputDecoration(
                label: const Text('Mobile Number'),
                errorText: state.phone.invalid ? 'invalid phone number' : null,
                suffix: CountryCodePicker(
                  padding: const EdgeInsets.only(top: 20),
                  flagWidth: 30,
                  flagDecoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  onChanged: print,
                  initialSelection: 'ng',
                  favorite: const ['NG'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  hideMainText: true,
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          );
        });
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return TextFormField(
    //   decoration: const InputDecoration(
    //     label: Text('Name'),
    //   ),
    //   keyboardType: TextInputType.text,
    // );
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return TextFormField(
            key: const Key('signUpForm_nameInput_textField'),
            onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
            decoration: InputDecoration(
              label: const Text('Name'),
              errorText: state.name.invalid ? 'invalid name' : null,
            ),
            keyboardType: TextInputType.text,
          );
        });
  }
}

class _SingUpButton extends StatelessWidget {
  const _SingUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status.isSubmissionInProgress
              ? const Center(child: CircularProgressIndicator())
              : ActionButton(
                  text: 'Create account',
                  onPressed: () {

                    // if (state.status.isValidated) {
                    context.read<SignUpCubit>().signUpFormSubmitted();
                    // }
                  },
                );
        });
  }
}
