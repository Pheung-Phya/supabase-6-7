import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/binding/auth_binding.dart';
import 'package:supabase_6_7/binding/navigation_bindings.dart';
import 'package:supabase_6_7/features/auth/controllers/auth_controller.dart';
import 'package:supabase_6_7/features/auth/screens/login/login_screen.dart';
import 'package:supabase_6_7/features/auth/screens/sign_up/sign_up_screen.dart';
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
      initialRoute: '/root',
      getPages: [
        GetPage(
            name: '/login', page: () => LoginScreen(), binding: AuthBinding()),
        GetPage(
            name: '/sign-up',
            page: () => SignUpScreen(),
            binding: AuthBinding()),
        GetPage(
            name: '/navigate',
            page: () => NavigateMenu(),
            binding: NavigationBindings()),
        GetPage(
            name: '/root', page: () => RootScreen(), binding: AuthBinding()),
      ],
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Obx(() {
          return controller.currentUser.value != null
              ? NavigateMenu()
              : const LoginScreen();
        });
      },
    );
  }
}
