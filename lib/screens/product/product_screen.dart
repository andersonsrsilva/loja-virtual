import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/managers/user_manager.dart';
import 'package:loja_virtual/models/product.dart';
import 'package:loja_virtual/screens/product/components/size_widget.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(product.name),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 350.0,
                enlargeCenterPage: true,
              ),
              items: product.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(image);
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'A partir de',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    'R\$ 19.99',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Tamanhos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: product.sizes.map((s) {
                      return SizeWidget(size: s);
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  if (product.hasStock)
                    Consumer2<UserManager, Product>(
                      builder: (_, userManager, product, __) {
                        return SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: product.selectedSize.stock > 0
                                  ? primaryColor
                                  : Colors.grey,
                            ),
                            onPressed: product.selectedSize.stock > 0
                                ? () {
                                    if (userManager.isLoggedIn) {
                                      // TODO: ADICIONAR AO CARRINHO
                                    } else {
                                      Navigator.of(context).pushNamed('/login');
                                    }
                                  }
                                : null,
                            child: Text(
                              userManager.isLoggedIn
                                  ? "Adicionar ao carrinho"
                                  : "Entre  para comprar",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
