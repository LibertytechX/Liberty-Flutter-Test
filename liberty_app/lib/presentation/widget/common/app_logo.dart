import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import 'assets_icon.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: AssetsSvg.logo(width: 22, height: 22),
          ),
          const SizedBox(width: 13),
          Text.rich(
            TextSpan(
              text: 'DO',
              style: Theme.of(context).textTheme.headline1?.copyWith(
                shadows: [
                  const Shadow(offset: Offset(0, -3), color: AppColors.primary)
                ],
                color: AppColors.transparent,
              ),
              children: [
                TextSpan(
                  text: '-IT',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        color: AppColors.transparent,
                        shadows: [
                          const Shadow(
                              offset: Offset(0, -3), color: AppColors.primary)
                        ],
                        decorationThickness: 1,
                        decorationColor: AppColors.primary,
                        height: 0.2,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
