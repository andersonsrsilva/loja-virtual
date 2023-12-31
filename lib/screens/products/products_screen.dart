import 'package:flutter/material.dart';
import 'package:loja_virtual/commons/custom_drawer/custom_drawer.dart';
import 'package:loja_virtual/models/product_list_tile.dart';
import 'package:loja_virtual/models/produtc_manager.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: productManager.allProducts.length,
              itemBuilder: (_, index) {
                return ProductListTile(productManager.allProducts[index]);
              });
        },
      ),
    );
  }
}
