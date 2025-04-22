import 'package:flutter/material.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_app_bar_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_bottom_sheet_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_checkbox_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_chip_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_elevated_button_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_outline_button_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_text_form_field_theme.dart';
import 'package:supabase_6_7/utils/theme/custom_themes/t_text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
  );
}
