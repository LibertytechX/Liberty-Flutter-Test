import 'package:flutter/material.dart';
import 'package:liberty_app/app/theme.dart';

import 'assets_icon.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({
    Key? key,
    this.elevation = 0,
    this.backgroundColor = AppColors.white,
    this.icon,
    this.width,
    this.height,
    this.padding,
  }) : super(key: key);

  final double elevation;
  final Color? backgroundColor;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      elevation: elevation,
      color: backgroundColor,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10.0),
        child: SizedBox(
          width: width ?? 25,
          height: height ?? 25,
          child: icon,
        ),
      ),
    );
  }
}
