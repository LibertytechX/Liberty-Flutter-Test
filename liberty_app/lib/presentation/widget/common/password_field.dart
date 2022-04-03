import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.onChanged,
    this.errorText,
  }) : super(key: key);

  final String? errorText;
  final Function(String  password) onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          label: const Text('Password'),
          errorText: widget.errorText,
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: const Icon(Icons.remove_red_eye))),
      keyboardType: TextInputType.visiblePassword,
      obscureText: !passwordVisible,
    );
  }
}
