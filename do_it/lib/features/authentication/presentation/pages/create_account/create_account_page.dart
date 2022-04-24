import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/util/input_validators.dart';
import 'package:do_it/features/authentication/presentation/providers/create_account_page_provider.dart';
import 'package:do_it/shared/widgets/custom_appbar.dart';
import 'package:do_it/shared/widgets/custom_text_input.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({ Key? key }) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return BasePage<CreateAccountPageProvider>(
      child: null,
      provider: CreateAccountPageProvider(
        createAccount: Provider.of(context)
      ), 
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: AppDimensions.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextExtraLarge(
                  'Create \nAccount',
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w600
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: size.width * 0.6,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        overflow: TextOverflow.ellipsis
                      ),
                      children: [
                        TextSpan(
                          text: 'Please fill the details below to create a '
                        ),
                        TextSpan(
                          text: 'DO-IT ',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis
                          )
                        ),
                        TextSpan(
                          text: 'account'
                        ),
                      ]
                    )
                  ),
                ),
                const SizedBox(height: 48),
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: [
                      CustomTextInput(
                        controller: provider.nameController,
                        hintText: 'Name',
                        validator: (value) => baseValidator(value!),
                      ),
                      const SizedBox(height: 18),
                      CustomTextInput(
                        controller: provider.emailController,
                        hintText: 'Email',
                        validator: (value) => emailValidator(value!),
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 18),
                      IntlPhoneField(
                        controller: provider.phoneController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                            ),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          labelText: 'Mobile Number',
                          floatingLabelBehavior: FloatingLabelBehavior.auto
                        ),
                        initialCountryCode: 'NG',
                        // disableLengthCheck: true,
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
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                customTextSmall(
                  'Password must be at least 8 characters long',
                  textColor: Colors.black45
                ),
                const SizedBox(height: 48),
                Hero(
                  tag: 'create-account-button',
                  child: FillWidthButton(
                    onPressed: () {
                      if (!provider.loading && provider.formKey.currentState!.validate()) {
                        provider.initCreateAccount(context);
                      }
                    },
                    text: 'Create account',
                    isLoading: provider.loading,
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: customTextNormal(
                    'Privacy Policy',
                    textColor: Colors.black45,
                    decoration: TextDecoration.underline
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}