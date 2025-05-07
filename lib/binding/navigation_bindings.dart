import 'package:get/get.dart';
import 'package:supabase_6_7/navigate_menu.dart';

class NavigationBindings extends Bindings {
  @override
  void dependencies() {
    //  Get.put(NavigationController());
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
