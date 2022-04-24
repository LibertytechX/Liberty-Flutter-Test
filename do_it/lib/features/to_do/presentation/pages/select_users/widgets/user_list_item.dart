import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/texts.dart';
import 'package:do_it/features/to_do/data/models/user_profile.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final UserProfileModel user;
  final Function(bool? value) onChanged;
  final bool isSelected;
  
  const UserListItem({ 
    Key? key, 
    required this.user,
    required this.onChanged,
    required this.isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isSelected, 
      onChanged: onChanged,
      title: Row(
        children: [
          Container(
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
              padding: const EdgeInsets.all(10),
              child: customTextNormal(
                '${user.name.split(' ')[0][0]} ${user.name.split(' ')[1][0]}',
                textColor: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: customTextNormal(
              user.name,
              alignment: TextAlign.start
            ),
          )
        ],
      ),
      activeColor: AppColors.primaryColor,
    );
  }
}