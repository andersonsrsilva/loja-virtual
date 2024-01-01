import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: product.images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(image),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
