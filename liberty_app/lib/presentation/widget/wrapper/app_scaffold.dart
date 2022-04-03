import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    this.backIcon,
    required this.bodyWidgets,
    this.trailingWidget,
    this.widgetsAlignment,
    this.title,
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

  @override
  Widget build(BuildContext context) {
    const circleIconBorder =
        CircleBorder(side: BorderSide(color: AppColors.lightGray, width: 0.5));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        toolbarHeight: kToolbarHeight * 1.6,
        elevation: 0,
        leadingWidth: backIcon != null ? 60 : 56,
        automaticallyImplyLeading: false,
        actions: [
          if (trailingWidget != null)
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.appSideGap * 0.5),
              child: trailingWidget!,
            ),
        ],
        leading: backIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20.0),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.appSideGap),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: widgetsAlignment ?? CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 22,
              // ),

              /// App Body widgets
              ...bodyWidgets,
            ],
          ),
        ),
      ),
    );
  }
}
