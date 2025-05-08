import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/features/auth/controllers/auth_controller.dart';
import 'package:supabase_6_7/features/store/screen/product_form_view.dart';
import 'package:supabase_6_7/features/store/screen/product_list_view.dart';

class NavigateMenu extends StatelessWidget {
  NavigateMenu({super.key});

  final controller = Get.put(NavigationController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // drawer: Drawer(),
        endDrawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  child: CircleAvatar(
                child: Image(
                  height: double.infinity,
                  image: NetworkImage(
                      'https://zandokh.com/image/catalog/banner/2025/ZANDO/Category%20lifestyle,%20sportlife,%20smartcasual/Square/sportlife.w.png'),
                ),
              )),
              ListTile(
                onTap: authController.signOut,
              ),
              ElevatedButton(
                  onPressed: authController.signOut, child: Text('Log Out'))
            ],
          ),
        ),
        body: Obx(
          () => controller.screens[controller.currentPage.value],
        ),
        bottomNavigationBar: Obx(() => NavigationBar(
                selectedIndex: controller.currentPage.value,
                onDestinationSelected: (index) =>
                    controller.currentPage.value = index,
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
                  NavigationDestination(
                      icon: Icon(Icons.favorite), label: 'Heart'),
                  NavigationDestination(
                      icon: Icon(Icons.person_2), label: 'Profile')
                ])));
  }
}

class NavigationController extends GetxController {
  RxInt currentPage = 0.obs;

  final screens = [
    ProductListView(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    ProductFormView()
  ];
}
