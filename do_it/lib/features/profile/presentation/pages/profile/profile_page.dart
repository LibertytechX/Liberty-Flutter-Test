import 'package:cached_network_image/cached_network_image.dart';
import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/constants/dimensions.dart';
import 'package:do_it/features/profile/presentation/providers/profile_page_provider.dart';
import 'package:do_it/shared/widgets/fill_width_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      provider: ProfilePageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: AppDimensions.padding,
              child: Column(
                children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(19),
                  //   child: CachedNetworkImage(
                  //     width: 38,
                  //     height: 38,
                  //     imageUrl: project.image ?? '',
                  //     errorWidget: (context, _, __) {
                  //       return Container(
                  //         decoration: BoxDecoration(
                  //           color: AppColors.grey,
                  //           shape: BoxShape.circle
                  //         ),
                  //         child: Icon(
                  //           MdiIcons.imageOutline,
                  //           size: 18,
                  //         ),
                  //       );
                  //     },
                  //     placeholder: (context, _) {
                  //       return Container(
                  //         decoration: BoxDecoration(
                  //           color: AppColors.grey,
                  //           shape: BoxShape.circle
                  //         ),
                  //         child: Icon(
                  //           MdiIcons.imageOutline,
                  //           size: 18,
                  //         ),
                  //       );
                  //     },
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  // Spacer(),
                  // const SizedBox(height: 42),
                  // FillWidthButton(
                  //   onPressed: () {}, 
                  //   text: 'Save Changes'
                  // ),
                  // const SizedBox(height: 42),
                ],
              ),
            )
          ),
        );
      },
    );
  }
}