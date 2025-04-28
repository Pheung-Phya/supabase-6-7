import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/features/auth/screens/login/login_screen.dart';
import 'package:supabase_6_7/navigate_menu.dart';
import 'package:supabase_6_7/utils/theme/t_app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: NavigateMenu(),
    );
  }
}
