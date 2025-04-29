import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_6_7/controllers/auth_controller.dart';

class NavigateMenu extends StatelessWidget {
  NavigateMenu({super.key});

  final controller = Get.put(NavigationController());

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
                onTap: AuthController.instance.signOut,
              ),
              ElevatedButton(
                  onPressed: AuthController.instance.signOut,
                  child: Text('Log Out'))
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
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: const Color.fromARGB(255, 86, 243, 33),
    ),
  ];
}
