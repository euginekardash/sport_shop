import 'package:flutter/material.dart';
import 'package:sport_shop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/chip_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/outline_button_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/text_field_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/text_theme.dart';
import 'package:sport_shop/utils/theme/custom_themes/elevated_button_theme.dart';

class AppTheme{
  AppTheme._(); //private

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: MyTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
  );
}