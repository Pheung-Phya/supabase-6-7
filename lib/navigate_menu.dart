import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigateMenu extends StatelessWidget {
  NavigateMenu({super.key});

  final controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
