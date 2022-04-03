import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSizes {
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double widgetBorderRadius = 34;

  static const appSideGap = 24.0;
  static const appTopGap = 30.0;

  static double searchInputRadius = 10.0;
}

class AppColors {
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF8B8A8A);
  static const shadowGrey = Color(0x232F2F2F);
  static const darkGray = Color(0xFF535252);
  static const white = Color(0xFFFFFFFF);
  static const backgroundGrey = Color(0xFFF2F2F2);
  static const background = Color(0xFFE5E5E5);
  static const transparent = Color(0x00000000);
  static const amber = Colors.amber;
  static const turquoise = Color(0xFF0CB8B6);
  static const middleBlue = Color(0xFF5C86CE);
  static const primary = Color(0xFF217AC0);
  static const brown = Color(0xFFF7A325);
  static const blue = Color(0xFF217AC0);
  static const green = Color(0xFF037929);
  static const gray = Color(0xFFB1B0B0);
  static const purple = Color(0xFF58028C);
  static const lightBlue = Color(0xFFDAE5F6);
  static const red = Colors.red;

  static const primaryGradient = LinearGradient(
      begin: FractionalOffset(0.29, 0),
      end: FractionalOffset(0.8, 0),
      colors: [Color(0xFF0184D6), Color(0xFF004067)]);
}

class AppTheme {
  static const headline2Style = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.black);

  static final light = ThemeData(
    fontFamily: 'Mark_pro',

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.background,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primaryColor: AppColors.middleBlue,
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSwatch(
            // primarySwatch: Colors.deepPurple,
            )
        .copyWith(
      secondary: AppColors.middleBlue,
    ),
    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      headline1: const TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: AppColors.primary,
      ),
      headline2: headline2Style,
      overline: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.primary),
      caption: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: AppColors.lightGray),
      subtitle1: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      headline3: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGray,
          letterSpacing: 0.8),
      headline4: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      button: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedIconTheme: const IconThemeData(color: AppColors.purple),
    //   unselectedLabelStyle: captionStyle.copyWith(height: 2),
    //   selectedLabelStyle:
    //       captionStyle.copyWith(color: AppColors.purple, height: 2),
    //   type: BottomNavigationBarType.fixed,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: headline2Style.copyWith(fontSize: 12, color: AppColors.white),
      // contentPadding: const EdgeInsets.only(top: 12),
      isCollapsed: true,
      // isDense: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.lightGray,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.lightGray,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(
          AppSizes.searchInputRadius,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: AppColors.primary)),

    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
