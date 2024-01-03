import 'package:flutter/material.dart';
import 'package:loja_virtual/models/item_size.dart';

class Product extends ChangeNotifier {
  int id;
  String name;
  String description;
  double price;
  List<String> images;
  List<ItemSize> sizes;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.sizes,
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
          sizes: List<dynamic>.from(json['sizes'] as List<dynamic>)
              .map((s) => ItemSize.fromJson(s as Map<String, dynamic>))
              .toList(),
        ),
      _ => throw const FormatException('Failed to load product.'),
    };
  }

  ItemSize _selectedSize = ItemSize(name: "", price: 0.0, stock: 0);

  ItemSize get selectedSize => _selectedSize;

  set selectedSize(ItemSize value) {
    _selectedSize = value;
    notifyListeners();
  }

  int get totalStock {
    int stock = 0;
    for (final size in sizes) {
      stock += size.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0;
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price}';
  }
}
