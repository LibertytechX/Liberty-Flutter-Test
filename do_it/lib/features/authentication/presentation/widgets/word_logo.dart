import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:flutter/material.dart';

class WordLogo extends StatelessWidget {
  const WordLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'asset/icons/logo.png',
          height: 20,
        ),
        const SizedBox(width: 12),
        customTextExtraLarge(
          'DO ',
          fontSize: 28,
          fontWeight: FontWeight.bold,
          textColor: AppColors.primaryColor
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: AppColors.primaryColor
              )
            )
          ),
          child: customTextExtraLarge(
            '- IT',
            fontSize: 28,
            fontWeight: FontWeight.bold,
            textColor: AppColors.primaryColor
          ),
        )
      ],
    );
  }
}