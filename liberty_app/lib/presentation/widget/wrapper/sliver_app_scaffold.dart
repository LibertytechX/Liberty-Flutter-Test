import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';

import 'package:liberty_app/presentation/screens/project/project.dart';
import 'package:liberty_app/presentation/widget/common/assets_icon.dart';

class SliverAppScaffold extends StatelessWidget {
  const SliverAppScaffold({
    Key? key,
    this.backIcon,
    required this.bodyWidgets,
    this.trailingWidget,
    this.widgetsAlignment,
    this.title,
    this.floatingIcon,
    this.fabHandler,
  }) : super(key: key);

  /// back Icon to pop the current page
  final Widget? backIcon;

  /// body children
  final List<Widget> bodyWidgets;

  /// body children Alignment
  final CrossAxisAlignment? widgetsAlignment;

  /// App bar trailing widget
  final Widget? trailingWidget;

  /// App bar title
  final Widget? title;

  /// App bar title
  final IconData? floatingIcon;
  final Function()? fabHandler;

  @override
  Widget build(BuildContext context) {
    const circleIconBorder =
        CircleBorder(side: BorderSide(color: AppColors.lightGray, width: 0.5));

    return Scaffold(
      // bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: floatingIcon != null
          ? Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: FloatingActionButton(
                child: Icon(
                  floatingIcon,
                  size: 38,
                ),
                onPressed: fabHandler,
              ),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          backgroundColor: AppColors.lightBlue,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).popUntil((predicate)=>predicate.isFirst);

                break;
              case 1:
                Navigator.of(context).push(ProjectListScreen.route());
                break;
              case 2:
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: AssetsSvg.navHome(width: 20, height: 33),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                  child: AssetsSvg.projectMark(
                      color: AppColors.primary, width: 22, height: 20),
                ),
                label: 'Task'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 4),
                  child: AssetsSvg.navPerson(
                      color: AppColors.primary, width: 28, height: 26),
                ),
                label: 'Profile'),
          ],
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: AppColors.background,
      //   toolbarHeight: kToolbarHeight * 1.6,
      //   elevation: 0,
      //   leadingWidth: backIcon != null ? 60 : 56,
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     if (trailingWidget != null)
      //       Padding(
      //         padding: const EdgeInsets.only(right: AppSizes.appSideGap * 0.5),
      //         child: trailingWidget!,
      //       ),
      //   ],
      //   leading: backIcon != null
      //       ? Padding(
      //           padding: const EdgeInsets.only(left: 20.0),
      //           child: InkWell(
      //             customBorder: circleIconBorder,
      //             onTap: () => Navigator.of(context).pop(),
      //             child: Material(
      //               color: AppColors.transparent,
      //               shape: circleIconBorder,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(16.0),
      //                 child: backIcon!,
      //               ),
      //             ),
      //           ),
      //         )
      //       : null,
      //   title: title,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.background,
              toolbarHeight: kToolbarHeight * 1.6,
              elevation: 0,
              leadingWidth: backIcon != null ? 60 : 56,
              automaticallyImplyLeading: false,
              actions: [
                if (trailingWidget != null)
                  Padding(
                    padding:
                        const EdgeInsets.only(right: AppSizes.appSideGap * 0.5),
                    child: trailingWidget!,
                  ),
              ],
              leading: backIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        customBorder: circleIconBorder,
                        onTap: () => Navigator.of(context).pop(),
                        child: Material(
                          color: AppColors.transparent,
                          shape: circleIconBorder,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: backIcon!,
                          ),
                        ),
                      ),
                    )
                  : null,
              title: title,
            ),
            ...bodyWidgets,
          ],
        ),
      ),
    );
  }
}
