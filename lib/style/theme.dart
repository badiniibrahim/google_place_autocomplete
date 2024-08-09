import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_place_autocomplete/style/colors.style.dart';
import 'package:google_place_autocomplete/style/texts.style.dart';

class AppTheme {
  static const double horizontalMargin = 16.0;
  static const double radius = 12.0;
  static const double padding = 16.0;
  static const double margin = 16.0;

  static const double buttonRadius = 12.0;
  static const double buttonPaddingSm = 10.0;
  static const double buttonPaddingMd = 20.0;

  static const double inputRadius = 12.0;
  static const double inputBorderWidth = 1.0;

  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    appBarTheme: lightAppBarTheme,
    tabBarTheme: tabBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    // splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    // primaryColor: AppColors.accentColor,
    primaryColor: AppColors.teal1,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accentColor,
      brightness: Brightness.light,
      error: Colors.red.shade500,
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
    appBarTheme: darkAppBarTheme,
    tabBarTheme: tabBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.teal1,
    // primaryColor: AppColors.accentColor,
    // errorColor: Colors.red.shade800,
    textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.accentColor,
      brightness: Brightness.dark,
      error: Colors.red.shade800,
    ),
  );

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.teal1,
    iconTheme: const IconThemeData(
      color: AppColors.primaryText,
    ),
    titleTextStyle: IText.header1.copyWith(
      fontFamily: GoogleFonts.inter().fontFamily,
      letterSpacing: 1,
      fontSize: 15,
    ),

    // titleTextStyle: TextStyle(
    //   color: AppColors.primaryText,
    //   fontSize: 30,
    //   fontWeight: FontWeight.w500,
    // ),
    toolbarTextStyle: const TextStyle(
      color: AppColors.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.blueGrey1,
    iconTheme: IconThemeData(
      color: AppColors.primaryText,
    ),
    // titleTextStyle: TextStyle(
    //   color: AppColors.primaryText,
    //   fontSize: 20,
    //   fontWeight: FontWeight.w500,
    // ),
    toolbarTextStyle: TextStyle(
      color: AppColors.primaryText,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );

  static const bottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldBackgroundColor,
    unselectedLabelStyle: TextStyle(fontSize: 12),
    selectedLabelStyle: TextStyle(fontSize: 12),
    unselectedItemColor: Color(0xffA2A5B9),
    selectedItemColor: AppColors.accentColor,
  );

  static const tabBarTheme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    labelColor: AppColors.accentColor,
    unselectedLabelColor: AppColors.secondaryText,
  );

  static const lightButtonTheme = ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.secondaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.scaffoldBackgroundColor,
      background: AppColors.scaffoldBackgroundColor,
      error: AppColors.errorColor,
      onPrimary: AppColors.secondaryColor,
      onSecondary: AppColors.secondaryColor,
      onSurface: AppColors.secondaryColor,
      onBackground: AppColors.secondaryColor,
      onError: AppColors.secondaryColor,
    ),
    padding: EdgeInsets.all(padding),
  );

  static final inputDecorationTheme = InputDecorationTheme(
    errorStyle: const TextStyle(color: AppColors.errorColor),
    labelStyle: IText.inputLabelStyle,
    hintStyle: IText.inputHintStyle,
  );
}
