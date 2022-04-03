import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8)),
        width: double.infinity,
        height: 56,
        child: Center(
            child: Text(
          text,
          style: Theme.of(context).textTheme.headline4,
        )),
      ),
    );
  }
}
