import 'package:supabase_6_7/features/store/model/product.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final supabase = Supabase.instance.client;

  Future<List<Product>> getAllProducts() async {
    final response = await supabase.from('products').select();

    return response
        .map((e) => Product(
              uuid: e['id'],
              name: e['name'],
              price: (e['price'] as num).toDouble(),
              qty: e['qty'],
              description: e['description'],
              imageUrl: e['image_url'],
            ))
        .toList();
  }

  Future<void> createProduct(Product product) async {
    final user = supabase.auth.currentUser;
    if (user == null) throw Exception("User not logged in");
    await supabase.from('products').insert({
      'name': product.name,
      'price': product.price,
      'qty': product.qty,
      'description': product.description,
      'image_url': product.imageUrl,
      'created_by': user.id,
    });
  }

  Future<void> updateProduct(Product product) async {
    if (product.uuid == null) throw Exception('Missing UUID for update');
    await supabase.from('products').update({
      'name': product.name,
      'price': product.price,
      'qty': product.qty,
      'description': product.description,
      'image_url': product.imageUrl,
    }).eq('uuid', product.uuid as Object);
  }

  Future<void> deleteProduct(String uuid) async {
    final user = supabase.auth.currentUser;
    if (user == null) throw Exception("User not logged in");

    final deleted = await supabase
        .from('products')
        .delete()
        .eq('id', uuid)
        .select(); // returns the deleted record(s)

    if (deleted.isEmpty) {
      throw Exception("Delete failed or no product was deleted.");
    }
  }
}
