class Product {
  int id;
  String name;
  String description;
  double price;
  String images;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'description': String description,
        'price': double price,
        'images': String images,
      } =>
        Product(
          id: id,
          name: name,
          description: description,
          price: price,
          images: images,
        ),
      _ => throw const FormatException('Failed to load product.'),
    };
  }
}
