import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:loja_virtual/models/product.dart';
import 'dart:convert';

class ProductManager extends ChangeNotifier {
  ProductManager() {
    _loadAllProdects();
  }

  List<Product> allProducts = [];

  Future<void> _loadAllProdects() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:3000/produts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      _loadProducts(response.body);
    } on PlatformException catch (e) {
      throw (e.code);
    }
  }

  Future<void> _loadProducts(String body) async {
    Iterable l = json.decode(body);
    allProducts = List<Product>.from(l.map((model) => Product.fromJson(model)));

    notifyListeners();
  }
}
