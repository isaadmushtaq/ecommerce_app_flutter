import 'package:ecomerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  const ProductDescription({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(product.imagePath),
              height: 200,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(product.description),
            const SizedBox(
              height: 25,
            ),
            Text('\$ ${product.price}'),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
