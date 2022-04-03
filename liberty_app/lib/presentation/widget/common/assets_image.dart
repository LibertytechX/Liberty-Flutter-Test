import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liberty_app/app/assets.dart';

class AssetsImage {
  AssetsImage._();

  static Widget onboardImage1({double? width, double? height}) =>
      Assets.onboardImage1.getImageSize(width: width, height: height);
}

extension AssetImageExt on String {
  Widget getImage() {
    return Image.asset(
      this,
    );
  }

  Widget getImageSize({color, width, height}) {
    return Image.asset(
      this,
      width: width,
      height: height,
    );
  }

}
