import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SelectedUsersWidget extends StatelessWidget {
  final List<UserProfileModel> users;
  final Function() onAdd;
  
  const SelectedUsersWidget({ 
    Key? key, 
    required this.users, 
    required this.onAdd
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                runSpacing: 4,
                children: users.map((user) => _User(user: user)).toList(),
              ),
            ),
            const SizedBox(width: 12),
            InkWell(
              onTap: onAdd,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Icon(
                    MdiIcons.plus,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _User extends StatelessWidget {
  final UserProfileModel user;
  
  const _User({ Key? key, required this.user }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 24,
    //   height: 24,
    //   decoration: BoxDecoration(
    //     color: Colors.green,
    //     shape: BoxShape.circle
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0184D6), 
            Color(0xFF004067)
          ]
        ),
        shape: BoxShape.circle
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: customTextSmall(
          '${user.name.split(' ')[0][0]} ${user.name.split(' ')[1][0]}',
          textColor: Colors.white,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}