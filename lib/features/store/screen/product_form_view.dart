import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/product_controller.dart';
import '../model/product.dart';

class ProductFormView extends StatefulWidget {
  final Product? product;

  ProductFormView({this.product});

  @override
  State<ProductFormView> createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final controller = Get.find<ProductController>();
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController qtyCtrl;
  late TextEditingController descCtrl;
  late TextEditingController imgCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.product?.name ?? '');
    priceCtrl =
        TextEditingController(text: widget.product?.price.toString() ?? '');
    qtyCtrl = TextEditingController(text: widget.product?.qty.toString() ?? '');
    descCtrl = TextEditingController(text: widget.product?.description ?? '');
    imgCtrl = TextEditingController(text: widget.product?.imageUrl ?? '');
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        uuid: widget.product?.uuid,
        name: nameCtrl.text,
        price: double.parse(priceCtrl.text),
        qty: int.parse(qtyCtrl.text),
        description: descCtrl.text,
        imageUrl: imgCtrl.text,
      );

      if (widget.product == null) {
        await controller.addProduct(product);
      } else {
        await controller.updateProduct(product);
      }

      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product == null ? 'Add Product' : 'Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: priceCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: qtyCtrl,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Quantity'),
                validator: (v) => v!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: descCtrl,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: imgCtrl,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: Text(widget.product == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
