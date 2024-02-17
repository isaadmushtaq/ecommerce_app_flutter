import 'package:ecomerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
      imagePath: 'lib/images/smartwatch.png',
      name: 'Smart Watch',
      price: '99.99',
      description: 'description',
    ),
    Product(
        imagePath: 'lib/images/shoes.png',
        name: 'Air Jordan',
        price: '99.99',
        description: 'description'),
    Product(
        imagePath: 'lib/images/sunglasses.png',
        name: 'Glasses',
        price: '99.99',
        description: 'description'),
    Product(
        imagePath: 'lib/images/hoddie.png',
        name: 'Hoddie',
        price: '99.99',
        description: 'description'),
  ];

  //list for cart

  List _cart = [];

  //get prods
  List get shop => _shop;

  //get cart
  List get cart => _cart;

  //add item to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove item from the cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
