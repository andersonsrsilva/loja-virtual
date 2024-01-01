class Product {
  int id;
  String name;
  String description;
  double price;
  List<String> images = List.empty();

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
      } =>
        Product(
          id: id,
          name: name,
          description: description,
          price: price,
          images: List<String>.from(json['images'] as List<dynamic>),
        ),
      _ => throw const FormatException('Failed to load product.'),
    };
  }
}
