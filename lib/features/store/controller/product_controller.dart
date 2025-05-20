import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_6_7/services/product_service.dart';
import '../model/product.dart';

class ProductController extends GetxController {
  RxList<Product> list = <Product>[].obs; // Reactive list
  final _service = ProductService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      list.value = await _service.getAllProducts();
      log("Fetched products: ${list.length}");
    } catch (e) {
      log('Error fetching products: $e');
      list.clear();
    }
  }

  Future<void> addProduct(Product product) async {
    await _service.createProduct(product);
    await fetchProducts();
  }

  Future<void> updateProduct(Product product) async {
    await _service.updateProduct(product);
    await fetchProducts();
  }

  Future<void> deleteProduct(String uuid) async {
    await _service.deleteProduct(uuid);
    await fetchProducts();
  }
}
