import 'package:do_it/core/base_page.dart';
import 'package:do_it/core/constants/app_colors.dart';
import 'package:do_it/core/pages/home/home_screen_provider.dart';
import 'package:do_it/core/router/route_paths.dart';
import 'package:do_it/features/profile/presentation/pages/profile/profile_page.dart';
import 'package:do_it/features/to_do/presentation/pages/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<HomePageProvider>(
      child: null,
      provider: HomePageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) {
              return Visibility(
                visible: !isKeyboardVisible,
                child: FloatingActionButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    RoutePaths.createProjectPage
                  ),
                  child: const Icon(MdiIcons.plus),
                  backgroundColor: AppColors.primaryColor,
                  // mini: true,
                ),
              );
            }
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 2,
            color: AppColors.primaryColor.withOpacity(0.1),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 14,
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 18
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _BottomNavigationItem(
                        onTap: () => provider.setCurrentIndex(0, context),
                        isActive: provider.currentIndex == 0,
                        inactiveIcon: MdiIcons.homeOutline,
                        icon: MdiIcons.home,
                        padding: const EdgeInsets.only(left: 28.0),
                      ),
                      _BottomNavigationItem(
                        onTap: () => provider.setCurrentIndex(1, context),
                        isActive: provider.currentIndex == 1,
                        inactiveIcon: Icons.check_outlined,
                        icon: MdiIcons.checkBold,
                        padding: const EdgeInsets.all(0)
                      ),
                      _BottomNavigationItem(
                        onTap: () => provider.setCurrentIndex(2, context),
                        isActive: provider.currentIndex == 2,
                        inactiveIcon: Icons.person_outline,
                        icon: Icons.person,
                        padding: const EdgeInsets.only(right: 28.0)
                      ),
                    ],
                  ),
                ),
              ),
            )
          ),
          body: PageView(
            controller: provider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DashboardPage(),
              Container(),
              ProfilePage(),
            ],
          ),
        );
      },
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final Function()? onTap;
  final bool isActive;
  final IconData icon;
  final IconData inactiveIcon;
  final EdgeInsetsGeometry padding;
  
  const _BottomNavigationItem({ 
    Key? key, 
    required this.onTap, 
    required this.isActive, 
    required this.inactiveIcon,
    required this.icon,
    required this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: InkResponse(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? icon : inactiveIcon,
              size: 28,
              // color: isActive
              //   ? AppColors.primaryColor
              //   : Theme.of(context).brightness == Brightness.dark
              //     ? Colors.white
              //     : Colors.black54,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _Test extends StatefulWidget {
  const _Test({ Key? key }) : super(key: key);

  @override
  __TestState createState() => __TestState();
}

class __TestState extends State<_Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}