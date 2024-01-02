class ItemSize {
  String name;
  num price;
  int stock;

  ItemSize({
    required this.name,
    required this.price,
    required this.stock,
  });

  factory ItemSize.fromJson(Map<String, dynamic> json) => ItemSize(
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
      );

  bool get hasStock => stock > 0;

  @override
  String toString() => 'ItemSize(name: $name, price: $price, stock: $stock)';
}
