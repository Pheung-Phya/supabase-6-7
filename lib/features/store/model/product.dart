class Product {
  final String? uuid;
  final String name;
  final double price;
  final int qty;
  final String? description;
  final String? imageUrl;

  Product({
    this.uuid,
    required this.name,
    required this.price,
    required this.qty,
    this.description,
    this.imageUrl,
  });
}
