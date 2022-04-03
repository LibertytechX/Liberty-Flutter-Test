import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';
import 'package:liberty_app/presentation/widget/widgets.dart';

import '../../../../app/routes.dart';
import '../../login/view/login_view.dart';
import '../../register/register.dart';

class OnboardPage extends StatelessWidget {

  const OnboardPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: OnboardPage());

  @override
  Widget build(BuildContext context) {

    createAccountHandler() {
      Navigator.of(context).push(RegisterScreen.route());
    }

    void signInHandler() {
      Navigator.of(context).push(LoginScreen.route());
    }

    return Scaffold(
      body: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 75),
            const AppLogo(),
            const SizedBox(height: 85),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.88,
              child: Stack(
                children: [
                  Align(
                    alignment: const FractionalOffset(0.5, 0),
                    child: RoundedIcon(
                      elevation: 5,
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(child: AssetsSvg.onboardMark()),
                          AssetsSvg.onboardMarkShadow(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const FractionalOffset(0.1, 0.18),
                    child: RoundedIcon(
                      elevation: 5,
                      icon: AssetsSvg.onboardCategory(),
                    ),
                  ),
                  Align(
                    alignment: const FractionalOffset(0.9, 0.18),
                    child: RoundedIcon(
                      elevation: 5,
                      icon: AssetsSvg.onboardCalender(),
                    ),
                  ),
                  Align(
                    alignment: const FractionalOffset(0.5, 0.70),
                    child: AssetsImage.onboardImage1(width: 240, height: 184),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text.rich(
              TextSpan(
                text: 'Just',
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: AppColors.black,
                    ),
                children: [
                  TextSpan(
                    text: ' DO-IT',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
              child: ActionButton(
                  text: 'Create account', onPressed: createAccountHandler),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: signInHandler,
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
