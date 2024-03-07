import 'package:ecomerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image(
                    image: AssetImage(product.imagePath),
                    height: 200,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '4.9',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                        color: Colors.grey.shade600, fontSize: 14, height: 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 138, 60, 55)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(109, 140, 94, 91),
                          borderRadius: BorderRadius.circular(25)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
