import 'package:ecomerce_app/models/product.dart';
import 'package:ecomerce_app/pages/product_description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  //Add to cart func
  void addToCart(BuildContext context) {
    context.read<Shop>().addToCart(product);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        '${product.name} added to cart!',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      duration: const Duration(milliseconds: 1000),
      backgroundColor: Theme.of(context).colorScheme.background,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDescription(
            product: product,
          ),
        ),
      ),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ ${product.price}'),
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        onPressed: () {
                          addToCart(context);
                        },
                        icon: const Icon(Icons.add)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
