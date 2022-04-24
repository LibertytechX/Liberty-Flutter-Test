import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/authentication/presentation/providers/auth_selection_page_provider.dart';
import 'package:do_it/features/authentication/presentation/widgets/word_logo.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthSelectionPage extends StatefulWidget {
  const AuthSelectionPage({ Key? key }) : super(key: key);

  @override
  _AuthSelectionPageState createState() => _AuthSelectionPageState();
}

class _AuthSelectionPageState extends State<AuthSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<AuthSelectionPageProvider>(
      child: null,
      provider: AuthSelectionPageProvider(
        firebaseAuth: Provider.of(context)
      ),
      builder: (context, provider, child) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          if (provider.initRan) return;
          provider.init(context);
        });

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 48
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const WordLogo(),
                    const SizedBox(height: 72),
                    Container(
                      height: 272,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Center(
                              child: Image.asset(
                                'asset/images/center_icon.png'
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 42,
                            child: Center(
                              child: Image.asset(
                                'asset/images/left_icon.png'
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 42,
                            child: Center(
                              child: Image.asset(
                                'asset/images/right_icon.png'
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            bottom: 0,
                            // top: 42,
                            child: Center(
                              child: Image.asset(
                                'asset/images/banner.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 72),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTextLarge(
                          'Just ',
                          fontWeight: FontWeight.w600,
                        ),
                        customTextLarge(
                          'DO-IT',
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Hero(
                      tag: 'create-account-button',
                      child: FillWidthButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                          RoutePaths.createAccountPage
                        ),
                        text: 'Create account'
                      ),
                    ),
                    const SizedBox(height: 14),
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                        RoutePaths.loginPage
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          customTextNormal(
                            'Already have an account?',
                            textColor: Colors.black54
                          ),
                          const SizedBox(width: 8),
                          customTextNormal(
                            'Sign in',
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.primaryColor
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}