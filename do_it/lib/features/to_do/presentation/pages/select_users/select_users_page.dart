import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:do_it/features/to_do/presentation/pages/select_users/widgets/user_list_item.dart';
import 'package:do_it/features/to_do/presentation/providers/select_users_page_provider.dart';
import 'package:do_it/shared/widgets/custom_appbar.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectUsersPage extends StatefulWidget {
  final List<UserProfileModel>? initSelection;
  
  const SelectUsersPage({ Key? key, this.initSelection }) : super(key: key);

  @override
  _SelectUsersPageState createState() => _SelectUsersPageState();
}

class _SelectUsersPageState extends State<SelectUsersPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<SelectUsersPageProvider>(
      child: null,
      provider: SelectUsersPageProvider(
        getAllUsers: Provider.of(context),
        initSelection: widget.initSelection
      ),
      builder: (context, provider, child) {
        if (provider.allUsers == null && !provider.loading) {
          provider.initGetAllUsers();
        }
        
        return Scaffold(
          appBar: getCustomAppBar(context),
          body: Padding(
            padding: AppDimensions.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextExtraLarge(
                  'Select users',
                  alignment: TextAlign.start,
                  fontWeight: FontWeight.w600
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (provider.loading) {
                        return Center(child: CircularProgressIndicator.adaptive());
                      }

                      if (provider.allUsers!.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              customTextMedium(
                                'Looks like you\'re the only one we\'ve got',
                                textColor: Colors.black54,
                                alignment: TextAlign.center
                              ),
                              TextButton(
                                onPressed: () => provider.initGetAllUsers(), 
                                child: customTextNormal(
                                  'Retry'
                                )
                              )
                            ],
                          ),
                        );
                      }
                
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.allUsers!.length,
                              itemBuilder: (context, index) {
                                return UserListItem(
                                  user: provider.allUsers![index],
                                  isSelected: provider.selectedUsers.contains(
                                    provider.allUsers![index]
                                  ),
                                  onChanged: (_) => provider.toggleUserSelection(
                                    provider.allUsers![index]
                                  ),
                                );
                              },
                            )
                          ),
                          const SizedBox(height: 16),
                          FillWidthButton(
                            onPressed: provider.selectedUsers.isEmpty
                              ? null
                              : () {
                                Navigator.of(context).pop(provider.selectedUsers);
                              },
                            text: 'Done'
                          )
                        ],
                      );
                    } 
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