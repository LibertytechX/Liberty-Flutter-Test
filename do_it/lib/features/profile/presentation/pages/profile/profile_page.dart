import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/core/util/input_validators.dart';
import 'package:do_it/features/profile/presentation/providers/profile_page_provider.dart';
import 'package:do_it/shared/widgets/custom_text_input.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:do_it/shared/widgets/image_mode_modal.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<ProfilePageProvider>(
      child: null,
      provider: ProfilePageProvider(
        updateUserProfile: Provider.of(context),
        getUserProfile: Provider.of(context),
        logout: Provider.of(context)
      ),
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppDimensions.padding,
              child: Builder(
                builder: (context) {
                  if (provider.userProfile == null) {
                    provider.initGetUserProfile();
                  }
                  
                  if (provider.loading && provider.userProfile == null) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (provider.userProfile == null) {
                    return Container();
                  }
                  
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: provider.formKey,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => provider.initLogout(context),
                                    child: customTextNormal(
                                      'Logout',
                                      textColor: Colors.redAccent,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                ),
                                const SizedBox(height: 28),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return ImageSelectionModal(
                                          onPickImage: (source) => provider.pickImage(source),
                                        );
                                      }
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (provider.pickedImage != null) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  width: 98,
                                                  height: 98,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                        File(provider.pickedImage!.path),
                                                      )
                                                    )
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  top: 0,
                                                  child: InkWell(
                                                    onTap: () => provider.clearImage(),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        shape: BoxShape.circle
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(1.0),
                                                        child: Icon(
                                                          MdiIcons.close,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                )
                                              ],
                                            );
                                          }
                                          
                                          return ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: CachedNetworkImage(
                                              width: 98,
                                              height: 98,
                                              imageUrl: provider.userProfile!.avatar ?? '',
                                              errorWidget: (context, _, __) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 28,
                                                    color: Colors.black45,
                                                  ),
                                                );
                                              },
                                              placeholder: (context, _) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey,
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Icon(
                                                    Icons.person,
                                                    size: 28,
                                                    color: Colors.black45,
                                                  ),
                                                );
                                              },
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        }
                                      ),
                                      const SizedBox(height: 6),
                                      customTextNormal(
                                        'Tap to change photo'
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 48),
                                CustomTextInput(
                                  controller: provider.nameController,
                                  onChanged: (_) => provider.refresh(),
                                  validator: (value) => baseValidator(value!),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 42),
                      FillWidthButton(
                        onPressed: provider.pickedImage == null 
                          && provider.nameController.value.text == provider.userProfile!.name
                            ? null 
                            : () {
                              if (provider.formKey.currentState!.validate()) {
                                provider.initUpdateUserProfile(context);
                              }
                            },
                        text: 'Save Changes',
                        isLoading: provider.loading,
                      ),
                    ],
                  );
                }
              ),
            )
          ),
        );
      },
    );
  }
}