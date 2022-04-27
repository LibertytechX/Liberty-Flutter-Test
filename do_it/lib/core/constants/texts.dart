import 'package:flutter/material.dart';

Widget customTextSmall(
  String text,
  {
    TextAlign alignment = TextAlign.center,
    double fontSize = 12,
    Color? textColor,
    double? lineHeight,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1000
  }
) {
  return Text(
    text,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      decoration: null,
      fontFamily: 'Mark_Pro',
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
      color: textColor,
      overflow: TextOverflow.ellipsis
    ),
  );
}

Widget customTextNormal(
  String text,
  {
    TextAlign alignment = TextAlign.center,
    double fontSize = 15,
    Color? textColor,
    double? lineHeight,
    FontWeight fontWeight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    int maxLines = 1000
  }
) {
  return Text(
    text,
    textAlign: alignment,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: 'Mark_Pro',
      decoration: decoration,
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
      color: textColor,
      overflow: TextOverflow.ellipsis
    )
  );
}

Widget customTextMedium(
  String text,
  {
    TextAlign alignment = TextAlign.center,
    double fontSize = 16,
    Color? textColor,
    double? lineHeight,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1000
  }
) {
  return Text(
    text,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: 'Mark_Pro',
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
      color: textColor,
      overflow: TextOverflow.ellipsis
    ),
  );
}

Widget customTextLarge(
  String text,
  {
    TextAlign alignment = TextAlign.center,
    double fontSize = 20,
    Color? textColor,
    double? lineHeight,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1000
  }
) {
  return Text(
    text,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: 'Mark_Pro',
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
      color: textColor,
      overflow: TextOverflow.ellipsis
    ),
  );
}

Widget customTextExtraLarge(
  String text,
  {
    TextAlign alignment = TextAlign.center,
    double fontSize = 25,
    Color? textColor,
    double? lineHeight,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 1000
  }
) {
  return Text(
    text,
    textAlign: alignment,
    maxLines: maxLines,
    style: TextStyle(
      fontFamily: 'Mark_Pro',
      fontSize: fontSize,
      height: lineHeight,
      fontWeight: fontWeight,
      color: textColor,
      overflow: TextOverflow.ellipsis
    ),
  );
}