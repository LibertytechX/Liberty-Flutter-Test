import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/core/util/input_validators.dart';
import 'package:do_it/features/authentication/presentation/providers/login_page_provider.dart';
import 'package:do_it/features/authentication/presentation/widgets/word_logo.dart';
import 'package:do_it/shared/widgets/custom_appbar.dart';
import 'package:do_it/shared/widgets/custom_text_input.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<LoginPageProvider>(
      child: null,
      provider: LoginPageProvider(
        login: Provider.of(context)
      ), 
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppDimensions.padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: WordLogo()),
                const SizedBox(height: 24),
                Center(
                  child: customTextLarge(
                    'Welcome Back!',
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: provider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      CustomTextInput(
                        controller: provider.emailController,
                        hintText: 'Email',
                        validator: (value) => emailValidator(value!),
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      CustomTextInput(
                        controller: provider.passwordController,
                        validator: (value) => passwordValidator(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Password',
                        inputType: TextInputType.visiblePassword,
                        hideText: provider.hidePassword,
                        suffix: Icon(
                          provider.hidePassword ? MdiIcons.eye : MdiIcons.eyeOff,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onTapSuffix: () => provider.toggleHidePassword(),
                      ),
                      const SizedBox(height: 12),
                      customTextSmall(
                        'Forgot password?',
                        textColor: Colors.black54
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 72),
                Row(
                  children: [
                    Expanded(
                      child: FillWidthButton(
                        onPressed: () {
                          if (!provider.loading && provider.formKey.currentState!.validate()) {
                            provider.initLogin(context);
                          }
                        },
                        isLoading: provider.loading,
                        text: 'Sign in'
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.fingerprint,
                          size: 28,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Center(
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                      RoutePaths.createAccountPage
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        customTextNormal(
                          'Don\'t have an account?',
                          textColor: Colors.black54
                        ),
                        const SizedBox(width: 8),
                        customTextNormal(
                          'Create Account',
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}