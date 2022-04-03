import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_app/app/assets.dart';

class AssetsSvg {
  AssetsSvg._();

  static Widget logo({double? width, double? height}) =>
      Assets.logo.getSvgSize(width: width, height: height);

  static Widget onboardMark({double? width, double? height, color}) =>
      Assets.onboardMark.getSvgSize(width: width, height: height, color: color);

  static Widget onboardMarkShadow({double? width, double? height}) =>
      Assets.onboardMarkShadow.getSvgSize(width: width, height: height);

  static Widget onboardCategory({double? width, double? height}) =>
      Assets.onboardCategory.getSvgSize(width: width, height: height);

  static Widget onboardCalender({double? width, double? height}) =>
      Assets.onboardCalender.getSvgSize(width: width, height: height);

  static Widget onboardImage1({double? width, double? height}) =>
      Assets.onboardImage1.getSvgSize(width: width, height: height);

  static Widget backArrowIos({double? width, double? height}) =>
      Assets.backArrowIos.getSvgSize(width: width, height: height);

  static Widget fingerPrintIcon({double? width, double? height}) =>
      Assets.fingerPrintIcon.getSvgSize(width: width, height: height);

  static Widget notificationIcon({double? width, double? height}) =>
      Assets.notificationIcon.getSvgSize(width: width, height: height);

  static Widget projectMark({double? width, double? height,color}) =>
      Assets.projectMark.getSvgSize(width: width, height: height,color: color);

  static Widget taskIcon({double? width, double? height}) =>
      Assets.taskIcon.getSvgSize(width: width, height: height);

  static Widget timeCalender({double? width, double? height,color}) =>
      Assets.timeCalender.getSvgSize(width: width, height: height,color: color);

  static Widget overdueTask({double? width, double? height}) =>
      Assets.overdueTask.getSvgSize(width: width, height: height);

  static Widget navHome({double? width, double? height,color}) =>
      Assets.navHome.getSvgSize(width: width, height: height,color:color);

  static Widget navPerson({double? width, double? height,color}) =>
      Assets.navPerson.getSvgSize(width: width, height: height,color: color);

}

extension AssetIconExt on String {
  Widget getSvg({color}) {
    return SvgPicture.asset(
      this,
      color: color,
    );
  }

  Widget getSvgSize({color, width, height}) {
    return SvgPicture.asset(
      this,
      color: color,
      width: width,
      height: height,
    );
  }

  Widget getSvgBlack({
    color,
  }) {
    return SvgPicture.asset(
      this,
      color: color ?? Colors.black38,
    );
  }
}
