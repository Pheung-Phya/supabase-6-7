import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';
import 'product_form_view.dart';

class ProductListView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Obx(() {
        if (controller.list.isEmpty) {
          return Center(child: Text('No products found.'));
        }
        return ListView.builder(
          itemCount: controller.list.length,
          itemBuilder: (_, index) {
            final product = controller.list[index];

            // Debug print to verify image URL
            print('Loading image URL: ${product.imageUrl}');

            return ListTile(
              leading: (product.imageUrl != null &&
                      product.imageUrl!.isNotEmpty)
                  ? CachedNetworkImage(
                      imageUrl: product.imageUrl!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => SizedBox(
                          width: 50, height: 50, child: Icon(Icons.error)),
                    )
                  : SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.image_not_supported)),
              title: Text(product.name),
              subtitle: Text(
                  "\$${product.price.toStringAsFixed(2)} - Qty: ${product.qty}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.to(() => ProductFormView(product: product));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteProduct(product.uuid!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ProductFormView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
